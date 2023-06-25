
`timescale 1ns/10ps
module LBP ( clk, reset, gray_addr, gray_req, gray_ready, gray_data, lbp_addr, lbp_valid, lbp_data, finish);
input   	    clk;
input   	    reset;

input   	    gray_ready;
input   [7:0] 	gray_data;

output reg          [13:0] 	gray_addr;
output reg         	gray_req;
output reg  [13:0] 	lbp_addr;
output reg	        lbp_valid;
output reg  [7:0] 	lbp_data;
output reg 	        finish;

reg     [1:0]   cur_state, nx_state;

reg     [3:0]   count,i;

reg     [7:0]   data    [0:8];
reg     [13:0]  pt;

reg     s       [0:8];
reg     [7:0]   sol;

parameter       STATE_IDLE=2'b00, STATE_RD=2'b01, STATE_CAL=2'b10, STATE_SD=2'b11;
//====================================================================


//================================================================
// STATE_RD
//================================================================

//count
always@(posedge clk or posedge reset)begin
    if(reset) count <= 4'd0;
    else begin
        case(cur_state)
            STATE_IDLE: count <= 0;
            STATE_RD:   count <= count+1;
            STATE_CAL:  count <= 0;
            STATE_SD:   count <= 0;
        endcase
    end
end

//pt
always@(posedge clk or posedge reset)begin
    if(reset) pt <= 14'd0;
    else begin
        case(nx_state)
            STATE_IDLE: pt <= 14'd0;
            STATE_RD:  pt <= pt; 
            STATE_CAL: pt <= pt;
            STATE_SD: begin
                if((pt + 14'd3) % 8'd128 == 0) pt <= pt + 14'd3;
                else pt <= pt +14'd1;
            end
        endcase
    end
end

//gray_addr
always@(posedge clk or posedge reset)begin
    if(reset) begin
        gray_addr <= 14'd0;
    end
    else begin
        if(nx_state == STATE_RD) begin
            if(pt % 8'd128 == 0)begin
                case(count)
                    0: gray_addr <= pt;
                    1: gray_addr <= pt + 14'd1;
                    2: gray_addr <= pt + 14'd2;
                    3: gray_addr <= pt + 14'd128;
                    4: gray_addr <= pt + 14'd129;
                    5: gray_addr <= pt + 14'd130;
                    6: gray_addr <= pt + 14'd256;
                    7: gray_addr <= pt + 14'd257;
                    8: gray_addr <= pt + 14'd258;
                    default: gray_addr <= 14'd0;
                endcase
            end
            else begin
                case(count)
                    0: gray_addr = pt + 14'd2;
                    1: gray_addr = pt + 14'd130;
                    2: gray_addr = pt + 14'd258;
                endcase
            end
        end
        else gray_addr <= 14'd0;
    end
end 

//data
always@(posedge clk or posedge reset)begin
    if(reset) begin
        for(i=0 ; i<=4'd8 ; i=i+1)begin
            data[i] <= 4'd0;
        end
    end
    else begin
        if(pt % 8'd128 == 0) begin
            data[count - 4'd1] <= (count >= 4'd1) ? gray_data : data[count];
        end
        else begin
            case(count)
                1: begin
                    data[0] <= data[1];
                    data[1] <= data[2];
                    data[3] <= data[4];
                    data[4] <= data[5];
                    data[6] <= data[7];
                    data[7] <= data[8];
                    
                    data[2] <= gray_data;
                end
                2: data[5] <= gray_data;
                3: data[8] <= gray_data;
                default: begin
                    for(i=0 ; i<=4'd8 ; i=i+1)begin
                        data[i] <= data[i];
                    end
                end
            endcase
        end
    end
end

//================================================================
// STATE_CAL
//================================================================

//s
always@(*) begin
    if(cur_state == STATE_CAL)begin
        for(i=0 ; i<=4'd8 ; i=i+1)begin
            s[i] = (data[i] >= data[4]) ? 1 : 0 ;
        end
    end
    else begin
        for(i=0 ; i<=4'd8 ; i=i+1)begin
            s[i] = 0;
        end
    end
end

//sol
always@(*)begin
    if(cur_state == STATE_CAL) begin
        sol = s[0]*2**0 +
              s[1]*2**1 +
              s[2]*2**2 +
              s[3]*2**3 +
              s[5]*2**4 +
              s[6]*2**5 +
              s[7]*2**6 +
              s[8]*2**7 ;
    end
    else sol = sol;
end

//================================================================
// STATE_SD
//================================================================

//lbp_addr
always@(posedge clk or posedge reset)begin
    if(reset) lbp_addr <= 14'd0;
    else begin
        if(nx_state == STATE_SD) begin
            lbp_addr <= pt + 14'd129;
        end
        else lbp_addr <= lbp_addr;
    end
end

//lbp_data
always@(posedge clk or posedge reset)begin
    if(reset) lbp_data <= 8'd0;
    else begin
        if(nx_state == STATE_SD) begin
            lbp_data <= sol;
        end
        else lbp_data <= 8'd0;
    end
end


//================================================================
// FSM
//================================================================
always@(posedge clk or posedge reset) begin
    if(reset) cur_state <= STATE_IDLE;
    else begin
        cur_state <= nx_state; 
    end
end

always@(*)begin
    case(cur_state)
        STATE_IDLE: nx_state <= (gray_ready) ? STATE_RD : STATE_IDLE;
        STATE_RD:   nx_state <= (gray_req) ? STATE_RD : STATE_CAL;
        STATE_CAL:  nx_state <= STATE_SD;
        STATE_SD:   nx_state <= STATE_RD;
    endcase
end




//================================================================
// signal control
//================================================================
always @(*) begin
    case(cur_state)
        STATE_IDLE:begin
            gray_req=0;
            lbp_valid=0;
            finish=0;
        end
        STATE_RD:begin
            // if((pt % 8'd128) == 0) gray_req = (count > 4'd9) ? 0 : 1;
            // else gray_req = (count > 4'd3) ? 0 : 1;
            gray_req = (count > 4'd9) ? 0 : 1;
            lbp_valid=0;
            finish = (lbp_addr == 14'd16254) ? 1 : 0;
        end
        STATE_CAL:begin
            gray_req=0;
            lbp_valid=0;
            finish=0;
        end
        STATE_SD:begin
            gray_req=0;
            lbp_valid=1;
            finish=0;
        end
    endcase
end

//====================================================================
endmodule
