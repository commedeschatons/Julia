/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Apr 28 17:01:22 2016
/////////////////////////////////////////////////////////////


module flex_x_DW01_inc_0 ( A, SUM );
  input [9:0] A;
  output [9:0] SUM;

  wire   [9:2] carry;

  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[9]), .B(A[9]), .Y(SUM[9]) );
endmodule


module flex_x ( clk, n_rst, clear, count_enable, rollover_val, count_out, 
        rollover_flag );
  input [9:0] rollover_val;
  output [9:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n1, n2, n3, n4, n5, n6, n7, n8, n9, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100;

  DFFSR \count_out_reg[0]  ( .D(n73), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[9]  ( .D(n64), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[9]) );
  DFFSR \count_out_reg[8]  ( .D(n65), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[8]) );
  DFFSR \count_out_reg[7]  ( .D(n66), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[7]) );
  DFFSR \count_out_reg[6]  ( .D(n67), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[6]) );
  DFFSR \count_out_reg[5]  ( .D(n68), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[5]) );
  DFFSR \count_out_reg[4]  ( .D(n69), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  DFFSR \count_out_reg[3]  ( .D(n70), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[2]  ( .D(n71), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[1]  ( .D(n72), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR rollover_flag_reg ( .D(n100), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  flex_x_DW01_inc_0 add_47 ( .A(count_out), .SUM({N26, N25, N24, N23, N22, N21, 
        N20, N19, N18, N17}) );
  MUX2X1 U7 ( .B(n1), .A(n2), .S(n3), .Y(n100) );
  INVX1 U8 ( .A(rollover_flag), .Y(n2) );
  NAND3X1 U16 ( .A(n4), .B(n5), .C(n6), .Y(n1) );
  NOR2X1 U17 ( .A(n7), .B(n8), .Y(n6) );
  NAND3X1 U18 ( .A(n9), .B(n21), .C(n22), .Y(n8) );
  XOR2X1 U19 ( .A(n23), .B(n24), .Y(n22) );
  NAND2X1 U20 ( .A(n25), .B(n26), .Y(n24) );
  OAI21X1 U21 ( .A(rollover_val[2]), .B(n27), .C(rollover_val[3]), .Y(n25) );
  XOR2X1 U22 ( .A(n28), .B(n29), .Y(n21) );
  NAND2X1 U23 ( .A(n30), .B(n31), .Y(n29) );
  OAI21X1 U24 ( .A(rollover_val[6]), .B(n32), .C(rollover_val[7]), .Y(n30) );
  XOR2X1 U25 ( .A(n33), .B(n34), .Y(n9) );
  NAND2X1 U26 ( .A(n35), .B(n32), .Y(n34) );
  OAI21X1 U27 ( .A(rollover_val[4]), .B(n26), .C(rollover_val[5]), .Y(n35) );
  NAND3X1 U28 ( .A(n36), .B(n37), .C(n38), .Y(n7) );
  XOR2X1 U29 ( .A(n39), .B(n40), .Y(n38) );
  OAI21X1 U30 ( .A(count_out[0]), .B(n41), .C(n27), .Y(n40) );
  INVX1 U31 ( .A(rollover_val[1]), .Y(n41) );
  XOR2X1 U32 ( .A(n42), .B(n27), .Y(n36) );
  NOR2X1 U33 ( .A(n43), .B(n44), .Y(n5) );
  OAI21X1 U34 ( .A(n31), .B(n45), .C(n46), .Y(n44) );
  INVX1 U35 ( .A(clear), .Y(n46) );
  OR2X1 U36 ( .A(rollover_val[8]), .B(rollover_val[9]), .Y(n45) );
  XOR2X1 U37 ( .A(n47), .B(n48), .Y(n43) );
  OAI21X1 U38 ( .A(rollover_val[8]), .B(n31), .C(rollover_val[9]), .Y(n48) );
  NOR2X1 U39 ( .A(n49), .B(n50), .Y(n4) );
  NAND2X1 U40 ( .A(n51), .B(n52), .Y(n50) );
  XOR2X1 U41 ( .A(n53), .B(n32), .Y(n52) );
  INVX1 U42 ( .A(n54), .Y(n32) );
  XOR2X1 U43 ( .A(n26), .B(n55), .Y(n51) );
  XOR2X1 U44 ( .A(n31), .B(n56), .Y(n49) );
  NAND3X1 U45 ( .A(n57), .B(n58), .C(n54), .Y(n31) );
  NOR3X1 U46 ( .A(rollover_val[4]), .B(rollover_val[5]), .C(n26), .Y(n54) );
  INVX1 U47 ( .A(n59), .Y(n26) );
  NOR3X1 U48 ( .A(rollover_val[2]), .B(rollover_val[3]), .C(n27), .Y(n59) );
  OR2X1 U49 ( .A(rollover_val[0]), .B(rollover_val[1]), .Y(n27) );
  INVX1 U50 ( .A(rollover_val[7]), .Y(n58) );
  OAI21X1 U51 ( .A(n60), .B(n61), .C(n62), .Y(n73) );
  NAND2X1 U52 ( .A(N17), .B(n63), .Y(n62) );
  INVX1 U53 ( .A(count_out[0]), .Y(n61) );
  OAI21X1 U54 ( .A(n60), .B(n39), .C(n74), .Y(n72) );
  NAND2X1 U55 ( .A(N18), .B(n63), .Y(n74) );
  INVX1 U56 ( .A(count_out[1]), .Y(n39) );
  OAI21X1 U57 ( .A(n60), .B(n75), .C(n76), .Y(n71) );
  NAND2X1 U58 ( .A(N19), .B(n63), .Y(n76) );
  OAI21X1 U59 ( .A(n60), .B(n23), .C(n77), .Y(n70) );
  NAND2X1 U60 ( .A(N20), .B(n63), .Y(n77) );
  OAI21X1 U61 ( .A(n60), .B(n78), .C(n79), .Y(n69) );
  NAND2X1 U62 ( .A(N21), .B(n63), .Y(n79) );
  INVX1 U63 ( .A(count_out[4]), .Y(n78) );
  OAI21X1 U64 ( .A(n60), .B(n33), .C(n80), .Y(n68) );
  NAND2X1 U65 ( .A(N22), .B(n63), .Y(n80) );
  INVX1 U66 ( .A(count_out[5]), .Y(n33) );
  OAI21X1 U67 ( .A(n60), .B(n81), .C(n82), .Y(n67) );
  NAND2X1 U68 ( .A(N23), .B(n63), .Y(n82) );
  OAI21X1 U69 ( .A(n60), .B(n28), .C(n83), .Y(n66) );
  NAND2X1 U70 ( .A(N24), .B(n63), .Y(n83) );
  INVX1 U71 ( .A(count_out[7]), .Y(n28) );
  OAI21X1 U72 ( .A(n60), .B(n84), .C(n85), .Y(n65) );
  NAND2X1 U73 ( .A(N25), .B(n63), .Y(n85) );
  OAI21X1 U74 ( .A(n60), .B(n47), .C(n86), .Y(n64) );
  NAND2X1 U75 ( .A(N26), .B(n63), .Y(n86) );
  INVX1 U76 ( .A(n87), .Y(n63) );
  OAI21X1 U77 ( .A(n88), .B(n89), .C(n90), .Y(n87) );
  NOR2X1 U78 ( .A(clear), .B(n3), .Y(n90) );
  NAND3X1 U79 ( .A(n91), .B(n92), .C(n93), .Y(n89) );
  NOR2X1 U80 ( .A(n94), .B(n95), .Y(n93) );
  XOR2X1 U81 ( .A(rollover_val[9]), .B(count_out[9]), .Y(n95) );
  XOR2X1 U82 ( .A(rollover_val[7]), .B(count_out[7]), .Y(n94) );
  XOR2X1 U83 ( .A(n23), .B(rollover_val[3]), .Y(n92) );
  INVX1 U84 ( .A(count_out[3]), .Y(n23) );
  NOR2X1 U85 ( .A(n96), .B(n97), .Y(n91) );
  XOR2X1 U86 ( .A(rollover_val[1]), .B(count_out[1]), .Y(n97) );
  XOR2X1 U87 ( .A(rollover_val[5]), .B(count_out[5]), .Y(n96) );
  NAND3X1 U88 ( .A(n98), .B(n56), .C(n99), .Y(n88) );
  NOR2X1 U89 ( .A(n42), .B(n37), .Y(n99) );
  XOR2X1 U90 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n37) );
  XNOR2X1 U91 ( .A(n75), .B(rollover_val[2]), .Y(n42) );
  INVX1 U92 ( .A(count_out[2]), .Y(n75) );
  XOR2X1 U93 ( .A(n84), .B(rollover_val[8]), .Y(n56) );
  INVX1 U94 ( .A(count_out[8]), .Y(n84) );
  NOR2X1 U95 ( .A(n53), .B(n55), .Y(n98) );
  XOR2X1 U96 ( .A(count_out[4]), .B(rollover_val[4]), .Y(n55) );
  XOR2X1 U97 ( .A(n81), .B(n57), .Y(n53) );
  INVX1 U98 ( .A(rollover_val[6]), .Y(n57) );
  INVX1 U99 ( .A(count_out[6]), .Y(n81) );
  INVX1 U100 ( .A(count_out[9]), .Y(n47) );
  INVX1 U101 ( .A(n3), .Y(n60) );
  NOR2X1 U102 ( .A(count_enable), .B(clear), .Y(n3) );
endmodule


module flex_y_DW01_inc_0 ( A, SUM );
  input [9:0] A;
  output [9:0] SUM;

  wire   [9:2] carry;

  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[9]), .B(A[9]), .Y(SUM[9]) );
endmodule


module flex_y ( clk, n_rst, clear, count_enable, rollover_val, count_out, 
        rollover_flag );
  input [9:0] rollover_val;
  output [9:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N52, N53, N54, N55,
         N56, N57, N58, N59, N60, N61, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n1, n2, n3, n4, n5, n6, n7, n8, n9, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101;

  DFFSR \count_out_reg[0]  ( .D(n73), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n72), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n71), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n70), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[4]  ( .D(n69), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  DFFSR \count_out_reg[5]  ( .D(n68), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[5]) );
  DFFSR \count_out_reg[6]  ( .D(n67), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[6]) );
  DFFSR \count_out_reg[7]  ( .D(n66), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[7]) );
  DFFSR \count_out_reg[8]  ( .D(n65), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[8]) );
  DFFSR \count_out_reg[9]  ( .D(n64), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[9]) );
  DFFSR rollover_flag_reg ( .D(n101), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  flex_y_DW01_inc_0 add_47_aco ( .A({N61, N60, N59, N58, N57, N56, N55, N54, 
        N53, N52}), .SUM({N26, N25, N24, N23, N22, N21, N20, N19, N18, N17})
         );
  OAI21X1 U7 ( .A(n1), .B(n2), .C(n3), .Y(n101) );
  NAND2X1 U8 ( .A(rollover_flag), .B(n4), .Y(n3) );
  OR2X1 U16 ( .A(n5), .B(n6), .Y(n2) );
  NAND3X1 U17 ( .A(n7), .B(n8), .C(n9), .Y(n6) );
  XOR2X1 U18 ( .A(n21), .B(n22), .Y(n9) );
  XNOR2X1 U19 ( .A(n23), .B(n24), .Y(n8) );
  XOR2X1 U20 ( .A(n25), .B(n26), .Y(n7) );
  NAND3X1 U21 ( .A(n27), .B(n28), .C(n29), .Y(n5) );
  XOR2X1 U22 ( .A(n30), .B(n31), .Y(n29) );
  XOR2X1 U23 ( .A(n32), .B(n33), .Y(n28) );
  NAND2X1 U24 ( .A(n34), .B(n25), .Y(n33) );
  OAI21X1 U25 ( .A(rollover_val[6]), .B(n35), .C(rollover_val[7]), .Y(n34) );
  NAND3X1 U26 ( .A(n36), .B(n37), .C(n38), .Y(n1) );
  NOR2X1 U27 ( .A(n39), .B(n40), .Y(n38) );
  OAI21X1 U28 ( .A(n25), .B(n41), .C(n42), .Y(n40) );
  XOR2X1 U29 ( .A(n43), .B(count_out[9]), .Y(n42) );
  OAI21X1 U30 ( .A(rollover_val[8]), .B(n25), .C(rollover_val[9]), .Y(n43) );
  OR2X1 U31 ( .A(rollover_val[8]), .B(rollover_val[9]), .Y(n41) );
  NAND3X1 U32 ( .A(n44), .B(n45), .C(n31), .Y(n25) );
  INVX1 U33 ( .A(rollover_val[6]), .Y(n44) );
  XOR2X1 U34 ( .A(n46), .B(count_out[5]), .Y(n39) );
  NAND2X1 U35 ( .A(n47), .B(n35), .Y(n46) );
  INVX1 U36 ( .A(n31), .Y(n35) );
  NOR3X1 U37 ( .A(rollover_val[4]), .B(rollover_val[5]), .C(n23), .Y(n31) );
  OAI21X1 U38 ( .A(rollover_val[4]), .B(n23), .C(rollover_val[5]), .Y(n47) );
  XOR2X1 U39 ( .A(n48), .B(n49), .Y(n37) );
  NAND2X1 U40 ( .A(n50), .B(n23), .Y(n49) );
  NAND3X1 U41 ( .A(n51), .B(n52), .C(n53), .Y(n23) );
  OAI21X1 U42 ( .A(rollover_val[2]), .B(n22), .C(rollover_val[3]), .Y(n50) );
  NOR2X1 U43 ( .A(n54), .B(n55), .Y(n36) );
  XOR2X1 U44 ( .A(rollover_val[0]), .B(n56), .Y(n55) );
  XOR2X1 U45 ( .A(n57), .B(count_out[1]), .Y(n54) );
  OAI21X1 U46 ( .A(count_out[0]), .B(n58), .C(n22), .Y(n57) );
  INVX1 U47 ( .A(n53), .Y(n22) );
  NOR2X1 U48 ( .A(rollover_val[0]), .B(rollover_val[1]), .Y(n53) );
  OAI21X1 U49 ( .A(n56), .B(n59), .C(n60), .Y(n73) );
  NAND2X1 U50 ( .A(N17), .B(n27), .Y(n60) );
  OAI21X1 U51 ( .A(n61), .B(n59), .C(n62), .Y(n72) );
  NAND2X1 U52 ( .A(N18), .B(n27), .Y(n62) );
  OAI21X1 U53 ( .A(n63), .B(n59), .C(n74), .Y(n71) );
  NAND2X1 U54 ( .A(N19), .B(n27), .Y(n74) );
  OAI21X1 U55 ( .A(n48), .B(n59), .C(n75), .Y(n70) );
  NAND2X1 U56 ( .A(N20), .B(n27), .Y(n75) );
  OAI21X1 U57 ( .A(n76), .B(n59), .C(n77), .Y(n69) );
  NAND2X1 U58 ( .A(N21), .B(n27), .Y(n77) );
  OAI21X1 U59 ( .A(n78), .B(n59), .C(n79), .Y(n68) );
  NAND2X1 U60 ( .A(N22), .B(n27), .Y(n79) );
  OAI21X1 U61 ( .A(n80), .B(n59), .C(n81), .Y(n67) );
  NAND2X1 U62 ( .A(N23), .B(n27), .Y(n81) );
  OAI21X1 U63 ( .A(n32), .B(n59), .C(n82), .Y(n66) );
  NAND2X1 U64 ( .A(N24), .B(n27), .Y(n82) );
  OAI21X1 U65 ( .A(n83), .B(n59), .C(n84), .Y(n65) );
  NAND2X1 U66 ( .A(N25), .B(n27), .Y(n84) );
  OAI21X1 U67 ( .A(n85), .B(n59), .C(n86), .Y(n64) );
  NAND2X1 U68 ( .A(N26), .B(n27), .Y(n86) );
  NOR2X1 U69 ( .A(n4), .B(clear), .Y(n27) );
  INVX1 U70 ( .A(n4), .Y(n59) );
  NOR2X1 U71 ( .A(count_enable), .B(clear), .Y(n4) );
  NOR2X1 U72 ( .A(n87), .B(n85), .Y(N61) );
  NOR2X1 U73 ( .A(n87), .B(n83), .Y(N60) );
  INVX1 U74 ( .A(count_out[8]), .Y(n83) );
  NOR2X1 U75 ( .A(n87), .B(n32), .Y(N59) );
  INVX1 U76 ( .A(count_out[7]), .Y(n32) );
  NOR2X1 U77 ( .A(n87), .B(n80), .Y(N58) );
  NOR2X1 U78 ( .A(n87), .B(n78), .Y(N57) );
  NOR2X1 U79 ( .A(n87), .B(n76), .Y(N56) );
  INVX1 U80 ( .A(count_out[4]), .Y(n76) );
  NOR2X1 U81 ( .A(n87), .B(n48), .Y(N55) );
  INVX1 U82 ( .A(count_out[3]), .Y(n48) );
  NOR2X1 U83 ( .A(n87), .B(n63), .Y(N54) );
  NOR2X1 U84 ( .A(n87), .B(n61), .Y(N53) );
  INVX1 U85 ( .A(count_out[1]), .Y(n61) );
  NOR2X1 U86 ( .A(n87), .B(n56), .Y(N52) );
  INVX1 U87 ( .A(count_out[0]), .Y(n56) );
  INVX1 U88 ( .A(n88), .Y(n87) );
  NAND3X1 U89 ( .A(n89), .B(n90), .C(n91), .Y(n88) );
  NOR2X1 U90 ( .A(n92), .B(n93), .Y(n91) );
  NAND2X1 U91 ( .A(n94), .B(n95), .Y(n93) );
  XOR2X1 U92 ( .A(rollover_val[5]), .B(n78), .Y(n95) );
  INVX1 U93 ( .A(count_out[5]), .Y(n78) );
  XOR2X1 U94 ( .A(n45), .B(count_out[7]), .Y(n94) );
  INVX1 U95 ( .A(rollover_val[7]), .Y(n45) );
  NAND3X1 U96 ( .A(n96), .B(n97), .C(n98), .Y(n92) );
  XOR2X1 U97 ( .A(n52), .B(count_out[3]), .Y(n98) );
  INVX1 U98 ( .A(rollover_val[3]), .Y(n52) );
  XOR2X1 U99 ( .A(rollover_val[9]), .B(n85), .Y(n97) );
  INVX1 U100 ( .A(count_out[9]), .Y(n85) );
  XOR2X1 U101 ( .A(n58), .B(count_out[1]), .Y(n96) );
  INVX1 U102 ( .A(rollover_val[1]), .Y(n58) );
  NOR2X1 U103 ( .A(n26), .B(n99), .Y(n90) );
  NAND2X1 U104 ( .A(n24), .B(n30), .Y(n99) );
  XOR2X1 U105 ( .A(n80), .B(rollover_val[6]), .Y(n30) );
  INVX1 U106 ( .A(count_out[6]), .Y(n80) );
  XNOR2X1 U107 ( .A(count_out[4]), .B(rollover_val[4]), .Y(n24) );
  XOR2X1 U108 ( .A(count_out[8]), .B(rollover_val[8]), .Y(n26) );
  NOR2X1 U109 ( .A(n21), .B(n100), .Y(n89) );
  XOR2X1 U110 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n100) );
  XOR2X1 U111 ( .A(n63), .B(n51), .Y(n21) );
  INVX1 U112 ( .A(rollover_val[2]), .Y(n51) );
  INVX1 U113 ( .A(count_out[2]), .Y(n63) );
endmodule


module pix_inc ( wr_clk, wr_n_rst, wr_counter_enable, x_max, y_max, wr_clear, 
        x_value, y_value, done );
  input [9:0] x_max;
  input [9:0] y_max;
  output [9:0] x_value;
  output [9:0] y_value;
  input wr_clk, wr_n_rst, wr_counter_enable, wr_clear;
  output done;
  wire   x_flag, y_flag;

  flex_x XCNT ( .clk(wr_clk), .n_rst(wr_n_rst), .clear(wr_clear), 
        .count_enable(wr_counter_enable), .rollover_val(x_max), .count_out(
        x_value), .rollover_flag(x_flag) );
  flex_y YCNT ( .clk(wr_clk), .n_rst(wr_n_rst), .clear(wr_clear), 
        .count_enable(x_flag), .rollover_val(y_max), .count_out(y_value), 
        .rollover_flag(y_flag) );
  AND2X1 U2 ( .A(y_flag), .B(x_flag), .Y(done) );
endmodule

