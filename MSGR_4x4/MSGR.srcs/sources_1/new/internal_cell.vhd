----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/31/2019 05:47:56 PM
-- Design Name: 
-- Module Name: internal_cell - Behavioral
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

entity internal_cell is
    Port ( clk, reset, i_go: in STD_LOGIC;
           Win : in STD_LOGIC_VECTOR (31 downto 0);
           Yin : in STD_LOGIC_VECTOR (32 downto 0);
           Xin : in STD_LOGIC_VECTOR (32 downto 0);
           Wout : inout STD_LOGIC_VECTOR (31 downto 0);
           Yout : out STD_LOGIC_VECTOR (32 downto 0);
           Xout : inout STD_LOGIC_VECTOR (32 downto 0);
           err: inout STD_LOGIC);
end internal_cell;

architecture Behavioral of internal_cell is

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

type state_type is (S0, S1, S2, S3, S4, S5, S6, S7, S8);
signal state: state_type := S0;

signal go: STD_LOGIC_VECTOR(7 downto 0):= "00000000";


-- Multiplier Inputs
signal Mult1_In1: STD_LOGIC_VECTOR(31 downto 0);
signal Mult2_In1: STD_LOGIC_VECTOR(31 downto 0);
signal Mult4_In1: STD_LOGIC_VECTOR(31 downto 0);
signal Mult4_In2: STD_LOGIC_VECTOR(31 downto 0); 

-- Multiplier Outputs
signal Mult1_Out: STD_LOGIC_VECTOR(31 downto 0); 
signal Mult2_Out: STD_LOGIC_VECTOR(31 downto 0); 
signal Mult3_Out: STD_LOGIC_VECTOR(31 downto 0); 
signal Mult4_Out: STD_LOGIC_VECTOR(31 downto 0); 
signal Mult5_Out: STD_LOGIC_VECTOR(31 downto 0);

-- Adder Inputs
signal Add2_In2: STD_LOGIC_VECTOR(31 downto 0);
 
-- Adder Outputs
signal Add1_Out: STD_LOGIC_VECTOR(31 downto 0);
signal Add2_Out: STD_LOGIC_VECTOR(31 downto 0);

-- Divider Inputs
signal Div1_In1:  STD_LOGIC_VECTOR(31 downto 0);
signal Div1_In2:  STD_LOGIC_VECTOR(31 downto 0);

-- Divider Outputs
signal Div1_Out:  STD_LOGIC_VECTOR(31 downto 0);
signal Div_Err_Out: STD_LOGIC_VECTOR(1 downto 0);

-- C Register
signal Creg_en: STD_LOGIC := '1';
signal Creg_in: STD_LOGIC_VECTOR(31 downto 0):= x"3f800000";
signal C: STD_LOGIC_VECTOR(31 downto 0);

-- S Register
signal Sreg_en: STD_LOGIC := '1';
signal Sreg_in: STD_LOGIC_VECTOR(31 downto 0) := x"3f800000" ;
signal S: STD_LOGIC_VECTOR(31 downto 0);

-- Z Register
signal Zreg_en: STD_LOGIC := '1';
signal Zreg_in: STD_LOGIC_VECTOR(31 downto 0):= x"3f800000";
signal Z: STD_LOGIC_VECTOR(31 downto 0) ;

-- W Register
signal Wreg_en: STD_LOGIC := '1';
signal Wreg_in: STD_LOGIC_VECTOR(31 downto 0):= x"3f800000";

signal overflow: STD_LOGIC_VECTOR(7 downto 0) := "00000000";
signal err_int: STD_LOGIC;
signal err_en: STD_LOGIC;

-- Flag signals
signal XFlag: STD_LOGIC;
signal YFLAG: STD_LOGIC;


begin

XFlag<= Xin(32);
YFlag <= Yin(32);

Mult1 : FP_MULT
  PORT MAP (
    aclk => clk,
    s_axis_a_tvalid => go(0),
    s_axis_a_tdata => Mult1_In1,
    s_axis_b_tvalid => go(0),
    s_axis_b_tdata => Yin(31 downto 0),
    m_axis_result_tvalid => OPEN,
    m_axis_result_tdata => Mult1_Out,
    m_axis_result_tuser => overflow(0 downto 0)
  );

Mult2 : FP_MULT
  PORT MAP (
    aclk => clk,
    s_axis_a_tvalid => go(1),
    s_axis_a_tdata => Mult2_In1,
    s_axis_b_tvalid => go(1),
    s_axis_b_tdata => Xin(31 downto 0),
    m_axis_result_tvalid => OPEN,
    m_axis_result_tdata => Mult2_Out,
    m_axis_result_tuser => overflow(1 downto 1)
  );
  
  Mult3 : FP_MULT
  PORT MAP (
    aclk => clk,
    s_axis_a_tvalid => go(2),
    s_axis_a_tdata => Win,
    s_axis_b_tvalid => go(2),
    s_axis_b_tdata => Mult1_Out,
    m_axis_result_tvalid => OPEN,
    m_axis_result_tdata => Mult3_Out,
    m_axis_result_tuser => overflow(2 downto 2)
  );
  
  Mult4 : FP_MULT
  PORT MAP (
    aclk => clk,
    s_axis_a_tvalid => go(3),
    s_axis_a_tdata => Mult4_In1,
    s_axis_b_tvalid => go(3),
    s_axis_b_tdata => Mult4_In2,
    m_axis_result_tvalid => OPEN,
    m_axis_result_tdata => Mult4_Out,
    m_axis_result_tuser => overflow(3 downto 3)
  );
  
  Mult5 : FP_MULT
  PORT MAP (
    aclk => clk,
    s_axis_a_tvalid => go(4),
    s_axis_a_tdata => C,
    s_axis_b_tvalid => go(4),
    s_axis_b_tdata => Xin(31 downto 0),
    m_axis_result_tvalid => OPEN,
    m_axis_result_tdata => Mult5_Out,
    m_axis_result_tuser => overflow(4 downto 4)
  );
  
  Add1 : FP_ADDER
  PORT MAP (
    aclk => clk,
    s_axis_a_tvalid => go(5),
    s_axis_a_tdata => Mult2_Out,
    s_axis_b_tvalid => go(5),
    s_axis_b_tdata => Mult3_out,
    m_axis_result_tvalid => OPEN,
    m_axis_result_tdata => Add1_Out,
    m_axis_result_tuser => overflow(5 downto 5)
  );
  
  Add2_In2 <= (not Mult5_Out(31)) & Mult5_Out(30 downto 0);
  
    Add2 : FP_ADDER
  PORT MAP (
    aclk => clk,
    s_axis_a_tvalid => go(6),
    s_axis_a_tdata => Mult4_Out,
    s_axis_b_tvalid => go(6),
    s_axis_b_tdata => Add2_In2,
    m_axis_result_tvalid => OPEN,
    m_axis_result_tdata => Add2_Out,
    m_axis_result_tuser => overflow(6 downto 6)
  );
  
  Div1 : FP_DIVIDE
  PORT MAP (
    aclk => clk,
    s_axis_a_tvalid => go(7),
    s_axis_a_tdata => Div1_In1,
    s_axis_b_tvalid => go(7),
    s_axis_b_tdata => Div1_In2,
    m_axis_result_tvalid => OPEN,
    m_axis_result_tdata => Div1_Out,
    m_axis_result_tuser => overflow(7 downto 7)
  );
  
C_Reg: reg
GENERIC MAP ( bits => 32) 
   PORT MAP (
    clk => clk,
    E => Creg_en,
    D => Creg_in,
    Q => C);

S_Reg: reg
GENERIC MAP ( bits => 32) 
   PORT MAP (
    clk => clk,
    E => Sreg_en,
    D => Sreg_in,
    Q => S);

Z_Reg: reg
GENERIC MAP ( bits => 32) 
   PORT MAP (
    clk => clk,
    E => Zreg_en,
    D => Zreg_in,
    Q => Z);   

W_Reg: reg
GENERIC MAP ( bits => 32) 
   PORT MAP (
    clk => clk,
    E => Wreg_en,
    D => Wreg_in,
    Q => Wout);
 
  Err_Reg: reg
GENERIC MAP ( bits => 1) 
   PORT MAP (
    clk => clk,
    E => err_en,
    D(0) => '1',
    Q(0) => err);
    
    with overflow select
        err_en <= '1' when "00000001",
                   '1' when "00000010",
                   '1' when "00000100",
                   '1' when "00001000",
                   '1' when "00010000",
                   '1' when "00100000",
                   '1' when "01000000",
                   '1' when "10000000",
                   '0' when others;  
                   
     with err_int select
        err <= '0' when 'U',
                err_int when others;

  Xout <= XFlag & Add1_Out;

process (clk) 
begin
    if (clk'event and clk='1') then
        if (state = S0) then
            Creg_in <= x"00000000"; Sreg_in <= x"00000000"; Zreg_in <= x"00000000"; Wreg_in <= x"3f800000";
        elsif (Xflag = '1') then
            Mult1_In1 <= Yin(31 downto 0);
            Mult2_In1 <= x"3f800000";
            Yout <= YFlag & x"00000000";
            if (Xin(31 downto 0) = x"00000000") then
                Creg_in <= x"3f800000"; Zreg_in <= x"00000000"; Wreg_in <= x"3f800000";
                if (Yin(31 downto 0) = x"00000000") then
                    Sreg_in <= x"3f800000";
                else
                    Sreg_in <= Yin(31 downto 0);
                end if;
            else
                Creg_in <= Div1_Out; Zreg_in <= x"3f800000"; Wreg_in <= Div1_out; Sreg_in <= Yin(31 downto 0);
                Mult4_In1 <= Win; Mult4_In2 <= Xin(31 downto 0);
            end if;
        else 
            Mult1_In1 <= S;
            Mult2_In1 <= Z;
            Mult4_In1 <= Z; Mult4_In2 <= Yin(31 downto 0); 
            Yout <= YFlag & Add2_Out;
            Creg_in <= C; Zreg_in <= Z; Sreg_in <= S; Wreg_in <= Wout;
        end if;
    end if;
  end process; 

  process (clk)
  begin
    if (reset = '1') then
        state <= S0;
    elsif (clk'event and clk='1') then
        case state is
            when S0 => state <= S1; Creg_en <= '1'; Sreg_en <= '1'; Zreg_en <= '1'; Wreg_en <= '0';
                        if (i_go = '1') then
                            state <= S1;
                        else
                            state <= S0;
                        end if;
            when S1 => state <= S2; Creg_en <= '0'; Sreg_en <= '0'; Zreg_en <= '0'; Wreg_en <= '0'; 
            when S2 => state <= S3; Creg_en <= '0'; Sreg_en <= '0'; Zreg_en <= '0'; Wreg_en <= '0'; 
            when S3 => state <= S4; Creg_en <= '0'; Sreg_en <= '0'; Zreg_en <= '0'; Wreg_en <= '0'; 
            when S4 => state <= S5; Creg_en <= '1'; Sreg_en <= '1'; Zreg_en <= '1'; Wreg_en <= '0'; 
            when S5 => state <= S6; Creg_en <= '0'; Sreg_en <= '0'; Zreg_en <= '0'; Wreg_en <= '0'; 
            when S6 => state <= S7; Creg_en <= '0'; Sreg_en <= '0'; Zreg_en <= '0'; Wreg_en <= '0'; 
            when S7 => state <= S8; Creg_en <= '0'; Sreg_en <= '0'; Zreg_en <= '0'; Wreg_en <= '0'; 
            when S8 => Creg_en <= '0'; Sreg_en <= '0'; Zreg_en <= '0'; Wreg_en <= '1';
                        if (i_go = '1') then
                            state <= S1;
                        else 
                            state <= S8;
                        end if;
        end case;
     end if;
   end process;

   process (state) 
   begin
    case state is
        when S0 => go <= "00000000";
        when S1 => go <= "10011011"; Div1_In1 <= Yin(31 downto 0); Div1_In2 <= Xin(31 downto 0); 
        when S2 => go <= "00000000";
        when S3 => go <= "00000100";
        when S4 => go <= "00000000";
        when S5 => go <= "01100000";
        when S6 => go <= "00000000";
        when S7 => go <= "10000000"; Div1_In1 <= Mult4_Out; Div1_In2 <= Add1_Out; 
        when S8 => go <= "00000000";
    end case;
   end process;
end Behavioral;
