----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/07/2019 11:03:14 PM
-- Design Name: 
-- Module Name: IAM_TB - Behavioral
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

entity IAM_TB is
--  Port ( );
end IAM_TB;

architecture Behavioral of IAM_TB is

component IAM is
    Port ( clk : in STD_LOGIC;
           in1 : in STD_LOGIC_VECTOR (32 downto 0);
           in2 : in STD_LOGIC_VECTOR (32 downto 0);
           out1 : inout STD_LOGIC_VECTOR (31 downto 0);
           out2 : inout STD_LOGIC_VECTOR (31 downto 0);
           err : out STD_LOGIC);
end component;

constant clk_period: TIME := 10 ns;
signal clk: STD_LOGIC := '1';

signal in1: STD_LOGIC_VECTOR(32 downto 0);
signal in2: STD_LOGIC_VECTOR(32 downto 0);
signal out1: STD_LOGIC_VECTOR(31 downto 0);
signal out2: STD_LOGIC_VECTOR(31 downto 0);
signal err: STD_LOGIC;

begin

UUT: IAM
    port map( clk => clk,
              in1 => in1, 
              in2 => in2, 
              out1 => out1,
              out2 => out2,
              err => err);
              
    clk <= not clk after clk_period/2;
    
process
begin

    in1 <= '1' & x"41000000" after 0 ns,
           '0' & x"00000000" after 80 ns,
           '0' & x"40000000" after 160 ns,
           '0' & x"3f000000" after 240 ns,
           '0' & x"00000000" after 320 ns;
    
    in2 <= '0' & x"00000000" after 0 ns,
           '1' & x"41200000" after 160 ns,
           '0' & x"3f000000" after 240 ns,
           '0' & x"40000000" after 320 ns,
           '0' & x"bf000000" after 400 ns;
           
wait;
end process;


end Behavioral;
