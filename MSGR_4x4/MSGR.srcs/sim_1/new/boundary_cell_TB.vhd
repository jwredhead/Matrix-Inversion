----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/03/2019 12:57:49 PM
-- Design Name: 
-- Module Name: boundary_cell_TB - Behavioral
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

entity boundary_cell_TB is
--  Port ( );
end boundary_cell_TB;

architecture Behavioral of boundary_cell_TB is

component boundary_cell is
    Port ( clk, reset, b_go: in STD_LOGIC;
           Win: in STD_LOGIC_VECTOR (31 downto 0);
           Yin: in STD_LOGIC_VECTOR (32 downto 0);
           Xout: out STD_LOGIC_VECTOR (32 downto 0);
           err: out STD_LOGIC);
end component;

constant clk_period: TIME := 10 ns;
signal clk: STD_LOGIC := '1';

signal reset: STD_LOGIC;
signal b_go: STD_LOGIC;
signal Win: STD_LOGIC_VECTOR(31 downto 0);
signal Yin: STD_LOGIC_VECTOR(32 downto 0);
signal Xout: STD_LOGIC_VECTOR(32 downto 0);
signal err: STD_LOGIC;



begin

UUT: boundary_cell
    port map ( clk => clk,
               reset => reset,
               b_go => b_go,
               Win => Win,
               Yin => Yin,
               Xout => Xout,
               err => err);
          
clk <= not clk after clk_period/2;
process
begin
reset <= '0' after 0 ns,
         '1' after 280 ns,
         '0' after 290 ns;

b_go <= '0' after 0 ns,
        '1' after 20 ns,
        '0' after 30 ns,
        '1' after 100 ns,
        '0' after 110 ns,
        '1' after 190 ns,
        '0' after 200 ns,
        '1' after 260 ns,
        '0' after 270 ns,
        '1' after 310 ns,
        '0' after 320 ns,
        '1' after 370 ns,
        '0' after 380 ns,
        '1' after 460 ns,
        '0' after 470 ns,
        '1' after 530 ns,
        '0' after 540 ns;
        

Win <= x"3f800000",
       x"00000000" after 290 ns,
       x"3f000000" after 370 ns;
       
Yin <='1' & x"40000000", -- 3.25
      '0' & x"40400000" after 100 ns, -- 1
      '0' & x"3f800000" after 190 ns, --3.25
      '0' & x"00000000" after 260 ns,
      '0' & x"00000000" after 290 ns,
      '0' & x"00000000" after 390ns,
      '1' & x"c1000000" after 480 ns,
      '0' & x"00000000" after 550 ns,
      '0' & x"3f800000" after 630 ns; -- 6.325

wait;
end process;

end Behavioral;
