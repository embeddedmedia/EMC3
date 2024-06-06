#serial UART
set_property PACKAGE_PIN C3 [get_ports UART_0_0_rxd]
set_property PACKAGE_PIN C2 [get_ports UART_0_0_txd]
set_property IOSTANDARD LVCMOS18 [get_ports UART_0_0_rxd]
set_property IOSTANDARD LVCMOS18 [get_ports UART_0_0_txd]
set_property PULLTYPE PULLUP [get_ports UART_0_0_rxd]
set_property PULLTYPE PULLUP [get_ports UART_0_0_txd]

# WiFi UART
set_property PACKAGE_PIN AH1 [get_ports UART_1_0_rxd]
set_property PACKAGE_PIN AH2 [get_ports UART_1_0_txd]
set_property IOSTANDARD LVCMOS18 [get_ports UART_1_0_rxd]
set_property IOSTANDARD LVCMOS18 [get_ports UART_1_0_txd]
set_property PULLTYPE PULLUP [get_ports UART_1_0_rxd]
set_property PULLTYPE PULLUP [get_ports UART_1_0_txd]

# GPIO resets
set_property IOSTANDARD LVCMOS18 [get_ports {resets_tri_o[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {resets_tri_o[1]}] 
set_property IOSTANDARD LVCMOS18 [get_ports {resets_tri_o[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {resets_tri_o[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {resets_tri_o[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {resets_tri_o[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {resets_tri_o[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {resets_tri_o[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {resets_tri_o[8]}]
# PS_ETH_RESET_B
set_property PACKAGE_PIN AC3 [get_ports {resets_tri_o[0]}] 
# USB_HUB_RESET_B
set_property PACKAGE_PIN AC4 [get_ports {resets_tri_o[1]}] 
# USB_PHY_RESET_B
set_property PACKAGE_PIN AB3 [get_ports {resets_tri_o[2]}] 
# MPCIE_RST_B
set_property PACKAGE_PIN AB4 [get_ports {resets_tri_o[3]}] 
# PL_ETH_RESET_B
set_property PACKAGE_PIN AD2 [get_ports {resets_tri_o[4]}] 
# ISP0_RESET_B
set_property PACKAGE_PIN AD1 [get_ports {resets_tri_o[5]}] 
# IAS2_RESET_B
set_property PACKAGE_PIN AB2 [get_ports {resets_tri_o[6]}] 
# IAS3_RESET_B
set_property PACKAGE_PIN AF2 [get_ports {resets_tri_o[7]}] 
# N_RST_WIFI
set_property PACKAGE_PIN AH3 [get_ports {resets_tri_o[8]}] 


# GPIO RPI enable
set_property IOSTANDARD LVCMOS18 [get_ports {rpi_enable_tri_o[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {rpi_enable_tri_o[1]}] 
set_property IOSTANDARD LVCMOS18 [get_ports {rpi_enable_tri_o[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {rpi_enable_tri_o[3]}]
# RPI0_ENABLE
set_property PACKAGE_PIN AC2 [get_ports {rpi_enable_tri_o[0]}] 
# RPI1_ENABLE
set_property PACKAGE_PIN AG4 [get_ports {rpi_enable_tri_o[1]}] 
# RPI2_ENABLE
set_property PACKAGE_PIN AH4 [get_ports {rpi_enable_tri_o[2]}] 
# RPI3_ENABLE
set_property PACKAGE_PIN AG3 [get_ports {rpi_enable_tri_o[3]}] 


# GPIO LED
set_property IOSTANDARD LVCMOS18 [get_ports {leds_tri_o[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {leds_tri_o[1]}] 
# DEBUG LED7
set_property PACKAGE_PIN AE3 [get_ports {leds_tri_o[0]}] 
# DEBUG LED9
set_property PACKAGE_PIN AF3 [get_ports {leds_tri_o[1]}] 

