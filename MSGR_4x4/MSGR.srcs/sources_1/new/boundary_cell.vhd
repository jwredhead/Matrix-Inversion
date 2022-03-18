----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/31/2019 05:47:56 PM
-- Design Name: 
-- Module Name: boundary_cell - Behavioral
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

entity boundary_cell is
    Port ( clk, reset, b_go: in STD_LOGIC;
           Win: in STD_LOGIC_VECTOR (31 downto 0);
           Yin: in STD_LOGIC_VECTOR (32 downto 0);
           Xout: out STD_LOGIC_VECTOR (32 downto 0);
           err: inout STD_LOGIC);
end boundary_cell;

architecture Behavioral of boundary_cell is

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

type state_type is (S0, S1, S2, S3, S4, S5, S6, S7, S8);
signal state: state_type := S0;

signal m1_go: STD_LOGIC := '0';
signal m2_go: STD_LOGIC := '0';

signal R: STD_LOGIC_VECTOR(31 downto 0);

signal reg_en: STD_LOGIC;
signal reg_in: STD_LOGIC_VECTOR(31 downto 0);

-- Multiplier Inputs
signal Mult1_In1: STD_LOGIC_VECTOR(31 downto 0);

-- Multiplier Outputs
signal Mult1_Out1: STD_LOGIC_VECTOR(31 downto 0);
signal Mult2_Out1: STD_LOGIC_VECTOR(31 downto 0);

-- Error Signals
signal overflow: STD_LOGIC_VECTOR(1 downto 0);
signal err_int: STD_LOGIC;
signal err_en: STD_LOGIC;

--Flag Signals
signal flag: STD_LOGIC;

begin 

flag <= Yin(32);

with flag select 
    Mult1_In1 <= Yin(31 downto 0) when '1',
                 R when others;

Mult1 : FP_MULT
  PORT MAP (
    aclk => clk,
    s_axis_a_tvalid => m1_go,
    s_axis_a_tdata => Mult1_In1,
    s_axis_b_tvalid => m1_go,
    s_axis_b_tdata => Yin(31 downto 0),
    m_axis_result_tvalid => OPEN,
    m_axis_result_tdata => Mult1_Out1,
    m_axis_result_tuser => overflow(0 downto 0)
  );

Mult2 : FP_MULT
  PORT MAP (
    aclk => clk,
    s_axis_a_tvalid => m2_go,
    s_axis_a_tdata => Mult1_Out1,
    s_axis_b_tvalid => m2_go,
    s_axis_b_tdata => Win,
    m_axis_result_tvalid => OPEN,
    m_axis_result_tdata => Mult2_Out1,
    m_axis_result_tuser => overflow(1 downto 1)
  );

R_Reg: reg
GENERIC MAP ( bits => 32) 
   PORT MAP (
    clk => clk,
    E => reg_en,
    D => reg_in,
    Q => R);

  Err_Reg: reg
GENERIC MAP ( bits => 1) 
   PORT MAP (
    clk => clk,
    E => err_en,
    D(0) => '1',
    Q(0) => err);
    
    with overflow select
        err_en <= '1' when "01",
                   '1' when "10",
                   '0' when others;  
     with err_int select
        err <= '0' when 'U',
                err_int when others;

Xout <= flag & Mult2_Out1;

process (clk) 
begin
    if (reset = '1') then
        state <= S0;
    elsif (clk'event and clk = '1') then
        case state is 
            when S0 => reg_en <= '1';
                        if (b_go = '1') then
                            state <= S1;
                        else 
                            state <= S0;
                        end if;
            when S1 => state <= S2; reg_en <= '0';
            when S2 => state <= S3; reg_en <= '0';
            when S3 => state <= S4; reg_en <= '0';
            when S4 => state <= S5; reg_en <= '0';
            when S5 => state <= S6; reg_en <= '0';
            when S6 => state <= S7;
                        if (flag = '1') then
                            reg_en <= '1';
                        else 
                            reg_en <= '0';
                        end if;
            when S7 => state <= S8; reg_en <= '0';
            when S8 => if (b_go = '1') then
                        state <= S1; reg_en <= '0';
                       else
                        state <= S8; reg_en <= '0';
                       end if;
        end case;             
    end if;
end process;

process (state, Yin)
begin
    case state is
        when S0 => m1_go <= '0'; m2_go <= '0';
        when S1 => m1_go <= '1'; m2_go <= '0'; 
        when S2 => m1_go <= '0'; m2_go <= '0';
        when S3 => m1_go <= '0'; m2_go <= '0';
        when S4 => m1_go <= '0'; m2_go <= '0';
        when S5 => m1_go <= '0'; m2_go <= '1';
        when S6 => m1_go <= '0'; m2_go <= '0';
        when S7 => m1_go <= '0'; m2_go <= '0';
        when S8 => m1_go <= '0'; m2_go <= '0';
    end case;
    if (state = S0) then
        reg_in <= x"00000000";
    else 
        case Yin(31 downto 0) is
            when x"00000000" => reg_in <= x"3f800000";
            when others => reg_in <= Yin(31 downto 0);
        end case;

    end if;
        
end process;

end Behavioral;
