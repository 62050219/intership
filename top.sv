
`line 2 "top.tlv" 0 //_\TLV_version 1d: tl-x.org, generated by SandPiper(TM) 1.11-2021/01/28-beta
`include "sp_default.vh" //_\SV
   `include "sqrt32.v";
   module top(input wire clk, input wire reset, input wire [31:0] cyc_cnt, output wire passed, output wire failed);    /* verilator lint_save */ /* verilator lint_off UNOPTFLAT */  bit [256:0] RW_rand_raw; bit [256+63:0] RW_rand_vect; pseudo_rand #(.WIDTH(257)) pseudo_rand (clk, reset, RW_rand_raw[256:0]); assign RW_rand_vect[256+63:0] = {RW_rand_raw[62:0], RW_rand_raw};  /* verilator lint_restore */  /* verilator lint_off WIDTH */ /* verilator lint_off UNOPTFLAT */
`include "top_gen.sv" //_\TLV
   
   //_|calc
      
      // Pythagora's Theorem
      //_@0
         assign CALC_aa_sq_a0[7:0] = CALC_aa_a0[3:0] ** 2; // ไม่สนใจ clk
      //_@1
         assign CALC_bb_sq_a1[7:0] = CALC_bb_a1[3:0] ** 2;
      //_@2
         assign CALC_cc_sq_a2[8:0] = CALC_aa_sq_a2 + CALC_bb_sq_a2;
      //_@3
      //_@4
         assign CALC_cc_a4[4:0] = sqrt(CALC_cc_sq_a4);


      // Print
         /*SV_plus*/
            always_ff @(posedge clk) begin  //เมื่อ clkขาขึ้นทำงานจะ display ในส่วนข้างล่างออกมา
               $display("sqrt((%2d ^ 2) + (%2d ^ 2)) = %2d", CALC_aa_a4, CALC_bb_a4, CALC_cc_a4);
            end

   // Stop simulation.
   assign passed = cyc_cnt > 40; endgenerate
//_\SV
endmodule
