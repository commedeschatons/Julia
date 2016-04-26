	amm_master_qsys_with_pcie u0 (
		.clk_clk                                         (<connected-to-clk_clk>),                                         //                                       clk.clk
		.custom_module_conduit_rdwr_cntl                 (<connected-to-custom_module_conduit_rdwr_cntl>),                 //                     custom_module_conduit.rdwr_cntl
		.custom_module_conduit_n_action                  (<connected-to-custom_module_conduit_n_action>),                  //                                          .n_action
		.custom_module_conduit_add_data_sel              (<connected-to-custom_module_conduit_add_data_sel>),              //                                          .add_data_sel
		.custom_module_conduit_rdwr_address              (<connected-to-custom_module_conduit_rdwr_address>),              //                                          .rdwr_address
		.custom_module_conduit_display_data              (<connected-to-custom_module_conduit_display_data>),              //                                          .display_data
		.pcie_ip_clocks_sim_clk250_export                (<connected-to-pcie_ip_clocks_sim_clk250_export>),                //                        pcie_ip_clocks_sim.clk250_export
		.pcie_ip_clocks_sim_clk500_export                (<connected-to-pcie_ip_clocks_sim_clk500_export>),                //                                          .clk500_export
		.pcie_ip_clocks_sim_clk125_export                (<connected-to-pcie_ip_clocks_sim_clk125_export>),                //                                          .clk125_export
		.pcie_ip_pcie_rstn_export                        (<connected-to-pcie_ip_pcie_rstn_export>),                        //                         pcie_ip_pcie_rstn.export
		.pcie_ip_pipe_ext_pipe_mode                      (<connected-to-pcie_ip_pipe_ext_pipe_mode>),                      //                          pcie_ip_pipe_ext.pipe_mode
		.pcie_ip_pipe_ext_phystatus_ext                  (<connected-to-pcie_ip_pipe_ext_phystatus_ext>),                  //                                          .phystatus_ext
		.pcie_ip_pipe_ext_rate_ext                       (<connected-to-pcie_ip_pipe_ext_rate_ext>),                       //                                          .rate_ext
		.pcie_ip_pipe_ext_powerdown_ext                  (<connected-to-pcie_ip_pipe_ext_powerdown_ext>),                  //                                          .powerdown_ext
		.pcie_ip_pipe_ext_txdetectrx_ext                 (<connected-to-pcie_ip_pipe_ext_txdetectrx_ext>),                 //                                          .txdetectrx_ext
		.pcie_ip_pipe_ext_rxelecidle0_ext                (<connected-to-pcie_ip_pipe_ext_rxelecidle0_ext>),                //                                          .rxelecidle0_ext
		.pcie_ip_pipe_ext_rxdata0_ext                    (<connected-to-pcie_ip_pipe_ext_rxdata0_ext>),                    //                                          .rxdata0_ext
		.pcie_ip_pipe_ext_rxstatus0_ext                  (<connected-to-pcie_ip_pipe_ext_rxstatus0_ext>),                  //                                          .rxstatus0_ext
		.pcie_ip_pipe_ext_rxvalid0_ext                   (<connected-to-pcie_ip_pipe_ext_rxvalid0_ext>),                   //                                          .rxvalid0_ext
		.pcie_ip_pipe_ext_rxdatak0_ext                   (<connected-to-pcie_ip_pipe_ext_rxdatak0_ext>),                   //                                          .rxdatak0_ext
		.pcie_ip_pipe_ext_txdata0_ext                    (<connected-to-pcie_ip_pipe_ext_txdata0_ext>),                    //                                          .txdata0_ext
		.pcie_ip_pipe_ext_txdatak0_ext                   (<connected-to-pcie_ip_pipe_ext_txdatak0_ext>),                   //                                          .txdatak0_ext
		.pcie_ip_pipe_ext_rxpolarity0_ext                (<connected-to-pcie_ip_pipe_ext_rxpolarity0_ext>),                //                                          .rxpolarity0_ext
		.pcie_ip_pipe_ext_txcompl0_ext                   (<connected-to-pcie_ip_pipe_ext_txcompl0_ext>),                   //                                          .txcompl0_ext
		.pcie_ip_pipe_ext_txelecidle0_ext                (<connected-to-pcie_ip_pipe_ext_txelecidle0_ext>),                //                                          .txelecidle0_ext
		.pcie_ip_powerdown_pll_powerdown                 (<connected-to-pcie_ip_powerdown_pll_powerdown>),                 //                         pcie_ip_powerdown.pll_powerdown
		.pcie_ip_powerdown_gxb_powerdown                 (<connected-to-pcie_ip_powerdown_gxb_powerdown>),                 //                                          .gxb_powerdown
		.pcie_ip_reconfig_busy_busy_altgxb_reconfig      (<connected-to-pcie_ip_reconfig_busy_busy_altgxb_reconfig>),      //                     pcie_ip_reconfig_busy.busy_altgxb_reconfig
		.pcie_ip_reconfig_fromgxb_0_data                 (<connected-to-pcie_ip_reconfig_fromgxb_0_data>),                 //                pcie_ip_reconfig_fromgxb_0.data
		.pcie_ip_reconfig_togxb_data                     (<connected-to-pcie_ip_reconfig_togxb_data>),                     //                    pcie_ip_reconfig_togxb.data
		.pcie_ip_refclk_export                           (<connected-to-pcie_ip_refclk_export>),                           //                            pcie_ip_refclk.export
		.pcie_ip_rx_in_rx_datain_0                       (<connected-to-pcie_ip_rx_in_rx_datain_0>),                       //                             pcie_ip_rx_in.rx_datain_0
		.pcie_ip_test_in_test_in                         (<connected-to-pcie_ip_test_in_test_in>),                         //                           pcie_ip_test_in.test_in
		.pcie_ip_tx_out_tx_dataout_0                     (<connected-to-pcie_ip_tx_out_tx_dataout_0>),                     //                            pcie_ip_tx_out.tx_dataout_0
		.reset_reset_n                                   (<connected-to-reset_reset_n>),                                   //                                     reset.reset_n
		.sdram_addr                                      (<connected-to-sdram_addr>),                                      //                                     sdram.addr
		.sdram_ba                                        (<connected-to-sdram_ba>),                                        //                                          .ba
		.sdram_cas_n                                     (<connected-to-sdram_cas_n>),                                     //                                          .cas_n
		.sdram_cke                                       (<connected-to-sdram_cke>),                                       //                                          .cke
		.sdram_cs_n                                      (<connected-to-sdram_cs_n>),                                      //                                          .cs_n
		.sdram_dq                                        (<connected-to-sdram_dq>),                                        //                                          .dq
		.sdram_dqm                                       (<connected-to-sdram_dqm>),                                       //                                          .dqm
		.sdram_ras_n                                     (<connected-to-sdram_ras_n>),                                     //                                          .ras_n
		.sdram_we_n                                      (<connected-to-sdram_we_n>),                                      //                                          .we_n
		.video_vga_controller_0_external_interface_CLK   (<connected-to-video_vga_controller_0_external_interface_CLK>),   // video_vga_controller_0_external_interface.CLK
		.video_vga_controller_0_external_interface_HS    (<connected-to-video_vga_controller_0_external_interface_HS>),    //                                          .HS
		.video_vga_controller_0_external_interface_VS    (<connected-to-video_vga_controller_0_external_interface_VS>),    //                                          .VS
		.video_vga_controller_0_external_interface_BLANK (<connected-to-video_vga_controller_0_external_interface_BLANK>), //                                          .BLANK
		.video_vga_controller_0_external_interface_SYNC  (<connected-to-video_vga_controller_0_external_interface_SYNC>),  //                                          .SYNC
		.video_vga_controller_0_external_interface_R     (<connected-to-video_vga_controller_0_external_interface_R>),     //                                          .R
		.video_vga_controller_0_external_interface_G     (<connected-to-video_vga_controller_0_external_interface_G>),     //                                          .G
		.video_vga_controller_0_external_interface_B     (<connected-to-video_vga_controller_0_external_interface_B>)      //                                          .B
	);

