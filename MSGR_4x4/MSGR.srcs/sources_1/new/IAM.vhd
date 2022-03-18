----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/07/2019 05:04:46 PM
-- Design Name: 
-- Module Name: IAM - Behavioral
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

entity IAM is
    Port ( clk : in STD_LOGIC;
           in1 : in STD_LOGIC_VECTOR (32 downto 0);
           in2 : in STD_LOGIC_VECTOR (32 downto 0);
           in3 : in STD_LOGIC_VECTOR (32 downto 0);
           in4 : in STD_LOGIC_VECTOR (32 downto 0);
           out1 : inout STD_LOGIC_VECTOR (31 downto 0);
           out2 : inout STD_LOGIC_VECTOR (31 downto 0);
           out3 : inout STD_LOGIC_VECTOR (31 downto 0);
           out4 : inout STD_LOGIC_VECTOR (31 downto 0);
           err : out STD_LOGIC);
end IAM;

architecture Behavioral of IAM is

component bs_boundary_cell is
    Port ( clk : in STD_LOGIC;
           Xin : in STD_LOGIC_VECTOR (32 downto 0);
           Yout : out STD_LOGIC_VECTOR (31 downto 0);
           err : out STD_LOGIC);
end component;

component bs_internal_cell is
    Port ( Xin : in STD_LOGIC_VECTOR (32 downto 0);
           Yin : in STD_LOGIC_VECTOR (31 downto 0);
           Xout : out STD_LOGIC_VECTOR (32 downto 0);
           Yout : out STD_LOGIC_VECTOR (31 downto 0);
           clk : in STD_LOGIC;
           err : out STD_LOGIC);
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

type state_type is (LOAD, CALC);
signal state: state_type := LOAD;

signal reg_en: STD_LOGIC := '0';

-- Pipeline Registers
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

signal Y1reg_in: STD_LOGIC_VECTOR (31 downto 0);
signal Y1reg_out: STD_LOGIC_VECTOR (31 downto 0);
signal Y2reg_in: STD_LOGIC_VECTOR (31 downto 0);
signal Y2reg_out: STD_LOGIC_VECTOR (31 downto 0);
signal Y3reg_in: STD_LOGIC_VECTOR (31 downto 0);
signal Y3reg_out: STD_LOGIC_VECTOR (31 downto 0);
signal Y4reg_in: STD_LOGIC_VECTOR (31 downto 0);
signal Y4reg_out: STD_LOGIC_VECTOR (31 downto 0);
signal Y5reg_in: STD_LOGIC_VECTOR (31 downto 0);
signal Y5reg_out: STD_LOGIC_VECTOR (31 downto 0);
signal Y6reg_in: STD_LOGIC_VECTOR (31 downto 0);
signal Y6reg_out: STD_LOGIC_VECTOR (31 downto 0);

signal out1reg_in: STD_LOGIC_VECTOR (31 downto 0);
signal out2reg_in: STD_LOGIC_VECTOR (31 downto 0);
signal out3reg_in: STD_LOGIC_VECTOR (31 downto 0);
signal out4reg_in: STD_LOGIC_VECTOR (31 downto 0);

signal in1reg_out: STD_LOGIC_VECTOR (32 downto 0);
signal in2reg_out: STD_LOGIC_VECTOR (32 downto 0);
signal in3reg_out: STD_LOGIC_VECTOR (32 downto 0);
signal in4reg_out: STD_LOGIC_VECTOR (32 downto 0);

signal count_en: STD_LOGIC := '0';
signal sclr: STD_LOGIC := '0';
signal zQ: STD_LOGIC := '0';

signal go: STD_LOGIC;

signal overflow: STD_LOGIC_VECTOR(9 downto 0);
signal err_en: STD_LOGIC;
signal err_int:STD_LOGIC;

begin

B1: bs_boundary_cell
    port map( clk => clk,
              Xin => in1reg_out, 
              Yout => Y1reg_in,
              err => overflow(0));
              
B2: bs_boundary_cell
    port map( clk => clk,
              Xin => X1reg_out, 
              Yout => Y3reg_in,
              err => overflow(1));
              
B3: bs_boundary_cell
    port map( clk => clk,
              Xin => X3reg_out, 
              Yout => Y6reg_in,
              err => overflow(2));
              
B4: bs_boundary_cell
    port map( clk => clk,
              Xin => X6reg_out, 
              Yout => out4reg_in,
              err => overflow(3));
              
I1: bs_internal_cell
    port map( clk => clk,       
              Yin => Y1reg_out,
              Xin => in2reg_out,
              Yout => Y2reg_in,
              Xout => X1reg_in,
              err => overflow(4));
             
I2: bs_internal_cell
    port map( clk => clk,           
              Yin => Y2reg_out,
              Xin => in3reg_out,
              Yout => Y4reg_in,
              Xout => X2reg_in,
              err => overflow(5));
              
I3: bs_internal_cell
    port map( clk => clk,         
              Yin => Y3reg_out,
              Xin => X2reg_out,
              Yout => Y5reg_in,
              Xout => X3reg_in,
              err => overflow(6));

I4: bs_internal_cell
    port map( clk => clk,         
              Yin => Y4reg_out,
              Xin => in4reg_out,
              Yout => out1reg_in,
              Xout => X4reg_in,
              err => overflow(7));
              
I5: bs_internal_cell
    port map( clk => clk,         
              Yin => Y5reg_out,
              Xin => X4reg_out,
              Yout => out2reg_in,
              Xout => X5reg_in,
              err => overflow(8));
              
I6: bs_internal_cell
    port map( clk => clk, 
              Yin => Y6reg_out,
              Xin => X5reg_out,
              Yout => out3reg_in,
              Xout => X6reg_in,
              err => overflow(9));
              
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
    
Y1reg: reg
GENERIC MAP ( bits => 32) 
   PORT MAP (
    clk => clk,
    E => reg_en,
    D => Y1reg_in,
    Q => Y1reg_out);

Y2reg: reg
GENERIC MAP ( bits => 32) 
   PORT MAP (
    clk => clk,
    E => reg_en,
    D => Y2reg_in,
    Q => Y2reg_out);

Y3reg: reg
GENERIC MAP ( bits => 32) 
   PORT MAP (
    clk => clk,
    E => reg_en,
    D => Y3reg_in,
    Q => Y3reg_out);

Y4reg: reg
GENERIC MAP ( bits => 32) 
   PORT MAP (
    clk => clk,
    E => reg_en,
    D => Y4reg_in,
    Q => Y4reg_out);
    
Y5reg: reg
GENERIC MAP ( bits => 32) 
   PORT MAP (
    clk => clk,
    E => reg_en,
    D => Y5reg_in,
    Q => Y5reg_out);
    
Y6reg: reg
GENERIC MAP ( bits => 32) 
   PORT MAP (
    clk => clk,
    E => reg_en,
    D => Y6reg_in,
    Q => Y6reg_out);

Out1reg: reg
GENERIC MAP ( bits => 32) 
   PORT MAP (
    clk => clk,
    E => reg_en,
    D => out1reg_in,
    Q => out1);

Out2reg: reg
GENERIC MAP ( bits => 32) 
   PORT MAP (
    clk => clk,
    E => reg_en,
    D => out2reg_in,
    Q => out2);
 
Out3reg: reg
GENERIC MAP ( bits => 32) 
   PORT MAP (
    clk => clk,
    E => reg_en,
    D => out3reg_in,
    Q => out3);
    
Out4reg: reg
GENERIC MAP ( bits => 32) 
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
    if (clk'event and clk = '1') then
        case state is 
            when LOAD=> state <= CALC; 
            when CALC => if (zQ = '1') then
                            state <= LOAD;
                          else
                            state <= CALC;
                          end if;
        end case;
    end if;
end process;

process (state) 
begin
    case state is
        when LOAD => reg_en <= '1'; count_en <= '1'; sclr <= '0'; 
        when CALC => reg_en <= '0'; 
                      if (zQ = '1') then
                            sclr <= '1';  count_en <= '0'; 
                      else
                            sclr <= '0';  count_en <= '1'; 
                      end if;
    end case;
end process;

end Behavioral;
