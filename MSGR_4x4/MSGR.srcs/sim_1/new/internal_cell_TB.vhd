----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/02/2019 05:54:38 PM
-- Design Name: 
-- Module Name: internal_cell_TB - Behavioral
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

entity internal_cell_TB is
--  Port ( );
end internal_cell_TB;

architecture Behavioral of internal_cell_TB is

component internal_cell is
    Port ( clk, reset, i_go: in STD_LOGIC;
           Win : in STD_LOGIC_VECTOR (31 downto 0);
           Yin : in STD_LOGIC_VECTOR (32 downto 0);
           Xin : in STD_LOGIC_VECTOR (32 downto 0);
           Wout : inout STD_LOGIC_VECTOR (31 downto 0);
           Yout : out STD_LOGIC_VECTOR (32 downto 0);
           Xout : inout STD_LOGIC_VECTOR (32 downto 0);
           err: inout STD_LOGIC);
end component;

constant clk_period: TIME := 10 ns;
signal clk: STD_LOGIC := '1';

signal Xflag: STD_LOGIC := '0';
signal Yflag: STD_LOGIC := '0';
signal Win: STD_LOGIC_VECTOR(31 downto 0) := x"3f800000";
signal Yin: STD_LOGIC_VECTOR(32 downto 0) := YFlag & x"00000000";
signal Xin: STD_LOGIC_VECTOR(32 downto 0) := XFlag & x"00000000";
signal Wout: STD_LOGIC_VECTOR(31 downto 0);
signal Yout: STD_LOGIC_VECTOR(32 downto 0);
signal Xout: STD_LOGIC_VECTOR(32 downto 0);
signal err: STD_LOGIC;
signal reset: STD_LOGIC := '0';
signal i_go: STD_LOGIC := '1';


begin

UUT: internal_cell
    port map ( clk => clk,
               reset => reset,
               i_go => i_go,
               Win => Win,
               Yin => Yin,
               Xin => Xin,
               Wout => Wout,
               Yout => Yout,
               Xout => Xout,
               err => err);
    
clk <= not clk after clk_period/2;
process
begin

i_go <= '0' after 70 ns;

Win <= x"3f800000",
       x"3f800000" after 90 ns;

Yin <= '0' & x"40000000",
        '1' & x"40000000" after 90 ns;

Xin <= '1' & x"40800000",
        '0' & x"40c00000" after 90 ns;

wait;
end process;

end Behavioral;
