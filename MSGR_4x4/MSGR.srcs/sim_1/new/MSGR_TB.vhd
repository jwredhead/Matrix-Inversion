----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/03/2019 04:26:05 PM
-- Design Name: 
-- Module Name: MSGR_TB - TB
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

entity MSGR_TB is
--  Port ( );
end MSGR_TB;

architecture TB of MSGR_TB is

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

constant clk_period: TIME := 10 ns;
signal clk: STD_LOGIC := '1';
signal reset: STD_LOGIC;
signal in1: STD_LOGIC_VECTOR (32 downto 0);
signal in2: STD_LOGIC_VECTOR (32 downto 0);
signal in3: STD_LOGIC_VECTOR (32 downto 0);
signal in4: STD_LOGIC_VECTOR (32 downto 0);
signal out1: STD_LOGIC_VECTOR (32 downto 0);
signal out2: STD_LOGIC_VECTOR (32 downto 0);
signal out3: STD_LOGIC_VECTOR (32 downto 0);
signal out4: STD_LOGIC_VECTOR (32 downto 0);
signal err: STD_LOGIC;
signal calc: STD_LOGIC;

begin

UUT: MSGR
    port map ( clk => clk,
                reset => reset,
                calc => calc,
                in1 => in1,
                in2 => in2,
                in3 => in3,
                in4 => in4,
                out1 => out1, 
                out2 => out2,
                out3 => out3,
                out4 => out4,
                err => err);
                
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

end TB;
