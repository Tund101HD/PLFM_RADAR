`timescale 1ns / 1ps

module radar_system_top_te0713_dev (
    input wire clk_100m,
    output wire [3:0] user_led,
    output wire [3:0] system_status
);

wire clk_100m_buf;
reg [31:0] hb_counter;

BUFG bufg_100m (
    .I(clk_100m),
    .O(clk_100m_buf)
);

always @(posedge clk_100m_buf) begin
    hb_counter <= hb_counter + 1'b1;
end

assign user_led[0] = hb_counter[24];
assign user_led[1] = hb_counter[25];
assign user_led[2] = hb_counter[26];
assign user_led[3] = hb_counter[27];

assign system_status[0] = hb_counter[23];
assign system_status[1] = hb_counter[24];
assign system_status[2] = hb_counter[25];
assign system_status[3] = hb_counter[26];

endmodule
