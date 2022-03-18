----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/16/2019 01:09:59 AM
-- Design Name: 
-- Module Name: Overall_TB - Behavioral
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

entity Overall_TB is
--  Port ( );
end Overall_TB;

architecture Behavioral of Overall_TB is

component Overall_MSGR is
    Port ( clk, run : in STD_LOGIC;
           Input : in STD_LOGIC_VECTOR (31 downto 0);
           Output : inout STD_LOGIC_VECTOR (31 downto 0);
           err : inout STD_LOGIC;
           done : out STD_LOGIC);
end component;

constant clk_period: TIME := 10 ns;
signal clk: STD_LOGIC := '1';

signal run: STD_LOGIC := '1';
signal Input: STD_LOGIC_VECTOR (31 downto 0);
signal Output : STD_LOGIC_VECTOR (31 downto 0);
signal err: STD_LOGIC;
signal done: STD_LOGIC;

begin

UUT: Overall_MSGR
    PORT MAP (
        clk => clk,
        run => run,
        Input => Input,
        Output => Output,
        err => err,
        done => done);
        
clk <= not clk after clk_period/2;
process
begin
run <= '0' after 500 ns;

Input <= x"3f800000" after 10 ns,
         x"40000000" after 20 ns,
         x"40400000" after 30 ns,
         x"40800000" after 40 ns,
         x"bf800000" after 50 ns,
         x"40000000" after 60 ns,
         x"00000000" after 70 ns,
         x"40a00000" after 80 ns,
         x"00000000" after 90 ns,
         x"40800000" after 100 ns,
         x"c0000000" after 110 ns,
         x"40c00000" after 120 ns,
         x"40000000" after 130 ns,
         x"40800000" after 140 ns,
         x"00000000" after 150 ns,
         x"40c00000" after 160 ns;

wait;
end process;
end Behavioral;
