----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/14/2019 06:16:12 PM
-- Design Name: 
-- Module Name: Overall_MSGR - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Overall_MSGR is
    Port ( clk, run : in STD_LOGIC;
           Input : in STD_LOGIC_VECTOR (31 downto 0);
           Output : inout STD_LOGIC_VECTOR (31 downto 0);
           err : inout STD_LOGIC;
           done : out STD_LOGIC);
end Overall_MSGR;

architecture Behavioral of Overall_MSGR is

component MSGR is
    Port ( clk, reset, calc : in STD_LOGIC;
           in1 : in STD_LOGIC_VECTOR (32 downto 0);
           in2 : in STD_LOGIC_VECTOR (32 downto 0);
           in3 : in STD_LOGIC_VECTOR (32 downto 0);
           in4 : in STD_LOGIC_VECTOR (32 downto 0);
           out1 : inout STD_LOGIC_VECTOR (32 downto 0);
           out2 : inout STD_LOGIC_VECTOR (32 downto 0);
           out3 : inout STD_LOGIC_VECTOR (32 downto 0);
           out4 : inout STD_LOGIC_VECTOR (32 downto 0);
           err : inout STD_LOGIC);
end component;

component IAM is
    Port ( clk : in STD_LOGIC;
           in1 : in STD_LOGIC_VECTOR (32 downto 0);
           in2 : in STD_LOGIC_VECTOR (32 downto 0);
           in3 : in STD_LOGIC_VECTOR (32 downto 0);
           in4 : in STD_LOGIC_VECTOR (32 downto 0);
           out1 : inout STD_LOGIC_VECTOR (31 downto 0);
           out2 : inout STD_LOGIC_VECTOR (31 downto 0);
           out3 : inout STD_LOGIC_VECTOR (31 downto 0);
           out4 : inout STD_LOGIC_VECTOR (31 downto 0);
           err : out STD_LOGIC);
end component;

component reg is 
generic ( bits: integer := 4); 
port ( clk, E: IN STD_LOGIC;
		 D: IN STD_LOGIC_VECTOR(bits-1 downto 0);
		 Q: INOUT STD_LOGIC_VECTOR(bits-1 downto 0));
end component;


COMPONENT Counter_6
  PORT (
    CLK : IN STD_LOGIC;
    CE : IN STD_LOGIC;
    SCLR: IN STD_LOGIC;
    THRESH0 : OUT STD_LOGIC;
    Q : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
  );
END COMPONENT;

COMPONENT Counter_13
  PORT (
    CLK : IN STD_LOGIC;
    CE : IN STD_LOGIC;
    SCLR : IN STD_LOGIC;
    THRESH0 : OUT STD_LOGIC;
    Q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END COMPONENT;

type state_type is (INIT, 
                    TKIN1, TKIN2, TKIN3, TKIN4, TKIN5, TKIN6, TKIN7, TKIN8, TKIN9, TKIN10, TKIN11, TKIN12, TKIN13, TKIN14, TKIN15, TKIN16, 
                    SNDIN1, SNDIN2, SNDIN3, SNDIN4, SNDIN5, SNDIN6, SNDIN7, SNDIN8, SNDIN9, SNDIN10, SNDIN11,
                    CALC,
                    TKOUT1, TKOUT2, TKOUT3, TKOUT4, TKOUT5, TKOUT6, TKOUT7,
                    SNDOUT1, SNDOUT2, SNDOUT3, SNDOUT4, SNDOUT5, SNDOUT6, SNDOUT7, SNDOUT8, SNDOUT9, SNDOUT10, SNDOUT11, SNDOUT12, SNDOUT13, SNDOUT14, SNDOUT15, SNDOUT16);
signal state: state_type := INIT;

signal reset: STD_LOGIC := '0';

type IN_RAM is array (10 downto 0, 3 downto 0) of STD_LOGIC_VECTOR(32 downto 0);
signal matrix: IN_RAM;

signal calc_go: STD_LOGIC;
signal in1: STD_LOGIC_VECTOR(32 downto 0);
signal in2: STD_LOGIC_VECTOR(32 downto 0);
signal in3: STD_LOGIC_VECTOR(32 downto 0);
signal in4: STD_LOGIC_VECTOR(32 downto 0);
signal MSGR_IAM1: STD_LOGIC_VECTOR(32 downto 0);
signal MSGR_IAM2: STD_LOGIC_VECTOR(32 downto 0);
signal MSGR_IAM3: STD_LOGIC_VECTOR(32 downto 0);
signal MSGR_IAM4: STD_LOGIC_VECTOR(32 downto 0);
signal out1: STD_LOGIC_VECTOR(31 downto 0);
signal out2: STD_LOGIC_VECTOR(31 downto 0);
signal out3: STD_LOGIC_VECTOR(31 downto 0);
signal out4: STD_LOGIC_VECTOR(31 downto 0);

signal sndin_count_en: STD_LOGIC;
signal sndin_count_clr: STD_LOGIC;
signal sndin_count_thresh:STD_LOGIC;

signal calc_count_en: STD_LOGIC;
signal calc_count_clr: STD_LOGIC;
signal calc_count_thresh:STD_LOGIC;

signal tkout_count_en: STD_LOGIC;
signal tkout_count_clr: STD_LOGIC;
signal tkout_count_thresh:STD_LOGIC;

-- Input Matrix Registers
signal matrix_reg_en: STD_LOGIC_VECTOR(15 downto 0);
signal M00_reg_in: STD_LOGIC_VECTOR(32 downto 0);
signal M00_reg_out: STD_LOGIC_VECTOR(32 downto 0);
signal M10_reg_in: STD_LOGIC_VECTOR(32 downto 0);
signal M10_reg_out: STD_LOGIC_VECTOR(32 downto 0);
signal M20_reg_in: STD_LOGIC_VECTOR(32 downto 0);
signal M20_reg_out: STD_LOGIC_VECTOR(32 downto 0);
signal M30_reg_in: STD_LOGIC_VECTOR(32 downto 0);
signal M30_reg_out: STD_LOGIC_VECTOR(32 downto 0);
signal M11_reg_in: STD_LOGIC_VECTOR(32 downto 0);
signal M11_reg_out: STD_LOGIC_VECTOR(32 downto 0);
signal M21_reg_in: STD_LOGIC_VECTOR(32 downto 0);
signal M21_reg_out: STD_LOGIC_VECTOR(32 downto 0);
signal M31_reg_in: STD_LOGIC_VECTOR(32 downto 0);
signal M31_reg_out: STD_LOGIC_VECTOR(32 downto 0);
signal M41_reg_in: STD_LOGIC_VECTOR(32 downto 0);
signal M41_reg_out: STD_LOGIC_VECTOR(32 downto 0);
signal M22_reg_in: STD_LOGIC_VECTOR(32 downto 0);
signal M22_reg_out: STD_LOGIC_VECTOR(32 downto 0);
signal M32_reg_in: STD_LOGIC_VECTOR(32 downto 0);
signal M32_reg_out: STD_LOGIC_VECTOR(32 downto 0);
signal M42_reg_in: STD_LOGIC_VECTOR(32 downto 0);
signal M42_reg_out: STD_LOGIC_VECTOR(32 downto 0);
signal M52_reg_in: STD_LOGIC_VECTOR(32 downto 0);
signal M52_reg_out: STD_LOGIC_VECTOR(32 downto 0);
signal M33_reg_in: STD_LOGIC_VECTOR(32 downto 0);
signal M33_reg_out: STD_LOGIC_VECTOR(32 downto 0);
signal M43_reg_in: STD_LOGIC_VECTOR(32 downto 0);
signal M43_reg_out: STD_LOGIC_VECTOR(32 downto 0);
signal M53_reg_in: STD_LOGIC_VECTOR(32 downto 0);
signal M53_reg_out: STD_LOGIC_VECTOR(32 downto 0);
signal M63_reg_in: STD_LOGIC_VECTOR(32 downto 0);
signal M63_reg_out: STD_LOGIC_VECTOR(32 downto 0);

-- Output Matrix Registers
signal inv_matrix_reg_en: STD_LOGIC_VECTOR(15 downto 0);
signal IM00_reg_in: STD_LOGIC_VECTOR(31 downto 0);
signal IM00_reg_out: STD_LOGIC_VECTOR(31 downto 0);
signal IM10_reg_in: STD_LOGIC_VECTOR(31 downto 0);
signal IM10_reg_out: STD_LOGIC_VECTOR(31 downto 0);
signal IM20_reg_in: STD_LOGIC_VECTOR(31 downto 0);
signal IM20_reg_out: STD_LOGIC_VECTOR(31 downto 0);
signal IM30_reg_in: STD_LOGIC_VECTOR(31 downto 0);
signal IM30_reg_out: STD_LOGIC_VECTOR(31 downto 0);
signal IM01_reg_in: STD_LOGIC_VECTOR(31 downto 0);
signal IM01_reg_out: STD_LOGIC_VECTOR(31 downto 0);
signal IM11_reg_in: STD_LOGIC_VECTOR(31 downto 0);
signal IM11_reg_out: STD_LOGIC_VECTOR(31 downto 0);
signal IM21_reg_in: STD_LOGIC_VECTOR(31 downto 0);
signal IM21_reg_out: STD_LOGIC_VECTOR(31 downto 0);
signal IM31_reg_in: STD_LOGIC_VECTOR(31 downto 0);
signal IM31_reg_out: STD_LOGIC_VECTOR(31 downto 0);
signal IM02_reg_in: STD_LOGIC_VECTOR(31 downto 0);
signal IM02_reg_out: STD_LOGIC_VECTOR(31 downto 0);
signal IM12_reg_in: STD_LOGIC_VECTOR(31 downto 0);
signal IM12_reg_out: STD_LOGIC_VECTOR(31 downto 0);
signal IM22_reg_in: STD_LOGIC_VECTOR(31 downto 0);
signal IM22_reg_out: STD_LOGIC_VECTOR(31 downto 0);
signal IM32_reg_in: STD_LOGIC_VECTOR(31 downto 0);
signal IM32_reg_out: STD_LOGIC_VECTOR(31 downto 0);
signal IM03_reg_in: STD_LOGIC_VECTOR(31 downto 0);
signal IM03_reg_out: STD_LOGIC_VECTOR(31 downto 0);
signal IM13_reg_in: STD_LOGIC_VECTOR(31 downto 0);
signal IM13_reg_out: STD_LOGIC_VECTOR(31 downto 0);
signal IM23_reg_in: STD_LOGIC_VECTOR(31 downto 0);
signal IM23_reg_out: STD_LOGIC_VECTOR(31 downto 0);
signal IM33_reg_in: STD_LOGIC_VECTOR(31 downto 0);
signal IM33_reg_out: STD_LOGIC_VECTOR(31 downto 0);
signal error: STD_LOGIC_VECTOR(1 downto 0);


begin
matrix(0,0) <= M00_reg_out;
matrix(1,0) <= M10_reg_out;
matrix(2,0) <= M20_reg_out;
matrix(3,0) <= M30_reg_out;
matrix(4,0) <= '0' & x"3f800000";
matrix(5,0) <= '0' & x"00000000";
matrix(6,0) <= '0' & x"00000000";
matrix(7,0) <= '0' & x"00000000";
matrix(8,0) <= '0' & x"00000000";
matrix(9,0) <= '0' & x"00000000";
matrix(10,0) <= '0' & x"00000000";
matrix(0,1) <= '0' & x"00000000";
matrix(1,1) <= M11_reg_out;
matrix(2,1) <= M21_reg_out;
matrix(3,1) <= M31_reg_out;
matrix(4,1) <= M41_reg_out;
matrix(5,1) <= '0' & x"00000000";
matrix(6,1) <= '0' & x"3f800000";
matrix(7,1) <= '0' & x"00000000";
matrix(8,1) <= '0' & x"00000000";
matrix(9,1) <= '0' & x"00000000";
matrix(10,1) <= '0' & x"00000000";
matrix(0,2) <= '0' & x"00000000";
matrix(1,2) <= '0' & x"00000000";
matrix(2,2) <= M22_reg_out;
matrix(3,2) <= M32_reg_out;
matrix(4,2) <= M42_reg_out;
matrix(5,2) <= M52_reg_out;
matrix(6,2) <= '0' & x"00000000";
matrix(7,2) <= '0' & x"00000000";
matrix(8,2) <= '0' & x"3f800000";
matrix(9,2) <= '0' & x"00000000";
matrix(10,2) <= '0' & x"00000000";
matrix(0,3) <= '0' & x"00000000";
matrix(1,3) <= '0' & x"00000000";
matrix(2,3) <= '0' & x"00000000";
matrix(3,3) <= M33_reg_out;
matrix(4,3) <= M43_reg_out;
matrix(5,3) <= M53_reg_out;
matrix(6,3) <= M63_reg_out;
matrix(7,3) <= '0' & x"00000000";
matrix(8,3) <= '0' & x"00000000";
matrix(9,3) <= '0' & x"00000000";
matrix(10,3) <= '0' & x"3f800000";


M00_Reg: reg
GENERIC MAP ( bits => 33) 
   PORT MAP (
    clk => clk,
    E => matrix_reg_en(0),
    D => M00_reg_in,
    Q => M00_reg_out);
    
M10_Reg: reg
GENERIC MAP ( bits => 33) 
   PORT MAP (
    clk => clk,
    E => matrix_reg_en(1),
    D => M10_reg_in,
    Q => M10_reg_out);
    
M20_Reg: reg
GENERIC MAP ( bits => 33) 
   PORT MAP (
    clk => clk,
    E => matrix_reg_en(2),
    D => M20_reg_in,
    Q => M20_reg_out);

M30_Reg: reg
GENERIC MAP ( bits => 33) 
   PORT MAP (
    clk => clk,
    E => matrix_reg_en(3),
    D => M30_reg_in,
    Q => M30_reg_out);
        
M11_Reg: reg
GENERIC MAP ( bits => 33) 
   PORT MAP (
    clk => clk,
    E => matrix_reg_en(4),
    D => M11_reg_in,
    Q => M11_reg_out);

M21_Reg: reg
GENERIC MAP ( bits => 33) 
   PORT MAP (
    clk => clk,
    E => matrix_reg_en(5),
    D => M21_reg_in,
    Q => M21_reg_out);
    
M31_Reg: reg
GENERIC MAP ( bits => 33) 
   PORT MAP (
    clk => clk,
    E => matrix_reg_en(6),
    D => M31_reg_in,
    Q => M31_reg_out);
    
M41_Reg: reg
GENERIC MAP ( bits => 33) 
   PORT MAP (
    clk => clk,
    E => matrix_reg_en(7),
    D => M41_reg_in,
    Q => M41_reg_out);
    
M22_Reg: reg
GENERIC MAP ( bits => 33) 
   PORT MAP (
    clk => clk,
    E => matrix_reg_en(8),
    D => M22_reg_in,
    Q => M22_reg_out);
   
M32_Reg: reg
GENERIC MAP ( bits => 33) 
   PORT MAP (
    clk => clk,
    E => matrix_reg_en(9),
    D => M32_reg_in,
    Q => M32_reg_out);
    
M42_Reg: reg
GENERIC MAP ( bits => 33) 
   PORT MAP (
    clk => clk,
    E => matrix_reg_en(10),
    D => M42_reg_in,
    Q => M42_reg_out);
    
M52_Reg: reg
GENERIC MAP ( bits => 33) 
   PORT MAP (
    clk => clk,
    E => matrix_reg_en(11),
    D => M52_reg_in,
    Q => M52_reg_out);

M33_Reg: reg
GENERIC MAP ( bits => 33) 
   PORT MAP (
    clk => clk,
    E => matrix_reg_en(12),
    D => M33_reg_in,
    Q => M33_reg_out);
   
M43_Reg: reg
GENERIC MAP ( bits => 33) 
   PORT MAP (
    clk => clk,
    E => matrix_reg_en(13),
    D => M43_reg_in,
    Q => M43_reg_out);
    
M53_Reg: reg
GENERIC MAP ( bits => 33) 
   PORT MAP (
    clk => clk,
    E => matrix_reg_en(14),
    D => M53_reg_in,
    Q => M53_reg_out);
    
M63_Reg: reg
GENERIC MAP ( bits => 33) 
   PORT MAP (
    clk => clk,
    E => matrix_reg_en(15),
    D => M63_reg_in,
    Q => M63_reg_out);
    
IM00_Reg: reg
GENERIC MAP ( bits => 32) 
   PORT MAP (
    clk => clk,
    E => inv_matrix_reg_en(0),
    D => IM00_reg_in,
    Q => IM00_reg_out);

IM01_Reg: reg
GENERIC MAP ( bits => 32) 
   PORT MAP (
    clk => clk,
    E => inv_matrix_reg_en(1),
    D => IM01_reg_in,
    Q => IM01_reg_out);
    
IM02_Reg: reg
GENERIC MAP ( bits => 32) 
   PORT MAP (
    clk => clk,
    E => inv_matrix_reg_en(2),
    D => IM02_reg_in,
    Q => IM02_reg_out);
    
IM03_Reg: reg
GENERIC MAP ( bits => 32) 
   PORT MAP (
    clk => clk,
    E => inv_matrix_reg_en(3),
    D => IM03_reg_in,
    Q => IM03_reg_out);

IM10_Reg: reg
GENERIC MAP ( bits => 32) 
   PORT MAP (
    clk => clk,
    E => inv_matrix_reg_en(4),
    D => IM10_reg_in,
    Q => IM10_reg_out);
    
IM11_Reg: reg
GENERIC MAP ( bits => 32) 
   PORT MAP (
    clk => clk,
    E => inv_matrix_reg_en(5),
    D => IM11_reg_in,
    Q => IM11_reg_out);
    
IM12_Reg: reg
GENERIC MAP ( bits => 32) 
   PORT MAP (
    clk => clk,
    E => inv_matrix_reg_en(6),
    D => IM12_reg_in,
    Q => IM12_reg_out);
  
IM13_Reg: reg
GENERIC MAP ( bits => 32) 
   PORT MAP (
    clk => clk,
    E => inv_matrix_reg_en(7),
    D => IM13_reg_in,
    Q => IM13_reg_out);

IM20_Reg: reg
GENERIC MAP ( bits => 32) 
   PORT MAP (
    clk => clk,
    E => inv_matrix_reg_en(8),
    D => IM20_reg_in,
    Q => IM20_reg_out);
    
IM21_Reg: reg
GENERIC MAP ( bits => 32) 
   PORT MAP (
    clk => clk,
    E => inv_matrix_reg_en(9),
    D => IM21_reg_in,
    Q => IM21_reg_out);
    
IM22_Reg: reg
GENERIC MAP ( bits => 32) 
   PORT MAP (
    clk => clk,
    E => inv_matrix_reg_en(10),
    D => IM22_reg_in,
    Q => IM22_reg_out);
    
IM23_Reg: reg
GENERIC MAP ( bits => 32) 
   PORT MAP (
    clk => clk,
    E => inv_matrix_reg_en(11),
    D => IM23_reg_in,
    Q => IM23_reg_out);
    
IM30_Reg: reg
GENERIC MAP ( bits => 32) 
   PORT MAP (
    clk => clk,
    E => inv_matrix_reg_en(12),
    D => IM30_reg_in,
    Q => IM30_reg_out);
    
IM31_Reg: reg
GENERIC MAP ( bits => 32) 
   PORT MAP (
    clk => clk,
    E => inv_matrix_reg_en(13),
    D => IM31_reg_in,
    Q => IM31_reg_out); 
    
IM32_Reg: reg
GENERIC MAP ( bits => 32) 
   PORT MAP (
    clk => clk,
    E => inv_matrix_reg_en(14),
    D => IM32_reg_in,
    Q => IM32_reg_out);
    
IM33_Reg: reg
GENERIC MAP ( bits => 32) 
   PORT MAP (
    clk => clk,
    E => inv_matrix_reg_en(15),
    D => IM33_reg_in,
    Q => IM33_reg_out);     
    
SNDIN_COUNTER: Counter_6
  PORT MAP (
    CLK => CLK,
    CE => sndin_count_en,
    SCLR => sndin_count_clr,
    THRESH0 => sndin_count_thresh,
    Q => OPEN
  );
  
CALC_COUNTER: Counter_13
  PORT MAP (
    CLK => CLK,
    CE => calc_count_en,
    SCLR => calc_count_clr,
    THRESH0 => calc_count_thresh,
    Q => OPEN
  );
  
TKOUT_COUNTER : Counter_6
  PORT MAP (
    CLK => CLK,
    CE => tkout_count_en,
    SCLR => tkout_count_clr,
    THRESH0 => tkout_count_thresh,
    Q => OPEN
  );
  
CALC_MSGR: MSGR
    port map ( clk => clk,
                reset => reset,
                calc => calc_go,
                in1 => in1,
                in2 => in2,
                in3 => in3,
                in4 => in4,
                out1 => MSGR_IAM1, 
                out2 => MSGR_IAM2,
                out3 => MSGR_IAM3,
                out4 => MSGR_IAM4,
                err => error(0));
                
CALC_IAM: IAM
    port map( clk => clk,
              in1 => MSGR_IAM1, 
              in2 => MSGR_IAM2, 
              in3 => MSGR_IAM3,
              in4 => MSGR_IAM4,
              out1 => out1,
              out2 => out2,
              out3 => out3,
              out4 => out4,
              err => error(1));
              
err <= error(0) or error(1);
process (clk) 
begin 
    if(clk'event and clk = '1') then
        case state is
            when INIT  => sndin_count_clr <= '1'; calc_count_clr <= '1'; tkout_count_clr <= '1';
                          if (run = '1') then
                            state <= TKIN1;
                          else 
                            state <= INIT;
                          end if;
            when TKIN1 => state <= TKIN2; sndin_count_clr <= '0'; calc_count_clr <= '0'; tkout_count_clr <= '0';
            when TKIN2 => state <= TKIN3;
            when TKIN3 => state <= TKIN4;
            when TKIN4 => state <= TKIN5;
            when TKIN5 => state <= TKIN6;
            when TKIN6 => state <= TKIN7;
            when TKIN7 => state <= TKIN8;
            when TKIN8 => state <= TKIN9;
            when TKIN9 => state <= TKIN10;
            when TKIN10 => state <= TKIN11;
            when TKIN11 => state <= TKIN12;
            when TKIN12 => state <= TKIN13;
            when TKIN13 => state <= TKIN14;
            when TKIN14 => state <= TKIN15;
            when TKIN15 => state <= TKIN16;
            when TKIN16 => state <= SNDIN1;
            when SNDIN1 => if (sndin_count_thresh = '1') then
                            state <= SNDIN2; sndin_count_clr <= '1';
                           else
                            state <= SNDIN1; sndin_count_clr <= '0';
                           end if;
            when SNDIN2 => if (sndin_count_thresh = '1') then
                            state <= SNDIN3; sndin_count_clr <= '1';
                           else
                            state <= SNDIN2; sndin_count_clr <= '0';
                           end if;
            when SNDIN3 => if (sndin_count_thresh = '1') then
                            state <= SNDIN4; sndin_count_clr <= '1';
                           else
                            state <= SNDIN3; sndin_count_clr <= '0';
                           end if;
            when SNDIN4 => if (sndin_count_thresh = '1') then
                            state <= SNDIN5; sndin_count_clr <= '1';
                           else
                            state <= SNDIN4; sndin_count_clr <= '0';
                           end if;
            when SNDIN5 => if (sndin_count_thresh = '1') then
                            state <= SNDIN6; sndin_count_clr <= '1';
                           else
                            state <= SNDIN5; sndin_count_clr <= '0';
                           end if;
            when SNDIN6 => if (sndin_count_thresh = '1') then
                            state <= SNDIN7; sndin_count_clr <= '1';
                           else
                            state <= SNDIN6; sndin_count_clr <= '0';
                           end if;
            when SNDIN7 => if (sndin_count_thresh = '1') then
                            state <= SNDIN8; sndin_count_clr <= '1';
                           else
                            state <= SNDIN7; sndin_count_clr <= '0';
                           end if;
            when SNDIN8 => if (sndin_count_thresh = '1') then
                            state <= SNDIN9; sndin_count_clr <= '1';
                           else
                            state <= SNDIN8; sndin_count_clr <= '0';
                           end if;
            when SNDIN9 => if (sndin_count_thresh = '1') then
                            state <= SNDIN10; sndin_count_clr <= '1';
                           else
                            state <= SNDIN9; sndin_count_clr <= '0';
                           end if;
            when SNDIN10 => if (sndin_count_thresh = '1') then
                            state <= SNDIN11; sndin_count_clr <= '1';
                           else
                            state <= SNDIN10; sndin_count_clr <= '0';
                           end if;
            when SNDIN11 => if (sndin_count_thresh = '1') then
                            state <= CALC; sndin_count_clr <= '1';
                           else
                            state <= SNDIN11; sndin_count_clr <= '0';
                           end if;            
            when CALC =>   sndin_count_clr <= '0';
                           if (calc_count_thresh = '1') then
                            state <= TKOUT1; calc_count_clr <= '1'; 
                           else
                            state <= CALC; calc_count_clr <= '0'; 
                           end if;
            when TKOUT1 => calc_count_clr <= '0'; 
                           if (tkout_count_thresh = '1') then
                            state <= TKOUT2; tkout_count_clr <= '1'; IM00_reg_in <= out1; inv_matrix_reg_en <= x"0001";
                           else
                            state <= TKOUT1; tkout_count_clr <= '0'; inv_matrix_reg_en <= x"0000";
                           end if;
            when TKOUT2 => if (tkout_count_thresh = '1') then
                            state <= TKOUT3; tkout_count_clr <= '1'; IM01_reg_in <= out1; IM10_reg_in <= out2; inv_matrix_reg_en <= x"0012";
                           else
                            state <= TKOUT2; tkout_count_clr <= '0'; inv_matrix_reg_en <= x"0000";
                           end if;
            when TKOUT3 => if (tkout_count_thresh = '1') then
                            state <= TKOUT4; tkout_count_clr <= '1'; IM02_reg_in <= out1; IM11_reg_in <= out2; IM20_reg_in <= out3; inv_matrix_reg_en <= x"0124";
                           else
                            state <= TKOUT3; tkout_count_clr <= '0'; inv_matrix_reg_en <= x"0000";
                           end if;
            when TKOUT4 => if (tkout_count_thresh = '1') then
                            state <= TKOUT5; tkout_count_clr <= '1'; IM03_reg_in <= out1; IM12_reg_in <= out2; IM21_reg_in <= out3; IM30_reg_in <= out4; inv_matrix_reg_en <= x"1248";
                           else
                            state <= TKOUT4; tkout_count_clr <= '0'; inv_matrix_reg_en <= x"0000";
                           end if;
            when TKOUT5 => if (tkout_count_thresh = '1') then
                            state <= TKOUT6; tkout_count_clr <= '1'; IM13_reg_in <= out2; IM22_reg_in <= out3; IM31_reg_in <= out4; inv_matrix_reg_en <= x"2480";
                           else
                            state <= TKOUT5; tkout_count_clr <= '0'; inv_matrix_reg_en <= x"0000";
                           end if;
            when TKOUT6 => if (tkout_count_thresh = '1') then
                            state <= TKOUT7; tkout_count_clr <= '1'; IM23_reg_in <= out3; IM32_reg_in <= out4; inv_matrix_reg_en <= x"4800";
                           else
                            state <= TKOUT6; tkout_count_clr <= '0'; inv_matrix_reg_en <= x"0000";
                           end if;
            when TKOUT7 => if (tkout_count_thresh = '1') then
                            state <= SNDOUT1; tkout_count_clr <= '1'; IM33_reg_in <= out4; inv_matrix_reg_en <= x"8000";
                           else
                            state <= TKOUT7; tkout_count_clr <= '0'; inv_matrix_reg_en <= x"0000";
                           end if;
            when SNDOUT1 => state <= SNDOUT2; tkout_count_clr <= '0'; inv_matrix_reg_en <= x"0000";
            when SNDOUT2 => state <= SNDOUT3;
            when SNDOUT3 => state <= SNDOUT4;
            when SNDOUT4 => state <= SNDOUT5;
            when SNDOUT5 => state <= SNDOUT6;
            when SNDOUT6 => state <= SNDOUT7;
            when SNDOUT7 => state <= SNDOUT8;
            when SNDOUT8 => state <= SNDOUT9;
            when SNDOUT9 => state <= SNDOUT10;
            when SNDOUT10 => state <= SNDOUT11;
            when SNDOUT11 => state <= SNDOUT12;
            when SNDOUT12 => state <= SNDOUT13;
            when SNDOUT13 => state <= SNDOUT14;
            when SNDOUT14 => state <= SNDOUT15;
            when SNDOUT15 => state <= SNDOUT16;
            when SNDOUT16 => state <= INIT;
        end case;
    end if;
end process;

process (state) 
begin
    case state is
        when INIT  => reset <= '1'; done <= '0'; Output <= x"00000000";
        when TKIN1 => M00_reg_in <= '1' & Input; matrix_reg_en <= x"0001"; sndin_count_en <= '0'; calc_go <= '0'; reset <= '0';
        when TKIN2 => M10_reg_in <= '0' & Input; matrix_reg_en <= x"0002"; sndin_count_en <= '0'; calc_go <= '0';
        when TKIN3 => M20_reg_in <= '0' & Input; matrix_reg_en <= x"0004"; sndin_count_en <= '0'; calc_go <= '0';
        when TKIN4 => M30_reg_in <= '0' & Input; matrix_reg_en <= x"0008"; sndin_count_en <= '0'; calc_go <= '0';
        when TKIN5 => M11_reg_in <= '0' & Input; matrix_reg_en <= x"0010"; sndin_count_en <= '0'; calc_go <= '0';
        when TKIN6 => M21_reg_in <= '1' & Input; matrix_reg_en <= x"0020"; sndin_count_en <= '0'; calc_go <= '0';
        when TKIN7 => M31_reg_in <= '0' & Input; matrix_reg_en <= x"0040"; sndin_count_en <= '0'; calc_go <= '0';
        when TKIN8 => M41_reg_in <= '0' & Input; matrix_reg_en <= x"0080"; sndin_count_en <= '0'; calc_go <= '0';
        when TKIN9 => M22_reg_in <= '0' & Input; matrix_reg_en <= x"0100"; sndin_count_en <= '0'; calc_go <= '0';
        when TKIN10 => M32_reg_in <= '0' & Input; matrix_reg_en <= x"0200"; sndin_count_en <= '0'; calc_go <= '0';
        when TKIN11 => M42_reg_in <= '1' & Input; matrix_reg_en <= x"0400"; sndin_count_en <= '0'; calc_go <= '0';
        when TKIN12 => M52_reg_in <= '0' & Input; matrix_reg_en <= x"0800"; sndin_count_en <= '0'; calc_go <= '0';
        when TKIN13 => M33_reg_in <= '0' & Input; matrix_reg_en <= x"1000"; sndin_count_en <= '0'; calc_go <= '0';
        when TKIN14 => M43_reg_in <= '0' & Input; matrix_reg_en <= x"2000"; sndin_count_en <= '0'; calc_go <= '0';
        when TKIN15 => M53_reg_in <= '0' & Input; matrix_reg_en <= x"4000"; sndin_count_en <= '0'; calc_go <= '0';
        when TKIN16 => M63_reg_in <= '1' & Input; matrix_reg_en <= x"8000"; sndin_count_en <= '0'; calc_go <= '0';
        when SNDIN1 => sndin_count_en <= '1'; calc_go <= '1'; in1 <= matrix(0,0); in2 <= matrix(0,1); in3 <= matrix(0,2); in4 <= matrix(0,3);
        when SNDIN2 => sndin_count_en <= '1'; calc_go <= '1'; in1 <= matrix(1,0); in2 <= matrix(1,1); in3 <= matrix(1,2); in4 <= matrix(1,3);
        when SNDIN3 => sndin_count_en <= '1'; calc_go <= '1'; in1 <= matrix(2,0); in2 <= matrix(2,1); in3 <= matrix(2,2); in4 <= matrix(2,3);
        when SNDIN4 => sndin_count_en <= '1'; calc_go <= '1'; in1 <= matrix(3,0); in2 <= matrix(3,1); in3 <= matrix(3,2); in4 <= matrix(3,3);
        when SNDIN5 => sndin_count_en <= '1'; calc_go <= '1'; in1 <= matrix(4,0); in2 <= matrix(4,1); in3 <= matrix(4,2); in4 <= matrix(4,3);
        when SNDIN6 => sndin_count_en <= '1'; calc_go <= '1'; in1 <= matrix(5,0); in2 <= matrix(5,1); in3 <= matrix(5,2); in4 <= matrix(5,3);
        when SNDIN7 => sndin_count_en <= '1'; calc_go <= '1'; in1 <= matrix(6,0); in2 <= matrix(6,1); in3 <= matrix(6,2); in4 <= matrix(6,3);
        when SNDIN8 => sndin_count_en <= '1'; calc_go <= '1'; in1 <= matrix(7,0); in2 <= matrix(7,1); in3 <= matrix(7,2); in4 <= matrix(7,3);
        when SNDIN9 => sndin_count_en <= '1'; calc_go <= '1'; in1 <= matrix(8,0); in2 <= matrix(8,1); in3 <= matrix(8,2); in4 <= matrix(8,3);
        when SNDIN10 => sndin_count_en <= '1'; calc_go <= '1'; in1 <= matrix(9,0); in2 <= matrix(9,1); in3 <= matrix(9,2); in4 <= matrix(9,3);
        when SNDIN11 => sndin_count_en <= '1'; calc_go <= '1'; in1 <= matrix(10,0); in2 <= matrix(10,1); in3 <= matrix(10,2); in4 <= matrix(10,3);
        when CALC => sndin_count_en <= '0'; calc_go <= '0'; calc_count_en <= '1';
        when TKOUT1 => calc_count_en <= '0'; tkout_count_en <= '1';
        when TKOUT2 => tkout_count_en <= '1';
        when TKOUT3 => tkout_count_en <= '1';
        when TKOUT4 => tkout_count_en <= '1';
        when TKOUT5 => tkout_count_en <= '1';
        when TKOUT6 => tkout_count_en <= '1';
        when TKOUT7 => tkout_count_en <= '1';
        when SNDOUT1 => tkout_count_en <= '0'; Output <= IM00_reg_out; done <= '1';
        when SNDOUT2 => Output <= IM01_reg_out; done <= '1';
        when SNDOUT3 => Output <= IM02_reg_out; done <= '1';
        when SNDOUT4 => Output <= IM03_reg_out; done <= '1';
        when SNDOUT5 => Output <= IM10_reg_out; done <= '1';
        when SNDOUT6 => Output <= IM11_reg_out; done <= '1';
        when SNDOUT7 => Output <= IM12_reg_out; done <= '1';
        when SNDOUT8 => Output <= IM13_reg_out; done <= '1';
        when SNDOUT9 => Output <= IM20_reg_out; done <= '1';
        when SNDOUT10 => Output <= IM21_reg_out; done <= '1';
        when SNDOUT11 => Output <= IM22_reg_out; done <= '1';
        when SNDOUT12 => Output <= IM23_reg_out; done <= '1';
        when SNDOUT13 => Output <= IM30_reg_out; done <= '1';
        when SNDOUT14 => Output <= IM31_reg_out; done <= '1';
        when SNDOUT15 => Output <= IM32_reg_out; done <= '1';
        when SNDOUT16 => Output <= IM33_reg_out; done <= '1';
    end case;
end process;

  
end Behavioral;
