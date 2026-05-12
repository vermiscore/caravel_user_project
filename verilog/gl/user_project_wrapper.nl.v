module user_project_wrapper (user_clock2,
    wb_clk_i,
    wb_rst_i,
    wbs_ack_o,
    wbs_cyc_i,
    wbs_stb_i,
    wbs_we_i,
    analog_io,
    io_in,
    io_oeb,
    io_out,
    la_data_in,
    la_data_out,
    la_oenb,
    user_irq,
    wbs_adr_i,
    wbs_dat_i,
    wbs_dat_o,
    wbs_sel_i);
 input user_clock2;
 input wb_clk_i;
 input wb_rst_i;
 output wbs_ack_o;
 input wbs_cyc_i;
 input wbs_stb_i;
 input wbs_we_i;
 inout [28:0] analog_io;
 input [37:0] io_in;
 output [37:0] io_oeb;
 output [37:0] io_out;
 input [127:0] la_data_in;
 output [127:0] la_data_out;
 input [127:0] la_oenb;
 output [2:0] user_irq;
 input [31:0] wbs_adr_i;
 input [31:0] wbs_dat_i;
 output [31:0] wbs_dat_o;
 input [3:0] wbs_sel_i;


 ucb_top mprj (.clk(wb_clk_i),
    .reward_valid(la_data_in[1]),
    .rst_n(la_data_in[127]),
    .start(la_data_in[0]),
    .valid_out(io_out[6]),
    .reward_arm({la_data_in[7],
    la_data_in[6],
    la_data_in[5],
    la_data_in[4],
    la_data_in[3],
    la_data_in[2]}),
    .reward_val({la_data_in[23],
    la_data_in[22],
    la_data_in[21],
    la_data_in[20],
    la_data_in[19],
    la_data_in[18],
    la_data_in[17],
    la_data_in[16],
    la_data_in[15],
    la_data_in[14],
    la_data_in[13],
    la_data_in[12],
    la_data_in[11],
    la_data_in[10],
    la_data_in[9],
    la_data_in[8]}),
    .selected_arm({io_out[5],
    io_out[4],
    io_out[3],
    io_out[2],
    io_out[1],
    io_out[0]}));
assign io_oeb[6:0] = 7'b0;
    assign io_oeb[37:7] = 31'h7FFFFFFF;
 wire one_;
 wire zero_;
 sky130_fd_sc_hd__conb_1 TIE_ZERO_zero_ (.LO(zero_), .VNB(vssd1), .VPB(vccd1));
 sky130_fd_sc_hd__conb_1 TIE_ONE_one_ (.HI(one_), .VNB(vssd1), .VPB(vccd1));
 assign io_oeb[0] = zero_;
 assign io_oeb[1] = zero_;
 assign io_oeb[2] = zero_;
 assign io_oeb[3] = zero_;
 assign io_oeb[4] = zero_;
 assign io_oeb[5] = zero_;
 assign io_oeb[6] = zero_;
 assign io_oeb[7] = one_;
 assign io_oeb[8] = one_;
 assign io_oeb[9] = one_;
 assign io_oeb[10] = one_;
 assign io_oeb[11] = one_;
 assign io_oeb[12] = one_;
 assign io_oeb[13] = one_;
 assign io_oeb[14] = one_;
 assign io_oeb[15] = one_;
 assign io_oeb[16] = one_;
 assign io_oeb[17] = one_;
 assign io_oeb[18] = one_;
 assign io_oeb[19] = one_;
 assign io_oeb[20] = one_;
 assign io_oeb[21] = one_;
 assign io_oeb[22] = one_;
 assign io_oeb[23] = one_;
 assign io_oeb[24] = one_;
 assign io_oeb[25] = one_;
 assign io_oeb[26] = one_;
 assign io_oeb[27] = one_;
 assign io_oeb[28] = one_;
 assign io_oeb[29] = one_;
 assign io_oeb[30] = one_;
 assign io_oeb[31] = one_;
 assign io_oeb[32] = one_;
 assign io_oeb[33] = one_;
 assign io_oeb[34] = one_;
 assign io_oeb[35] = one_;
 assign io_oeb[36] = one_;
 assign io_oeb[37] = one_;
endmodule
