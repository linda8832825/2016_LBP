/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Sat Jul 15 15:22:55 2023
/////////////////////////////////////////////////////////////


module LBP_DW01_inc_0_DW01_inc_1 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;

  wire   [13:2] carry;

  ADDHXL U1_1_12 ( .A(A[12]), .B(carry[12]), .CO(carry[13]), .S(SUM[12]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_11 ( .A(A[11]), .B(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  XOR2X1 U1 ( .A(carry[13]), .B(A[13]), .Y(SUM[13]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module LBP ( clk, reset, gray_addr, gray_req, gray_ready, gray_data, lbp_addr, 
        lbp_valid, lbp_data, finish );
  output [13:0] gray_addr;
  input [7:0] gray_data;
  output [13:0] lbp_addr;
  output [7:0] lbp_data;
  input clk, reset, gray_ready;
  output gray_req, lbp_valid, finish;
  wire   n930, n931, n932, n933, n934, n935, n936, n937, n938, n939, n940,
         n941, n942, n943, n944, n945, n946, n947, n948, n949, n950, n951,
         n952, n953, n954, n955, n956, n957, n958, n959, n960, n961, n962,
         n963, n964, n965, n966, n967, N86, N87, N88, N89, \nx_state[1] , N99,
         N100, N101, N102, N103, N104, N108, N109, N110, N111, N112, N113,
         N114, N115, N116, N117, N118, N119, N120, N121, N122, N123, N124,
         N125, N126, N127, N128, N129, N130, N131, N132, N133, N134, N149,
         N150, N151, N152, N153, N154, N155, N156, N157, N158, N159, N160,
         N161, N162, N222, N224, N225, N226, N227, N228, N229, N230, N231,
         N232, N233, N234, N235, N237, N238, N239, N240, N241, N242, N244,
         N245, N246, N247, N248, N249, N251, N252, N253, N254, N255, N256,
         N257, N258, N259, N260, N261, N262, N263, N266, N267, N268, N269,
         N270, N271, N272, N273, N274, N275, N276, N277, N285, N287, N288,
         N289, N290, N291, N293, N294, N295, N296, N297, N298, N299, N300,
         N301, N302, N303, N304, N305, N308, N309, N310, N311, N312, N313,
         N314, N315, N316, N317, N318, N319, N663, N664, N665, N666, N667,
         N668, N669, N670, N671, N672, N673, N674, N675, N676, n69, n74, n75,
         n77, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n178, n179, n384, n385, n386, n387,
         n388, n389, n390, n391, n392, n393, n394, n395, n396, n397, n398,
         n399, n400, n401, n402, n403, n404, n405, n406, n407, n408, n409,
         n410, n411, n412, n413, n414, n415, n416, n417, n418, n419, n420,
         n421, n422, n423, n424, n425, n426, n427, n428, n429, n430, n431,
         n432, n433, n434, n435, n436, n437, n438, n439, n440, n441, n442,
         n443, n444, n445, n446, n447, n448, n449, n450, n451, n452, n453,
         n454, n455, n456, n457, n458, n459, n460, n461, n462, n463, n464,
         n465, n466, n467, n468, n469, \add_83/carry[2] , \add_83/carry[3] ,
         \add_83/carry[4] , \add_83/carry[5] , \add_83/carry[6] ,
         \add_83/carry[7] , \add_83/carry[8] , \add_83/carry[9] ,
         \add_83/carry[10] , \add_83/carry[11] , \add_83/carry[12] ,
         \add_83/carry[13] , \add_60_S2/carry[2] , \add_60_S2/carry[3] ,
         \add_60_S2/carry[4] , \add_60_S2/carry[5] , \add_60_S2/carry[6] ,
         \add_60_S2/carry[7] , \add_60_S2/carry[8] , \add_60_S2/carry[9] ,
         \add_60_S2/carry[10] , \add_60_S2/carry[11] , \add_60_S2/carry[12] ,
         \add_60_S2/carry[13] , \r446/carry[2] , \r446/carry[3] ,
         \r446/carry[4] , \r446/carry[5] , \r446/carry[6] , \r446/carry[7] ,
         \r446/carry[8] , \r446/carry[9] , \r446/carry[10] , \r446/carry[11] ,
         \r446/carry[12] , \r446/carry[13] , \add_60/carry[2] ,
         \add_60/carry[3] , \add_60/carry[4] , \add_60/carry[5] ,
         \add_60/carry[6] , n470, n471, n472, n473, n474, n475, n495, n497,
         n499, n501, n503, n505, n507, n509, n511, n513, n515, n517, n519,
         n521, n526, n527, n528, n531, n532, n533, n534, n535, n536, n537,
         n538, n539, n540, n541, n542, n543, n544, n545, n546, n547, n548,
         n549, n550, n551, n552, n553, n554, n555, n556, n557, n558, n559,
         n560, n561, n562, n563, n564, n565, n566, n567, n568, n569, n570,
         n571, n572, n573, n574, n575, n576, n577, n578, n579, n580, n581,
         n582, n583, n584, n585, n586, n587, n588, n589, n590, n591, n592,
         n593, n594, n595, n596, n597, n598, n599, n600, n601, n602, n603,
         n604, n605, n606, n607, n608, n609, n610, n611, n612, n613, n614,
         n615, n616, n617, n618, n619, n620, n621, n622, n623, n624, n625,
         n626, n627, n628, n629, n630, n631, n632, n633, n634, n635, n636,
         n637, n638, n639, n640, n641, n642, n643, n644, n645, n646, n647,
         n648, n649, n650, n651, n652, n653, n654, n655, n656, n657, n658,
         n659, n660, n661, n662, n663, n664, n665, n666, n667, n668, n669,
         n670, n671, n672, n673, n674, n675, n676, n677, n678, n679, n680,
         n681, n682, n683, n684, n685, n686, n687, n688, n689, n690, n691,
         n692, n693, n694, n695, n696, n697, n698, n699, n700, n701, n702,
         n703, n704, n705, n706, n707, n708, n709, n710, n711, n712, n713,
         n714, n715, n716, n717, n718, n719, n720, n721, n722, n723, n724,
         n725, n726, n727, n728, n729, n730, n731, n732, n733, n734, n735,
         n736, n737, n738, n739, n740, n741, n742, n743, n744, n745, n746,
         n747, n748, n749, n750, n751, n752, n753, n754, n755, n756, n757,
         n758, n759, n760, n761, n762, n763, n764, n765, n766, n767, n768,
         n769, n770, n771, n772, n773, n774, n775, n776, n777, n778, n779,
         n780, n781, n782, n783, n784, n785, n786, n787, n788, n789, n790,
         n791, n792, n793, n794, n795, n796, n797, n798, n799, n800, n801,
         n802, n803, n804, n805, n806, n807, n808, n809, n810, n811, n812,
         n813, n814, n815, n816, n817, n818, n819, n820, n821, n822, n823,
         n824, n825, n826, n827, n828, n829, n830, n831, n832, n833, n834,
         n835, n836, n837, n838, n839, n840, n841, n842, n843, n844, n845,
         n846, n847, n848, n849, n850, n851, n852, n853, n854, n855, n856,
         n857, n858, n859, n860, n861, n862, n863, n864, n865, n866, n867,
         n868, n869, n870, n871, n872, n873, n874, n875, n876, n877, n878,
         n879, n880, n881, n882, n883, n884, n885, n886, n887, n888, n889,
         n890, n891, n892, n893, n894, n895, n896, n897, n898, n899, n900,
         n901, n902, n903, n904, n905, n906, n907, n908, n909, n910, n911,
         n912, n913, n914, n915, n916, n917, n918, n919, n920, n921, n922,
         n923, n924, n925, n926, n927, n928, n929;
  wire   [13:0] pt;
  wire   [13:1] \add_82/carry ;
  wire   [13:1] \add_79/carry ;
  wire   [13:1] \r450/carry ;
  wire   [13:1] \r447/carry ;
  wire   [13:1] \r444/carry ;

  LBP_DW01_inc_0_DW01_inc_1 r443 ( .A({pt[13], n555, n556, n557, n558, n559, 
        n560, n566, n565, n564, n563, n562, n561, n567}), .SUM({N134, N133, 
        N132, N131, N130, N129, N128, N127, N126, N125, N124, N123, N122, N121}) );
  DFFRX1 \pt_reg[10]  ( .D(N159), .CK(clk), .RN(n576), .Q(pt[10]) );
  DFFRX1 \pt_reg[11]  ( .D(N160), .CK(clk), .RN(n576), .Q(pt[11]) );
  DFFRX1 \pt_reg[12]  ( .D(N161), .CK(clk), .RN(n576), .Q(pt[12]) );
  DFFRX1 \pt_reg[8]  ( .D(N157), .CK(clk), .RN(n576), .Q(pt[8]), .QN(n472) );
  DFFRX1 \pt_reg[9]  ( .D(N158), .CK(clk), .RN(n576), .Q(pt[9]) );
  DFFRX1 \pt_reg[7]  ( .D(N156), .CK(clk), .RN(n576), .Q(N285), .QN(n473) );
  DFFRX1 \pt_reg[6]  ( .D(N155), .CK(clk), .RN(n577), .Q(N242) );
  DFFRX1 \pt_reg[5]  ( .D(N154), .CK(clk), .RN(n577), .Q(N241) );
  DFFRX1 \pt_reg[4]  ( .D(N153), .CK(clk), .RN(n577), .Q(N240) );
  DFFRX1 \pt_reg[3]  ( .D(N152), .CK(clk), .RN(n577), .Q(N239) );
  DFFRX1 \pt_reg[2]  ( .D(N151), .CK(clk), .RN(n576), .Q(N238) );
  DFFRX1 \pt_reg[0]  ( .D(N149), .CK(clk), .RN(n577), .Q(N222), .QN(n475) );
  DFFRX1 \pt_reg[1]  ( .D(N150), .CK(clk), .RN(n576), .Q(N237), .QN(n474) );
  DFFRX1 \gray_addr_reg[13]  ( .D(n384), .CK(clk), .RN(n573), .Q(n930), .QN(
        n521) );
  DFFRX1 \gray_addr_reg[1]  ( .D(n396), .CK(clk), .RN(n574), .Q(n942), .QN(
        n519) );
  DFFRX1 \gray_addr_reg[7]  ( .D(n390), .CK(clk), .RN(n573), .Q(n936), .QN(
        n517) );
  DFFRX1 \gray_addr_reg[8]  ( .D(n389), .CK(clk), .RN(n573), .Q(n935), .QN(
        n515) );
  DFFRX1 \gray_addr_reg[9]  ( .D(n388), .CK(clk), .RN(n573), .Q(n934), .QN(
        n513) );
  DFFRX1 \gray_addr_reg[10]  ( .D(n387), .CK(clk), .RN(n573), .Q(n933), .QN(
        n511) );
  DFFRX1 \gray_addr_reg[11]  ( .D(n386), .CK(clk), .RN(n573), .Q(n932), .QN(
        n509) );
  DFFRX1 \gray_addr_reg[12]  ( .D(n385), .CK(clk), .RN(n573), .Q(n931), .QN(
        n507) );
  DFFRX1 \gray_addr_reg[2]  ( .D(n395), .CK(clk), .RN(n574), .Q(n941), .QN(
        n505) );
  DFFRX1 \gray_addr_reg[3]  ( .D(n394), .CK(clk), .RN(n574), .Q(n940), .QN(
        n503) );
  DFFRX1 \gray_addr_reg[4]  ( .D(n393), .CK(clk), .RN(n574), .Q(n939), .QN(
        n501) );
  DFFRX1 \gray_addr_reg[5]  ( .D(n392), .CK(clk), .RN(n574), .Q(n938), .QN(
        n499) );
  DFFRX1 \gray_addr_reg[6]  ( .D(n391), .CK(clk), .RN(n574), .Q(n937), .QN(
        n497) );
  DFFRX1 \gray_addr_reg[0]  ( .D(n397), .CK(clk), .RN(n573), .Q(n943), .QN(
        n495) );
  DFFRX1 \lbp_addr_reg[13]  ( .D(N676), .CK(clk), .RN(n575), .Q(n944), .QN(
        n891) );
  DFFRX1 \lbp_addr_reg[12]  ( .D(N675), .CK(clk), .RN(n575), .Q(n945), .QN(
        n892) );
  DFFRX1 \lbp_addr_reg[11]  ( .D(N674), .CK(clk), .RN(n575), .Q(n946), .QN(
        n893) );
  DFFRX1 \lbp_addr_reg[10]  ( .D(N673), .CK(clk), .RN(n575), .Q(n947), .QN(
        n894) );
  DFFRX1 \lbp_addr_reg[9]  ( .D(N672), .CK(clk), .RN(n575), .Q(n948), .QN(n895) );
  DFFRX1 \lbp_addr_reg[8]  ( .D(N671), .CK(clk), .RN(n575), .Q(n949), .QN(n896) );
  DFFRX1 \lbp_addr_reg[6]  ( .D(N669), .CK(clk), .RN(n575), .Q(n951), .QN(n897) );
  DFFRX1 \lbp_addr_reg[5]  ( .D(N668), .CK(clk), .RN(n575), .Q(n952), .QN(n898) );
  DFFRX1 \lbp_addr_reg[7]  ( .D(N670), .CK(clk), .RN(n575), .Q(n950), .QN(n176) );
  DFFRX1 \lbp_addr_reg[0]  ( .D(N663), .CK(clk), .RN(n576), .Q(n957), .QN(n903) );
  DFFRX1 \lbp_addr_reg[4]  ( .D(N667), .CK(clk), .RN(n575), .Q(n953), .QN(n899) );
  DFFRX1 \lbp_addr_reg[3]  ( .D(N666), .CK(clk), .RN(n576), .Q(n954), .QN(n900) );
  DFFRX1 \lbp_addr_reg[2]  ( .D(N665), .CK(clk), .RN(n576), .Q(n955), .QN(n901) );
  DFFRX1 \lbp_addr_reg[1]  ( .D(N664), .CK(clk), .RN(n576), .Q(n956), .QN(n902) );
  DFFRX1 \cur_state_reg[1]  ( .D(\nx_state[1] ), .CK(clk), .RN(n928), .Q(n887), 
        .QN(n178) );
  DFFRX1 \count_reg[1]  ( .D(N87), .CK(clk), .RN(n928), .Q(n706), .QN(n75) );
  DFFRX1 \count_reg[2]  ( .D(N88), .CK(clk), .RN(n928), .Q(n703), .QN(n74) );
  DFFRX1 \count_reg[3]  ( .D(N89), .CK(clk), .RN(n928), .Q(n708), .QN(n69) );
  DFFRX1 \data_reg[8][7]  ( .D(n462), .CK(clk), .RN(n928), .QN(n168) );
  DFFRX1 \data_reg[8][6]  ( .D(n463), .CK(clk), .RN(n928), .QN(n169) );
  DFFRX1 \data_reg[8][5]  ( .D(n464), .CK(clk), .RN(n928), .Q(n725), .QN(n170)
         );
  DFFRX1 \data_reg[8][4]  ( .D(n465), .CK(clk), .RN(n928), .Q(n724), .QN(n171)
         );
  DFFRX1 \data_reg[8][3]  ( .D(n466), .CK(clk), .RN(n928), .QN(n172) );
  DFFRX1 \data_reg[8][2]  ( .D(n467), .CK(clk), .RN(n928), .QN(n173) );
  DFFRX1 \data_reg[8][1]  ( .D(n468), .CK(clk), .RN(n928), .QN(n174) );
  DFFRX1 \data_reg[8][0]  ( .D(n469), .CK(clk), .RN(n928), .QN(n175) );
  DFFRX1 \data_reg[5][7]  ( .D(n438), .CK(clk), .RN(n928), .QN(n152) );
  DFFRX1 \data_reg[5][6]  ( .D(n439), .CK(clk), .RN(n928), .QN(n153) );
  DFFRX1 \data_reg[5][5]  ( .D(n440), .CK(clk), .RN(n928), .Q(n774), .QN(n154)
         );
  DFFRX1 \data_reg[5][4]  ( .D(n441), .CK(clk), .RN(n928), .Q(n773), .QN(n155)
         );
  DFFRX1 \data_reg[5][3]  ( .D(n442), .CK(clk), .RN(n928), .QN(n156) );
  DFFRX1 \data_reg[5][2]  ( .D(n443), .CK(clk), .RN(n928), .QN(n157) );
  DFFRX1 \data_reg[5][1]  ( .D(n444), .CK(clk), .RN(n928), .QN(n158) );
  DFFRX1 \data_reg[5][0]  ( .D(n445), .CK(clk), .RN(n928), .QN(n159) );
  DFFRX1 \cur_state_reg[0]  ( .D(n929), .CK(clk), .RN(n928), .QN(n179) );
  DFFRX1 \data_reg[0][7]  ( .D(n398), .CK(clk), .RN(n928), .QN(n904) );
  DFFRX1 \data_reg[0][6]  ( .D(n399), .CK(clk), .RN(n928), .QN(n910) );
  DFFRX1 \data_reg[0][5]  ( .D(n400), .CK(clk), .RN(n928), .Q(n836), .QN(n905)
         );
  DFFRX1 \data_reg[0][4]  ( .D(n401), .CK(clk), .RN(n928), .Q(n835), .QN(n911)
         );
  DFFRX1 \data_reg[0][3]  ( .D(n402), .CK(clk), .RN(n928), .QN(n906) );
  DFFRX1 \data_reg[0][2]  ( .D(n403), .CK(clk), .RN(n928), .QN(n909) );
  DFFRX1 \data_reg[0][1]  ( .D(n404), .CK(clk), .RN(n928), .QN(n907) );
  DFFRX1 \data_reg[0][0]  ( .D(n405), .CK(clk), .RN(n928), .Q(n841), .QN(n908)
         );
  DFFRX1 \data_reg[3][7]  ( .D(n422), .CK(clk), .RN(n928), .QN(n912) );
  DFFRX1 \data_reg[3][6]  ( .D(n423), .CK(clk), .RN(n928), .QN(n918) );
  DFFRX1 \data_reg[3][5]  ( .D(n424), .CK(clk), .RN(n928), .Q(n789), .QN(n913)
         );
  DFFRX1 \data_reg[3][4]  ( .D(n425), .CK(clk), .RN(n928), .Q(n788), .QN(n919)
         );
  DFFRX1 \data_reg[3][3]  ( .D(n426), .CK(clk), .RN(n928), .QN(n914) );
  DFFRX1 \data_reg[3][2]  ( .D(n427), .CK(clk), .RN(n928), .QN(n917) );
  DFFRX1 \data_reg[3][1]  ( .D(n428), .CK(clk), .RN(n928), .QN(n915) );
  DFFRX1 \data_reg[3][0]  ( .D(n429), .CK(clk), .RN(n928), .QN(n916) );
  DFFRX1 \data_reg[7][7]  ( .D(n454), .CK(clk), .RN(n928), .QN(n160) );
  DFFRX1 \data_reg[7][6]  ( .D(n455), .CK(clk), .RN(n928), .QN(n161) );
  DFFRX1 \data_reg[7][5]  ( .D(n456), .CK(clk), .RN(n928), .Q(n744), .QN(n162)
         );
  DFFRX1 \data_reg[7][4]  ( .D(n457), .CK(clk), .RN(n928), .Q(n743), .QN(n163)
         );
  DFFRX1 \data_reg[7][3]  ( .D(n458), .CK(clk), .RN(n928), .QN(n164) );
  DFFRX1 \data_reg[7][2]  ( .D(n459), .CK(clk), .RN(n928), .QN(n165) );
  DFFRX1 \data_reg[7][1]  ( .D(n460), .CK(clk), .RN(n928), .QN(n166) );
  DFFRX1 \data_reg[7][0]  ( .D(n461), .CK(clk), .RN(n928), .QN(n167) );
  DFFRX1 \data_reg[4][5]  ( .D(n432), .CK(clk), .RN(n928), .QN(n146) );
  DFFRX1 \data_reg[4][4]  ( .D(n433), .CK(clk), .RN(n928), .QN(n147) );
  DFFRX1 \data_reg[4][2]  ( .D(n435), .CK(clk), .RN(n928), .Q(n471), .QN(n149)
         );
  DFFRX1 \data_reg[4][0]  ( .D(n437), .CK(clk), .RN(n928), .QN(n151) );
  DFFRX1 \data_reg[2][7]  ( .D(n414), .CK(clk), .RN(n928), .QN(n136) );
  DFFRX1 \data_reg[2][6]  ( .D(n415), .CK(clk), .RN(n928), .QN(n137) );
  DFFRX1 \data_reg[2][5]  ( .D(n416), .CK(clk), .RN(n928), .Q(n804), .QN(n138)
         );
  DFFRX1 \data_reg[2][4]  ( .D(n417), .CK(clk), .RN(n928), .Q(n803), .QN(n139)
         );
  DFFRX1 \data_reg[2][3]  ( .D(n418), .CK(clk), .RN(n928), .QN(n140) );
  DFFRX1 \data_reg[2][2]  ( .D(n419), .CK(clk), .RN(n928), .QN(n141) );
  DFFRX1 \data_reg[2][1]  ( .D(n420), .CK(clk), .RN(n928), .Q(n809), .QN(n142)
         );
  DFFRX1 \data_reg[2][0]  ( .D(n421), .CK(clk), .RN(n928), .QN(n143) );
  DFFRX1 \data_reg[1][7]  ( .D(n406), .CK(clk), .RN(n928), .QN(n128) );
  DFFRX1 \data_reg[1][6]  ( .D(n407), .CK(clk), .RN(n928), .QN(n129) );
  DFFRX1 \data_reg[1][5]  ( .D(n408), .CK(clk), .RN(n928), .Q(n821), .QN(n130)
         );
  DFFRX1 \data_reg[1][4]  ( .D(n409), .CK(clk), .RN(n928), .Q(n820), .QN(n131)
         );
  DFFRX1 \data_reg[1][3]  ( .D(n410), .CK(clk), .RN(n928), .QN(n132) );
  DFFRX1 \data_reg[1][2]  ( .D(n411), .CK(clk), .RN(n928), .QN(n133) );
  DFFRX1 \data_reg[1][1]  ( .D(n412), .CK(clk), .RN(n928), .Q(n825), .QN(n134)
         );
  DFFRX1 \data_reg[1][0]  ( .D(n413), .CK(clk), .RN(n928), .QN(n135) );
  DFFRX1 \data_reg[6][7]  ( .D(n446), .CK(clk), .RN(n928), .QN(n920) );
  DFFRX1 \data_reg[6][6]  ( .D(n447), .CK(clk), .RN(n928), .QN(n926) );
  DFFRX1 \data_reg[6][5]  ( .D(n448), .CK(clk), .RN(n928), .Q(n759), .QN(n921)
         );
  DFFRX1 \data_reg[6][4]  ( .D(n449), .CK(clk), .RN(n928), .Q(n758), .QN(n927)
         );
  DFFRX1 \data_reg[6][3]  ( .D(n450), .CK(clk), .RN(n928), .QN(n922) );
  DFFRX1 \data_reg[6][2]  ( .D(n451), .CK(clk), .RN(n928), .QN(n925) );
  DFFRX1 \data_reg[6][1]  ( .D(n452), .CK(clk), .RN(n928), .QN(n923) );
  DFFRX1 \data_reg[6][0]  ( .D(n453), .CK(clk), .RN(n928), .QN(n924) );
  DFFRX1 \data_reg[4][1]  ( .D(n436), .CK(clk), .RN(n928), .Q(n526), .QN(n150)
         );
  DFFRX4 \data_reg[4][6]  ( .D(n431), .CK(clk), .RN(n928), .Q(n723), .QN(n145)
         );
  DFFRX4 \data_reg[4][3]  ( .D(n434), .CK(clk), .RN(n928), .Q(n726), .QN(n148)
         );
  DFFRX4 \data_reg[4][7]  ( .D(n430), .CK(clk), .RN(n928), .Q(n716), .QN(n144)
         );
  DFFRX2 \pt_reg[13]  ( .D(N162), .CK(clk), .RN(n928), .Q(pt[13]), .QN(n527)
         );
  DFFRX2 \count_reg[0]  ( .D(N86), .CK(clk), .RN(n928), .Q(n700), .QN(n77) );
  NAND2X1 U395 ( .A(n547), .B(n597), .Y(n470) );
  CLKBUFX3 U396 ( .A(N237), .Y(n561) );
  CLKBUFX3 U397 ( .A(N222), .Y(n567) );
  INVX12 U398 ( .A(n843), .Y(gray_req) );
  INVX16 U399 ( .A(reset), .Y(n928) );
  INVX3 U400 ( .A(n554), .Y(n734) );
  OA22X1 U401 ( .A0(n750), .A1(n751), .B0(n920), .B1(n716), .Y(n961) );
  INVX12 U402 ( .A(n961), .Y(lbp_data[5]) );
  NOR2X2 U403 ( .A(n534), .B(n603), .Y(n614) );
  OA22X1 U404 ( .A0(n780), .A1(n781), .B0(n912), .B1(n716), .Y(n963) );
  INVX12 U405 ( .A(n963), .Y(lbp_data[3]) );
  NOR2X2 U406 ( .A(n536), .B(n603), .Y(n620) );
  OA22X1 U407 ( .A0(n795), .A1(n796), .B0(n136), .B1(n716), .Y(n964) );
  INVX12 U408 ( .A(n964), .Y(lbp_data[2]) );
  NOR2X2 U409 ( .A(n537), .B(n603), .Y(n622) );
  OA22X1 U410 ( .A0(n812), .A1(n813), .B0(n128), .B1(n716), .Y(n965) );
  INVX12 U411 ( .A(n965), .Y(lbp_data[1]) );
  NOR2BX2 U412 ( .AN(n702), .B(n699), .Y(n674) );
  NOR2X2 U413 ( .A(n603), .B(n535), .Y(n617) );
  OA22X1 U414 ( .A0(n827), .A1(n828), .B0(n904), .B1(n716), .Y(n966) );
  INVX12 U415 ( .A(n966), .Y(lbp_data[0]) );
  OAI21X2 U416 ( .A0(n531), .A1(n597), .B0(n578), .Y(n580) );
  BUFX12 U417 ( .A(n956), .Y(lbp_addr[1]) );
  BUFX12 U418 ( .A(n955), .Y(lbp_addr[2]) );
  BUFX12 U419 ( .A(n954), .Y(lbp_addr[3]) );
  BUFX12 U420 ( .A(n953), .Y(lbp_addr[4]) );
  BUFX12 U421 ( .A(n957), .Y(lbp_addr[0]) );
  BUFX12 U422 ( .A(n950), .Y(lbp_addr[7]) );
  BUFX12 U423 ( .A(n952), .Y(lbp_addr[5]) );
  BUFX12 U424 ( .A(n951), .Y(lbp_addr[6]) );
  BUFX12 U425 ( .A(n949), .Y(lbp_addr[8]) );
  BUFX12 U426 ( .A(n948), .Y(lbp_addr[9]) );
  BUFX12 U427 ( .A(n947), .Y(lbp_addr[10]) );
  BUFX12 U428 ( .A(n946), .Y(lbp_addr[11]) );
  BUFX12 U429 ( .A(n945), .Y(lbp_addr[12]) );
  BUFX12 U430 ( .A(n944), .Y(lbp_addr[13]) );
  INVX12 U431 ( .A(n495), .Y(gray_addr[0]) );
  AOI22XL U432 ( .A0(n567), .A1(n546), .B0(n545), .B1(n943), .Y(n633) );
  INVX12 U433 ( .A(n497), .Y(gray_addr[6]) );
  AOI22XL U434 ( .A0(N312), .A1(n546), .B0(n545), .B1(n937), .Y(n666) );
  INVX12 U435 ( .A(n499), .Y(gray_addr[5]) );
  AOI22XL U436 ( .A0(N311), .A1(n546), .B0(n545), .B1(n938), .Y(n662) );
  INVX12 U437 ( .A(n501), .Y(gray_addr[4]) );
  AOI22XL U438 ( .A0(N310), .A1(n546), .B0(n545), .B1(n939), .Y(n658) );
  INVX12 U439 ( .A(n503), .Y(gray_addr[3]) );
  AOI22XL U440 ( .A0(N309), .A1(n546), .B0(n545), .B1(n940), .Y(n654) );
  INVX12 U441 ( .A(n505), .Y(gray_addr[2]) );
  AOI22XL U442 ( .A0(N308), .A1(n546), .B0(n545), .B1(n941), .Y(n650) );
  INVX12 U443 ( .A(n507), .Y(gray_addr[12]) );
  AOI22XL U444 ( .A0(N318), .A1(n546), .B0(n545), .B1(n931), .Y(n691) );
  INVX12 U445 ( .A(n509), .Y(gray_addr[11]) );
  AOI22XL U446 ( .A0(N317), .A1(n546), .B0(n545), .B1(n932), .Y(n687) );
  INVX12 U447 ( .A(n511), .Y(gray_addr[10]) );
  AOI22XL U448 ( .A0(N316), .A1(n546), .B0(n545), .B1(n933), .Y(n683) );
  INVX12 U449 ( .A(n513), .Y(gray_addr[9]) );
  AOI22XL U450 ( .A0(N315), .A1(n546), .B0(n545), .B1(n934), .Y(n679) );
  INVX12 U451 ( .A(n515), .Y(gray_addr[8]) );
  AOI22XL U452 ( .A0(N314), .A1(n546), .B0(n545), .B1(n935), .Y(n675) );
  INVX12 U453 ( .A(n517), .Y(gray_addr[7]) );
  AOI22XL U454 ( .A0(N313), .A1(n546), .B0(n545), .B1(n936), .Y(n670) );
  INVX12 U455 ( .A(n519), .Y(gray_addr[1]) );
  AOI22XL U456 ( .A0(n474), .A1(n546), .B0(n545), .B1(n942), .Y(n646) );
  INVX12 U457 ( .A(n521), .Y(gray_addr[13]) );
  AOI22XL U458 ( .A0(N319), .A1(n546), .B0(n545), .B1(n930), .Y(n695) );
  NOR2X2 U459 ( .A(n532), .B(n603), .Y(n602) );
  NOR2X2 U460 ( .A(n603), .B(n605), .Y(n606) );
  NOR2X2 U461 ( .A(n548), .B(n547), .Y(n603) );
  OA22X1 U462 ( .A0(n765), .A1(n766), .B0(n152), .B1(n716), .Y(n962) );
  INVX12 U463 ( .A(n962), .Y(lbp_data[4]) );
  OAI21X2 U464 ( .A0(n533), .A1(n597), .B0(n608), .Y(n609) );
  NAND3XL U465 ( .A(n703), .B(n700), .C(n701), .Y(n707) );
  NAND2XL U466 ( .A(n704), .B(n700), .Y(n615) );
  NOR2XL U467 ( .A(n700), .B(n851), .Y(N86) );
  NAND3XL U468 ( .A(n706), .B(n700), .C(n848), .Y(n852) );
  NAND2XL U469 ( .A(n905), .B(n734), .Y(n829) );
  NAND2XL U470 ( .A(n130), .B(n734), .Y(n814) );
  NAND2XL U471 ( .A(n138), .B(n734), .Y(n797) );
  NAND2XL U472 ( .A(n913), .B(n734), .Y(n782) );
  NAND2XL U473 ( .A(n154), .B(n734), .Y(n767) );
  NAND2XL U474 ( .A(n921), .B(n734), .Y(n752) );
  NAND2XL U475 ( .A(n162), .B(n734), .Y(n737) );
  NAND3XL U476 ( .A(n74), .B(n700), .C(n701), .Y(n598) );
  NAND2XL U477 ( .A(n170), .B(n734), .Y(n717) );
  BUFX12 U478 ( .A(n960), .Y(lbp_data[6]) );
  OAI22XL U479 ( .A0(n735), .A1(n736), .B0(n160), .B1(n716), .Y(n960) );
  NOR2X2 U480 ( .A(n151), .B(n150), .Y(n731) );
  INVX1 U481 ( .A(n731), .Y(n808) );
  AOI21XL U482 ( .A0(n731), .A1(n908), .B0(n907), .Y(n842) );
  OAI211XL U483 ( .A0(n166), .A1(n731), .B0(n749), .C0(n733), .Y(n747) );
  AO21XL U484 ( .A0(n526), .A1(n166), .B0(n167), .Y(n749) );
  OAI211XL U485 ( .A0(n174), .A1(n731), .B0(n732), .C0(n733), .Y(n729) );
  AO21XL U486 ( .A0(n526), .A1(n174), .B0(n175), .Y(n732) );
  OAI211XL U487 ( .A0(n916), .A1(n526), .B0(n794), .C0(n733), .Y(n793) );
  AO21XL U488 ( .A0(n731), .A1(n916), .B0(n915), .Y(n794) );
  OAI211XL U489 ( .A0(n924), .A1(n526), .B0(n764), .C0(n733), .Y(n763) );
  AO21XL U490 ( .A0(n731), .A1(n924), .B0(n923), .Y(n764) );
  AOI21XL U491 ( .A0(n526), .A1(n134), .B0(n135), .Y(n826) );
  AOI21XL U492 ( .A0(n526), .A1(n142), .B0(n143), .Y(n811) );
  CLKBUFX3 U493 ( .A(N240), .Y(n564) );
  CLKBUFX3 U494 ( .A(N241), .Y(n565) );
  CLKBUFX3 U495 ( .A(N239), .Y(n563) );
  CLKBUFX3 U496 ( .A(N238), .Y(n562) );
  CLKBUFX3 U497 ( .A(pt[8]), .Y(n559) );
  CLKBUFX3 U498 ( .A(N285), .Y(n560) );
  CLKBUFX3 U499 ( .A(pt[11]), .Y(n556) );
  CLKBUFX3 U500 ( .A(pt[10]), .Y(n557) );
  CLKBUFX3 U501 ( .A(pt[9]), .Y(n558) );
  CLKBUFX3 U502 ( .A(pt[12]), .Y(n555) );
  BUFX12 U503 ( .A(n959), .Y(lbp_data[7]) );
  OAI22XL U504 ( .A0(n714), .A1(n715), .B0(n168), .B1(n716), .Y(n959) );
  CLKBUFX3 U505 ( .A(n571), .Y(n569) );
  CLKBUFX3 U506 ( .A(n571), .Y(n570) );
  NOR2X2 U507 ( .A(n597), .B(n607), .Y(n605) );
  CLKBUFX3 U508 ( .A(n571), .Y(n568) );
  CLKBUFX3 U509 ( .A(n470), .Y(n571) );
  CLKBUFX3 U510 ( .A(n572), .Y(n573) );
  CLKBUFX3 U511 ( .A(n572), .Y(n574) );
  CLKBUFX3 U512 ( .A(n572), .Y(n575) );
  CLKBUFX3 U513 ( .A(n572), .Y(n576) );
  CLKBUFX3 U514 ( .A(n572), .Y(n577) );
  NAND2X2 U515 ( .A(n710), .B(n548), .Y(n699) );
  CLKBUFX3 U516 ( .A(n640), .Y(n543) );
  NOR2X1 U517 ( .A(n707), .B(n699), .Y(n640) );
  CLKBUFX3 U518 ( .A(n645), .Y(n545) );
  CLKINVX1 U519 ( .A(n709), .Y(n645) );
  CLKBUFX3 U520 ( .A(n641), .Y(n540) );
  NOR2BX1 U521 ( .AN(n547), .B(n699), .Y(n641) );
  AND2X2 U522 ( .A(n886), .B(n551), .Y(n870) );
  CLKBUFX3 U523 ( .A(n871), .Y(n550) );
  NOR2BX1 U524 ( .AN(n551), .B(n886), .Y(n871) );
  INVX3 U525 ( .A(n548), .Y(n597) );
  CLKBUFX3 U526 ( .A(n613), .Y(n534) );
  NOR2BX1 U527 ( .AN(n615), .B(n597), .Y(n613) );
  CLKBUFX3 U528 ( .A(n642), .Y(n542) );
  OAI32XL U529 ( .A0(n705), .A1(n706), .A2(n700), .B0(n611), .B1(n699), .Y(
        n642) );
  CLKBUFX3 U530 ( .A(n643), .Y(n544) );
  OAI22XL U531 ( .A0(n699), .A1(n615), .B0(n600), .B1(n705), .Y(n643) );
  CLKBUFX3 U532 ( .A(n638), .Y(n538) );
  NOR2X1 U533 ( .A(n699), .B(n598), .Y(n638) );
  CLKBUFX3 U534 ( .A(n637), .Y(n541) );
  NOR2X1 U535 ( .A(n618), .B(n699), .Y(n637) );
  CLKBUFX3 U536 ( .A(n639), .Y(n539) );
  NOR2X1 U537 ( .A(n612), .B(n699), .Y(n639) );
  CLKBUFX3 U538 ( .A(n869), .Y(n549) );
  CLKBUFX3 U539 ( .A(n855), .Y(n551) );
  AND2X2 U540 ( .A(n929), .B(\nx_state[1] ), .Y(n855) );
  CLKBUFX3 U541 ( .A(n624), .Y(n547) );
  NOR3X1 U542 ( .A(n600), .B(n703), .C(n708), .Y(n624) );
  OR2X2 U543 ( .A(n531), .B(n598), .Y(n578) );
  OR2X2 U544 ( .A(n611), .B(n533), .Y(n608) );
  CLKBUFX3 U545 ( .A(n625), .Y(n548) );
  NOR4BX1 U546 ( .AN(n712), .B(n567), .C(n561), .D(n562), .Y(n625) );
  CLKBUFX3 U547 ( .A(n610), .Y(n533) );
  NOR2BX1 U548 ( .AN(n612), .B(n597), .Y(n610) );
  CLKBUFX3 U549 ( .A(n581), .Y(n531) );
  AOI2BB1X1 U550 ( .A0N(n599), .A1N(n600), .B0(n597), .Y(n581) );
  CLKBUFX3 U551 ( .A(n621), .Y(n537) );
  NOR2BX1 U552 ( .AN(n611), .B(n597), .Y(n621) );
  CLKBUFX3 U553 ( .A(n619), .Y(n536) );
  NOR2BX1 U554 ( .AN(n598), .B(n597), .Y(n619) );
  CLKBUFX3 U555 ( .A(n601), .Y(n532) );
  NOR2BX1 U556 ( .AN(n604), .B(n597), .Y(n601) );
  CLKBUFX3 U557 ( .A(n616), .Y(n535) );
  NOR2BX1 U558 ( .AN(n618), .B(n597), .Y(n616) );
  XOR2X1 U559 ( .A(n527), .B(n528), .Y(N319) );
  NAND2X1 U560 ( .A(\r450/carry [12]), .B(n555), .Y(n528) );
  CLKBUFX3 U561 ( .A(n644), .Y(n546) );
  CLKBUFX3 U562 ( .A(n146), .Y(n554) );
  CLKBUFX3 U563 ( .A(n147), .Y(n553) );
  CLKBUFX3 U564 ( .A(n149), .Y(n552) );
  NAND2X2 U565 ( .A(gray_data[0]), .B(n548), .Y(n582) );
  NAND2X2 U566 ( .A(gray_data[1]), .B(n548), .Y(n584) );
  NAND2X2 U567 ( .A(gray_data[2]), .B(n548), .Y(n586) );
  NAND2X2 U568 ( .A(gray_data[3]), .B(n548), .Y(n588) );
  NAND2X2 U569 ( .A(gray_data[4]), .B(n548), .Y(n590) );
  NAND2X2 U570 ( .A(gray_data[5]), .B(n548), .Y(n592) );
  NAND2X2 U571 ( .A(gray_data[6]), .B(n548), .Y(n594) );
  NAND2X2 U572 ( .A(gray_data[7]), .B(n548), .Y(n596) );
  CLKBUFX3 U573 ( .A(N242), .Y(n566) );
  CLKBUFX3 U574 ( .A(n928), .Y(n572) );
  BUFX12 U575 ( .A(n958), .Y(lbp_valid) );
  BUFX12 U576 ( .A(n967), .Y(finish) );
  AOI32XL U577 ( .A0(n829), .A1(n830), .A2(n831), .B0(n832), .B1(n833), .Y(
        n827) );
  AOI32XL U578 ( .A0(n782), .A1(n783), .A2(n784), .B0(n785), .B1(n786), .Y(
        n780) );
  AOI32XL U579 ( .A0(n752), .A1(n753), .A2(n754), .B0(n755), .B1(n756), .Y(
        n750) );
  AOI32XL U580 ( .A0(n814), .A1(n815), .A2(n816), .B0(n817), .B1(n818), .Y(
        n812) );
  AOI32XL U581 ( .A0(n797), .A1(n798), .A2(n799), .B0(n800), .B1(n801), .Y(
        n795) );
  AOI32XL U582 ( .A0(n767), .A1(n768), .A2(n769), .B0(n770), .B1(n771), .Y(
        n765) );
  AOI32XL U583 ( .A0(n737), .A1(n738), .A2(n739), .B0(n740), .B1(n741), .Y(
        n735) );
  AOI32XL U584 ( .A0(n717), .A1(n718), .A2(n719), .B0(n720), .B1(n721), .Y(
        n714) );
  XOR2X1 U585 ( .A(pt[13]), .B(\add_79/carry [13]), .Y(N249) );
  AND2X1 U586 ( .A(\add_79/carry [12]), .B(n555), .Y(\add_79/carry [13]) );
  XOR2X1 U587 ( .A(n555), .B(\add_79/carry [12]), .Y(N248) );
  AND2X1 U588 ( .A(\add_79/carry [11]), .B(n556), .Y(\add_79/carry [12]) );
  XOR2X1 U589 ( .A(n556), .B(\add_79/carry [11]), .Y(N247) );
  AND2X1 U590 ( .A(\add_79/carry [10]), .B(n557), .Y(\add_79/carry [11]) );
  XOR2X1 U591 ( .A(n557), .B(\add_79/carry [10]), .Y(N246) );
  AND2X1 U592 ( .A(\add_79/carry [9]), .B(n558), .Y(\add_79/carry [10]) );
  XOR2X1 U593 ( .A(n558), .B(\add_79/carry [9]), .Y(N245) );
  AND2X1 U594 ( .A(n560), .B(n559), .Y(\add_79/carry [9]) );
  XOR2X1 U595 ( .A(n559), .B(n560), .Y(N244) );
  XOR2X1 U596 ( .A(pt[13]), .B(\add_82/carry [13]), .Y(N291) );
  AND2X1 U597 ( .A(\add_82/carry [12]), .B(n555), .Y(\add_82/carry [13]) );
  XOR2X1 U598 ( .A(n555), .B(\add_82/carry [12]), .Y(N290) );
  AND2X1 U599 ( .A(\add_82/carry [11]), .B(n556), .Y(\add_82/carry [12]) );
  XOR2X1 U600 ( .A(n556), .B(\add_82/carry [11]), .Y(N289) );
  AND2X1 U601 ( .A(\add_82/carry [10]), .B(n557), .Y(\add_82/carry [11]) );
  XOR2X1 U602 ( .A(n557), .B(\add_82/carry [10]), .Y(N288) );
  AND2X1 U603 ( .A(n559), .B(n558), .Y(\add_82/carry [10]) );
  XOR2X1 U604 ( .A(n558), .B(n559), .Y(N287) );
  XOR2X1 U605 ( .A(pt[13]), .B(\r444/carry [13]), .Y(N235) );
  AND2X1 U606 ( .A(\r444/carry [12]), .B(n555), .Y(\r444/carry [13]) );
  XOR2X1 U607 ( .A(n555), .B(\r444/carry [12]), .Y(N234) );
  AND2X1 U608 ( .A(\r444/carry [11]), .B(n556), .Y(\r444/carry [12]) );
  XOR2X1 U609 ( .A(n556), .B(\r444/carry [11]), .Y(N233) );
  AND2X1 U610 ( .A(\r444/carry [10]), .B(n557), .Y(\r444/carry [11]) );
  XOR2X1 U611 ( .A(n557), .B(\r444/carry [10]), .Y(N232) );
  AND2X1 U612 ( .A(\r444/carry [9]), .B(n558), .Y(\r444/carry [10]) );
  XOR2X1 U613 ( .A(n558), .B(\r444/carry [9]), .Y(N231) );
  AND2X1 U614 ( .A(\r444/carry [8]), .B(n559), .Y(\r444/carry [9]) );
  XOR2X1 U615 ( .A(n559), .B(\r444/carry [8]), .Y(N230) );
  AND2X1 U616 ( .A(\r444/carry [7]), .B(n560), .Y(\r444/carry [8]) );
  XOR2X1 U617 ( .A(n560), .B(\r444/carry [7]), .Y(N229) );
  XOR2X1 U618 ( .A(pt[13]), .B(\add_83/carry[13] ), .Y(N305) );
  AND2X1 U619 ( .A(\add_83/carry[12] ), .B(n555), .Y(\add_83/carry[13] ) );
  XOR2X1 U620 ( .A(n555), .B(\add_83/carry[12] ), .Y(N304) );
  AND2X1 U621 ( .A(\add_83/carry[11] ), .B(n556), .Y(\add_83/carry[12] ) );
  XOR2X1 U622 ( .A(n556), .B(\add_83/carry[11] ), .Y(N303) );
  AND2X1 U623 ( .A(\add_83/carry[10] ), .B(n557), .Y(\add_83/carry[11] ) );
  XOR2X1 U624 ( .A(n557), .B(\add_83/carry[10] ), .Y(N302) );
  AND2X1 U625 ( .A(\add_83/carry[9] ), .B(n558), .Y(\add_83/carry[10] ) );
  XOR2X1 U626 ( .A(n558), .B(\add_83/carry[9] ), .Y(N301) );
  OR2X1 U627 ( .A(n559), .B(\add_83/carry[8] ), .Y(\add_83/carry[9] ) );
  XNOR2X1 U628 ( .A(\add_83/carry[8] ), .B(n559), .Y(N300) );
  AND2X1 U629 ( .A(\add_83/carry[7] ), .B(n560), .Y(\add_83/carry[8] ) );
  XOR2X1 U630 ( .A(n560), .B(\add_83/carry[7] ), .Y(N299) );
  XOR2X1 U631 ( .A(pt[13]), .B(\r447/carry [13]), .Y(N277) );
  AND2X1 U632 ( .A(\r447/carry [12]), .B(n555), .Y(\r447/carry [13]) );
  XOR2X1 U633 ( .A(n555), .B(\r447/carry [12]), .Y(N276) );
  AND2X1 U634 ( .A(\r447/carry [11]), .B(n556), .Y(\r447/carry [12]) );
  XOR2X1 U635 ( .A(n556), .B(\r447/carry [11]), .Y(N275) );
  AND2X1 U636 ( .A(\r447/carry [10]), .B(n557), .Y(\r447/carry [11]) );
  XOR2X1 U637 ( .A(n557), .B(\r447/carry [10]), .Y(N274) );
  AND2X1 U638 ( .A(\r447/carry [9]), .B(n558), .Y(\r447/carry [10]) );
  XOR2X1 U639 ( .A(n558), .B(\r447/carry [9]), .Y(N273) );
  AND2X1 U640 ( .A(\r447/carry [8]), .B(n559), .Y(\r447/carry [9]) );
  XOR2X1 U641 ( .A(n559), .B(\r447/carry [8]), .Y(N272) );
  OR2X1 U642 ( .A(n560), .B(\r447/carry [7]), .Y(\r447/carry [8]) );
  XNOR2X1 U643 ( .A(\r447/carry [7]), .B(n560), .Y(N271) );
  XOR2X1 U644 ( .A(n555), .B(\r450/carry [12]), .Y(N318) );
  AND2X1 U645 ( .A(\r450/carry [11]), .B(n556), .Y(\r450/carry [12]) );
  XOR2X1 U646 ( .A(n556), .B(\r450/carry [11]), .Y(N317) );
  AND2X1 U647 ( .A(\r450/carry [10]), .B(n557), .Y(\r450/carry [11]) );
  XOR2X1 U648 ( .A(n557), .B(\r450/carry [10]), .Y(N316) );
  AND2X1 U649 ( .A(\r450/carry [9]), .B(n558), .Y(\r450/carry [10]) );
  XOR2X1 U650 ( .A(n558), .B(\r450/carry [9]), .Y(N315) );
  OR2X1 U651 ( .A(n559), .B(\r450/carry [8]), .Y(\r450/carry [9]) );
  XNOR2X1 U652 ( .A(\r450/carry [8]), .B(n559), .Y(N314) );
  AND2X1 U653 ( .A(\r450/carry [7]), .B(n560), .Y(\r450/carry [8]) );
  XOR2X1 U654 ( .A(n560), .B(\r450/carry [7]), .Y(N313) );
  AND2X1 U655 ( .A(\add_83/carry[6] ), .B(n566), .Y(\add_83/carry[7] ) );
  XOR2X1 U656 ( .A(n566), .B(\add_83/carry[6] ), .Y(N298) );
  AND2X1 U657 ( .A(\add_83/carry[5] ), .B(n565), .Y(\add_83/carry[6] ) );
  XOR2X1 U658 ( .A(n565), .B(\add_83/carry[5] ), .Y(N297) );
  AND2X1 U659 ( .A(\add_83/carry[4] ), .B(n564), .Y(\add_83/carry[5] ) );
  XOR2X1 U660 ( .A(n564), .B(\add_83/carry[4] ), .Y(N296) );
  AND2X1 U661 ( .A(\add_83/carry[3] ), .B(n563), .Y(\add_83/carry[4] ) );
  XOR2X1 U662 ( .A(n563), .B(\add_83/carry[3] ), .Y(N295) );
  AND2X1 U663 ( .A(\add_83/carry[2] ), .B(n562), .Y(\add_83/carry[3] ) );
  XOR2X1 U664 ( .A(n562), .B(\add_83/carry[2] ), .Y(N294) );
  AND2X1 U665 ( .A(n567), .B(n561), .Y(\add_83/carry[2] ) );
  XOR2X1 U666 ( .A(n561), .B(n567), .Y(N293) );
  AND2X1 U667 ( .A(\r447/carry [6]), .B(n566), .Y(\r447/carry [7]) );
  XOR2X1 U668 ( .A(n566), .B(\r447/carry [6]), .Y(N270) );
  AND2X1 U669 ( .A(\r447/carry [5]), .B(n565), .Y(\r447/carry [6]) );
  XOR2X1 U670 ( .A(n565), .B(\r447/carry [5]), .Y(N269) );
  AND2X1 U671 ( .A(\r447/carry [4]), .B(n564), .Y(\r447/carry [5]) );
  XOR2X1 U672 ( .A(n564), .B(\r447/carry [4]), .Y(N268) );
  AND2X1 U673 ( .A(\r447/carry [3]), .B(n563), .Y(\r447/carry [4]) );
  XOR2X1 U674 ( .A(n563), .B(\r447/carry [3]), .Y(N267) );
  AND2X1 U675 ( .A(n561), .B(n562), .Y(\r447/carry [3]) );
  XOR2X1 U676 ( .A(n562), .B(n561), .Y(N266) );
  AND2X1 U677 ( .A(\r444/carry [6]), .B(n566), .Y(\r444/carry [7]) );
  XOR2X1 U678 ( .A(n566), .B(\r444/carry [6]), .Y(N228) );
  AND2X1 U679 ( .A(\r444/carry [5]), .B(n565), .Y(\r444/carry [6]) );
  XOR2X1 U680 ( .A(n565), .B(\r444/carry [5]), .Y(N227) );
  AND2X1 U681 ( .A(\r444/carry [4]), .B(n564), .Y(\r444/carry [5]) );
  XOR2X1 U682 ( .A(n564), .B(\r444/carry [4]), .Y(N226) );
  AND2X1 U683 ( .A(\r444/carry [3]), .B(n563), .Y(\r444/carry [4]) );
  XOR2X1 U684 ( .A(n563), .B(\r444/carry [3]), .Y(N225) );
  AND2X1 U685 ( .A(n561), .B(n562), .Y(\r444/carry [3]) );
  XOR2X1 U686 ( .A(n562), .B(n561), .Y(N224) );
  AND2X1 U687 ( .A(\r450/carry [6]), .B(n566), .Y(\r450/carry [7]) );
  XOR2X1 U688 ( .A(n566), .B(\r450/carry [6]), .Y(N312) );
  AND2X1 U689 ( .A(\r450/carry [5]), .B(n565), .Y(\r450/carry [6]) );
  XOR2X1 U690 ( .A(n565), .B(\r450/carry [5]), .Y(N311) );
  AND2X1 U691 ( .A(\r450/carry [4]), .B(n564), .Y(\r450/carry [5]) );
  XOR2X1 U692 ( .A(n564), .B(\r450/carry [4]), .Y(N310) );
  AND2X1 U693 ( .A(\r450/carry [3]), .B(n563), .Y(\r450/carry [4]) );
  XOR2X1 U694 ( .A(n563), .B(\r450/carry [3]), .Y(N309) );
  AND2X1 U695 ( .A(n561), .B(n562), .Y(\r450/carry [3]) );
  XOR2X1 U696 ( .A(n562), .B(n561), .Y(N308) );
  XOR2X1 U697 ( .A(pt[13]), .B(\r446/carry[13] ), .Y(N263) );
  AND2X1 U698 ( .A(\r446/carry[12] ), .B(n555), .Y(\r446/carry[13] ) );
  XOR2X1 U699 ( .A(n555), .B(\r446/carry[12] ), .Y(N262) );
  AND2X1 U700 ( .A(\r446/carry[11] ), .B(n556), .Y(\r446/carry[12] ) );
  XOR2X1 U701 ( .A(n556), .B(\r446/carry[11] ), .Y(N261) );
  AND2X1 U702 ( .A(\r446/carry[10] ), .B(n557), .Y(\r446/carry[11] ) );
  XOR2X1 U703 ( .A(n557), .B(\r446/carry[10] ), .Y(N260) );
  AND2X1 U704 ( .A(\r446/carry[9] ), .B(n558), .Y(\r446/carry[10] ) );
  XOR2X1 U705 ( .A(n558), .B(\r446/carry[9] ), .Y(N259) );
  AND2X1 U706 ( .A(\r446/carry[8] ), .B(n559), .Y(\r446/carry[9] ) );
  XOR2X1 U707 ( .A(n559), .B(\r446/carry[8] ), .Y(N258) );
  OR2X1 U708 ( .A(n560), .B(\r446/carry[7] ), .Y(\r446/carry[8] ) );
  XNOR2X1 U709 ( .A(\r446/carry[7] ), .B(n560), .Y(N257) );
  AND2X1 U710 ( .A(\r446/carry[6] ), .B(n566), .Y(\r446/carry[7] ) );
  XOR2X1 U711 ( .A(n566), .B(\r446/carry[6] ), .Y(N256) );
  AND2X1 U712 ( .A(\r446/carry[5] ), .B(n565), .Y(\r446/carry[6] ) );
  XOR2X1 U713 ( .A(n565), .B(\r446/carry[5] ), .Y(N255) );
  AND2X1 U714 ( .A(\r446/carry[4] ), .B(n564), .Y(\r446/carry[5] ) );
  XOR2X1 U715 ( .A(n564), .B(\r446/carry[4] ), .Y(N254) );
  AND2X1 U716 ( .A(\r446/carry[3] ), .B(n563), .Y(\r446/carry[4] ) );
  XOR2X1 U717 ( .A(n563), .B(\r446/carry[3] ), .Y(N253) );
  AND2X1 U718 ( .A(\r446/carry[2] ), .B(n562), .Y(\r446/carry[3] ) );
  XOR2X1 U719 ( .A(n562), .B(\r446/carry[2] ), .Y(N252) );
  AND2X1 U720 ( .A(n567), .B(n561), .Y(\r446/carry[2] ) );
  XOR2X1 U721 ( .A(n561), .B(n567), .Y(N251) );
  XOR2X1 U722 ( .A(pt[13]), .B(\add_60_S2/carry[13] ), .Y(N120) );
  AND2X1 U723 ( .A(\add_60_S2/carry[12] ), .B(n555), .Y(\add_60_S2/carry[13] )
         );
  XOR2X1 U724 ( .A(n555), .B(\add_60_S2/carry[12] ), .Y(N119) );
  AND2X1 U725 ( .A(\add_60_S2/carry[11] ), .B(n556), .Y(\add_60_S2/carry[12] )
         );
  XOR2X1 U726 ( .A(n556), .B(\add_60_S2/carry[11] ), .Y(N118) );
  AND2X1 U727 ( .A(\add_60_S2/carry[10] ), .B(n557), .Y(\add_60_S2/carry[11] )
         );
  XOR2X1 U728 ( .A(n557), .B(\add_60_S2/carry[10] ), .Y(N117) );
  AND2X1 U729 ( .A(\add_60_S2/carry[9] ), .B(n558), .Y(\add_60_S2/carry[10] )
         );
  XOR2X1 U730 ( .A(n558), .B(\add_60_S2/carry[9] ), .Y(N116) );
  AND2X1 U731 ( .A(\add_60_S2/carry[8] ), .B(n559), .Y(\add_60_S2/carry[9] )
         );
  XOR2X1 U732 ( .A(n559), .B(\add_60_S2/carry[8] ), .Y(N115) );
  AND2X1 U733 ( .A(\add_60_S2/carry[7] ), .B(n560), .Y(\add_60_S2/carry[8] )
         );
  XOR2X1 U734 ( .A(n560), .B(\add_60_S2/carry[7] ), .Y(N114) );
  AND2X1 U735 ( .A(\add_60_S2/carry[6] ), .B(n566), .Y(\add_60_S2/carry[7] )
         );
  XOR2X1 U736 ( .A(n566), .B(\add_60_S2/carry[6] ), .Y(N113) );
  AND2X1 U737 ( .A(\add_60_S2/carry[5] ), .B(n565), .Y(\add_60_S2/carry[6] )
         );
  XOR2X1 U738 ( .A(n565), .B(\add_60_S2/carry[5] ), .Y(N112) );
  AND2X1 U739 ( .A(\add_60_S2/carry[4] ), .B(n564), .Y(\add_60_S2/carry[5] )
         );
  XOR2X1 U740 ( .A(n564), .B(\add_60_S2/carry[4] ), .Y(N111) );
  AND2X1 U741 ( .A(\add_60_S2/carry[3] ), .B(n563), .Y(\add_60_S2/carry[4] )
         );
  XOR2X1 U742 ( .A(n563), .B(\add_60_S2/carry[3] ), .Y(N110) );
  AND2X1 U743 ( .A(\add_60_S2/carry[2] ), .B(n562), .Y(\add_60_S2/carry[3] )
         );
  XOR2X1 U744 ( .A(n562), .B(\add_60_S2/carry[2] ), .Y(N109) );
  OR2X1 U745 ( .A(n561), .B(n567), .Y(\add_60_S2/carry[2] ) );
  XNOR2X1 U746 ( .A(n567), .B(n561), .Y(N108) );
  XOR2X1 U747 ( .A(n566), .B(\add_60/carry[6] ), .Y(N104) );
  AND2X1 U748 ( .A(\add_60/carry[5] ), .B(n565), .Y(\add_60/carry[6] ) );
  XOR2X1 U749 ( .A(n565), .B(\add_60/carry[5] ), .Y(N103) );
  AND2X1 U750 ( .A(\add_60/carry[4] ), .B(n564), .Y(\add_60/carry[5] ) );
  XOR2X1 U751 ( .A(n564), .B(\add_60/carry[4] ), .Y(N102) );
  AND2X1 U752 ( .A(\add_60/carry[3] ), .B(n563), .Y(\add_60/carry[4] ) );
  XOR2X1 U753 ( .A(n563), .B(\add_60/carry[3] ), .Y(N101) );
  AND2X1 U754 ( .A(\add_60/carry[2] ), .B(n562), .Y(\add_60/carry[3] ) );
  XOR2X1 U755 ( .A(n562), .B(\add_60/carry[2] ), .Y(N100) );
  OR2X1 U756 ( .A(n561), .B(n567), .Y(\add_60/carry[2] ) );
  XNOR2X1 U757 ( .A(n567), .B(n561), .Y(N99) );
  OAI222XL U758 ( .A0(n578), .A1(n579), .B0(n175), .B1(n580), .C0(n531), .C1(
        n582), .Y(n469) );
  OAI222XL U759 ( .A0(n578), .A1(n583), .B0(n174), .B1(n580), .C0(n531), .C1(
        n584), .Y(n468) );
  OAI222XL U760 ( .A0(n578), .A1(n585), .B0(n173), .B1(n580), .C0(n531), .C1(
        n586), .Y(n467) );
  OAI222XL U761 ( .A0(n578), .A1(n587), .B0(n172), .B1(n580), .C0(n531), .C1(
        n588), .Y(n466) );
  OAI222XL U762 ( .A0(n578), .A1(n589), .B0(n171), .B1(n580), .C0(n531), .C1(
        n590), .Y(n465) );
  OAI222XL U763 ( .A0(n578), .A1(n591), .B0(n170), .B1(n580), .C0(n531), .C1(
        n592), .Y(n464) );
  OAI222XL U764 ( .A0(n578), .A1(n593), .B0(n169), .B1(n580), .C0(n531), .C1(
        n594), .Y(n463) );
  OAI222XL U765 ( .A0(n578), .A1(n595), .B0(n168), .B1(n580), .C0(n531), .C1(
        n596), .Y(n462) );
  OAI222XL U766 ( .A0(n532), .A1(n582), .B0(n167), .B1(n602), .C0(n175), .C1(
        n568), .Y(n461) );
  OAI222XL U767 ( .A0(n532), .A1(n584), .B0(n166), .B1(n602), .C0(n174), .C1(
        n568), .Y(n460) );
  OAI222XL U768 ( .A0(n532), .A1(n586), .B0(n165), .B1(n602), .C0(n173), .C1(
        n568), .Y(n459) );
  OAI222XL U769 ( .A0(n532), .A1(n588), .B0(n164), .B1(n602), .C0(n172), .C1(
        n568), .Y(n458) );
  OAI222XL U770 ( .A0(n532), .A1(n590), .B0(n163), .B1(n602), .C0(n171), .C1(
        n568), .Y(n457) );
  OAI222XL U771 ( .A0(n532), .A1(n592), .B0(n162), .B1(n602), .C0(n170), .C1(
        n568), .Y(n456) );
  OAI222XL U772 ( .A0(n532), .A1(n594), .B0(n161), .B1(n602), .C0(n169), .C1(
        n568), .Y(n455) );
  OAI222XL U773 ( .A0(n532), .A1(n596), .B0(n160), .B1(n602), .C0(n168), .C1(
        n568), .Y(n454) );
  OAI222XL U774 ( .A0(n605), .A1(n582), .B0(n924), .B1(n606), .C0(n167), .C1(
        n568), .Y(n453) );
  OAI222XL U775 ( .A0(n605), .A1(n584), .B0(n923), .B1(n606), .C0(n166), .C1(
        n568), .Y(n452) );
  OAI222XL U776 ( .A0(n605), .A1(n586), .B0(n925), .B1(n606), .C0(n165), .C1(
        n568), .Y(n451) );
  OAI222XL U777 ( .A0(n605), .A1(n588), .B0(n922), .B1(n606), .C0(n164), .C1(
        n568), .Y(n450) );
  OAI222XL U778 ( .A0(n605), .A1(n590), .B0(n927), .B1(n606), .C0(n163), .C1(
        n569), .Y(n449) );
  OAI222XL U779 ( .A0(n605), .A1(n592), .B0(n921), .B1(n606), .C0(n162), .C1(
        n569), .Y(n448) );
  OAI222XL U780 ( .A0(n605), .A1(n594), .B0(n926), .B1(n606), .C0(n161), .C1(
        n569), .Y(n447) );
  OAI222XL U781 ( .A0(n605), .A1(n596), .B0(n920), .B1(n606), .C0(n160), .C1(
        n569), .Y(n446) );
  OAI222XL U782 ( .A0(n579), .A1(n608), .B0(n159), .B1(n609), .C0(n533), .C1(
        n582), .Y(n445) );
  OAI222XL U783 ( .A0(n583), .A1(n608), .B0(n158), .B1(n609), .C0(n533), .C1(
        n584), .Y(n444) );
  OAI222XL U784 ( .A0(n585), .A1(n608), .B0(n157), .B1(n609), .C0(n533), .C1(
        n586), .Y(n443) );
  OAI222XL U785 ( .A0(n587), .A1(n608), .B0(n156), .B1(n609), .C0(n533), .C1(
        n588), .Y(n442) );
  OAI222XL U786 ( .A0(n589), .A1(n608), .B0(n155), .B1(n609), .C0(n533), .C1(
        n590), .Y(n441) );
  OAI222XL U787 ( .A0(n591), .A1(n608), .B0(n154), .B1(n609), .C0(n533), .C1(
        n592), .Y(n440) );
  OAI222XL U788 ( .A0(n593), .A1(n608), .B0(n153), .B1(n609), .C0(n533), .C1(
        n594), .Y(n439) );
  OAI222XL U789 ( .A0(n595), .A1(n608), .B0(n152), .B1(n609), .C0(n533), .C1(
        n596), .Y(n438) );
  OAI222XL U790 ( .A0(n534), .A1(n582), .B0(n151), .B1(n614), .C0(n159), .C1(
        n569), .Y(n437) );
  OAI222XL U791 ( .A0(n534), .A1(n584), .B0(n150), .B1(n614), .C0(n158), .C1(
        n569), .Y(n436) );
  OAI222XL U792 ( .A0(n534), .A1(n586), .B0(n552), .B1(n614), .C0(n157), .C1(
        n569), .Y(n435) );
  OAI222XL U793 ( .A0(n534), .A1(n588), .B0(n148), .B1(n614), .C0(n156), .C1(
        n569), .Y(n434) );
  OAI222XL U794 ( .A0(n534), .A1(n590), .B0(n553), .B1(n614), .C0(n155), .C1(
        n569), .Y(n433) );
  OAI222XL U795 ( .A0(n534), .A1(n592), .B0(n554), .B1(n614), .C0(n154), .C1(
        n569), .Y(n432) );
  OAI222XL U796 ( .A0(n534), .A1(n594), .B0(n145), .B1(n614), .C0(n153), .C1(
        n569), .Y(n431) );
  OAI222XL U797 ( .A0(n534), .A1(n596), .B0(n144), .B1(n614), .C0(n152), .C1(
        n569), .Y(n430) );
  OAI222XL U798 ( .A0(n535), .A1(n582), .B0(n916), .B1(n617), .C0(n151), .C1(
        n470), .Y(n429) );
  OAI222XL U799 ( .A0(n535), .A1(n584), .B0(n915), .B1(n617), .C0(n150), .C1(
        n470), .Y(n428) );
  OAI222XL U800 ( .A0(n535), .A1(n586), .B0(n917), .B1(n617), .C0(n552), .C1(
        n571), .Y(n427) );
  OAI222XL U801 ( .A0(n535), .A1(n588), .B0(n914), .B1(n617), .C0(n148), .C1(
        n571), .Y(n426) );
  OAI222XL U802 ( .A0(n535), .A1(n590), .B0(n919), .B1(n617), .C0(n553), .C1(
        n569), .Y(n425) );
  OAI222XL U803 ( .A0(n535), .A1(n592), .B0(n913), .B1(n617), .C0(n554), .C1(
        n570), .Y(n424) );
  OAI222XL U804 ( .A0(n535), .A1(n594), .B0(n918), .B1(n617), .C0(n145), .C1(
        n568), .Y(n423) );
  OAI222XL U805 ( .A0(n535), .A1(n596), .B0(n912), .B1(n617), .C0(n144), .C1(
        n571), .Y(n422) );
  OAI222XL U806 ( .A0(n536), .A1(n582), .B0(n143), .B1(n620), .C0(n579), .C1(
        n571), .Y(n421) );
  CLKINVX1 U807 ( .A(gray_data[0]), .Y(n579) );
  OAI222XL U808 ( .A0(n536), .A1(n584), .B0(n142), .B1(n620), .C0(n583), .C1(
        n571), .Y(n420) );
  CLKINVX1 U809 ( .A(gray_data[1]), .Y(n583) );
  OAI222XL U810 ( .A0(n536), .A1(n586), .B0(n141), .B1(n620), .C0(n585), .C1(
        n571), .Y(n419) );
  CLKINVX1 U811 ( .A(gray_data[2]), .Y(n585) );
  OAI222XL U812 ( .A0(n536), .A1(n588), .B0(n140), .B1(n620), .C0(n587), .C1(
        n470), .Y(n418) );
  CLKINVX1 U813 ( .A(gray_data[3]), .Y(n587) );
  OAI222XL U814 ( .A0(n536), .A1(n590), .B0(n139), .B1(n620), .C0(n589), .C1(
        n570), .Y(n417) );
  CLKINVX1 U815 ( .A(gray_data[4]), .Y(n589) );
  OAI222XL U816 ( .A0(n536), .A1(n592), .B0(n138), .B1(n620), .C0(n591), .C1(
        n570), .Y(n416) );
  CLKINVX1 U817 ( .A(gray_data[5]), .Y(n591) );
  OAI222XL U818 ( .A0(n536), .A1(n594), .B0(n137), .B1(n620), .C0(n593), .C1(
        n570), .Y(n415) );
  CLKINVX1 U819 ( .A(gray_data[6]), .Y(n593) );
  OAI222XL U820 ( .A0(n536), .A1(n596), .B0(n136), .B1(n620), .C0(n595), .C1(
        n570), .Y(n414) );
  CLKINVX1 U821 ( .A(gray_data[7]), .Y(n595) );
  OAI222XL U822 ( .A0(n537), .A1(n582), .B0(n135), .B1(n622), .C0(n143), .C1(
        n570), .Y(n413) );
  OAI222XL U823 ( .A0(n537), .A1(n584), .B0(n134), .B1(n622), .C0(n142), .C1(
        n570), .Y(n412) );
  OAI222XL U824 ( .A0(n537), .A1(n586), .B0(n133), .B1(n622), .C0(n141), .C1(
        n570), .Y(n411) );
  OAI222XL U825 ( .A0(n537), .A1(n588), .B0(n132), .B1(n622), .C0(n140), .C1(
        n570), .Y(n410) );
  OAI222XL U826 ( .A0(n537), .A1(n590), .B0(n131), .B1(n622), .C0(n139), .C1(
        n570), .Y(n409) );
  OAI222XL U827 ( .A0(n537), .A1(n592), .B0(n130), .B1(n622), .C0(n138), .C1(
        n570), .Y(n408) );
  OAI222XL U828 ( .A0(n537), .A1(n594), .B0(n129), .B1(n622), .C0(n137), .C1(
        n570), .Y(n407) );
  OAI222XL U829 ( .A0(n537), .A1(n596), .B0(n128), .B1(n622), .C0(n136), .C1(
        n570), .Y(n406) );
  OAI21XL U830 ( .A0(n135), .A1(n470), .B0(n623), .Y(n405) );
  CLKMX2X2 U831 ( .A(n908), .B(n582), .S0(n547), .Y(n623) );
  OAI21XL U832 ( .A0(n134), .A1(n470), .B0(n626), .Y(n404) );
  CLKMX2X2 U833 ( .A(n907), .B(n584), .S0(n547), .Y(n626) );
  OAI21XL U834 ( .A0(n133), .A1(n470), .B0(n627), .Y(n403) );
  CLKMX2X2 U835 ( .A(n909), .B(n586), .S0(n547), .Y(n627) );
  OAI21XL U836 ( .A0(n132), .A1(n571), .B0(n628), .Y(n402) );
  CLKMX2X2 U837 ( .A(n906), .B(n588), .S0(n547), .Y(n628) );
  OAI21XL U838 ( .A0(n131), .A1(n571), .B0(n629), .Y(n401) );
  CLKMX2X2 U839 ( .A(n911), .B(n590), .S0(n547), .Y(n629) );
  OAI21XL U840 ( .A0(n130), .A1(n569), .B0(n630), .Y(n400) );
  CLKMX2X2 U841 ( .A(n905), .B(n592), .S0(n547), .Y(n630) );
  OAI21XL U842 ( .A0(n129), .A1(n570), .B0(n631), .Y(n399) );
  CLKMX2X2 U843 ( .A(n910), .B(n594), .S0(n547), .Y(n631) );
  OAI21XL U844 ( .A0(n128), .A1(n568), .B0(n632), .Y(n398) );
  CLKMX2X2 U845 ( .A(n904), .B(n596), .S0(n547), .Y(n632) );
  NAND4X1 U846 ( .A(n633), .B(n634), .C(n635), .D(n636), .Y(n397) );
  AOI222XL U847 ( .A0(n475), .A1(n541), .B0(n567), .B1(n538), .C0(n567), .C1(
        n539), .Y(n636) );
  AOI22X1 U848 ( .A0(n475), .A1(n543), .B0(N121), .B1(n540), .Y(n635) );
  AOI22X1 U849 ( .A0(n567), .A1(n542), .B0(n567), .B1(n544), .Y(n634) );
  NAND4X1 U850 ( .A(n646), .B(n647), .C(n648), .D(n649), .Y(n396) );
  AOI222XL U851 ( .A0(N251), .A1(n541), .B0(n561), .B1(n538), .C0(n561), .C1(
        n539), .Y(n649) );
  AOI22X1 U852 ( .A0(N293), .A1(n543), .B0(n540), .B1(N122), .Y(n648) );
  AOI22X1 U853 ( .A0(n474), .A1(n542), .B0(n474), .B1(n544), .Y(n647) );
  NAND4X1 U854 ( .A(n650), .B(n651), .C(n652), .D(n653), .Y(n395) );
  AOI222XL U855 ( .A0(N252), .A1(n541), .B0(n562), .B1(n538), .C0(n562), .C1(
        n539), .Y(n653) );
  AOI22X1 U856 ( .A0(N294), .A1(n543), .B0(n540), .B1(N123), .Y(n652) );
  AOI22X1 U857 ( .A0(N224), .A1(n542), .B0(N266), .B1(n544), .Y(n651) );
  NAND4X1 U858 ( .A(n654), .B(n655), .C(n656), .D(n657), .Y(n394) );
  AOI222XL U859 ( .A0(N253), .A1(n541), .B0(n563), .B1(n538), .C0(n563), .C1(
        n539), .Y(n657) );
  AOI22X1 U860 ( .A0(N295), .A1(n543), .B0(n540), .B1(N124), .Y(n656) );
  AOI22X1 U861 ( .A0(N225), .A1(n542), .B0(N267), .B1(n544), .Y(n655) );
  NAND4X1 U862 ( .A(n658), .B(n659), .C(n660), .D(n661), .Y(n393) );
  AOI222XL U863 ( .A0(N254), .A1(n541), .B0(n564), .B1(n538), .C0(n564), .C1(
        n539), .Y(n661) );
  AOI22X1 U864 ( .A0(N296), .A1(n543), .B0(n540), .B1(N125), .Y(n660) );
  AOI22X1 U865 ( .A0(N226), .A1(n542), .B0(N268), .B1(n544), .Y(n659) );
  NAND4X1 U866 ( .A(n662), .B(n663), .C(n664), .D(n665), .Y(n392) );
  AOI222XL U867 ( .A0(N255), .A1(n541), .B0(n565), .B1(n538), .C0(n565), .C1(
        n539), .Y(n665) );
  AOI22X1 U868 ( .A0(N297), .A1(n543), .B0(n540), .B1(N126), .Y(n664) );
  AOI22X1 U869 ( .A0(N227), .A1(n542), .B0(N269), .B1(n544), .Y(n663) );
  NAND4X1 U870 ( .A(n666), .B(n667), .C(n668), .D(n669), .Y(n391) );
  AOI222XL U871 ( .A0(N256), .A1(n541), .B0(n566), .B1(n538), .C0(n566), .C1(
        n539), .Y(n669) );
  AOI22X1 U872 ( .A0(N298), .A1(n543), .B0(n540), .B1(N127), .Y(n668) );
  AOI22X1 U873 ( .A0(N228), .A1(n542), .B0(N270), .B1(n544), .Y(n667) );
  NAND4X1 U874 ( .A(n670), .B(n671), .C(n672), .D(n673), .Y(n390) );
  AOI222XL U875 ( .A0(n560), .A1(n539), .B0(n560), .B1(n674), .C0(n473), .C1(
        n538), .Y(n673) );
  AOI22X1 U876 ( .A0(n541), .A1(N257), .B0(n540), .B1(N128), .Y(n672) );
  AOI222XL U877 ( .A0(N271), .A1(n544), .B0(N299), .B1(n543), .C0(N229), .C1(
        n542), .Y(n671) );
  NAND4X1 U878 ( .A(n675), .B(n676), .C(n677), .D(n678), .Y(n389) );
  AOI222XL U879 ( .A0(n472), .A1(n539), .B0(n559), .B1(n674), .C0(N244), .C1(
        n538), .Y(n678) );
  AOI22X1 U880 ( .A0(n541), .A1(N258), .B0(n540), .B1(N129), .Y(n677) );
  AOI222XL U881 ( .A0(N272), .A1(n544), .B0(N300), .B1(n543), .C0(N230), .C1(
        n542), .Y(n676) );
  NAND4X1 U882 ( .A(n679), .B(n680), .C(n681), .D(n682), .Y(n388) );
  AOI222XL U883 ( .A0(N287), .A1(n539), .B0(n558), .B1(n674), .C0(N245), .C1(
        n538), .Y(n682) );
  AOI22X1 U884 ( .A0(n541), .A1(N259), .B0(n540), .B1(N130), .Y(n681) );
  AOI222XL U885 ( .A0(N273), .A1(n544), .B0(N301), .B1(n543), .C0(N231), .C1(
        n542), .Y(n680) );
  NAND4X1 U886 ( .A(n683), .B(n684), .C(n685), .D(n686), .Y(n387) );
  AOI222XL U887 ( .A0(N288), .A1(n539), .B0(n557), .B1(n674), .C0(N246), .C1(
        n538), .Y(n686) );
  AOI22X1 U888 ( .A0(n541), .A1(N260), .B0(n540), .B1(N131), .Y(n685) );
  AOI222XL U889 ( .A0(N274), .A1(n544), .B0(N302), .B1(n543), .C0(N232), .C1(
        n542), .Y(n684) );
  NAND4X1 U890 ( .A(n687), .B(n688), .C(n689), .D(n690), .Y(n386) );
  AOI222XL U891 ( .A0(N289), .A1(n539), .B0(n556), .B1(n674), .C0(N247), .C1(
        n538), .Y(n690) );
  AOI22X1 U892 ( .A0(n541), .A1(N261), .B0(n540), .B1(N132), .Y(n689) );
  AOI222XL U893 ( .A0(N275), .A1(n544), .B0(N303), .B1(n543), .C0(N233), .C1(
        n542), .Y(n688) );
  NAND4X1 U894 ( .A(n691), .B(n692), .C(n693), .D(n694), .Y(n385) );
  AOI222XL U895 ( .A0(N290), .A1(n539), .B0(n555), .B1(n674), .C0(N248), .C1(
        n538), .Y(n694) );
  AOI22X1 U896 ( .A0(n541), .A1(N262), .B0(n540), .B1(N133), .Y(n693) );
  AOI222XL U897 ( .A0(N276), .A1(n544), .B0(N304), .B1(n543), .C0(N234), .C1(
        n542), .Y(n692) );
  NAND4X1 U898 ( .A(n695), .B(n696), .C(n697), .D(n698), .Y(n384) );
  AOI222XL U899 ( .A0(N291), .A1(n539), .B0(pt[13]), .B1(n674), .C0(N249), 
        .C1(n538), .Y(n698) );
  NAND3X1 U900 ( .A(n701), .B(n703), .C(n77), .Y(n612) );
  AOI22X1 U901 ( .A0(n541), .A1(N263), .B0(n540), .B1(N134), .Y(n697) );
  NAND2X1 U902 ( .A(n704), .B(n77), .Y(n618) );
  AOI222XL U903 ( .A0(N277), .A1(n544), .B0(N305), .B1(n543), .C0(N235), .C1(
        n542), .Y(n696) );
  NOR3X1 U904 ( .A(n706), .B(n74), .C(n708), .Y(n704) );
  OAI22XL U905 ( .A0(n699), .A1(n604), .B0(n75), .B1(n705), .Y(n644) );
  NAND3X1 U906 ( .A(n709), .B(n597), .C(n710), .Y(n705) );
  NAND4BX1 U907 ( .AN(n702), .B(n603), .C(n710), .D(n611), .Y(n709) );
  NAND3X1 U908 ( .A(n701), .B(n74), .C(n77), .Y(n611) );
  NOR4X1 U909 ( .A(n700), .B(n708), .C(n706), .D(n703), .Y(n702) );
  NAND3X1 U910 ( .A(n711), .B(n75), .C(n77), .Y(n604) );
  NOR4X1 U911 ( .A(n566), .B(n565), .C(n564), .D(n563), .Y(n712) );
  CLKINVX1 U912 ( .A(n713), .Y(n710) );
  NOR2X1 U913 ( .A(n179), .B(n178), .Y(n958) );
  AND2X1 U914 ( .A(n168), .B(n716), .Y(n715) );
  OAI21XL U915 ( .A0(n722), .A1(n723), .B0(n169), .Y(n721) );
  NAND2X1 U916 ( .A(n722), .B(n723), .Y(n720) );
  AOI32X1 U917 ( .A0(n553), .A1(n724), .A2(n717), .B0(n725), .B1(n554), .Y(
        n722) );
  AOI2BB2X1 U918 ( .B0(n723), .B1(n169), .A0N(n553), .A1N(n724), .Y(n719) );
  OAI22XL U919 ( .A0(n172), .A1(n726), .B0(n727), .B1(n728), .Y(n718) );
  AOI2BB2X1 U920 ( .B0(n552), .B1(n729), .A0N(n173), .A1N(n730), .Y(n728) );
  NOR2X1 U921 ( .A(n552), .B(n729), .Y(n730) );
  AND2X1 U922 ( .A(n172), .B(n726), .Y(n727) );
  AND2X1 U923 ( .A(n160), .B(n716), .Y(n736) );
  OAI21XL U924 ( .A0(n742), .A1(n723), .B0(n161), .Y(n741) );
  NAND2X1 U925 ( .A(n742), .B(n723), .Y(n740) );
  AOI32X1 U926 ( .A0(n553), .A1(n743), .A2(n737), .B0(n744), .B1(n554), .Y(
        n742) );
  AOI2BB2X1 U927 ( .B0(n723), .B1(n161), .A0N(n553), .A1N(n743), .Y(n739) );
  OAI22XL U928 ( .A0(n164), .A1(n726), .B0(n745), .B1(n746), .Y(n738) );
  AOI2BB2X1 U929 ( .B0(n552), .B1(n747), .A0N(n165), .A1N(n748), .Y(n746) );
  NOR2X1 U930 ( .A(n552), .B(n747), .Y(n748) );
  AND2X1 U931 ( .A(n164), .B(n726), .Y(n745) );
  AND2X1 U932 ( .A(n920), .B(n716), .Y(n751) );
  OAI21XL U933 ( .A0(n757), .A1(n723), .B0(n926), .Y(n756) );
  NAND2X1 U934 ( .A(n757), .B(n723), .Y(n755) );
  AOI32X1 U935 ( .A0(n553), .A1(n758), .A2(n752), .B0(n759), .B1(n554), .Y(
        n757) );
  AOI2BB2X1 U936 ( .B0(n723), .B1(n926), .A0N(n553), .A1N(n758), .Y(n754) );
  OAI21XL U937 ( .A0(n922), .A1(n726), .B0(n760), .Y(n753) );
  OAI2BB2XL U938 ( .B0(n761), .B1(n762), .A0N(n726), .A1N(n922), .Y(n760) );
  AND2X1 U939 ( .A(n763), .B(n552), .Y(n762) );
  AOI2BB1X1 U940 ( .A0N(n763), .A1N(n552), .B0(n925), .Y(n761) );
  AND2X1 U941 ( .A(n152), .B(n716), .Y(n766) );
  OAI21XL U942 ( .A0(n772), .A1(n723), .B0(n153), .Y(n771) );
  NAND2X1 U943 ( .A(n772), .B(n723), .Y(n770) );
  AOI32X1 U944 ( .A0(n553), .A1(n773), .A2(n767), .B0(n774), .B1(n554), .Y(
        n772) );
  AOI2BB2X1 U945 ( .B0(n723), .B1(n153), .A0N(n553), .A1N(n773), .Y(n769) );
  OAI22XL U946 ( .A0(n156), .A1(n726), .B0(n775), .B1(n776), .Y(n768) );
  AOI2BB2X1 U947 ( .B0(n552), .B1(n777), .A0N(n157), .A1N(n778), .Y(n776) );
  NOR2X1 U948 ( .A(n552), .B(n777), .Y(n778) );
  OAI211X1 U949 ( .A0(n158), .A1(n731), .B0(n779), .C0(n733), .Y(n777) );
  AO21X1 U950 ( .A0(n526), .A1(n158), .B0(n159), .Y(n779) );
  AND2X1 U951 ( .A(n156), .B(n726), .Y(n775) );
  AND2X1 U952 ( .A(n912), .B(n716), .Y(n781) );
  OAI21XL U953 ( .A0(n787), .A1(n723), .B0(n918), .Y(n786) );
  NAND2X1 U954 ( .A(n787), .B(n723), .Y(n785) );
  AOI32X1 U955 ( .A0(n553), .A1(n788), .A2(n782), .B0(n789), .B1(n554), .Y(
        n787) );
  AOI2BB2X1 U956 ( .B0(n723), .B1(n918), .A0N(n553), .A1N(n788), .Y(n784) );
  OAI21XL U957 ( .A0(n914), .A1(n726), .B0(n790), .Y(n783) );
  OAI2BB2XL U958 ( .B0(n791), .B1(n792), .A0N(n726), .A1N(n914), .Y(n790) );
  AND2X1 U959 ( .A(n793), .B(n552), .Y(n792) );
  AOI2BB1X1 U960 ( .A0N(n793), .A1N(n552), .B0(n917), .Y(n791) );
  AND2X1 U961 ( .A(n136), .B(n716), .Y(n796) );
  OAI21XL U962 ( .A0(n802), .A1(n137), .B0(n723), .Y(n801) );
  NAND2X1 U963 ( .A(n802), .B(n137), .Y(n800) );
  AOI32X1 U964 ( .A0(n553), .A1(n803), .A2(n797), .B0(n804), .B1(n554), .Y(
        n802) );
  AOI2BB2X1 U965 ( .B0(n723), .B1(n137), .A0N(n553), .A1N(n803), .Y(n799) );
  OAI22XL U966 ( .A0(n140), .A1(n726), .B0(n805), .B1(n806), .Y(n798) );
  ACHCINX2 U967 ( .CIN(n552), .A(n141), .B(n807), .CO(n806) );
  AOI211X1 U968 ( .A0(n808), .A1(n809), .B0(n810), .C0(n811), .Y(n807) );
  AND2X1 U969 ( .A(n140), .B(n726), .Y(n805) );
  AND2X1 U970 ( .A(n128), .B(n716), .Y(n813) );
  OAI21XL U971 ( .A0(n819), .A1(n129), .B0(n723), .Y(n818) );
  NAND2X1 U972 ( .A(n819), .B(n129), .Y(n817) );
  AOI32X1 U973 ( .A0(n553), .A1(n820), .A2(n814), .B0(n821), .B1(n554), .Y(
        n819) );
  AOI2BB2X1 U974 ( .B0(n723), .B1(n129), .A0N(n553), .A1N(n820), .Y(n816) );
  OAI22XL U975 ( .A0(n132), .A1(n726), .B0(n822), .B1(n823), .Y(n815) );
  ACHCINX2 U976 ( .CIN(n552), .A(n133), .B(n824), .CO(n823) );
  AOI211X1 U977 ( .A0(n808), .A1(n825), .B0(n810), .C0(n826), .Y(n824) );
  AND2X1 U978 ( .A(n132), .B(n726), .Y(n822) );
  NOR2BX1 U979 ( .AN(n904), .B(n144), .Y(n828) );
  OAI21XL U980 ( .A0(n834), .A1(n723), .B0(n910), .Y(n833) );
  NAND2X1 U981 ( .A(n834), .B(n723), .Y(n832) );
  AOI32X1 U982 ( .A0(n553), .A1(n835), .A2(n829), .B0(n836), .B1(n554), .Y(
        n834) );
  AOI2BB2X1 U983 ( .B0(n723), .B1(n910), .A0N(n553), .A1N(n835), .Y(n831) );
  OAI21XL U984 ( .A0(n906), .A1(n726), .B0(n837), .Y(n830) );
  OAI2BB2XL U985 ( .B0(n838), .B1(n839), .A0N(n726), .A1N(n906), .Y(n837) );
  NOR2X1 U986 ( .A(n840), .B(n471), .Y(n839) );
  AOI21X1 U987 ( .A0(n840), .A1(n471), .B0(n909), .Y(n838) );
  AOI211X1 U988 ( .A0(n841), .A1(n150), .B0(n842), .C0(n810), .Y(n840) );
  CLKINVX1 U989 ( .A(n733), .Y(n810) );
  NAND2X1 U990 ( .A(n151), .B(n150), .Y(n733) );
  NOR4X1 U991 ( .A(n844), .B(n845), .C(n846), .D(n847), .Y(n967) );
  NAND3X1 U992 ( .A(n176), .B(n848), .C(n903), .Y(n847) );
  OR4X1 U993 ( .A(n902), .B(n901), .C(n900), .D(n899), .Y(n846) );
  OR4X1 U994 ( .A(n898), .B(n897), .C(n896), .D(n895), .Y(n845) );
  OR4X1 U995 ( .A(n894), .B(n893), .C(n892), .D(n891), .Y(n844) );
  OAI22XL U996 ( .A0(n69), .A1(n849), .B0(n850), .B1(n851), .Y(N89) );
  NOR2X1 U997 ( .A(n711), .B(n607), .Y(n850) );
  CLKINVX1 U998 ( .A(n707), .Y(n607) );
  NOR2X1 U999 ( .A(n708), .B(n75), .Y(n701) );
  CLKINVX1 U1000 ( .A(n599), .Y(n711) );
  NAND2X1 U1001 ( .A(n74), .B(n708), .Y(n599) );
  MXI2X1 U1002 ( .A(n852), .B(n849), .S0(n703), .Y(N88) );
  OA21XL U1003 ( .A0(n706), .A1(n851), .B0(n853), .Y(n849) );
  OAI22XL U1004 ( .A0(n75), .A1(n853), .B0(n851), .B1(n600), .Y(N87) );
  NAND2X1 U1005 ( .A(n75), .B(n700), .Y(n600) );
  CLKINVX1 U1006 ( .A(N86), .Y(n853) );
  MXI2X1 U1007 ( .A(n891), .B(n854), .S0(n551), .Y(N676) );
  CLKINVX1 U1008 ( .A(N263), .Y(n854) );
  MXI2X1 U1009 ( .A(n892), .B(n856), .S0(n551), .Y(N675) );
  CLKINVX1 U1010 ( .A(N262), .Y(n856) );
  MXI2X1 U1011 ( .A(n893), .B(n857), .S0(n551), .Y(N674) );
  CLKINVX1 U1012 ( .A(N261), .Y(n857) );
  MXI2X1 U1013 ( .A(n894), .B(n858), .S0(n551), .Y(N673) );
  CLKINVX1 U1014 ( .A(N260), .Y(n858) );
  MXI2X1 U1015 ( .A(n895), .B(n859), .S0(n551), .Y(N672) );
  CLKINVX1 U1016 ( .A(N259), .Y(n859) );
  MXI2X1 U1017 ( .A(n896), .B(n860), .S0(n551), .Y(N671) );
  CLKINVX1 U1018 ( .A(N258), .Y(n860) );
  MXI2X1 U1019 ( .A(n176), .B(n861), .S0(n551), .Y(N670) );
  CLKINVX1 U1020 ( .A(N257), .Y(n861) );
  MXI2X1 U1021 ( .A(n897), .B(n862), .S0(n551), .Y(N669) );
  CLKINVX1 U1022 ( .A(N256), .Y(n862) );
  MXI2X1 U1023 ( .A(n898), .B(n863), .S0(n551), .Y(N668) );
  CLKINVX1 U1024 ( .A(N255), .Y(n863) );
  MXI2X1 U1025 ( .A(n899), .B(n864), .S0(n551), .Y(N667) );
  CLKINVX1 U1026 ( .A(N254), .Y(n864) );
  MXI2X1 U1027 ( .A(n900), .B(n865), .S0(n551), .Y(N666) );
  CLKINVX1 U1028 ( .A(N253), .Y(n865) );
  MXI2X1 U1029 ( .A(n901), .B(n866), .S0(n551), .Y(N665) );
  CLKINVX1 U1030 ( .A(N252), .Y(n866) );
  MXI2X1 U1031 ( .A(n902), .B(n867), .S0(n551), .Y(N664) );
  CLKINVX1 U1032 ( .A(N251), .Y(n867) );
  MXI2X1 U1033 ( .A(n903), .B(N222), .S0(n551), .Y(N663) );
  CLKINVX1 U1034 ( .A(n868), .Y(N162) );
  AOI222XL U1035 ( .A0(n549), .A1(pt[13]), .B0(n870), .B1(N120), .C0(N134), 
        .C1(n550), .Y(n868) );
  CLKINVX1 U1036 ( .A(n872), .Y(N161) );
  AOI222XL U1037 ( .A0(n549), .A1(n555), .B0(n870), .B1(N119), .C0(N133), .C1(
        n550), .Y(n872) );
  CLKINVX1 U1038 ( .A(n873), .Y(N160) );
  AOI222XL U1039 ( .A0(n549), .A1(n556), .B0(n870), .B1(N118), .C0(N132), .C1(
        n550), .Y(n873) );
  CLKINVX1 U1040 ( .A(n874), .Y(N159) );
  AOI222XL U1041 ( .A0(n549), .A1(n557), .B0(n870), .B1(N117), .C0(N131), .C1(
        n550), .Y(n874) );
  CLKINVX1 U1042 ( .A(n875), .Y(N158) );
  AOI222XL U1043 ( .A0(n549), .A1(n558), .B0(n870), .B1(N116), .C0(N130), .C1(
        n550), .Y(n875) );
  CLKINVX1 U1044 ( .A(n876), .Y(N157) );
  AOI222XL U1045 ( .A0(n549), .A1(n559), .B0(n870), .B1(N115), .C0(N129), .C1(
        n550), .Y(n876) );
  CLKINVX1 U1046 ( .A(n877), .Y(N156) );
  AOI222XL U1047 ( .A0(n549), .A1(n560), .B0(n870), .B1(N114), .C0(N128), .C1(
        n550), .Y(n877) );
  CLKINVX1 U1048 ( .A(n878), .Y(N155) );
  AOI222XL U1049 ( .A0(n549), .A1(n566), .B0(n870), .B1(N113), .C0(N127), .C1(
        n550), .Y(n878) );
  CLKINVX1 U1050 ( .A(n879), .Y(N154) );
  AOI222XL U1051 ( .A0(n549), .A1(n565), .B0(n870), .B1(N112), .C0(N126), .C1(
        n550), .Y(n879) );
  CLKINVX1 U1052 ( .A(n880), .Y(N153) );
  AOI222XL U1053 ( .A0(n549), .A1(n564), .B0(n870), .B1(N111), .C0(N125), .C1(
        n550), .Y(n880) );
  CLKINVX1 U1054 ( .A(n881), .Y(N152) );
  AOI222XL U1055 ( .A0(n549), .A1(n563), .B0(n870), .B1(N110), .C0(N124), .C1(
        n550), .Y(n881) );
  CLKINVX1 U1056 ( .A(n882), .Y(N151) );
  AOI222XL U1057 ( .A0(n549), .A1(n562), .B0(n870), .B1(N109), .C0(N123), .C1(
        n550), .Y(n882) );
  CLKINVX1 U1058 ( .A(n883), .Y(N150) );
  AOI222XL U1059 ( .A0(n549), .A1(n561), .B0(n870), .B1(N108), .C0(N122), .C1(
        n550), .Y(n883) );
  AO21X1 U1060 ( .A0(n475), .A1(n870), .B0(n884), .Y(N149) );
  CLKMX2X2 U1061 ( .A(n550), .B(n549), .S0(n567), .Y(n884) );
  OAI21XL U1062 ( .A0(n929), .A1(n885), .B0(n713), .Y(n869) );
  NAND2X1 U1063 ( .A(n929), .B(n885), .Y(n713) );
  CLKINVX1 U1064 ( .A(n885), .Y(\nx_state[1] ) );
  AOI22X1 U1065 ( .A0(n887), .A1(n179), .B0(n843), .B1(n848), .Y(n885) );
  NAND2X1 U1066 ( .A(n888), .B(n843), .Y(n929) );
  NAND2X1 U1067 ( .A(n848), .B(n889), .Y(n843) );
  OAI21XL U1068 ( .A0(n703), .A1(n706), .B0(n708), .Y(n889) );
  OAI21XL U1069 ( .A0(gray_ready), .A1(n887), .B0(n851), .Y(n888) );
  CLKINVX1 U1070 ( .A(n848), .Y(n851) );
  NOR2X1 U1071 ( .A(n887), .B(n179), .Y(n848) );
  NOR4X1 U1072 ( .A(N102), .B(N101), .C(N100), .D(n890), .Y(n886) );
  OR4X1 U1073 ( .A(N104), .B(N103), .C(N99), .D(n475), .Y(n890) );
endmodule

