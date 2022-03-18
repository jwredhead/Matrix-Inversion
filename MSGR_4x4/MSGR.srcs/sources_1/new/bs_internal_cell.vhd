----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/06/2019 01:21:46 PM
-- Design Name: 
-- Module Name: bs_internal_cell - Behavioral
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

entity bs_internal_cell is
    Port ( Xin : in STD_LOGIC_VECTOR (32 downto 0);
           Yin : in STD_LOGIC_VECTOR (31 downto 0);
           Xout : out STD_LOGIC_VECTOR (32 downto 0);
           Yout : out STD_LOGIC_VECTOR (31 downto 0);
           clk : in STD_LOGIC;
           err : out STD_LOGIC);
end bs_internal_cell;

architecture Behavioral of bs_internal_cell is

COMPONENT FP_ADDER
  PORT (
    aclk : IN STD_LOGIC;
    s_axis_a_tvalid : IN STD_LOGIC;
    s_axis_a_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axis_b_tvalid : IN STD_LOGIC;
    s_axis_b_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_result_tvalid : OUT STD_LOGIC;
    m_axis_result_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_result_tuser : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
END COMPONENT;

COMPONENT FP_DIVIDE
  PORT (
    aclk : IN STD_LOGIC;
    s_axis_a_tvalid : IN STD_LOGIC;
    s_axis_a_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axis_b_tvalid : IN STD_LOGIC;
    s_axis_b_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_result_tvalid : OUT STD_LOGIC;
    m_axis_result_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_result_tuser : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
END COMPONENT;

COMPONENT FP_MULT
  PORT (
    aclk : IN STD_LOGIC;
    s_axis_a_tvalid : IN STD_LOGIC;
    s_axis_a_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axis_b_tvalid : IN STD_LOGIC;
    s_axis_b_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_result_tvalid : OUT STD_LOGIC;
    m_axis_result_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_result_tuser : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
END COMPONENT;

component reg is 
generic ( bits: integer := 4); 
port ( clk, E: IN STD_LOGIC;
		 D: IN STD_LOGIC_VECTOR(bits-1 downto 0);
		 Q: INOUT STD_LOGIC_VECTOR(bits-1 downto 0));
end component;

type state_type is (S1, S2);
signal state: state_type := S1;

signal reg_en: STD_LOGIC;
signal reg_in: STD_LOGIC_VECTOR(31 downto 0);
signal R: STD_LOGIC_VECTOR(31 downto 0);

signal flag: STD_LOGIC;

signal overflow: STD_LOGIC_VECTOR(2 downto 0);
signal go: STD_LOGIC_VECTOR(2 downto 0);

signal Add_In2: STD_LOGIC_VECTOR(31 downto 0);

signal Mult_Out: STD_LOGIC_VECTOR(31 downto 0);
signal Div_Out: STD_LOGIC_VECTOR(31 downto 0);
signal Add_Out: STD_LOGIC_VECTOR(31 downto 0);

begin

flag <= Xin(32);

R_reg: reg
GENERIC MAP ( bits => 32) 
   PORT MAP (
    clk => clk,
    E => reg_en,
    D => reg_in,
    Q => R);
    
Mult: FP_MULT
  PORT MAP (
    aclk => clk,
    s_axis_a_tvalid => go(0),
    s_axis_a_tdata => R,
    s_axis_b_tvalid => go(0),
    s_axis_b_tdata => Xin(31 downto 0),
    m_axis_result_tvalid => OPEN,
    m_axis_result_tdata => Mult_Out,
    m_axis_result_tuser => overflow(0 downto 0)
  );

Div : FP_DIVIDE
  PORT MAP (
    aclk => clk,
    s_axis_a_tvalid => go(1),
    s_axis_a_tdata => Yin,
    s_axis_b_tvalid => go(1),
    s_axis_b_tdata => Xin(31 downto 0),
    m_axis_result_tvalid => OPEN,
    m_axis_result_tdata => Div_Out,
    m_axis_result_tuser => overflow(1 downto 1)
  );

Add_In2 <= (not Mult_Out(31)) & Mult_Out(30 downto 0);     

Add : FP_ADDER
  PORT MAP (
    aclk => clk,
    s_axis_a_tvalid => go(2),
    s_axis_a_tdata => Yin,
    s_axis_b_tvalid => go(2),
    s_axis_b_tdata => Add_In2,
    m_axis_result_tvalid => OPEN,
    m_axis_result_tdata => Add_Out,
    m_axis_result_tuser => overflow(2 downto 2)
  );

err <= overflow(0) and overflow(1) and overflow(2);

Xout <= Xin;

with flag select
    Yout <= x"00000000" when '1',
            Add_Out when others;
            
with flag select
    reg_in <= Div_Out when '1',
              R when others;
               
process (clk)
begin
    if (clk'event and clk = '1') then
        case state is
            when S1 => state <= S2; 
            when S2 => state <= S1; 
        end case;
    end if;
end process;

process (state)
begin
    case state is
        when S1 => go <= "011"; reg_en <= '0'; 
        when S2 => go <= "100"; reg_en <= '1';
    end case;
end process;


end Behavioral;
