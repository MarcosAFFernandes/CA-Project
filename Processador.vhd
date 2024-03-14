library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Processador is
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
end Processador;

architecture Struct of Processador is

Component PerifericoEntrada is
	Port ( PIN : in  STD_LOGIC_VECTOR (7 downto 0);
          ESCR_P : in  STD_LOGIC;
          Dados_IN : out  STD_LOGIC_VECTOR (7 downto 0));
end Component;

Component PerifericoSaida is
    Port ( ESCR_P : in  STD_LOGIC;
           Operando1 : in  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           POUT : out  STD_LOGIC_VECTOR (7 downto 0));
end Component;

Component MUX_R is
    Port ( Constante : in  STD_LOGIC_VECTOR (7 downto 0);
           Dados_M : in  STD_LOGIC_VECTOR (7 downto 0);
           Dados_IN : in  STD_LOGIC_VECTOR (7 downto 0);
           Resultado : in  STD_LOGIC_VECTOR (7 downto 0);
           SEL_Dados : in  STD_LOGIC_VECTOR (1 downto 0);
           Dados_R : out  STD_LOGIC_VECTOR (7 downto 0));
end Component;

Component BancoRegistos is
    Port ( Dados_R : in  STD_LOGIC_VECTOR (7 downto 0);
           SEL_R : in  STD_LOGIC_VECTOR (5 downto 0);
           clk : in  STD_LOGIC;
           ESCR_R : in  STD_LOGIC_VECTOR (1 downto 0);
           Operando1 : out  STD_LOGIC_VECTOR (7 downto 0);
           Operando2 : out  STD_LOGIC_VECTOR (7 downto 0));
end Component;

Component  ALU is
    Port ( Operando1 : in  STD_LOGIC_VECTOR (7 downto 0);
           Operando2 : in  STD_LOGIC_VECTOR (7 downto 0);
           SEL_ALU : in  STD_LOGIC_VECTOR (3 downto 0);
           Resultado : out  STD_LOGIC_VECTOR (7 downto 0);
           E_FLAG : out  STD_LOGIC_VECTOR (4 downto 0));
end Component;

Component RegistoFlags is
    Port ( E_FLAGS : in  STD_LOGIC_VECTOR (4 downto 0);
           ESCR_R : in  STD_LOGIC_VECTOR (1 downto 0);
           SEL_FLAG : in  STD_LOGIC_VECTOR (2 downto 0);
           clk : in  STD_LOGIC;
           S_FLAG : out  STD_LOGIC);
end Component;

Component MUX_PC is
    Port ( S_FLAG : in  STD_LOGIC;
           Operando1 : in  STD_LOGIC_VECTOR (7 downto 0);
           SEL_PC : in  STD_LOGIC_VECTOR (2 downto 0);
           ESCR_PC : out  STD_LOGIC;
           um : in  STD_LOGIC;
           zero : in  STD_LOGIC);
end Component;

Component PC is
    Port ( Reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           ESCR_PC : in  STD_LOGIC;
           Constante : in  STD_LOGIC_VECTOR (7 downto 0);
           Endereco : out  STD_LOGIC_VECTOR (7 downto 0));
end Component;

Component ROM is
    Port ( opcode : in  STD_LOGIC_VECTOR (4 downto 0);
           WR : out  STD_LOGIC;
           ESCR_P : out  STD_LOGIC;
           SEL_Dados : out  STD_LOGIC_VECTOR (1 downto 0);
           ESCR_R : out  STD_LOGIC_VECTOR (1 downto 0);
           SEL_ALU : out  STD_LOGIC_VECTOR (3 downto 0);
           SEL_FLAG : out  STD_LOGIC_VECTOR (2 downto 0);
           SEL_PC : out  STD_LOGIC_VECTOR (2 downto 0));
end Component;

signal Dados_IN, oper2, Resultado, Dados_R, oper1 : STD_LOGIC_VECTOR (7 downto 0);
signal E_FLAGS : STD_LOGIC_VECTOR (4 downto 0);
signal SEL_ALU : STD_LOGIC_VECTOR (3 downto 0);
signal SEL_FLAG, SEL_PC : STD_LOGIC_VECTOR (2 downto 0);
signal SEL_Dados, ESCR_R : STD_LOGIC_VECTOR (1 downto 0);
signal ESCR_P, S_FLAG, ESCR_PC : STD_LOGIC;

begin

perifericosIn : PerifericoEntrada Port Map (PIN, ESCR_P, Dados_IN);
perifericosOut : PerifericoSaida Port Map (ESCR_P, oper1, clk, POUT);
muxR : mux_R Port Map (Constante_IN, Dados_M, Dados_IN, Resultado, SEL_Dados, Dados_R);
bancoReg : BancoRegistos Port Map (Dados_R, SEL_R, clk, ESCR_R, oper1, oper2);
A_L_U : ALU Port Map (oper1, oper2, SEL_ALU, Resultado, E_FLAGS);
progCount : PC Port Map (reset, clk, ESCR_PC, Constante_IN, Endereco);
romDesc: ROM Port Map (opcode, WR, ESCR_P, SEL_Dados, ESCR_R, SEL_ALU, SEL_FLAG, SEL_PC);
regFlags : RegistoFlags Port Map (E_FLAGS, ESCR_R, SEL_FLAG, clk, S_FLAG);
muxPC : MUX_PC Port Map (S_FLAG, oper1, SEL_PC, ESCR_PC, '1', '0');

Constante_OUT <= Constante_IN;
Operando1 <= oper1;

end Struct;