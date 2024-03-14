library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PlacaMae is
    Port ( PIN : in  STD_LOGIC_VECTOR (7 downto 0);
           POUT : out  STD_LOGIC_VECTOR (7 downto 0);
           reset, clock : in  STD_LOGIC);
end PlacaMae;

architecture Struct of PlacaMae is

Component MemoriaInstrucoes is
    Port ( Endereco : in  STD_LOGIC_VECTOR (7 downto 0);
           opcode : out  STD_LOGIC_VECTOR (4 downto 0);
           SEL_R : out  STD_LOGIC_VECTOR (5 downto 0);
           Constante : out  STD_LOGIC_VECTOR (7 downto 0));
end Component;

Component RAM is
    Port ( clk : in  STD_LOGIC;
           Operando1 : in  STD_LOGIC_VECTOR (7 downto 0);
           WR : in  STD_LOGIC;
           Constante : in  STD_LOGIC_VECTOR (7 downto 0);
           Dados_M : out  STD_LOGIC_VECTOR (7 downto 0));
end Component;

Component Processador is
    Port ( reset : in  STD_LOGIC;
           Endereco : out  STD_LOGIC_VECTOR (7 downto 0);
           opcode : in  STD_LOGIC_VECTOR (4 downto 0);
           SEL_R : in  STD_LOGIC_VECTOR (5 downto 0);
           Constante_IN : in  STD_LOGIC_VECTOR (7 downto 0);
           Constante_OUT : out  STD_LOGIC_VECTOR (7 downto 0);
           WR : out  STD_LOGIC;
			  clk : in  STD_LOGIC;
           Dados_M : in  STD_LOGIC_VECTOR (7 downto 0);
           Operando1 : out  STD_LOGIC_VECTOR (7 downto 0);
           PIN : in  STD_LOGIC_VECTOR (7 downto 0);
           POUT : out  STD_LOGIC_VECTOR (7 downto 0));
end Component;

signal Endereco, Operando1, Constante, Constante_OUT, Dados_M : STD_LOGIC_VECTOR (7 downto 0);
signal SEL_R : STD_LOGIC_VECTOR (5 downto 0);
signal opcode : STD_LOGIC_VECTOR (4 downto 0);
signal WR: STD_LOGIC;

begin

MemInst : MemoriaInstrucoes Port Map (Endereco, opcode, SEL_R, Constante);
MemDados : RAM Port Map (clock, Operando1, WR, Constante_OUT, Dados_M);
processor : Processador Port Map (reset, Endereco, opcode, SEL_R, Constante, Constante_OUT, WR, clock, Dados_M, Operando1, PIN, POUT);

end Struct;