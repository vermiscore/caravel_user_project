// SPDX-FileCopyrightText: 2020 Efabless Corporation
// SPDX-License-Identifier: Apache-2.0
`default_nettype none
module user_project_wrapper #(
    parameter BITS = 32
) (
`ifdef USE_POWER_PINS
    inout vdda1, inout vdda2, inout vssa1, inout vssa2,
    inout vccd1, inout vccd2, inout vssd1, inout vssd2,
`endif
    input wb_clk_i, input wb_rst_i,
    input wbs_stb_i, input wbs_cyc_i, input wbs_we_i,
    input [3:0] wbs_sel_i, input [31:0] wbs_dat_i, input [31:0] wbs_adr_i,
    output wbs_ack_o, output [31:0] wbs_dat_o,
    input  [127:0] la_data_in, output [127:0] la_data_out, input [127:0] la_oenb,
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,
    inout [`MPRJ_IO_PADS-10:0] analog_io,
    input user_clock2,
    output [2:0] user_irq
);
    ucb_top mprj (
`ifdef USE_POWER_PINS
        .VPWR(vccd1),
        .VGND(vssd1),
`endif
        .clk(wb_clk_i),
        .rst_n(la_data_in[127]),
        .start(la_data_in[0]),
        .reward_valid(la_data_in[1]),
        .reward_arm(la_data_in[7:2]),
        .reward_val(la_data_in[23:8]),
        .selected_arm(io_out[5:0]),
        .valid_out(io_out[6])
    );
    assign io_oeb[6:0] = 7'b0;
    assign io_oeb[37:7] = 31'h7FFFFFFF;
endmodule
`default_nettype wire
