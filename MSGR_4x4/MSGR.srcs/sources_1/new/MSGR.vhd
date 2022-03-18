----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/03/2019 01:48:05 PM
-- Design Name: 
-- Module Name: MSGR - Structural
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

entity MSGR is
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
end MSGR;

architecture Structural of MSGR is

component boundary_cell is
    Port ( clk, reset, b_go: in STD_LOGIC;
           Win: in STD_LOGIC_VECTOR (31 downto 0);
           Yin: in STD_LOGIC_VECTOR (32 downto 0);
           Xout: out STD_LOGIC_VECTOR (32 downto 0);
           err: inout STD_LOGIC);
end component;

component internal_cell is
    Port ( clk, reset, i_go : in STD_LOGIC;
           Win : in STD_LOGIC_VECTOR (31 downto 0);
           Yin : in STD_LOGIC_VECTOR (32 downto 0);
           Xin : in STD_LOGIC_VECTOR (32 downto 0);
           Wout : inout STD_LOGIC_VECTOR (31 downto 0);
           Yout : out STD_LOGIC_VECTOR (32 downto 0);
           Xout : inout STD_LOGIC_VECTOR (32 downto 0);
           err: inout STD_LOGIC);
end component;

COMPONENT Counter
  PORT (
    CLK : IN STD_LOGIC;
    CE : IN STD_LOGIC;
    SCLR : IN STD_LOGIC;
    THRESH0 : OUT STD_LOGIC;
    Q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END COMPONENT;

component reg is 
generic ( bits: integer := 4); 
port ( clk, E: IN STD_LOGIC;
		 D: IN STD_LOGIC_VECTOR(bits-1 downto 0);
		 Q: INOUT STD_LOGIC_VECTOR(bits-1 downto 0));
end component;

type state_type is (INIT, LOAD, CALC1);
signal state: state_type := INIT;

signal reg_en: STD_LOGIC := '0';

signal go: STD_LOGIC;

-- Pipeline Registers
-- X Registers
signal X1reg_in: STD_LOGIC_VECTOR (32 downto 0);
signal X1reg_out: STD_LOGIC_VECTOR (32 downto 0);
signal X2reg_in: STD_LOGIC_VECTOR (32 downto 0);
signal X2reg_out: STD_LOGIC_VECTOR (32 downto 0);
signal X3reg_in: STD_LOGIC_VECTOR (32 downto 0);
signal X3reg_out: STD_LOGIC_VECTOR (32 downto 0);
signal X4reg_in: STD_LOGIC_VECTOR (32 downto 0);
signal X4reg_out: STD_LOGIC_VECTOR (32 downto 0);
signal X5reg_in: STD_LOGIC_VECTOR (32 downto 0);
signal X5reg_out: STD_LOGIC_VECTOR (32 downto 0);
signal X6reg_in: STD_LOGIC_VECTOR (32 downto 0);
signal X6reg_out: STD_LOGIC_VECTOR (32 downto 0);

-- W Registers
signal I1Wreg_in: STD_LOGIC_VECTOR (31 downto 0);
signal I1Wreg_out: STD_LOGIC_VECTOR (31 downto 0);
signal I2Wreg_in: STD_LOGIC_VECTOR (31 downto 0);
signal I2Wreg_out: STD_LOGIC_VECTOR (31 downto 0);
signal I3Wreg_in: STD_LOGIC_VECTOR (31 downto 0);
signal I3Wreg_out: STD_LOGIC_VECTOR (31 downto 0);
signal I4Wreg_in: STD_LOGIC_VECTOR (31 downto 0);
signal I4Wreg_out: STD_LOGIC_VECTOR (31 downto 0);
signal I5Wreg_in: STD_LOGIC_VECTOR (31 downto 0);
signal I5Wreg_out: STD_LOGIC_VECTOR (31 downto 0);
signal I6Wreg_in: STD_LOGIC_VECTOR (31 downto 0);
signal I6Wreg_out: STD_LOGIC_VECTOR (31 downto 0);

-- Y Registers
signal I1Yreg_in: STD_LOGIC_VECTOR (32 downto 0);
signal I1Yreg_out: STD_LOGIC_VECTOR (32 downto 0);
signal I2Yreg_in: STD_LOGIC_VECTOR (32 downto 0);
signal I2Yreg_out: STD_LOGIC_VECTOR (32 downto 0);
signal I3Yreg_in: STD_LOGIC_VECTOR (32 downto 0);
signal I3Yreg_out: STD_LOGIC_VECTOR (32 downto 0);
signal I4Yreg_in: STD_LOGIC_VECTOR (32 downto 0);
signal I4Yreg_out: STD_LOGIC_VECTOR (32 downto 0);
signal I5Yreg_in: STD_LOGIC_VECTOR (32 downto 0);
signal I5Yreg_out: STD_LOGIC_VECTOR (32 downto 0);
signal I6Yreg_in: STD_LOGIC_VECTOR (32 downto 0);
signal I6Yreg_out: STD_LOGIC_VECTOR (32 downto 0);

-- Out Registers
signal out1reg_in: STD_LOGIC_VECTOR (32 downto 0);
signal out2reg_in: STD_LOGIC_VECTOR (32 downto 0);
signal out3reg_in: STD_LOGIC_VECTOR (32 downto 0);
signal out4reg_in: STD_LOGIC_VECTOR (32 downto 0);

-- In Registers
signal in1reg_out: STD_LOGIC_VECTOR (32 downto 0);
signal in2reg_out: STD_LOGIC_VECTOR (32 downto 0);
signal in3reg_out: STD_LOGIC_VECTOR (32 downto 0);
signal in4reg_out: STD_LOGIC_VECTOR (32 downto 0);

signal count_en: STD_LOGIC := '0';
signal sclr: STD_LOGIC := '0';
signal zQ: STD_LOGIC := '0';

signal overflow: STD_LOGIC_VECTOR(9 downto 0);
signal err_en: STD_LOGIC;
signal err_int:STD_LOGIC;

begin

X1reg: reg
GENERIC MAP ( bits => 33) 
   PORT MAP (
    clk => clk,
    E => reg_en,
    D => X1reg_in,
    Q => X1reg_out);

X2reg: reg
GENERIC MAP ( bits => 33) 
   PORT MAP (
    clk => clk,
    E => reg_en,
    D => X2reg_in,
    Q => X2reg_out);
    
X3reg: reg
GENERIC MAP ( bits => 33) 
   PORT MAP (
    clk => clk,
    E => reg_en,
    D => X3reg_in,
    Q => X3reg_out);
    
X4reg: reg
GENERIC MAP ( bits => 33) 
   PORT MAP (
    clk => clk,
    E => reg_en,
    D => X4reg_in,
    Q => X4reg_out);
    
X5reg: reg
GENERIC MAP ( bits => 33) 
   PORT MAP (
    clk => clk,
    E => reg_en,
    D => X5reg_in,
    Q => X5reg_out);
    
X6reg: reg
GENERIC MAP ( bits => 33) 
   PORT MAP (
    clk => clk,
    E => reg_en,
    D => X6reg_in,
    Q => X6reg_out);
    
I1Wreg: reg
GENERIC MAP ( bits => 32) 
   PORT MAP (
    clk => clk,
    E => reg_en,
    D => I1Wreg_in,
    Q => I1Wreg_out);
      
I1Yreg: reg
GENERIC MAP ( bits => 33) 
   PORT MAP (
    clk => clk,
    E => reg_en,
    D => I1Yreg_in,
    Q => I1Yreg_out);
    
I2Wreg: reg
GENERIC MAP ( bits => 32) 
   PORT MAP (
    clk => clk,
    E => reg_en,
    D => I2Wreg_in,
    Q => I2Wreg_out);
      
I2Yreg: reg
GENERIC MAP ( bits => 33) 
   PORT MAP (
    clk => clk,
    E => reg_en,
    D => I2Yreg_in,
    Q => I2Yreg_out);

I3Wreg: reg
GENERIC MAP ( bits => 32) 
   PORT MAP (
    clk => clk,
    E => reg_en,
    D => I3Wreg_in,
    Q => I3Wreg_out);
      
I3Yreg: reg
GENERIC MAP ( bits => 33) 
   PORT MAP (
    clk => clk,
    E => reg_en,
    D => I3Yreg_in,
    Q => I3Yreg_out);
    
I4Wreg: reg
GENERIC MAP ( bits => 32) 
   PORT MAP (
    clk => clk,
    E => reg_en,
    D => I4Wreg_in,
    Q => I4Wreg_out);
      
I4Yreg: reg
GENERIC MAP ( bits => 33) 
   PORT MAP (
    clk => clk,
    E => reg_en,
    D => I4Yreg_in,
    Q => I4Yreg_out);
    
I5Wreg: reg
GENERIC MAP ( bits => 32) 
   PORT MAP (
    clk => clk,
    E => reg_en,
    D => I5Wreg_in,
    Q => I5Wreg_out);
      
I5Yreg: reg
GENERIC MAP ( bits => 33) 
   PORT MAP (
    clk => clk,
    E => reg_en,
    D => I5Yreg_in,
    Q => I5Yreg_out);

I6Wreg: reg
GENERIC MAP ( bits => 32) 
   PORT MAP (
    clk => clk,
    E => reg_en,
    D => I6Wreg_in,
    Q => I6Wreg_out);
      
I6Yreg: reg
GENERIC MAP ( bits => 33) 
   PORT MAP (
    clk => clk,
    E => reg_en,
    D => I6Yreg_in,
    Q => I6Yreg_out);

Out1reg: reg
GENERIC MAP ( bits => 33) 
   PORT MAP (
    clk => clk,
    E => reg_en,
    D => out1reg_in,
    Q => out1);
    
Out2reg: reg
GENERIC MAP ( bits => 33) 
   PORT MAP (
    clk => clk,
    E => reg_en,
    D => out2reg_in,
    Q => out2);
    
Out3reg: reg
GENERIC MAP ( bits => 33) 
   PORT MAP (
    clk => clk,
    E => reg_en,
    D => out3reg_in,
    Q => out3);
    
Out4reg: reg
GENERIC MAP ( bits => 33) 
   PORT MAP (
    clk => clk,
    E => reg_en,
    D => out4reg_in,
    Q => out4);

In1reg: reg
GENERIC MAP ( bits => 33) 
   PORT MAP (
    clk => clk,
    E => reg_en,
    D => in1,
    Q => in1reg_out);

In2reg: reg
GENERIC MAP ( bits => 33) 
   PORT MAP (
    clk => clk,
    E => reg_en,
    D => in2,
    Q => in2reg_out);
    
In3reg: reg
GENERIC MAP ( bits => 33) 
   PORT MAP (
    clk => clk,
    E => reg_en,
    D => in3,
    Q => in3reg_out);

In4reg: reg
GENERIC MAP ( bits => 33) 
   PORT MAP (
    clk => clk,
    E => reg_en,
    D => in4,
    Q => in4reg_out);

B1: boundary_cell
    port map( clk => clk,
              reset => reset,
              b_go => go,
              Win => x"3f800000", -- 1
              Yin => in1reg_out,
              Xout => X1reg_in,
              err => overflow(0));
              
B2: boundary_cell
    port map( clk => clk,
              reset => reset,
              b_go => go,
              Win => I1Wreg_out ,
              Yin => I1Yreg_out,
              Xout => X4reg_in,
              err => overflow(1));
              
B3: boundary_cell
    port map( clk => clk,
              reset => reset,
              b_go => go,
              Win => I4Wreg_out,
              Yin => I4Yreg_out,
              Xout => X6reg_in,
              err => overflow(2));
              
B4: boundary_cell
    port map( clk => clk,
              reset => reset,
              b_go => go,
              Win => I6Wreg_out,
              Yin => I6Yreg_out,
              Xout => out4reg_in,
              err => overflow(3));
              
I1: internal_cell
    port map( clk => clk,
              reset => reset,
              i_go => go,
              Win => x"3f800000", -- 1           
              Yin => in2reg_out,
              Xin => X1reg_out,
              Wout => I1Wreg_in,
              Yout => I1Yreg_in,
              Xout => X2reg_in,
              err => overflow(4));
              
I2: internal_cell
    port map( clk => clk,
              reset => reset,
              i_go => go,
              Win => x"3f800000", -- 1           
              Yin => in3reg_out,
              Xin => X2reg_out,
              Wout => I2Wreg_in,
              Yout => I2Yreg_in,
              Xout => X3reg_in,
              err => overflow(5));
              
I3: internal_cell
    port map( clk => clk,
              reset => reset,
              i_go => go,
              Win => x"3f800000", -- 1           
              Yin => in4reg_out,
              Xin => X3reg_out,
              Wout => I3Wreg_in,
              Yout => I3Yreg_in,
              Xout => out1reg_in,
              err => overflow(6));
              
I4: internal_cell
    port map( clk => clk,
              reset => reset,
              i_go => go,
              Win => I2Wreg_out,           
              Yin => I2Yreg_out,
              Xin => X4reg_out,
              Wout => I4Wreg_in,
              Yout => I4Yreg_in,
              Xout => X5reg_in,
              err => overflow(7));
              
I5: internal_cell
    port map( clk => clk,
              reset => reset,
              i_go => go,
              Win => I3Wreg_out,           
              Yin => I3Yreg_out,
              Xin => X5reg_out,
              Wout => I5Wreg_in,
              Yout => I5Yreg_in,
              Xout => out2reg_in,
              err => overflow(8));
              
I6: internal_cell
    port map( clk => clk,
              reset => reset,
              i_go => go,
              Win => I5Wreg_out,           
              Yin => I5Yreg_out,
              Xin => X6reg_out,
              Wout => I6Wreg_in,
              Yout => I6Yreg_in,
              Xout => out3reg_in,
              err => overflow(9));
              
CTRL_COUNTER : Counter
  PORT MAP (
    CLK => clk,
    CE => count_en,
    SCLR => sclr,
    THRESH0 => zQ,
    Q => OPEN
  );
  
    Err_Reg: reg
GENERIC MAP ( bits => 1) 
   PORT MAP (
    clk => clk,
    E => err_en,
    D(0) => '1',
    Q(0) => err_int);
    
    with overflow select
        err_en <= '1' when "0000000001",
                   '1' when "0000000010",
                   '1' when "0000000100",
                   '1' when "0000001000",
                   '1' when "0000010000",
                   '1' when "0000100000",
                   '1' when "0001000000",
                   '1' when "0010000000",
                   '1' when "0100000000",
                   '1' when "1000000000",
                   '0' when others;  
   with err_int select
        err <= '0' when 'U',
                err_int when others;
process (clk) 
begin 
    if (reset = '1') then
        state <= INIT;
    elsif (clk'event and clk = '1') then
        case state is
            when INIT  => if (calc = '1') then
                            state <= LOAD;
                          else 
                            state <= INIT;
                          end if;
            when LOAD  => state <= CALC1; 
            when CALC1 => if (zQ = '1') then
                            state <= LOAD;
                          else
                            state <= CALC1;
                          end if;
        end case;
    end if;
end process;

process (state)
begin
        case state is
            when INIT => reg_en <= '0'; count_en <= '0'; sclr <= '0'; go <= '0';
            when LOAD => reg_en <= '1'; count_en <= '1'; sclr <= '0'; go <= '1';
            when CALC1 => if (zQ = '1') then
                            sclr <= '1'; reg_en <= '0'; count_en <= '0';
                          else
                            sclr <= '0'; reg_en <= '0'; count_en <= '1';
                          end if;
                          go <= '0';
        end case;
end process;
end Structural;
