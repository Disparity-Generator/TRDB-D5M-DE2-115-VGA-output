library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity KAMERA_VGA_DEMONSTRATOR is
port (
  I_CLOCK        : in    std_logic;

  ------------------SDRAM---------------------------
  O_DRAM_ADDR    : out   unsigned(12 downto 0);
  O_DRAM_BA      : out   unsigned(1 downto 0);
  O_DRAM_CAS_N   : out   std_logic;
  O_DRAM_CKE     : out   std_logic;
  O_DRAM_CLK     : out   std_logic;
  O_DRAM_CS_N    : out   std_logic;
  IO_DRAM_DQ     : inout std_logic_vector(31 downto 0);
  O_DRAM_RAS_N   : out   std_logic;
  O_DRAM_WE_N    : out   std_logic;
  O_DRAM_LDQM_1  : out   std_logic;
  O_DRAM_UDQM_1  : out   std_logic;
  O_DRAM_LDQM_0  : out   std_logic;
  O_DRAM_UDQM_0  : out   std_logic;

  -------------------VGA----------------------------
  O_H_SYNC       : out   std_logic;
  O_V_SYNC       : out   std_logic;
  O_VGA_R        : out   std_logic_vector(7 downto 0);
  O_VGA_G        : out   std_logic_vector(7 downto 0);
  O_VGA_B        : out   std_logic_vector(7 downto 0);
  O_VGA_SYNC_N   : out   std_logic;
  O_VGA_BLANK_N  : out   std_logic;
  O_VGA_CLOCK    : out   std_logic;

  ------- Anzeigen, Buttons, Switches------------------
  I_SLIDE_SWITCH : in    std_logic_vector(17 downto 0);
  I_BUTTON       : in    std_logic_vector(3 downto 0);

  O_LED_RED      : out   std_logic_vector(17 downto 0);
  O_LED_GREEN    : out   std_logic_vector(8 downto 0);

  O_7_SEGMENT_0  : out   std_logic_vector(6 downto 0);
  O_7_SEGMENT_1  : out   std_logic_vector(6 downto 0);
  O_7_SEGMENT_2  : out   std_logic_vector(6 downto 0);
  O_7_SEGMENT_3  : out   std_logic_vector(6 downto 0);
  O_7_SEGMENT_4  : out   std_logic_vector(6 downto 0);
  O_7_SEGMENT_5  : out   std_logic_vector(6 downto 0);
  O_7_SEGMENT_6  : out   std_logic_vector(6 downto 0);
  O_7_SEGMENT_7  : out   std_logic_vector(6 downto 0);

  I_GPIO_0       : in    std_logic;
  I_GPIO_1       : in    std_logic;
  I_GPIO_3       : in    std_logic;
  I_GPIO_4       : in    std_logic;
  I_GPIO_5       : in    std_logic;
  I_GPIO_6       : in    std_logic;
  I_GPIO_7       : in    std_logic;
  I_GPIO_8       : in    std_logic;
  I_GPIO_9       : in    std_logic;
  I_GPIO_10      : in    std_logic;
  I_GPIO_11      : in    std_logic;
  I_GPIO_12      : in    std_logic;
  I_GPIO_13      : in    std_logic;

  O_GPIO_16      : out   std_logic;
  O_GPIO_17      : out   std_logic;

  O_GPIO_19      : out   std_logic;

  I_GPIO_20      : in    std_logic;
  I_GPIO_21      : in    std_logic;
  I_GPIO_22      : in    std_logic;
  O_GPIO_23      : inout std_logic;
  O_GPIO_24      : out   std_logic;

  I_HSMC_J2_0       : in    std_logic; -- (GPIO 0)
  I_HSMC_J2_1       : in    std_logic; -- (GPIO 1)
  I_HSMC_J2_3       : in    std_logic; -- (GPIO 3)
  I_HSMC_J2_4       : in    std_logic; -- TX_n16 (GPIO 4)
  I_HSMC_J2_5       : in    std_logic; -- RX_n15 (GPIO 5)
  I_HSMC_J2_6       : in    std_logic; -- TX_p16 (GPIO 6)
  I_HSMC_J2_7       : in    std_logic; -- RX_p15 (GPIO 7)
  I_HSMC_J2_8       : in    std_logic; -- TX_n15 (GPIO 8)
  I_HSMC_J2_9       : in    std_logic; -- RX_n14 (GPIO 9)
  I_HSMC_J2_10      : in    std_logic; -- TX_p15 (GPIO 10)
  I_HSMC_J2_11      : in    std_logic;
  I_HSMC_J2_12      : in    std_logic;
  I_HSMC_J2_13      : in    std_logic; -- RX_p14 (GPIO 11)
  I_HSMC_J2_14      : in    std_logic; -- TX_n14 (GPIO 12)
  I_HSMC_J2_15      : in    std_logic; -- RX_n13 (GPIO 13)
  O_HSMC_J2_16      : out   std_logic;
  -- HSMC 17 = TX_p14 (GPIO 14)
  O_HSMC_J2_17      : out   std_logic; -- RX_p13 (GPIO 15)
  O_HSMC_J2_18      : out   std_logic; -- CLKOUT_n2

  O_HSMC_J2_19      : out   std_logic; -- RX_n12

  I_HSMC_J2_20      : in    std_logic; -- CLKOUT_p2
  I_HSMC_J2_21      : in    std_logic; -- RX_p12
  I_HSMC_J2_22      : in    std_logic; -- TX_n13
  IO_HSMC_J2_23      : inout std_logic; -- RX_n11
  O_HSMC_J2_24      : out   std_logic; -- TX_p13

  I_HSMC_J3_0       : in    std_logic; -- (GPIO 0)
  I_HSMC_J3_1       : in    std_logic; -- (GPIO 1)
  I_HSMC_J3_3       : in    std_logic; -- (GPIO 3)
  I_HSMC_J3_4       : in    std_logic; -- TX_n16 (GPIO 4)
  I_HSMC_J3_5       : in    std_logic; -- RX_n15 (GPIO 5)
  I_HSMC_J3_6       : in    std_logic; -- TX_p16 (GPIO 6)
  I_HSMC_J3_7       : in    std_logic; -- RX_p15 (GPIO 7)
  I_HSMC_J3_8       : in    std_logic; -- TX_n15 (GPIO 8)
  I_HSMC_J3_9       : in    std_logic; -- RX_n14 (GPIO 9)
  I_HSMC_J3_10      : in    std_logic; -- TX_p15 (GPIO 10)
  I_HSMC_J3_11      : in    std_logic;
  I_HSMC_J3_12      : in    std_logic;
  I_HSMC_J3_13      : in    std_logic; -- RX_p14 (GPIO 11)
  I_HSMC_J3_14      : in    std_logic; -- TX_n14 (GPIO 12)
  I_HSMC_J3_15      : in    std_logic; -- RX_n13 (GPIO 13)
  O_HSMC_J3_16      : out   std_logic;
  -- HSMC 17 = TX_p14 (GPIO 14)
  O_HSMC_J3_17      : out   std_logic; -- RX_p13 (GPIO 15)
  O_HSMC_J3_18      : out   std_logic; -- CLKOUT_n2

  O_HSMC_J3_19      : out   std_logic; -- RX_n12

  I_HSMC_J3_20      : in    std_logic; -- CLKOUT_p2
  I_HSMC_J3_21      : in    std_logic; -- RX_p12
  I_HSMC_J3_22      : in    std_logic; -- TX_n13
  IO_HSMC_J3_23      : inout std_logic; -- RX_n11
  O_HSMC_J3_24      : out   std_logic  -- TX_p13

);
end entity KAMERA_VGA_DEMONSTRATOR;

architecture RTL of KAMERA_VGA_DEMONSTRATOR is

type states_t is (FLUSH_FIFOS, WAIT_FOR_NEW_FRAME_LEFT, WRITE_LEFT, WAIT_FOR_NEW_FRAME_RIGHT, WRITE_RIGHT, READ);

----------------- clocks ------------------------------
signal w_clk_system                     : std_logic;
signal w_clk_vga                        : std_logic;
signal w_clk_sdram                      : std_logic;
signal w_clk_i2c                        : std_logic;
signal w_clk_i2c_double                 : std_logic;
signal w_clk_camera_pll : std_logic;
signal w_clk_camera : std_logic;

  --------------- camera left ---------------------------

  signal w_left_camera_pixeldata                      : std_logic_vector(23 downto 0);
  signal w_left_input_image_valid                     : std_logic;
  signal r_left_new_frame_started                     : std_logic;
  signal w_left_camera_pixclk                         : std_logic;
  signal w_left_camera_sclk                           : std_logic;
  signal w_left_camera_xclk                           : std_logic;

  signal w_left_camera_out_raw                        : std_logic_vector(11 downto 0);
  signal w_left_camera_pixel_out_full_width           : std_logic_vector(35 downto 0);
  signal w_left_camera_pixel_out_reduced_width        : std_logic_vector(23 downto 0);
  signal w_left_camera_strobe                         : std_logic;
  signal w_left_camera_lval                           : std_logic;
  signal w_left_camera_fval                           : std_logic;
  signal w_left_camera_sdata                          : std_logic;
  signal w_left_camera_reset_n                        : std_logic;
  signal w_left_camera_trigger                        : std_logic;
  signal w_left_camera_pixel_valid                    : std_logic;
  signal w_left_new_frame_started                     : std_logic;

  signal w_left_raw_pixel_valid                       : std_logic;
  signal w_left_raw_pixel_full_width                  : std_logic_vector(11 downto 0);
  signal w_left_raw_pixel_reduced_width               : std_logic_vector(7 downto 0);

  signal w_take_picture                               : std_logic;

  signal r_lval                                       : std_logic;
  signal r_pixel_data                                 : std_logic_vector(11 downto 0);

  -- disparity --
  signal w_disparity_pixel_valid                      : std_logic;
  signal w_disparity_pixel                            : std_logic_vector(7 downto 0);
  signal w_disparity_ready                            : std_logic;

  --------------- camera right ---------------------------
  signal w_right_chosen_picture                       : std_logic_vector(1 downto 0);
  signal w_right_pixeldata                            : std_logic_vector(23 downto 0);
  signal w_right_input_image_valid                    : std_logic;
  signal r_right_new_frame_started                    : std_logic;
  signal w_right_camera_pixclk                        : std_logic;
  signal w_right_camera_sclk                          : std_logic;
  signal w_right_camera_xclk                          : std_logic;

  signal w_right_camera_out_raw                       : std_logic_vector(11 downto 0);
  signal w_right_camera_pixel_out_reduced_width       : std_logic_vector(23 downto 0);
  signal w_right_camera_strobe                        : std_logic;
  signal w_right_camera_lval                          : std_logic;
  signal w_right_camera_fval                          : std_logic;
  signal w_right_camera_sdata                         : std_logic;
  signal w_right_camera_reset_n                       : std_logic;
  signal w_right_camera_trigger                       : std_logic;
  signal w_right_camera_pixel_valid                   : std_logic;
  signal w_right_new_frame_started                    : std_logic;


-- sdram --

signal w_sdram_fifo_left_data_in             : std_logic_vector(23 downto 0);
signal w_sdram_fifo_left_rdreq               : std_logic;
signal w_sdram_fifo_left_wrreq               : std_logic;
signal w_sdram_fifo_left_q                   : std_logic_vector(23 downto 0);
signal w_sdram_fifo_left_rdempty             : std_logic;
signal w_sdram_fifo_left_wrfull              : std_logic;
signal w_sdram_fifo_left_wrusedw             : std_logic_vector(12 downto 0);
signal w_sdram_fifo_left_rdusedw             : std_logic_vector(12 downto 0);
signal w_sdram_fifo_left_aclr                : std_logic;

signal w_sdram_fifo_right_data_in             : std_logic_vector(23 downto 0);
signal w_sdram_fifo_right_rdreq               : std_logic;
signal w_sdram_fifo_right_wrreq               : std_logic;
signal w_sdram_fifo_right_q                   : std_logic_vector(23 downto 0);
signal w_sdram_fifo_right_rdempty             : std_logic;
signal w_sdram_fifo_right_wrfull              : std_logic;
signal w_sdram_fifo_right_wrusedw             : std_logic_vector(12 downto 0);
signal w_sdram_fifo_right_rdusedw             : std_logic_vector(12 downto 0);
signal w_sdram_fifo_right_aclr                : std_logic;

signal w_sdram_initialized              : std_logic;

signal r_current_state                  : states_t := flush_fifos;
signal w_next_state                     : states_t;
signal w_sdram_addr                     : std_logic_vector(24 downto 0);
signal w_sdram_rdval                    : std_logic;
signal w_sdram_we_n                     : std_logic;
signal w_sdram_writedata                : std_logic_vector(31 downto 0);
signal w_sdram_ack                      : std_logic;

signal w_dqml                           : std_logic;
signal w_dqmh                           : std_logic;

signal w_sdram_readdata                 : std_logic_vector(31 downto 0);
signal w_sdram_req                      : std_logic;

-----------------fifo-------------------------------------

signal w_vga_fifo_data_in               : std_logic_vector(23 downto 0);
signal w_vga_fifo_rdreq                 : std_logic;
signal w_vga_fifo_wrreq                 : std_logic;
signal w_vga_fifo_q                     : std_logic_vector(23 downto 0);
signal w_vga_fifo_rdempty               : std_logic;
signal w_vga_fifo_wrfull                : std_logic;
signal w_vga_fifo_wrusedw               : std_logic_vector(12 downto 0);
signal w_vga_fifo_rdusedw               : std_logic_vector(12 downto 0);
signal w_vga_fifo_aclr                  : std_logic;

-------------------vga-------------------------------------
signal w_vga_ready                      : std_logic;
signal w_vga_data_in                    : std_logic_vector(23 downto 0);
signal w_vga_reset                      : std_logic;

---------------anwendung-----------------------------------
signal r_ram_write_pointer              : integer range 0 to 308000 := 0; -- 480*640 = 307.200

-- Der Integer wird bei -1 initialisiert und nimmt diesen Zustand dann nie wieder ein.
-- So kann überprüft werden, ob schon einmal gelesen wurde.
-- Dies ist nötig für die write_ready flag beim ersten Durchlauf.
signal r_ram_read_pointer               : integer range 0 to 308000 := 0; -- 480*640 = 307.200

signal r_vga_out_counter                : integer range 0 to 307199;

signal r_rgb_count                      : integer range 0 to 16777215 := 0;

signal r_values_written_to_fifo         : integer range 0 to 308000 := 0;

signal w_continous_write                : std_logic;
signal w_reset_n                        : std_logic;
signal w_vga_blank_n                    : std_logic;

signal r_pixel_col_count                : integer range 0 to 2600 := 0;
signal r_pixel_row_count                : integer range 0 to 2600 := 0;
signal r_row_counter_locked             : std_logic               := '1';

constant c_image_width                  : integer := 640;
constant c_image_height                 : integer := 480;
constant c_max_rgb_count                : integer := c_image_height * c_image_width;

attribute keep : boolean;
attribute preserve : boolean;
attribute noprune : boolean;

attribute keep of r_pixel_col_count     : signal is true;
attribute preserve of r_pixel_col_count : signal is true;
attribute noprune of r_pixel_col_count  : signal is true;

attribute keep of r_pixel_row_count     : signal is true;
attribute preserve of r_pixel_row_count : signal is true;
attribute noprune of r_pixel_row_count  : signal is true;

attribute keep of r_lval     : signal is true;
attribute preserve of r_lval : signal is true;
attribute noprune of r_lval  : signal is true;

attribute keep of r_pixel_data     : signal is true;
attribute preserve of r_pixel_data : signal is true;
attribute noprune of r_pixel_data  : signal is true;

component PLL is
  port (
    CLK_CLK            : in    std_logic                     := 'X';
    CLK_SYSTEM_CLK     : out   std_logic;
    RESET_RESET_N      : in    std_logic                     := 'X';
    CLK_SDRAM_CLK      : out   std_logic;
    CLK_VGA_CLK        : out   std_logic;
    CLK_I2C_CLK        : out   std_logic;
    CLK_I2C_DOUBLE_CLK : out   std_logic;
	 CLK_CAMERA_CLK : out std_logic
  );
end component pll;

component SDRAM_CONTROLLER is
  generic (
    G_CLK_FREQ           : real := 90.0;

    G_ADDR_WIDTH         : natural := 25;

    G_SDRAM_ADDR_WIDTH   : natural := 13;
    G_SDRAM_DATA_WIDTH   : natural := 32;
    G_SDRAM_COL_WIDTH    : natural := 10;
    G_SDRAM_ROW_WIDTH    : natural := 13;
    G_SDRAM_BANK_WIDTH   : natural := 2;

    G_CAS_LATENCY        : natural := 2;

    G_BURST_LENGTH       : natural := 1;

    G_WRITE_BURST_MODE   : std_logic := '0';

    G_T_DESL             : real := 200000.0;
    G_T_MRD              : real := 15.0;
    G_T_RC               : real := 60.0;
    G_T_RCD              : real := 15.0;
    G_T_RP               : real := 15.0;
    G_T_WR               : real := 15.0;
    G_T_REFI             : real := 7812.5;
    -- 7812.5
    -- 1953.0
    G_USE_AUTO_PRECHARGE : std_logic := '0'
  );
  port (
    I_RESET_N           : in    std_logic := '1';
    I_CLOCK             : in    std_logic;
    I_ADDRESS           : in    unsigned(G_ADDR_WIDTH - 1 downto 0);
    I_DATA              : in    std_logic_vector(G_SDRAM_DATA_WIDTH - 1 downto 0);
    I_WRITE_ENABLE      : in    std_logic;
    I_REQUEST           : in    std_logic;
    O_ACKNOWLEDGE       : out   std_logic;
    O_VALID             : out   std_logic;
    O_Q                 : out   std_logic_vector(G_SDRAM_DATA_WIDTH - 1 downto 0);
    O_SDRAM_A           : out   unsigned(G_SDRAM_ADDR_WIDTH - 1 downto 0);
    O_SDRAM_BA          : out   unsigned(G_SDRAM_BANK_WIDTH - 1 downto 0);
    IO_SDRAM_DQ         : inout std_logic_vector(G_SDRAM_DATA_WIDTH - 1 downto 0);
    O_SDRAM_CKE         : out   std_logic;
    O_SDRAM_CS          : out   std_logic;
    O_SDRAM_RAS         : out   std_logic;
    O_SDRAM_CAS         : out   std_logic;
    O_SDRAM_WE          : out   std_logic;
    O_SDRAM_DQML        : out   std_logic;
    O_SDRAM_DQMH        : out   std_logic;
    O_SDRAM_INITIALIZED : out   std_logic
  );
end component sdram_controller;

component VGA_FIFO is
  port (
    DATA    : in    std_logic_vector(23 downto 0);
    RDCLK   : in    std_logic;
    RDREQ   : in    std_logic;
    WRCLK   : in    std_logic;
    WRREQ   : in    std_logic;
    Q       : out   std_logic_vector(23 downto 0);
    RDEMPTY : out   std_logic;
    WRFULL  : out   std_logic;
    WRUSEDW : out   std_logic_vector(12 downto 0);
    RDUSEDW : out   std_logic_vector(12 downto 0);
    ACLR    : in    std_logic
  );
end component vga_fifo;

component SDRAM_FIFO is
  port (
    DATA    : in    std_logic_vector(23 downto 0);
    RDCLK   : in    std_logic;
    RDREQ   : in    std_logic;
    WRCLK   : in    std_logic;
    WRREQ   : in    std_logic;
    Q       : out   std_logic_vector(23 downto 0);
    RDEMPTY : out   std_logic;
    WRFULL  : out   std_logic;
    WRUSEDW : out   std_logic_vector(12 downto 0);
    RDUSEDW : out   std_logic_vector(12 downto 0);
    ACLR    : in    std_logic
  );
end component sdram_fifo;

component VGA_PUFFER is
  port (
    DATA    : in    std_logic_vector(11 downto 0);
    RDCLK   : in    std_logic;
    RDREQ   : in    std_logic;
    WRCLK   : in    std_logic;
    WRREQ   : in    std_logic;
    Q       : out   std_logic_vector(11 downto 0);
    RDEMPTY : out   std_logic;
    WRFULL  : out   std_logic;
    WRUSEDW : out   std_logic_vector(8 downto 0);
    RDUSEDW : out   std_logic_vector(8 downto 0)
  );
end component;

component VGA_CONTROLLER is
  generic (
    G_HORIZONTAL_DISPLAY : integer := c_image_width;
    G_VERTICAL_DISPLAY   : integer := c_image_height;
    G_PIXEL_WIDTH        : integer := 8;

    G_H_FRONT_PORCH_SIZE : integer := 16;
    G_H_BACK_PORCH_SIZE  : integer := 48;
    G_H_SYNC_SIZE        : integer := 96;

    G_V_BACK_PORCH_SIZE  : integer := 33;
    G_V_FRONT_PORCH_SIZE : integer := 10;
    G_V_SYNC_SIZE        : integer := 2
  );
  port (
    I_CLOCK       : in    std_logic;
    I_RESET_N     : in    std_logic;
    I_VGA_BLANK_N : in    std_logic;
    O_H_SYNC_N    : out   std_logic;
    O_V_SYNC_N    : out   std_logic;
    O_VALID_PIXEL : out   std_logic;
    I_RED         : in    std_logic_vector(G_PIXEL_WIDTH - 1 downto 0);
    I_GREEN       : in    std_logic_vector(G_PIXEL_WIDTH - 1 downto 0);
    I_BLUE        : in    std_logic_vector(G_PIXEL_WIDTH - 1 downto 0);
    O_RED         : out   std_logic_vector(G_PIXEL_WIDTH - 1 downto 0);
    O_GREEN       : out   std_logic_vector(G_PIXEL_WIDTH - 1 downto 0);
    O_BLUE        : out   std_logic_vector(G_PIXEL_WIDTH - 1 downto 0);
    O_VGA_SYNC_N  : out   std_logic;
    O_VGA_BLANK_N : out   std_logic
  );
end component vga_controller;

component KAMERA_CONTROLLER is
    generic(
      G_COLOR_BW : string := "GRAY";
		G_SHUTTER_WIDTH_LOWER : integer := 500
    );
  port (
    I_CAMERA_CLOCK                   : in    std_logic;
    I_I2C_CLOCK                      : in    std_logic;
    I_RESET_N                        : in    std_logic;

    ---------------- Kamera -----------------------------
    I_PIXEL_RAW                      : in    std_logic_vector(11 downto 0);
    I_PIXCLK                         : in    std_logic;
    I_STROBE                         : in    std_logic;
    I_LVAL                           : in    std_logic;
    I_FVAL                           : in    std_logic;

    IO_SDATA                         : inout std_logic;
    O_SCLK                           : out   std_logic;

    O_CAMERA_RESET_N                 : out   std_logic;
    O_TRIGGER                        : out   std_logic;

    ----------------- berechnete Pixel -------------------
    O_NEW_FRAME_STARTED              : out   std_logic;
    O_CALCULATED_PIXEL_REDUCED_WIDTH : out   std_logic_vector(23 downto 0);
    O_CALCULATED_PIXEL_FULL_WIDTH    : out   std_logic_vector(35 downto 0);
    O_CALCULATED_PIXEL_VALID         : out   std_logic
  );
end component kamera_controller;

begin

U0 : PLL
  port map (
    CLK_CLK            => I_CLOCK,
    RESET_RESET_N      => w_reset_n,
    CLK_SYSTEM_CLK     => w_clk_system,
    CLK_VGA_CLK        => w_clk_vga,
    CLK_SDRAM_CLK      => w_clk_sdram,
    CLK_I2C_CLK        => w_clk_i2c,
    CLK_I2C_DOUBLE_CLK => w_clk_i2c_double,
	 CLK_CAMERA_CLK => w_clk_camera
  );

U1 : VGA_FIFO
  port map (
    DATA    => w_vga_fifo_data_in,
    RDCLK   => w_clk_vga,
    RDREQ   => w_vga_fifo_rdreq,
    WRCLK   => w_clk_system,
    WRREQ   => w_vga_fifo_wrreq,
    Q       => w_vga_fifo_q,
    RDEMPTY => w_vga_fifo_rdempty,
    WRFULL  => w_vga_fifo_wrfull,
    WRUSEDW => w_vga_fifo_wrusedw,
    RDUSEDW => w_vga_fifo_rdusedw,
    ACLR    => w_vga_fifo_aclr
  );

U2 : VGA_CONTROLLER
  port map (
    I_CLOCK       => w_clk_vga,
    I_RESET_N     => w_vga_reset,
    I_RED         => w_vga_data_in(23 downto 16),
    I_GREEN       => w_vga_data_in(15 downto 8),
    I_BLUE        => w_vga_data_in(7 downto 0),
    I_VGA_BLANK_N => w_vga_blank_n,
    O_VALID_PIXEL => w_vga_ready,
    O_H_SYNC_N    => O_H_SYNC,
    O_V_SYNC_N    => O_V_SYNC,
    O_RED         => O_VGA_R,
    O_GREEN       => O_VGA_G,
    O_BLUE        => O_VGA_B,
    O_VGA_SYNC_N  => O_VGA_SYNC_N,
    O_VGA_BLANK_N => O_VGA_BLANK_N
  );

U3 : SDRAM_CONTROLLER
  port map (
    -- reset
    I_RESET_N           => w_reset_n,
    I_CLOCK             => w_clk_system,
    I_ADDRESS           => unsigned(w_sdram_addr),
    I_DATA              => w_sdram_writedata,
    I_WRITE_ENABLE      => not w_sdram_we_n,
    I_REQUEST           => w_sdram_req,
    O_ACKNOWLEDGE       => w_sdram_ack,
    O_VALID             => w_sdram_rdval,
    O_Q                 => w_sdram_readdata,
    O_SDRAM_A           => O_DRAM_ADDR,
    O_SDRAM_BA          => O_DRAM_BA,
    IO_SDRAM_DQ         => IO_DRAM_DQ,
    O_SDRAM_CKE         => O_DRAM_CKE,
    O_SDRAM_CS          => O_DRAM_CS_N,
    O_SDRAM_RAS         => O_DRAM_RAS_N,
    O_SDRAM_CAS         => O_DRAM_CAS_N,
    O_SDRAM_WE          => O_DRAM_WE_N,
    O_SDRAM_DQML        => w_dqml,
    O_SDRAM_DQMH        => w_dqmh,
    O_SDRAM_INITIALIZED => w_sdram_initialized
  );

SDRAM_FIFO_RIGHT : SDRAM_FIFO
  port map (
    DATA    => w_sdram_fifo_right_data_in,
    RDCLK   => w_clk_system,
    RDREQ   => w_sdram_fifo_right_rdreq,
    WRCLK   => w_clk_camera,
    WRREQ   => w_sdram_fifo_right_wrreq,
    Q       => w_sdram_fifo_right_q,
    RDEMPTY => w_sdram_fifo_right_rdempty,
    WRFULL  => w_sdram_fifo_right_wrfull,
    WRUSEDW => w_sdram_fifo_right_wrusedw,
    RDUSEDW => w_sdram_fifo_right_rdusedw,
    ACLR    => w_sdram_fifo_right_aclr
  );
  
  SDRAM_FIFO_LEFT : SDRAM_FIFO
  port map (
    DATA    => w_sdram_fifo_left_data_in,
    RDCLK   => w_clk_system,
    RDREQ   => w_sdram_fifo_left_rdreq,
    WRCLK   => w_clk_camera,
    WRREQ   => w_sdram_fifo_left_wrreq,
    Q       => w_sdram_fifo_left_q,
    RDEMPTY => w_sdram_fifo_left_rdempty,
    WRFULL  => w_sdram_fifo_left_wrfull,
    WRUSEDW => w_sdram_fifo_left_wrusedw,
    RDUSEDW => w_sdram_fifo_left_rdusedw,
    ACLR    => w_sdram_fifo_left_aclr
  );

  COMP_CAMERA_LEFT : KAMERA_CONTROLLER
    port map (
      I_CAMERA_CLOCK => w_clk_camera,
      I_I2C_CLOCK    => w_clk_i2c,
      I_RESET_N      => w_reset_n,

      I_PIXCLK    => w_left_camera_pixclk,
      I_PIXEL_RAW => w_left_camera_out_raw,
      I_STROBE    => w_left_camera_strobe,
      I_LVAL      => w_left_camera_lval,
      I_FVAL      => w_left_camera_fval,

      O_SCLK   => O_GPIO_24,
      IO_SDATA => O_GPIO_23,

      O_CAMERA_RESET_N => w_left_camera_reset_n,
      O_TRIGGER        => w_left_camera_trigger,

      O_NEW_FRAME_STARTED              => w_left_new_frame_started,
      O_CALCULATED_PIXEL_REDUCED_WIDTH => w_left_camera_pixel_out_reduced_width,
      O_CALCULATED_PIXEL_FULL_WIDTH    => open,
      O_CALCULATED_PIXEL_VALID         => w_left_camera_pixel_valid
    );

  COMP_CAMERA_RIGHT : KAMERA_CONTROLLER
    port map (
      I_CAMERA_CLOCK => w_clk_camera,
      I_I2C_CLOCK    => w_clk_i2c,
      I_RESET_N      => w_reset_n,

      I_PIXCLK    => w_right_camera_pixclk,
      I_PIXEL_RAW => w_right_camera_out_raw,
      I_STROBE    => w_right_camera_strobe,
      I_LVAL      => w_right_camera_lval,
      I_FVAL      => w_right_camera_fval,

      O_SCLK   => O_HSMC_J3_24,
      IO_SDATA => IO_HSMC_J3_23,

      O_CAMERA_RESET_N => w_right_camera_reset_n,
      O_TRIGGER        => w_right_camera_trigger,

      O_NEW_FRAME_STARTED              => w_right_new_frame_started,
      O_CALCULATED_PIXEL_REDUCED_WIDTH => w_right_camera_pixel_out_reduced_width,
      O_CALCULATED_PIXEL_FULL_WIDTH    => open,
      O_CALCULATED_PIXEL_VALID         => w_right_camera_pixel_valid
    );

---------------------
-- Fill sdram fifo --
---------------------

w_sdram_fifo_left_data_in <= "00000000" & "00000000" & w_left_camera_pixel_out_reduced_width(7 downto 0);
w_sdram_fifo_right_data_in <= "00000000" & "00000000" & w_right_camera_pixel_out_reduced_width(7 downto 0);

--------------------------------------------
-- read/write state machine and registers --
--------------------------------------------

PROC_STATE_OUT : process (r_current_state, r_ram_write_pointer, w_continous_write, r_left_new_frame_started, w_left_input_image_valid, w_sdram_fifo_left_rdempty, w_sdram_fifo_left_rdempty, w_sdram_ack, w_vga_fifo_wrusedw) is

begin

  case r_current_state is

    when flush_fifos =>

      w_next_state <= wait_for_new_frame_left;

      w_sdram_addr       <= std_logic_vector(to_unsigned(r_ram_write_pointer, w_sdram_addr'length));
      w_sdram_we_n       <= '0';
      w_vga_reset        <= '0';
      w_sdram_req        <= '0';
      w_vga_fifo_aclr    <= '1';
      w_sdram_fifo_left_aclr  <= '1';
      w_sdram_fifo_left_wrreq <= '0';
      w_sdram_fifo_left_rdreq <= '0';
		w_sdram_fifo_right_aclr  <= '1';
      w_sdram_fifo_right_wrreq <= '0';
      w_sdram_fifo_right_rdreq <= '0';

      when wait_for_new_frame_left =>

      if (w_left_new_frame_started = '1' and w_sdram_initialized = '1') then
        w_next_state <= write_left;
      else
        w_next_state <= wait_for_new_frame_left;
      end if;

      w_sdram_addr         <= std_logic_vector(to_unsigned(r_ram_write_pointer, w_sdram_addr'length));
      w_sdram_we_n         <= '0';
      w_sdram_req          <= '0';
      w_sdram_fifo_aclr    <= '0';
      w_sdram_fifo_wrreq   <= '0';
      w_sdram_fifo_rdreq   <= '0';
      w_sdram_fifo_data_in <= (others => '0');
      w_sdram_writedata    <= "000000000000000000000000" & w_sdram_fifo_q;
      w_vga_reset          <= '0';
      w_vga_fifo_aclr      <= '1';

    when write_left =>

      if (r_ram_write_pointer = c_max_rgb_count - 1 and w_sdram_ack = '1') then
        w_next_state <= wait_for_new_frame_right;
      else
        w_next_state <= write_left;
      end if;

      w_sdram_addr         <= std_logic_vector(to_unsigned(r_ram_write_pointer, w_sdram_addr'length));
      w_sdram_we_n         <= '0';
      w_sdram_fifo_aclr    <= '0';
      w_sdram_fifo_data_in <= w_left_camera_pixel_out_reduced_width(7 downto 0);
      w_sdram_writedata    <= "000000000000000000000000" & w_sdram_fifo_q;
      w_vga_reset          <= '0';
      w_vga_fifo_aclr      <= '1';

      if (w_left_input_image_valid = '1') then
        w_sdram_fifo_wrreq <= '1';
      else
        w_sdram_fifo_wrreq <= '0';
      end if;

      if (w_sdram_fifo_rdempty = '0') then
        w_sdram_req <= '1';
      else
        w_sdram_req <= '0';
      end if;

      if (w_sdram_ack = '1') then
        w_sdram_fifo_rdreq <= '1';
      else
        w_sdram_fifo_rdreq <= '0';
      end if;

    when wait_for_new_frame_right =>

      if (w_right_new_frame_started = '1' and w_sdram_initialized = '1') then
        w_next_state <= write_right;
      else
        w_next_state <= wait_for_new_frame_right;
      end if;

      w_sdram_addr         <= std_logic_vector(to_unsigned(r_ram_write_pointer + c_image_2_offset, w_sdram_addr'length));
      w_sdram_we_n         <= '0';
      w_sdram_req          <= '0';
      w_sdram_fifo_aclr    <= '0';
      w_sdram_fifo_wrreq   <= '0';
      w_sdram_fifo_rdreq   <= '0';
      w_sdram_fifo_data_in <= (others => '0');
      w_sdram_writedata    <= "000000000000000000000000" & w_sdram_fifo_q;
      w_vga_reset          <= '0';
      w_vga_fifo_aclr      <= '1';

    when write_right =>

      if (r_ram_write_pointer = c_max_rgb_count - 1 and w_sdram_ack = '1') then
        w_next_state <= RECTIFICATION_LOAD_OLD_COORDINATE;
      else
        w_next_state <= write_right;
      end if;

      w_sdram_addr         <= std_logic_vector(to_unsigned(r_ram_write_pointer + c_image_2_offset, w_sdram_addr'length));
      w_sdram_we_n         <= '0';
      w_sdram_fifo_aclr    <= '0';
      w_sdram_fifo_data_in <= w_right_camera_pixel_out_reduced_width(7 downto 0);
      w_sdram_writedata    <= "000000000000000000000000" & w_sdram_fifo_q;
      w_vga_reset          <= '0';
      w_vga_fifo_aclr      <= '1';

      if (w_right_input_image_valid = '1') then
        w_sdram_fifo_wrreq <= '1';
      else
        w_sdram_fifo_wrreq <= '0';
      end if;

      if (w_sdram_fifo_rdempty = '0') then
        w_sdram_req <= '1';
      else
        w_sdram_req <= '0';
      end if;

      if (w_sdram_ack = '1') then
        w_sdram_fifo_rdreq <= '1';
      else
        w_sdram_fifo_rdreq <= '0';
      end if;

    when read =>

      w_next_state <= read;

      w_sdram_addr       <= std_logic_vector(to_unsigned(r_ram_read_pointer + c_image_2_offset, w_sdram_addr'length));
      w_sdram_we_n       <= '1';
      w_vga_reset        <= '1';
      w_vga_fifo_aclr    <= '0';
      w_sdram_fifo_left_aclr  <= '0';
      w_sdram_fifo_left_wrreq <= '0';
      w_sdram_fifo_left_rdreq <= '0';
		w_sdram_fifo_right_aclr  <= '0';
      w_sdram_fifo_right_wrreq <= '0';
      w_sdram_fifo_right_rdreq <= '0';

      if (to_integer(unsigned(w_vga_fifo_wrusedw)) < 240) then
        w_sdram_req <= '1';
      else
        w_sdram_req <= '0';
      end if;

  end case;

end process PROC_STATE_OUT;

PROC_STATE_FF : process (w_reset_n, w_clk_system) is
begin

  if (w_reset_n = '0' ) then
    r_current_state <= flush_fifos;
  elsif (rising_edge(w_clk_system)) then
	  if(w_take_picture = '0') then
			r_current_state <= flush_fifos;
		else
			r_current_state <= w_next_state;
		end if;
  end if;

end process PROC_STATE_FF;

PROC_WRITE_POINTER_COUNTER : process (r_current_state, w_reset_n, w_clk_system) is
begin

  if (w_reset_n = '0') then
    r_ram_write_pointer <= 0;
  elsif (rising_edge(w_clk_system)) then
    if (r_current_state = write and w_sdram_ack = '1') then
      if (r_ram_write_pointer < c_max_rgb_count) then
        r_ram_write_pointer <= r_ram_write_pointer + 1;
      else
        r_ram_write_pointer <= 0;
      end if;
	 elsif(r_current_state = read) then
			r_ram_write_pointer <= 0;
    end if;
  end if;

end process PROC_WRITE_POINTER_COUNTER;

PROC_READ_POINTER_COUNTER : process (w_reset_n, w_clk_system, r_current_state) is
begin

  if (w_reset_n = '0') then
    r_ram_read_pointer <= 0;
  elsif (rising_edge(w_clk_system)) then
    if (r_current_state = read and w_sdram_ack = '1') then
			if (r_ram_read_pointer < c_max_rgb_count - 1) then
			  r_ram_read_pointer <= r_ram_read_pointer + 1;
			else
			  r_ram_read_pointer <= 0;
			end if;
	 elsif(r_current_state = write) then
		r_ram_read_pointer <= 0;
    end if;
  end if;

end process PROC_READ_POINTER_COUNTER;

-- Because there is a possible offset between the read pointer and the actual amount of
-- values written to the fifo we have to count it seperately.
PROC_VGA_FIFO_WRITE_COUNTER : process (w_reset_n, w_clk_system) is
begin

  if (w_reset_n = '0') then
    r_values_written_to_fifo <= 0;
  elsif (rising_edge(w_clk_system)) then
    if (w_vga_fifo_wrreq = '1' and r_values_written_to_fifo < c_max_rgb_count - 1) then
      r_values_written_to_fifo <= r_values_written_to_fifo + 1;
    elsif (r_values_written_to_fifo = c_max_rgb_count - 1 and w_sdram_rdval = '0') then
      r_values_written_to_fifo <= 0;
    end if;
  end if;

end process PROC_VGA_FIFO_WRITE_COUNTER;

-----------------
-- vga & fifo control --
-----------------

proc_capture_ram_out : process (w_reset_n, w_clk_system) is
begin

  if (w_reset_n = '0') then
    w_vga_fifo_data_in <= (others => '0');
    w_vga_fifo_wrreq   <= '0';
    -- capture ram output on falling flag to prevent unstable signal
  elsif (falling_edge(w_clk_system)) then
  if(I_SLIDE_SWITCH(17) = '0') then
		w_vga_fifo_data_in <= w_sdram_readdata(15 downto 8) & w_sdram_readdata(15 downto 8) & w_sdram_readdata(15 downto 8);
	 else
      w_vga_fifo_data_in <= w_sdram_readdata(7 downto 0) & w_sdram_readdata(7 downto 0) & w_sdram_readdata(7 downto 0);
	end if;

    if(w_sdram_rdval = '1' and r_values_written_to_fifo < c_max_rgb_count and r_current_state = read) then
      w_vga_fifo_wrreq <= '1';
    else
      w_vga_fifo_wrreq <= '0';
    end if;

  end if;

end process proc_capture_ram_out;

w_vga_fifo_rdreq <= '1' when w_vga_fifo_rdempty = '0' and w_vga_ready = '1' else
                    '0';
w_vga_data_in    <= w_vga_fifo_q(23 downto 0);

-------------------------------
-- process independent wires --
-------------------------------
w_sdram_writedata <= "0000000000000000" & w_sdram_fifo_left_q(7 downto 0) & w_sdram_fifo_right_q(7 downto 0);

w_left_input_image_valid <= '1' when w_left_camera_pixel_valid = '1' else
                       '0';
							  
w_right_input_image_valid <= '1' when w_right_camera_pixel_valid = '1' else
                       '0';

--------------------------------------------
--- Connect I/O with registers and wires ---
--------------------------------------------
O_LED_GREEN   <= (others => '0');
O_LED_RED     <= (others => '0');
O_7_SEGMENT_0 <= (others => '1');
O_7_SEGMENT_1 <= (others => '1');
O_7_SEGMENT_2 <= (others => '1');
O_7_SEGMENT_3 <= (others => '1');
O_7_SEGMENT_4 <= (others => '1');
O_7_SEGMENT_5 <= (others => '1');
O_7_SEGMENT_6 <= (others => '1');
O_7_SEGMENT_7 <= (others => '1');

w_continous_write <= I_SLIDE_SWITCH(0);
w_reset_n         <= I_BUTTON(0);
O_VGA_CLOCK       <= w_clk_vga;
O_DRAM_LDQM_1     <= w_dqml;
O_DRAM_UDQM_1     <= w_dqmh;

O_DRAM_LDQM_0 <= w_dqml;
O_DRAM_UDQM_0 <= w_dqmh;

O_DRAM_CLK <= w_clk_sdram;

w_vga_blank_n <= I_SLIDE_SWITCH(1);

-- w_camera_pixclk      <= I_GPIO_0;
-- w_camera_out_raw(11) <= I_GPIO_1;
-- -- 2 NC
-- w_camera_out_raw(10) <= I_GPIO_3;
-- w_camera_out_raw(9)  <= I_GPIO_4;
-- w_camera_out_raw(8)  <= I_GPIO_5;
-- w_camera_out_raw(7)  <= I_GPIO_6;
-- w_camera_out_raw(6)  <= I_GPIO_7;
-- w_camera_out_raw(5)  <= I_GPIO_8;
-- w_camera_out_raw(4)  <= I_GPIO_9;
-- w_camera_out_raw(3)  <= I_GPIO_10;
-- w_camera_out_raw(2)  <= I_GPIO_11;
-- w_camera_out_raw(1)  <= I_GPIO_12;
-- w_camera_out_raw(0)  <= I_GPIO_13;
-- -- 14 & 15 NC
-- O_GPIO_16 <= w_clk_system;
-- O_GPIO_17 <= w_camera_reset_n;
-- -- 18 NC
-- O_GPIO_19       <= w_camera_trigger;
-- w_camera_strobe <= I_GPIO_20;
-- w_camera_lval   <= I_GPIO_21;
-- w_camera_fval   <= I_GPIO_22;

  w_left_camera_pixclk      <= I_GPIO_0;
  w_left_camera_out_raw(11) <= I_GPIO_1;
  -- 2 NC
  w_left_camera_out_raw(10) <= I_GPIO_3;
  w_left_camera_out_raw(9)  <= I_GPIO_4;
  w_left_camera_out_raw(8)  <= I_GPIO_5;
  w_left_camera_out_raw(7)  <= I_GPIO_6;
  w_left_camera_out_raw(6)  <= I_GPIO_7;
  w_left_camera_out_raw(5)  <= I_GPIO_8;
  w_left_camera_out_raw(4)  <= I_GPIO_9;
  w_left_camera_out_raw(3)  <= I_GPIO_10;
  w_left_camera_out_raw(2)  <= I_GPIO_11;
  w_left_camera_out_raw(1)  <= I_GPIO_12;
  w_left_camera_out_raw(0)  <= I_GPIO_13;
  -- 14 & 15 NC
  O_GPIO_16 <= w_clk_camera;
  O_GPIO_17 <= w_left_camera_reset_n;
  -- 18 NC
  O_GPIO_19            <= w_left_camera_trigger;
  w_left_camera_strobe <= I_GPIO_20;
  w_left_camera_lval   <= I_GPIO_21;
  w_left_camera_fval   <= I_GPIO_22;

  w_right_camera_pixclk      <= I_HSMC_J3_0;
  w_right_camera_out_raw(11) <= I_HSMC_J3_1;
  -- 2 NC
  w_right_camera_out_raw(10) <= I_HSMC_J3_3;
  w_right_camera_out_raw(9)  <= I_HSMC_J3_4;
  w_right_camera_out_raw(8)  <= I_HSMC_J3_5;
  w_right_camera_out_raw(7)  <= I_HSMC_J3_6;
  w_right_camera_out_raw(6)  <= I_HSMC_J3_7;
  w_right_camera_out_raw(5)  <= I_HSMC_J3_8;
  w_right_camera_out_raw(4)  <= I_HSMC_J3_9;
  w_right_camera_out_raw(3)  <= I_HSMC_J3_10;
  w_right_camera_out_raw(2)  <= I_HSMC_J3_11;
  w_right_camera_out_raw(1)  <= I_HSMC_J3_12;
  w_right_camera_out_raw(0)  <= I_HSMC_J3_13;
  -- 14 & 15 NC
  O_HSMC_J3_16 <= w_clk_camera;
  O_HSMC_J3_17 <= w_right_camera_reset_n;
  -- 18 NC
  O_HSMC_J3_19          <= w_right_camera_trigger;
  w_right_camera_strobe <= I_HSMC_J3_20;
  w_right_camera_lval   <= I_HSMC_J3_21;
  w_right_camera_fval   <= I_HSMC_J3_22;

  -- w_camera_pixclk      <= I_HSMC_J2_0;
  -- w_camera_out_raw(11) <= I_HSMC_J2_1;
  -- -- 2 NC
  -- w_camera_out_raw(10) <= I_HSMC_J2_3;
  -- w_camera_out_raw(9)  <= I_HSMC_J2_4;
  -- w_camera_out_raw(8)  <= I_HSMC_J2_5;
  -- w_camera_out_raw(7)  <= I_HSMC_J2_6;
  -- w_camera_out_raw(6)  <= I_HSMC_J2_7;
  -- w_camera_out_raw(5)  <= I_HSMC_J2_8;
  -- w_camera_out_raw(4)  <= I_HSMC_J2_9;
  -- w_camera_out_raw(3)  <= I_HSMC_J2_10;
  -- w_camera_out_raw(2)  <= I_HSMC_J2_11;
  -- w_camera_out_raw(1)  <= I_HSMC_J2_12;
  -- w_camera_out_raw(0)  <= I_HSMC_J2_13;
  -- -- 14 & 15 NC
  -- O_HSMC_J2_16 <= w_clk_system;
  -- O_HSMC_J2_17 <= w_camera_reset_n;
  -- -- 18 NC
  -- O_HSMC_J2_19      <= w_camera_trigger;
  -- w_camera_strobe <= I_HSMC_J2_20;
  -- w_camera_lval   <= I_HSMC_J2_21;
  -- w_camera_fval   <= I_HSMC_J2_22;


w_take_picture <= I_BUTTON(3);
-- Rest NC

end architecture RTL;
