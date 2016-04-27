/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Wed Apr 27 19:22:54 2016
/////////////////////////////////////////////////////////////


module addr_calculator_DW01_add_0 ( A, B, CI, SUM, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6;
  wire   [31:1] carry;

  FAX1 U1_25 ( .A(A[25]), .B(B[25]), .C(carry[25]), .YC(carry[26]), .YS(
        SUM[25]) );
  FAX1 U1_24 ( .A(A[24]), .B(B[24]), .C(carry[24]), .YC(carry[25]), .YS(
        SUM[24]) );
  FAX1 U1_23 ( .A(A[23]), .B(B[23]), .C(carry[23]), .YC(carry[24]), .YS(
        SUM[23]) );
  FAX1 U1_22 ( .A(A[22]), .B(B[22]), .C(carry[22]), .YC(carry[23]), .YS(
        SUM[22]) );
  FAX1 U1_21 ( .A(A[21]), .B(B[21]), .C(carry[21]), .YC(carry[22]), .YS(
        SUM[21]) );
  FAX1 U1_20 ( .A(A[20]), .B(B[20]), .C(carry[20]), .YC(carry[21]), .YS(
        SUM[20]) );
  FAX1 U1_19 ( .A(A[19]), .B(B[19]), .C(carry[19]), .YC(carry[20]), .YS(
        SUM[19]) );
  FAX1 U1_18 ( .A(A[18]), .B(B[18]), .C(carry[18]), .YC(carry[19]), .YS(
        SUM[18]) );
  FAX1 U1_17 ( .A(A[17]), .B(B[17]), .C(carry[17]), .YC(carry[18]), .YS(
        SUM[17]) );
  FAX1 U1_16 ( .A(A[16]), .B(B[16]), .C(carry[16]), .YC(carry[17]), .YS(
        SUM[16]) );
  FAX1 U1_15 ( .A(A[15]), .B(B[15]), .C(carry[15]), .YC(carry[16]), .YS(
        SUM[15]) );
  FAX1 U1_14 ( .A(A[14]), .B(B[14]), .C(carry[14]), .YC(carry[15]), .YS(
        SUM[14]) );
  FAX1 U1_13 ( .A(A[13]), .B(B[13]), .C(carry[13]), .YC(carry[14]), .YS(
        SUM[13]) );
  FAX1 U1_12 ( .A(A[12]), .B(B[12]), .C(carry[12]), .YC(carry[13]), .YS(
        SUM[12]) );
  FAX1 U1_11 ( .A(A[11]), .B(B[11]), .C(carry[11]), .YC(carry[12]), .YS(
        SUM[11]) );
  FAX1 U1_10 ( .A(A[10]), .B(B[10]), .C(carry[10]), .YC(carry[11]), .YS(
        SUM[10]) );
  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  FAX1 U1_1 ( .A(A[1]), .B(B[1]), .C(n2), .YC(carry[2]), .YS(SUM[1]) );
  AND2X2 U1 ( .A(n5), .B(B[29]), .Y(n1) );
  AND2X2 U2 ( .A(B[0]), .B(A[0]), .Y(n2) );
  AND2X2 U3 ( .A(carry[26]), .B(B[26]), .Y(n3) );
  AND2X2 U4 ( .A(n3), .B(B[27]), .Y(n4) );
  AND2X2 U5 ( .A(n4), .B(B[28]), .Y(n5) );
  AND2X2 U6 ( .A(n1), .B(B[30]), .Y(n6) );
  XOR2X1 U7 ( .A(B[31]), .B(n6), .Y(SUM[31]) );
  XOR2X1 U8 ( .A(n1), .B(B[30]), .Y(SUM[30]) );
  XOR2X1 U9 ( .A(n5), .B(B[29]), .Y(SUM[29]) );
  XOR2X1 U10 ( .A(n4), .B(B[28]), .Y(SUM[28]) );
  XOR2X1 U11 ( .A(n3), .B(B[27]), .Y(SUM[27]) );
  XOR2X1 U12 ( .A(carry[26]), .B(B[26]), .Y(SUM[26]) );
  XOR2X1 U13 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module addr_calculator_DW_mult_uns_2 ( a, b, product );
  input [19:0] a;
  input [5:0] b;
  output [25:0] product;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254,
         n255, n256, n257, n258, n259, n260, n261, n262, n263, n264, n265,
         n266, n267, n268, n269, n270, n271, n272, n273, n274, n275, n276,
         n277, n278, n279, n280, n281, n282, n283, n284, n285, n286, n287,
         n288, n289, n290, n291, n292, n293, n294, n295, n296, n297, n298,
         n299, n300, n301, n302, n303, n304, n305, n306, n307, n308, n309,
         n310, n311, n312, n313, n314, n315, n316, n317, n318, n319, n320,
         n321, n322, n323, n324, n325, n326, n327, n328, n329, n330, n331,
         n332, n333;
  assign product[25] = n13;

  FAX1 U14 ( .A(n189), .B(n37), .C(n14), .YC(n13), .YS(product[24]) );
  FAX1 U15 ( .A(n38), .B(n39), .C(n15), .YC(n14), .YS(product[23]) );
  FAX1 U16 ( .A(n40), .B(n43), .C(n16), .YC(n15), .YS(product[22]) );
  FAX1 U17 ( .A(n49), .B(n44), .C(n17), .YC(n16), .YS(product[21]) );
  FAX1 U18 ( .A(n57), .B(n50), .C(n18), .YC(n17), .YS(product[20]) );
  FAX1 U19 ( .A(n65), .B(n58), .C(n19), .YC(n18), .YS(product[19]) );
  FAX1 U20 ( .A(n73), .B(n66), .C(n20), .YC(n19), .YS(product[18]) );
  FAX1 U21 ( .A(n81), .B(n74), .C(n21), .YC(n20), .YS(product[17]) );
  FAX1 U22 ( .A(n89), .B(n82), .C(n22), .YC(n21), .YS(product[16]) );
  FAX1 U23 ( .A(n97), .B(n90), .C(n23), .YC(n22), .YS(product[15]) );
  FAX1 U24 ( .A(n105), .B(n98), .C(n24), .YC(n23), .YS(product[14]) );
  FAX1 U25 ( .A(n113), .B(n106), .C(n25), .YC(n24), .YS(product[13]) );
  FAX1 U26 ( .A(n121), .B(n114), .C(n26), .YC(n25), .YS(product[12]) );
  FAX1 U27 ( .A(n129), .B(n122), .C(n27), .YC(n26), .YS(product[11]) );
  FAX1 U28 ( .A(n137), .B(n130), .C(n28), .YC(n27), .YS(product[10]) );
  FAX1 U29 ( .A(n145), .B(n138), .C(n29), .YC(n28), .YS(product[9]) );
  FAX1 U30 ( .A(n153), .B(n146), .C(n30), .YC(n29), .YS(product[8]) );
  FAX1 U31 ( .A(n161), .B(n154), .C(n31), .YC(n30), .YS(product[7]) );
  FAX1 U32 ( .A(n169), .B(n162), .C(n32), .YC(n31), .YS(product[6]) );
  FAX1 U33 ( .A(n177), .B(n170), .C(n33), .YC(n32), .YS(product[5]) );
  FAX1 U34 ( .A(n183), .B(n178), .C(n34), .YC(n33), .YS(product[4]) );
  FAX1 U35 ( .A(n186), .B(n184), .C(n35), .YC(n34), .YS(product[3]) );
  FAX1 U36 ( .A(n268), .B(n36), .C(n188), .YC(n35), .YS(product[2]) );
  HAX1 U37 ( .A(n288), .B(n307), .YC(n36), .YS(product[1]) );
  FAX1 U38 ( .A(n209), .B(n190), .C(n41), .YC(n37), .YS(n38) );
  FAX1 U39 ( .A(n47), .B(n42), .C(n45), .YC(n39), .YS(n40) );
  FAX1 U40 ( .A(n229), .B(n191), .C(n210), .YC(n41), .YS(n42) );
  FAX1 U41 ( .A(n48), .B(n46), .C(n51), .YC(n43), .YS(n44) );
  FAX1 U42 ( .A(n230), .B(n55), .C(n53), .YC(n45), .YS(n46) );
  FAX1 U43 ( .A(n249), .B(n192), .C(n211), .YC(n47), .YS(n48) );
  FAX1 U44 ( .A(n54), .B(n59), .C(n52), .YC(n49), .YS(n50) );
  FAX1 U45 ( .A(n56), .B(n63), .C(n61), .YC(n51), .YS(n52) );
  FAX1 U46 ( .A(n250), .B(n231), .C(n269), .YC(n53), .YS(n54) );
  HAX1 U47 ( .A(n212), .B(n193), .YC(n55), .YS(n56) );
  FAX1 U48 ( .A(n62), .B(n67), .C(n60), .YC(n57), .YS(n58) );
  FAX1 U49 ( .A(n71), .B(n69), .C(n64), .YC(n59), .YS(n60) );
  FAX1 U50 ( .A(n289), .B(n251), .C(n270), .YC(n61), .YS(n62) );
  FAX1 U51 ( .A(n213), .B(n194), .C(n232), .YC(n63), .YS(n64) );
  FAX1 U52 ( .A(n70), .B(n75), .C(n68), .YC(n65), .YS(n66) );
  FAX1 U53 ( .A(n79), .B(n77), .C(n72), .YC(n67), .YS(n68) );
  FAX1 U54 ( .A(n290), .B(n252), .C(n271), .YC(n69), .YS(n70) );
  FAX1 U55 ( .A(n214), .B(n195), .C(n233), .YC(n71), .YS(n72) );
  FAX1 U56 ( .A(n78), .B(n83), .C(n76), .YC(n73), .YS(n74) );
  FAX1 U57 ( .A(n87), .B(n85), .C(n80), .YC(n75), .YS(n76) );
  FAX1 U58 ( .A(n291), .B(n253), .C(n272), .YC(n77), .YS(n78) );
  FAX1 U59 ( .A(n215), .B(n196), .C(n234), .YC(n79), .YS(n80) );
  FAX1 U60 ( .A(n86), .B(n91), .C(n84), .YC(n81), .YS(n82) );
  FAX1 U61 ( .A(n95), .B(n93), .C(n88), .YC(n83), .YS(n84) );
  FAX1 U62 ( .A(n292), .B(n254), .C(n273), .YC(n85), .YS(n86) );
  FAX1 U63 ( .A(n216), .B(n197), .C(n235), .YC(n87), .YS(n88) );
  FAX1 U64 ( .A(n94), .B(n99), .C(n92), .YC(n89), .YS(n90) );
  FAX1 U65 ( .A(n103), .B(n101), .C(n96), .YC(n91), .YS(n92) );
  FAX1 U66 ( .A(n293), .B(n255), .C(n274), .YC(n93), .YS(n94) );
  FAX1 U67 ( .A(n217), .B(n198), .C(n236), .YC(n95), .YS(n96) );
  FAX1 U68 ( .A(n102), .B(n107), .C(n100), .YC(n97), .YS(n98) );
  FAX1 U69 ( .A(n111), .B(n109), .C(n104), .YC(n99), .YS(n100) );
  FAX1 U70 ( .A(n294), .B(n256), .C(n275), .YC(n101), .YS(n102) );
  FAX1 U71 ( .A(n218), .B(n199), .C(n237), .YC(n103), .YS(n104) );
  FAX1 U72 ( .A(n110), .B(n115), .C(n108), .YC(n105), .YS(n106) );
  FAX1 U73 ( .A(n119), .B(n117), .C(n112), .YC(n107), .YS(n108) );
  FAX1 U74 ( .A(n295), .B(n257), .C(n276), .YC(n109), .YS(n110) );
  FAX1 U75 ( .A(n219), .B(n200), .C(n238), .YC(n111), .YS(n112) );
  FAX1 U76 ( .A(n118), .B(n123), .C(n116), .YC(n113), .YS(n114) );
  FAX1 U77 ( .A(n127), .B(n125), .C(n120), .YC(n115), .YS(n116) );
  FAX1 U78 ( .A(n296), .B(n258), .C(n277), .YC(n117), .YS(n118) );
  FAX1 U79 ( .A(n220), .B(n201), .C(n239), .YC(n119), .YS(n120) );
  FAX1 U80 ( .A(n126), .B(n131), .C(n124), .YC(n121), .YS(n122) );
  FAX1 U81 ( .A(n135), .B(n133), .C(n128), .YC(n123), .YS(n124) );
  FAX1 U82 ( .A(n297), .B(n259), .C(n278), .YC(n125), .YS(n126) );
  FAX1 U83 ( .A(n221), .B(n202), .C(n240), .YC(n127), .YS(n128) );
  FAX1 U84 ( .A(n134), .B(n139), .C(n132), .YC(n129), .YS(n130) );
  FAX1 U85 ( .A(n143), .B(n141), .C(n136), .YC(n131), .YS(n132) );
  FAX1 U86 ( .A(n298), .B(n260), .C(n279), .YC(n133), .YS(n134) );
  FAX1 U87 ( .A(n222), .B(n203), .C(n241), .YC(n135), .YS(n136) );
  FAX1 U88 ( .A(n142), .B(n147), .C(n140), .YC(n137), .YS(n138) );
  FAX1 U89 ( .A(n151), .B(n149), .C(n144), .YC(n139), .YS(n140) );
  FAX1 U90 ( .A(n299), .B(n261), .C(n280), .YC(n141), .YS(n142) );
  FAX1 U91 ( .A(n223), .B(n204), .C(n242), .YC(n143), .YS(n144) );
  FAX1 U92 ( .A(n150), .B(n155), .C(n148), .YC(n145), .YS(n146) );
  FAX1 U93 ( .A(n159), .B(n157), .C(n152), .YC(n147), .YS(n148) );
  FAX1 U94 ( .A(n300), .B(n262), .C(n281), .YC(n149), .YS(n150) );
  FAX1 U95 ( .A(n224), .B(n205), .C(n243), .YC(n151), .YS(n152) );
  FAX1 U96 ( .A(n158), .B(n163), .C(n156), .YC(n153), .YS(n154) );
  FAX1 U97 ( .A(n167), .B(n165), .C(n160), .YC(n155), .YS(n156) );
  FAX1 U98 ( .A(n301), .B(n263), .C(n282), .YC(n157), .YS(n158) );
  FAX1 U99 ( .A(n225), .B(n206), .C(n244), .YC(n159), .YS(n160) );
  FAX1 U100 ( .A(n168), .B(n171), .C(n164), .YC(n161), .YS(n162) );
  FAX1 U101 ( .A(n175), .B(n173), .C(n166), .YC(n163), .YS(n164) );
  FAX1 U102 ( .A(n302), .B(n264), .C(n283), .YC(n165), .YS(n166) );
  FAX1 U103 ( .A(n226), .B(n207), .C(n245), .YC(n167), .YS(n168) );
  FAX1 U104 ( .A(n179), .B(n174), .C(n172), .YC(n169), .YS(n170) );
  FAX1 U105 ( .A(n284), .B(n181), .C(n176), .YC(n171), .YS(n172) );
  FAX1 U106 ( .A(n303), .B(n246), .C(n265), .YC(n173), .YS(n174) );
  HAX1 U107 ( .A(n227), .B(n208), .YC(n175), .YS(n176) );
  FAX1 U108 ( .A(n185), .B(n182), .C(n180), .YC(n177), .YS(n178) );
  FAX1 U109 ( .A(n304), .B(n266), .C(n285), .YC(n179), .YS(n180) );
  HAX1 U110 ( .A(n247), .B(n228), .YC(n181), .YS(n182) );
  FAX1 U111 ( .A(n305), .B(n286), .C(n187), .YC(n183), .YS(n184) );
  HAX1 U112 ( .A(n267), .B(n248), .YC(n185), .YS(n186) );
  HAX1 U113 ( .A(n306), .B(n287), .YC(n187), .YS(n188) );
  NOR2X1 U114 ( .A(n308), .B(n12), .Y(n189) );
  NOR2X1 U115 ( .A(n309), .B(n12), .Y(n190) );
  NOR2X1 U116 ( .A(n310), .B(n12), .Y(n191) );
  NOR2X1 U117 ( .A(n311), .B(n12), .Y(n192) );
  NOR2X1 U118 ( .A(n312), .B(n12), .Y(n193) );
  NOR2X1 U119 ( .A(n313), .B(n12), .Y(n194) );
  NOR2X1 U120 ( .A(n314), .B(n12), .Y(n195) );
  NOR2X1 U121 ( .A(n315), .B(n12), .Y(n196) );
  NOR2X1 U122 ( .A(n316), .B(n12), .Y(n197) );
  NOR2X1 U123 ( .A(n317), .B(n12), .Y(n198) );
  NOR2X1 U124 ( .A(n318), .B(n11), .Y(n199) );
  NOR2X1 U125 ( .A(n319), .B(n11), .Y(n200) );
  NOR2X1 U126 ( .A(n320), .B(n11), .Y(n201) );
  NOR2X1 U127 ( .A(n321), .B(n11), .Y(n202) );
  NOR2X1 U128 ( .A(n322), .B(n11), .Y(n203) );
  NOR2X1 U129 ( .A(n323), .B(n11), .Y(n204) );
  NOR2X1 U130 ( .A(n324), .B(n11), .Y(n205) );
  NOR2X1 U131 ( .A(n325), .B(n11), .Y(n206) );
  NOR2X1 U132 ( .A(n326), .B(n11), .Y(n207) );
  NOR2X1 U133 ( .A(n327), .B(n11), .Y(n208) );
  NOR2X1 U134 ( .A(n308), .B(n10), .Y(n209) );
  NOR2X1 U135 ( .A(n309), .B(n10), .Y(n210) );
  NOR2X1 U136 ( .A(n310), .B(n10), .Y(n211) );
  NOR2X1 U137 ( .A(n311), .B(n10), .Y(n212) );
  NOR2X1 U138 ( .A(n312), .B(n10), .Y(n213) );
  NOR2X1 U139 ( .A(n313), .B(n10), .Y(n214) );
  NOR2X1 U140 ( .A(n314), .B(n10), .Y(n215) );
  NOR2X1 U141 ( .A(n315), .B(n10), .Y(n216) );
  NOR2X1 U142 ( .A(n316), .B(n10), .Y(n217) );
  NOR2X1 U143 ( .A(n317), .B(n10), .Y(n218) );
  NOR2X1 U144 ( .A(n318), .B(n9), .Y(n219) );
  NOR2X1 U145 ( .A(n319), .B(n9), .Y(n220) );
  NOR2X1 U146 ( .A(n320), .B(n9), .Y(n221) );
  NOR2X1 U147 ( .A(n321), .B(n9), .Y(n222) );
  NOR2X1 U148 ( .A(n322), .B(n9), .Y(n223) );
  NOR2X1 U149 ( .A(n323), .B(n9), .Y(n224) );
  NOR2X1 U150 ( .A(n324), .B(n9), .Y(n225) );
  NOR2X1 U151 ( .A(n325), .B(n9), .Y(n226) );
  NOR2X1 U152 ( .A(n326), .B(n9), .Y(n227) );
  NOR2X1 U153 ( .A(n327), .B(n9), .Y(n228) );
  NOR2X1 U154 ( .A(n308), .B(n8), .Y(n229) );
  NOR2X1 U155 ( .A(n309), .B(n8), .Y(n230) );
  NOR2X1 U156 ( .A(n310), .B(n8), .Y(n231) );
  NOR2X1 U157 ( .A(n311), .B(n8), .Y(n232) );
  NOR2X1 U158 ( .A(n312), .B(n8), .Y(n233) );
  NOR2X1 U159 ( .A(n313), .B(n8), .Y(n234) );
  NOR2X1 U160 ( .A(n314), .B(n8), .Y(n235) );
  NOR2X1 U161 ( .A(n315), .B(n8), .Y(n236) );
  NOR2X1 U162 ( .A(n316), .B(n8), .Y(n237) );
  NOR2X1 U163 ( .A(n317), .B(n8), .Y(n238) );
  NOR2X1 U164 ( .A(n318), .B(n7), .Y(n239) );
  NOR2X1 U165 ( .A(n319), .B(n7), .Y(n240) );
  NOR2X1 U166 ( .A(n320), .B(n7), .Y(n241) );
  NOR2X1 U167 ( .A(n321), .B(n7), .Y(n242) );
  NOR2X1 U168 ( .A(n322), .B(n7), .Y(n243) );
  NOR2X1 U169 ( .A(n323), .B(n7), .Y(n244) );
  NOR2X1 U170 ( .A(n324), .B(n7), .Y(n245) );
  NOR2X1 U171 ( .A(n325), .B(n7), .Y(n246) );
  NOR2X1 U172 ( .A(n326), .B(n7), .Y(n247) );
  NOR2X1 U173 ( .A(n327), .B(n7), .Y(n248) );
  NOR2X1 U174 ( .A(n308), .B(n6), .Y(n249) );
  NOR2X1 U175 ( .A(n309), .B(n6), .Y(n250) );
  NOR2X1 U176 ( .A(n310), .B(n6), .Y(n251) );
  NOR2X1 U177 ( .A(n311), .B(n6), .Y(n252) );
  NOR2X1 U178 ( .A(n312), .B(n6), .Y(n253) );
  NOR2X1 U179 ( .A(n313), .B(n6), .Y(n254) );
  NOR2X1 U180 ( .A(n314), .B(n6), .Y(n255) );
  NOR2X1 U181 ( .A(n315), .B(n6), .Y(n256) );
  NOR2X1 U182 ( .A(n316), .B(n6), .Y(n257) );
  NOR2X1 U183 ( .A(n317), .B(n6), .Y(n258) );
  NOR2X1 U184 ( .A(n318), .B(n5), .Y(n259) );
  NOR2X1 U185 ( .A(n319), .B(n5), .Y(n260) );
  NOR2X1 U186 ( .A(n320), .B(n5), .Y(n261) );
  NOR2X1 U187 ( .A(n321), .B(n5), .Y(n262) );
  NOR2X1 U188 ( .A(n322), .B(n5), .Y(n263) );
  NOR2X1 U189 ( .A(n323), .B(n5), .Y(n264) );
  NOR2X1 U190 ( .A(n324), .B(n5), .Y(n265) );
  NOR2X1 U191 ( .A(n325), .B(n5), .Y(n266) );
  NOR2X1 U192 ( .A(n326), .B(n5), .Y(n267) );
  NOR2X1 U193 ( .A(n327), .B(n5), .Y(n268) );
  NOR2X1 U194 ( .A(n308), .B(n4), .Y(n269) );
  NOR2X1 U195 ( .A(n309), .B(n4), .Y(n270) );
  NOR2X1 U196 ( .A(n310), .B(n4), .Y(n271) );
  NOR2X1 U197 ( .A(n311), .B(n4), .Y(n272) );
  NOR2X1 U198 ( .A(n312), .B(n4), .Y(n273) );
  NOR2X1 U199 ( .A(n313), .B(n4), .Y(n274) );
  NOR2X1 U200 ( .A(n314), .B(n4), .Y(n275) );
  NOR2X1 U201 ( .A(n315), .B(n4), .Y(n276) );
  NOR2X1 U202 ( .A(n316), .B(n4), .Y(n277) );
  NOR2X1 U203 ( .A(n317), .B(n4), .Y(n278) );
  NOR2X1 U204 ( .A(n318), .B(n3), .Y(n279) );
  NOR2X1 U205 ( .A(n319), .B(n3), .Y(n280) );
  NOR2X1 U206 ( .A(n320), .B(n3), .Y(n281) );
  NOR2X1 U207 ( .A(n321), .B(n3), .Y(n282) );
  NOR2X1 U208 ( .A(n322), .B(n3), .Y(n283) );
  NOR2X1 U209 ( .A(n323), .B(n3), .Y(n284) );
  NOR2X1 U210 ( .A(n324), .B(n3), .Y(n285) );
  NOR2X1 U211 ( .A(n325), .B(n3), .Y(n286) );
  NOR2X1 U212 ( .A(n326), .B(n3), .Y(n287) );
  NOR2X1 U213 ( .A(n327), .B(n3), .Y(n288) );
  NOR2X1 U214 ( .A(n308), .B(n2), .Y(n289) );
  NOR2X1 U215 ( .A(n309), .B(n2), .Y(n290) );
  NOR2X1 U216 ( .A(n310), .B(n2), .Y(n291) );
  NOR2X1 U217 ( .A(n311), .B(n2), .Y(n292) );
  NOR2X1 U218 ( .A(n312), .B(n2), .Y(n293) );
  NOR2X1 U219 ( .A(n313), .B(n2), .Y(n294) );
  NOR2X1 U220 ( .A(n314), .B(n2), .Y(n295) );
  NOR2X1 U221 ( .A(n315), .B(n2), .Y(n296) );
  NOR2X1 U222 ( .A(n316), .B(n2), .Y(n297) );
  NOR2X1 U223 ( .A(n317), .B(n2), .Y(n298) );
  NOR2X1 U224 ( .A(n318), .B(n1), .Y(n299) );
  NOR2X1 U225 ( .A(n319), .B(n1), .Y(n300) );
  NOR2X1 U226 ( .A(n320), .B(n1), .Y(n301) );
  NOR2X1 U227 ( .A(n321), .B(n1), .Y(n302) );
  NOR2X1 U228 ( .A(n322), .B(n1), .Y(n303) );
  NOR2X1 U229 ( .A(n323), .B(n1), .Y(n304) );
  NOR2X1 U230 ( .A(n324), .B(n1), .Y(n305) );
  NOR2X1 U231 ( .A(n325), .B(n1), .Y(n306) );
  NOR2X1 U232 ( .A(n326), .B(n1), .Y(n307) );
  NOR2X1 U233 ( .A(n327), .B(n1), .Y(product[0]) );
  INVX2 U262 ( .A(a[16]), .Y(n311) );
  INVX2 U263 ( .A(a[14]), .Y(n313) );
  INVX2 U264 ( .A(a[12]), .Y(n315) );
  INVX2 U265 ( .A(a[15]), .Y(n312) );
  INVX2 U266 ( .A(a[13]), .Y(n314) );
  BUFX2 U267 ( .A(n333), .Y(n1) );
  BUFX2 U268 ( .A(n332), .Y(n3) );
  BUFX2 U269 ( .A(n330), .Y(n7) );
  BUFX2 U270 ( .A(n331), .Y(n5) );
  BUFX2 U271 ( .A(n329), .Y(n9) );
  BUFX2 U272 ( .A(n328), .Y(n11) );
  BUFX2 U273 ( .A(n333), .Y(n2) );
  BUFX2 U274 ( .A(n332), .Y(n4) );
  BUFX2 U275 ( .A(n331), .Y(n6) );
  BUFX2 U276 ( .A(n330), .Y(n8) );
  BUFX2 U277 ( .A(n328), .Y(n12) );
  BUFX2 U278 ( .A(n329), .Y(n10) );
  INVX2 U279 ( .A(a[19]), .Y(n308) );
  INVX2 U280 ( .A(a[10]), .Y(n317) );
  INVX2 U281 ( .A(a[11]), .Y(n316) );
  INVX2 U282 ( .A(a[18]), .Y(n309) );
  INVX2 U283 ( .A(a[17]), .Y(n310) );
  INVX2 U284 ( .A(a[7]), .Y(n320) );
  INVX2 U285 ( .A(a[2]), .Y(n325) );
  INVX2 U286 ( .A(a[8]), .Y(n319) );
  INVX2 U287 ( .A(a[1]), .Y(n326) );
  INVX2 U288 ( .A(a[3]), .Y(n324) );
  INVX2 U289 ( .A(a[4]), .Y(n323) );
  INVX2 U290 ( .A(a[5]), .Y(n322) );
  INVX2 U291 ( .A(a[6]), .Y(n321) );
  INVX2 U292 ( .A(a[9]), .Y(n318) );
  INVX2 U293 ( .A(a[0]), .Y(n327) );
  INVX2 U294 ( .A(b[0]), .Y(n333) );
  INVX2 U295 ( .A(b[1]), .Y(n332) );
  INVX2 U296 ( .A(b[3]), .Y(n330) );
  INVX2 U297 ( .A(b[2]), .Y(n331) );
  INVX2 U298 ( .A(b[4]), .Y(n329) );
  INVX2 U299 ( .A(b[5]), .Y(n328) );
endmodule


module addr_calculator ( x, y, pixel_size, offset, address );
  input [9:0] x;
  input [9:0] y;
  input [5:0] pixel_size;
  input [31:0] offset;
  output [31:0] address;
  wire   \mul2[9] , \mul2[8] , \mul2[7] , \mul2[6] , \mul2[5] , \mul2[4] ,
         \mul2[3] , \mul2[2] , \mul2[25] , \mul2[24] , \mul2[23] , \mul2[22] ,
         \mul2[21] , \mul2[20] , \mul2[1] , \mul2[19] , \mul2[18] , \mul2[17] ,
         \mul2[16] , \mul2[15] , \mul2[14] , \mul2[13] , \mul2[12] ,
         \mul2[11] , \mul2[10] , \mul2[0] , \mul1[6] , \mul1[5] , \mul1[4] ,
         \mul1[3] , \mul1[2] , \mul1[1] , \mul1[0] , \add1[9] , \add1[8] ,
         \add1[7] , \add1[6] , \add1[5] , \add1[4] , \add1[3] , \add1[2] ,
         \add1[1] , \add1[19] , \add1[18] , \add1[17] , \add1[16] , \add1[15] ,
         \add1[14] , \add1[13] , \add1[12] , \add1[11] , \add1[10] , \add1[0] ,
         n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137;
  assign \mul1[6]  = y[6];
  assign \mul1[5]  = y[5];
  assign \mul1[4]  = y[4];
  assign \mul1[3]  = y[3];
  assign \mul1[2]  = y[2];
  assign \mul1[1]  = y[1];
  assign \mul1[0]  = y[0];

  addr_calculator_DW01_add_0 add_35 ( .A({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        \mul2[25] , \mul2[24] , \mul2[23] , \mul2[22] , \mul2[21] , \mul2[20] , 
        \mul2[19] , \mul2[18] , \mul2[17] , \mul2[16] , \mul2[15] , \mul2[14] , 
        \mul2[13] , \mul2[12] , \mul2[11] , \mul2[10] , \mul2[9] , \mul2[8] , 
        \mul2[7] , \mul2[6] , \mul2[5] , \mul2[4] , \mul2[3] , \mul2[2] , 
        \mul2[1] , \mul2[0] }), .B(offset), .CI(1'b0), .SUM(address) );
  addr_calculator_DW_mult_uns_2 mult_32 ( .a({\add1[19] , \add1[18] , 
        \add1[17] , \add1[16] , \add1[15] , \add1[14] , \add1[13] , \add1[12] , 
        \add1[11] , \add1[10] , \add1[9] , \add1[8] , \add1[7] , \add1[6] , 
        \add1[5] , \add1[4] , \add1[3] , \add1[2] , \add1[1] , \add1[0] }), 
        .b(pixel_size), .product({\mul2[25] , \mul2[24] , \mul2[23] , 
        \mul2[22] , \mul2[21] , \mul2[20] , \mul2[19] , \mul2[18] , \mul2[17] , 
        \mul2[16] , \mul2[15] , \mul2[14] , \mul2[13] , \mul2[12] , \mul2[11] , 
        \mul2[10] , \mul2[9] , \mul2[8] , \mul2[7] , \mul2[6] , \mul2[5] , 
        \mul2[4] , \mul2[3] , \mul2[2] , \mul2[1] , \mul2[0] }) );
  XOR2X1 U9 ( .A(n7), .B(n8), .Y(\add1[9] ) );
  XOR2X1 U10 ( .A(n9), .B(x[9]), .Y(n8) );
  XOR2X1 U11 ( .A(n10), .B(n11), .Y(\add1[8] ) );
  XOR2X1 U12 ( .A(n12), .B(x[8]), .Y(n10) );
  XOR2X1 U13 ( .A(n13), .B(n14), .Y(\add1[7] ) );
  XOR2X1 U14 ( .A(n15), .B(x[7]), .Y(n13) );
  XOR2X1 U15 ( .A(n16), .B(n17), .Y(\add1[6] ) );
  XOR2X1 U16 ( .A(x[6]), .B(\mul1[6] ), .Y(n17) );
  XOR2X1 U17 ( .A(n18), .B(n19), .Y(\add1[5] ) );
  XOR2X1 U18 ( .A(x[5]), .B(\mul1[5] ), .Y(n19) );
  XOR2X1 U19 ( .A(n20), .B(n21), .Y(\add1[4] ) );
  XOR2X1 U20 ( .A(x[4]), .B(\mul1[4] ), .Y(n21) );
  XOR2X1 U21 ( .A(n22), .B(n23), .Y(\add1[3] ) );
  XOR2X1 U22 ( .A(x[3]), .B(\mul1[3] ), .Y(n23) );
  XOR2X1 U23 ( .A(n24), .B(n25), .Y(\add1[2] ) );
  XOR2X1 U24 ( .A(x[2]), .B(n26), .Y(n24) );
  XOR2X1 U25 ( .A(n27), .B(n28), .Y(\add1[1] ) );
  XOR2X1 U26 ( .A(x[1]), .B(n29), .Y(n28) );
  OAI22X1 U27 ( .A(n30), .B(n31), .C(n32), .D(n33), .Y(\add1[19] ) );
  XOR2X1 U28 ( .A(n33), .B(n32), .Y(\add1[18] ) );
  XOR2X1 U29 ( .A(n31), .B(y[9]), .Y(n32) );
  OAI21X1 U30 ( .A(n34), .B(n35), .C(y[8]), .Y(n31) );
  NAND3X1 U31 ( .A(n36), .B(n37), .C(n38), .Y(n33) );
  INVX1 U32 ( .A(n39), .Y(n38) );
  XOR2X1 U33 ( .A(n37), .B(n40), .Y(\add1[17] ) );
  NOR2X1 U34 ( .A(n41), .B(n39), .Y(n40) );
  XOR2X1 U35 ( .A(n35), .B(n42), .Y(n37) );
  XOR2X1 U36 ( .A(y[8]), .B(n34), .Y(n42) );
  NOR2X1 U37 ( .A(n43), .B(n30), .Y(n34) );
  OAI21X1 U38 ( .A(n44), .B(n45), .C(n46), .Y(n35) );
  OAI21X1 U39 ( .A(n47), .B(n48), .C(n49), .Y(n46) );
  INVX1 U40 ( .A(n48), .Y(n45) );
  XOR2X1 U41 ( .A(n39), .B(n41), .Y(\add1[16] ) );
  INVX1 U42 ( .A(n36), .Y(n41) );
  XOR2X1 U43 ( .A(n50), .B(n48), .Y(n36) );
  XNOR2X1 U44 ( .A(n43), .B(y[9]), .Y(n48) );
  XOR2X1 U45 ( .A(n47), .B(n49), .Y(n50) );
  NOR2X1 U46 ( .A(n51), .B(n52), .Y(n49) );
  INVX1 U47 ( .A(n44), .Y(n47) );
  AOI21X1 U48 ( .A(n53), .B(n54), .C(n55), .Y(n44) );
  INVX1 U49 ( .A(n56), .Y(n55) );
  OAI21X1 U50 ( .A(n53), .B(n54), .C(n57), .Y(n56) );
  NAND3X1 U51 ( .A(n58), .B(n59), .C(n60), .Y(n39) );
  XNOR2X1 U52 ( .A(n61), .B(n59), .Y(\add1[15] ) );
  XOR2X1 U53 ( .A(n62), .B(n54), .Y(n59) );
  XOR2X1 U54 ( .A(n51), .B(n52), .Y(n54) );
  INVX1 U55 ( .A(y[8]), .Y(n52) );
  XOR2X1 U56 ( .A(n53), .B(n57), .Y(n62) );
  NOR2X1 U57 ( .A(n63), .B(n43), .Y(n57) );
  OAI21X1 U58 ( .A(n64), .B(n65), .C(n66), .Y(n53) );
  OAI21X1 U59 ( .A(n67), .B(n68), .C(n69), .Y(n66) );
  INVX1 U60 ( .A(n68), .Y(n65) );
  NAND2X1 U61 ( .A(n60), .B(n58), .Y(n61) );
  XOR2X1 U62 ( .A(n58), .B(n60), .Y(\add1[14] ) );
  NOR3X1 U63 ( .A(n70), .B(n71), .C(n72), .Y(n60) );
  XOR2X1 U64 ( .A(n73), .B(n68), .Y(n58) );
  XNOR2X1 U65 ( .A(n63), .B(y[7]), .Y(n68) );
  XOR2X1 U66 ( .A(n67), .B(n69), .Y(n73) );
  NOR2X1 U67 ( .A(n51), .B(n74), .Y(n69) );
  INVX1 U68 ( .A(n64), .Y(n67) );
  AOI21X1 U69 ( .A(n75), .B(n76), .C(n77), .Y(n64) );
  INVX1 U70 ( .A(n78), .Y(n77) );
  OAI21X1 U71 ( .A(n75), .B(n76), .C(n79), .Y(n78) );
  XNOR2X1 U72 ( .A(n71), .B(n80), .Y(\add1[13] ) );
  NOR2X1 U73 ( .A(n70), .B(n72), .Y(n80) );
  XNOR2X1 U74 ( .A(n81), .B(n76), .Y(n71) );
  XOR2X1 U75 ( .A(n74), .B(n51), .Y(n76) );
  XOR2X1 U76 ( .A(n75), .B(n79), .Y(n81) );
  NOR2X1 U77 ( .A(n63), .B(n82), .Y(n79) );
  OAI21X1 U78 ( .A(n83), .B(n84), .C(n85), .Y(n75) );
  OAI21X1 U79 ( .A(n86), .B(n87), .C(n88), .Y(n85) );
  INVX1 U80 ( .A(n87), .Y(n84) );
  XOR2X1 U81 ( .A(n72), .B(n70), .Y(\add1[12] ) );
  XNOR2X1 U82 ( .A(n89), .B(n87), .Y(n70) );
  XNOR2X1 U83 ( .A(n82), .B(\mul1[5] ), .Y(n87) );
  XOR2X1 U84 ( .A(n86), .B(n88), .Y(n89) );
  NOR2X1 U85 ( .A(n74), .B(n26), .Y(n88) );
  INVX1 U86 ( .A(n83), .Y(n86) );
  AOI21X1 U87 ( .A(n90), .B(n91), .C(n92), .Y(n83) );
  INVX1 U88 ( .A(n93), .Y(n92) );
  OAI21X1 U89 ( .A(n90), .B(n91), .C(n94), .Y(n93) );
  NAND3X1 U90 ( .A(n95), .B(n96), .C(n97), .Y(n72) );
  XNOR2X1 U91 ( .A(n98), .B(n97), .Y(\add1[11] ) );
  XOR2X1 U92 ( .A(n99), .B(n91), .Y(n97) );
  XOR2X1 U93 ( .A(n26), .B(n74), .Y(n91) );
  XOR2X1 U94 ( .A(n90), .B(n94), .Y(n99) );
  NOR2X1 U95 ( .A(n82), .B(n29), .Y(n94) );
  OAI21X1 U96 ( .A(n100), .B(n101), .C(n102), .Y(n90) );
  OAI21X1 U97 ( .A(n103), .B(n104), .C(n105), .Y(n102) );
  INVX1 U98 ( .A(n103), .Y(n101) );
  INVX1 U99 ( .A(n104), .Y(n100) );
  NAND2X1 U100 ( .A(n95), .B(n96), .Y(n98) );
  XOR2X1 U101 ( .A(n96), .B(n95), .Y(\add1[10] ) );
  XOR2X1 U102 ( .A(n106), .B(n103), .Y(n95) );
  XNOR2X1 U103 ( .A(n82), .B(\mul1[1] ), .Y(n103) );
  XOR2X1 U104 ( .A(n105), .B(n104), .Y(n106) );
  OAI21X1 U105 ( .A(n107), .B(n108), .C(n109), .Y(n104) );
  OAI21X1 U106 ( .A(n110), .B(n111), .C(\mul1[0] ), .Y(n109) );
  INVX1 U107 ( .A(n111), .Y(n108) );
  NOR2X1 U108 ( .A(n26), .B(n30), .Y(n105) );
  INVX1 U109 ( .A(y[9]), .Y(n30) );
  OAI21X1 U110 ( .A(n112), .B(n113), .C(n114), .Y(n96) );
  OAI21X1 U111 ( .A(n7), .B(n9), .C(x[9]), .Y(n114) );
  INVX1 U112 ( .A(n7), .Y(n113) );
  XOR2X1 U113 ( .A(n115), .B(n111), .Y(n7) );
  XNOR2X1 U114 ( .A(n26), .B(y[9]), .Y(n111) );
  XOR2X1 U115 ( .A(n116), .B(n107), .Y(n115) );
  INVX1 U116 ( .A(n110), .Y(n107) );
  OAI21X1 U117 ( .A(n117), .B(n29), .C(n118), .Y(n110) );
  OAI21X1 U118 ( .A(n119), .B(\mul1[1] ), .C(y[8]), .Y(n118) );
  INVX1 U119 ( .A(n117), .Y(n119) );
  INVX1 U120 ( .A(n9), .Y(n112) );
  OAI21X1 U121 ( .A(n120), .B(n121), .C(n122), .Y(n9) );
  OAI21X1 U122 ( .A(n11), .B(n12), .C(x[8]), .Y(n122) );
  INVX1 U123 ( .A(n120), .Y(n12) );
  INVX1 U124 ( .A(n121), .Y(n11) );
  XOR2X1 U125 ( .A(n117), .B(n123), .Y(n121) );
  XOR2X1 U126 ( .A(y[8]), .B(\mul1[1] ), .Y(n123) );
  NAND2X1 U127 ( .A(y[7]), .B(\mul1[0] ), .Y(n117) );
  AOI21X1 U128 ( .A(n15), .B(n14), .C(n124), .Y(n120) );
  INVX1 U129 ( .A(n125), .Y(n124) );
  OAI21X1 U130 ( .A(n14), .B(n15), .C(x[7]), .Y(n125) );
  XOR2X1 U131 ( .A(n116), .B(n43), .Y(n14) );
  INVX1 U132 ( .A(y[7]), .Y(n43) );
  INVX1 U133 ( .A(\mul1[0] ), .Y(n116) );
  OAI21X1 U134 ( .A(n126), .B(n51), .C(n127), .Y(n15) );
  OAI21X1 U135 ( .A(\mul1[6] ), .B(n16), .C(x[6]), .Y(n127) );
  INVX1 U136 ( .A(\mul1[6] ), .Y(n51) );
  INVX1 U137 ( .A(n16), .Y(n126) );
  OAI21X1 U138 ( .A(n128), .B(n63), .C(n129), .Y(n16) );
  OAI21X1 U139 ( .A(\mul1[5] ), .B(n18), .C(x[5]), .Y(n129) );
  INVX1 U140 ( .A(\mul1[5] ), .Y(n63) );
  INVX1 U141 ( .A(n18), .Y(n128) );
  OAI21X1 U142 ( .A(n130), .B(n74), .C(n131), .Y(n18) );
  OAI21X1 U143 ( .A(\mul1[4] ), .B(n20), .C(x[4]), .Y(n131) );
  INVX1 U144 ( .A(\mul1[4] ), .Y(n74) );
  INVX1 U145 ( .A(n20), .Y(n130) );
  OAI21X1 U146 ( .A(n132), .B(n82), .C(n133), .Y(n20) );
  OAI21X1 U147 ( .A(\mul1[3] ), .B(n22), .C(x[3]), .Y(n133) );
  INVX1 U148 ( .A(\mul1[3] ), .Y(n82) );
  INVX1 U149 ( .A(n22), .Y(n132) );
  OAI21X1 U150 ( .A(n25), .B(n26), .C(n134), .Y(n22) );
  OAI21X1 U151 ( .A(\mul1[2] ), .B(n135), .C(x[2]), .Y(n134) );
  INVX1 U152 ( .A(\mul1[2] ), .Y(n26) );
  INVX1 U153 ( .A(n135), .Y(n25) );
  OAI21X1 U154 ( .A(n29), .B(n27), .C(n136), .Y(n135) );
  OAI21X1 U155 ( .A(n137), .B(\mul1[1] ), .C(x[1]), .Y(n136) );
  INVX1 U156 ( .A(n27), .Y(n137) );
  NAND2X1 U157 ( .A(x[0]), .B(\mul1[0] ), .Y(n27) );
  INVX1 U158 ( .A(\mul1[1] ), .Y(n29) );
  XOR2X1 U159 ( .A(x[0]), .B(\mul1[0] ), .Y(\add1[0] ) );
endmodule

