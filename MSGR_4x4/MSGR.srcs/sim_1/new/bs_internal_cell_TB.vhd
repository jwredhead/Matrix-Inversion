----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/07/2019 03:11:04 PM
-- Design Name: 
-- Module Name: bs_internal_cell_TB - Behavioral
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

entity bs_internal_cell_TB is
--  Port ( );
end bs_internal_cell_TB;

architecture Behavioral of bs_internal_cell_TB is

component bs_internal_cell is
    Port ( Xin : in STD_LOGIC_VECTOR (32 downto 0);
           Yin : in STD_LOGIC_VECTOR (31 downto 0);
           Xout : out STD_LOGIC_VECTOR (32 downto 0);
           Yout : out STD_LOGIC_VECTOR (31 downto 0);
           clk : in STD_LOGIC;
           err : out STD_LOGIC);
end component;

constant clk_period: TIME := 10 ns;
signal clk: STD_LOGIC := '1';

signal Xin: STD_LOGIC_VECTOR(32 downto 0);
signal Yin: STD_LOGIC_VECTOR(31 downto 0);
signal Xout: STD_LOGIC_VECTOR(32 downto 0);
signal Yout: STD_LOGIC_VECTOR(31 downto 0);
signal err: STD_LOGIC;


begin

UUT: bs_internal_cell
    port map( clk => clk,
              Xin => Xin,
              Yin => Yin,
              Xout => Xout,
              Yout => Yout,
              err => err);
              
clk <= not clk after clk_period/2;

process 
begin

Xin <= '1' & x"40500000" after 0 ns,
       '0' & x"40500000" after 80 ns;

Yin <= x"40ca6666" after 0 ns,
       x"40700000" after 80 ns;

wait;

end process;
             
end Behavioral;
