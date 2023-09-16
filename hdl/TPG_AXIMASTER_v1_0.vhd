library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TPG_AXIMASTER_v1_0 is
	generic (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line

		C_TPGM_TARGET_SLAVE_BASE_ADDR	: std_logic_vector	:= x"44a0_0000";
		C_TPGM_ADDR_WIDTH	: integer	:= 32;
		C_TPGM_DATA_WIDTH	: integer	:= 32
	);
	port (
		-- Users to add ports here

		-- User ports ends
		-- Do not modify the ports beyond this line

		-- Ports of Axi Master Bus Interface TPGM
		tpgm_init_axi_txn	: in std_logic;		
		tpgm_txn_done	: out std_logic;
		tpgm_aclk	: in std_logic;
		tpgm_aresetn	: in std_logic;
		tpgm_awaddr	: out std_logic_vector(C_TPGM_ADDR_WIDTH-1 downto 0);
		tpgm_awprot	: out std_logic_vector(2 downto 0);
		tpgm_awvalid	: out std_logic;
		tpgm_awready	: in std_logic;
		tpgm_wdata	: out std_logic_vector(C_TPGM_DATA_WIDTH-1 downto 0);
		tpgm_wstrb	: out std_logic_vector(C_TPGM_DATA_WIDTH/8-1 downto 0);
		tpgm_wvalid	: out std_logic;
		tpgm_wready	: in std_logic;
		tpgm_bresp	: in std_logic_vector(1 downto 0);
		tpgm_bvalid	: in std_logic;
		tpgm_bready	: out std_logic;
		tpgm_araddr	: out std_logic_vector(C_TPGM_ADDR_WIDTH-1 downto 0);
		tpgm_arprot	: out std_logic_vector(2 downto 0);
		tpgm_arvalid	: out std_logic;
		tpgm_arready	: in std_logic;
		tpgm_rdata	: in std_logic_vector(C_TPGM_DATA_WIDTH-1 downto 0);
		tpgm_rresp	: in std_logic_vector(1 downto 0);
		tpgm_rvalid	: in std_logic;
		tpgm_rready	: out std_logic
	);
end TPG_AXIMASTER_v1_0;

architecture arch_imp of TPG_AXIMASTER_v1_0 is

	-- component declaration
	component TPG_AXIMASTER_v1_0_TPGM is
		generic (
		C_M_TARGET_SLAVE_BASE_ADDR	: std_logic_vector	:= x"44a0_0000";
		C_M_AXI_ADDR_WIDTH	: integer	:= 32;
		C_M_AXI_DATA_WIDTH	: integer	:= 32
		);
		port (
		INIT_AXI_TXN	: in std_logic;
		TXN_DONE	: out std_logic;
		M_AXI_ACLK	: in std_logic;
		M_AXI_ARESETN	: in std_logic;
		M_AXI_AWADDR	: out std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0);
		M_AXI_AWPROT	: out std_logic_vector(2 downto 0);
		M_AXI_AWVALID	: out std_logic;
		M_AXI_AWREADY	: in std_logic;
		M_AXI_WDATA	: out std_logic_vector(C_M_AXI_DATA_WIDTH-1 downto 0);
		M_AXI_WSTRB	: out std_logic_vector(C_M_AXI_DATA_WIDTH/8-1 downto 0);
		M_AXI_WVALID	: out std_logic;
		M_AXI_WREADY	: in std_logic;
		M_AXI_BRESP	: in std_logic_vector(1 downto 0);
		M_AXI_BVALID	: in std_logic;
		M_AXI_BREADY	: out std_logic;
		M_AXI_ARADDR	: out std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0);
		M_AXI_ARPROT	: out std_logic_vector(2 downto 0);
		M_AXI_ARVALID	: out std_logic;
		M_AXI_ARREADY	: in std_logic;
		M_AXI_RDATA	: in std_logic_vector(C_M_AXI_DATA_WIDTH-1 downto 0);
		M_AXI_RRESP	: in std_logic_vector(1 downto 0);
		M_AXI_RVALID	: in std_logic;
		M_AXI_RREADY	: out std_logic
		);
	end component TPG_AXIMASTER_v1_0_TPGM;

begin

-- Instantiation of Axi Bus Interface TPGM
TPG_AXIMASTER_v1_0_TPGM_inst : TPG_AXIMASTER_v1_0_TPGM
	generic map (
		C_M_TARGET_SLAVE_BASE_ADDR	=> C_TPGM_TARGET_SLAVE_BASE_ADDR,
		C_M_AXI_ADDR_WIDTH	=> C_TPGM_ADDR_WIDTH,
		C_M_AXI_DATA_WIDTH	=> C_TPGM_DATA_WIDTH
	)
	port map (
		INIT_AXI_TXN	=> tpgm_init_axi_txn,
		TXN_DONE	=> tpgm_txn_done,
		M_AXI_ACLK	=> tpgm_aclk,
		M_AXI_ARESETN	=> tpgm_aresetn,
		M_AXI_AWADDR	=> tpgm_awaddr,
		M_AXI_AWPROT	=> tpgm_awprot,
		M_AXI_AWVALID	=> tpgm_awvalid,
		M_AXI_AWREADY	=> tpgm_awready,
		M_AXI_WDATA	=> tpgm_wdata,
		M_AXI_WSTRB	=> tpgm_wstrb,
		M_AXI_WVALID	=> tpgm_wvalid,
		M_AXI_WREADY	=> tpgm_wready,
		M_AXI_BRESP	=> tpgm_bresp,
		M_AXI_BVALID	=> tpgm_bvalid,
		M_AXI_BREADY	=> tpgm_bready,
		M_AXI_ARADDR	=> tpgm_araddr,
		M_AXI_ARPROT	=> tpgm_arprot,
		M_AXI_ARVALID	=> tpgm_arvalid,
		M_AXI_ARREADY	=> tpgm_arready,
		M_AXI_RDATA	=> tpgm_rdata,
		M_AXI_RRESP	=> tpgm_rresp,
		M_AXI_RVALID	=> tpgm_rvalid,
		M_AXI_RREADY	=> tpgm_rready
	);

end arch_imp;