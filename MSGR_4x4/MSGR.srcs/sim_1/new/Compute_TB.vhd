----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2019 07:45:16 PM
-- Design Name: 
-- Module Name: Compute_TB - Behavioral
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

entity Compute_TB is
--  Port ( );
end Compute_TB;

architecture Behavioral of Compute_TB is

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

constant clk_period: TIME := 10 ns;
signal clk: STD_LOGIC := '1';
signal reset: STD_LOGIC;
signal in1: STD_LOGIC_VECTOR (32 downto 0);
signal in2: STD_LOGIC_VECTOR (32 downto 0);
signal in3: STD_LOGIC_VECTOR (32 downto 0);
signal in4: STD_LOGIC_VECTOR (32 downto 0);
signal msgr_out1: STD_LOGIC_VECTOR (32 downto 0);
signal msgr_out2: STD_LOGIC_VECTOR (32 downto 0);
signal msgr_out3: STD_LOGIC_VECTOR (32 downto 0);
signal msgr_out4: STD_LOGIC_VECTOR (32 downto 0);
signal out1: STD_LOGIC_VECTOR (31 downto 0);
signal out2: STD_LOGIC_VECTOR (31 downto 0);
signal out3: STD_LOGIC_VECTOR (31 downto 0);
signal out4: STD_LOGIC_VECTOR (31 downto 0);
signal err1: STD_LOGIC;
signal err2: STD_LOGIC;
signal calc: STD_LOGIC;

begin
UUT1: MSGR
    port map ( clk => clk,
                reset => reset,
                calc => calc,
                in1 => in1,
                in2 => in2,
                in3 => in3,
                in4 => in4,
                out1 => msgr_out1, 
                out2 => msgr_out2,
                out3 => msgr_out3,
                out4 => msgr_out4,
                err => err1);

UUT2: IAM
    port map( clk => clk,
              in1 => msgr_out1, 
              in2 => msgr_out2, 
              in3 => msgr_out3,
              in4 => msgr_out4,
              out1 => out1,
              out2 => out2,
              out3 => out3,
              out4 => out4,
              err => err2);

clk <= not clk after clk_period/2;
process
begin

calc <= '1';

reset <= '0';

in1 <= '1' & x"3f800000" after 0 ns, -- 1
       '0' & x"40000000" after 80 ns, -- 2
       '0' & x"40400000" after 160 ns, -- 3
       '0' & x"40800000" after 240 ns, -- 4
       '0' & x"3f800000" after 320 ns, -- 1
       '0' & x"00000000" after 400 ns; -- 0

in2 <= '0' & x"00000000" after 0 ns, -- 0
       '0' & x"bf800000" after 80 ns, -- -1
       '1' & x"40000000" after 160 ns, -- 2
       '0' & x"00000000" after 240 ns, -- 0
       '0' & x"40a00000" after 320 ns, -- 5
       '0' & x"00000000" after 400 ns, -- 0
       '0' & x"3f800000" after 480 ns, -- 1
       '0' & x"00000000" after 560 ns; -- 0

in3 <= '0' & x"00000000" after 0 ns, -- 0 
       '0' & x"00000000" after 80 ns, -- 0
       '0' & x"00000000" after 160 ns, -- 0
       '0' & x"40800000" after 240 ns, -- 4
       '1' & x"c0000000" after 320 ns, -- -2
       '0' & x"40c00000" after 400 ns, -- 6
       '0' & x"00000000" after 480 ns, -- 0
       '0' & x"00000000" after 560 ns, -- 0
       '0' & x"3f800000" after 640 ns, -- 1
       '0' & x"00000000" after 720 ns; -- 0
       
in4 <= '0' & x"00000000" after 0 ns, -- 0 
       '0' & x"00000000" after 80 ns, -- 0
       '0' & x"00000000" after 160 ns, -- 0
       '0' & x"40000000" after 240 ns, -- 2
       '0' & x"40800000" after 320 ns, -- 4
       '0' & x"00000000" after 400 ns, -- 0
       '1' & x"40c00000" after 480 ns, -- 6
       '0' & x"00000000" after 560 ns, -- 0
       '0' & x"00000000" after 640 ns, -- 0
       '0' & x"00000000" after 720 ns, -- 0
       '0' & x"3f800000" after 800 ns; -- 0

wait;
end process;

end Behavioral;
