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
    wire clk          = wb_clk_i;
    wire rst_n        = la_data_in[127];
    wire start        = la_data_in[0];
    wire reward_valid = la_data_in[1];
    wire [5:0]  reward_arm = la_data_in[7:2];
    wire [15:0] reward_val = la_data_in[23:8];
    wire [5:0]  selected_arm;
    wire        valid_out;

    // Output assignments
    assign io_oeb[6:0]                = 7'b0000000;
    assign io_oeb[7]                  = 1'b1;
    assign io_oeb[8]                  = 1'b1;
    assign io_oeb[9]                  = 1'b1;
    assign io_oeb[10]                 = 1'b1;
    assign io_oeb[11]                 = 1'b1;
    assign io_oeb[`MPRJ_IO_PADS-1:12] = {(`MPRJ_IO_PADS-12){1'b1}};

    assign io_out[5:0]                = selected_arm;
    assign io_out[6]                  = valid_out;
    assign io_out[7]                  = 1'b0;
    assign io_out[8]                  = 1'b0;
    assign io_out[9]                  = 1'b0;
    assign io_out[10]                 = 1'b0;
    assign io_out[11]                 = 1'b0;
    assign io_out[`MPRJ_IO_PADS-1:12] = {(`MPRJ_IO_PADS-12){1'b0}};

    assign wbs_ack_o   = 1'b0;
    assign wbs_dat_o   = 32'b0;
    assign la_data_out[0]     = valid_out;
    assign la_data_out[127:1] = 127'b0;
    assign user_irq    = 3'b0;

    ucb_top mprj (
`ifdef USE_POWER_PINS
        .VPWR         (vccd1),
        .VGND         (vssd1),
`endif
        .clk          (clk),
        .rst_n        (rst_n),
        .start        (start),
        .selected_arm (selected_arm),
        .valid_out    (valid_out),
        .reward_valid (reward_valid),
        .reward_arm   (reward_arm),
        .reward_val   (reward_val)
    );
endmodule
`default_nettype wire
