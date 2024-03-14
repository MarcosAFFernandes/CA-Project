----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:39:57 02/26/2024 
-- Design Name: 
-- Module Name:    MUX_PC - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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

entity MUX_PC is
    Port ( S_FLAG : in  STD_LOGIC;
           Operando1 : in  STD_LOGIC_VECTOR (7 downto 0);
           SEL_PC : in  STD_LOGIC_VECTOR (2 downto 0);
           ESCR_PC : out  STD_LOGIC;
           um : in  STD_LOGIC;
           zero : in  STD_LOGIC);
end MUX_PC;

architecture Behavioral of MUX_PC is

begin
	process (S_FLAG, Operando1, SEL_PC, um, zero)
	begin
		if SEL_PC = "000" then 
			ESCR_PC <= zero;
		elsif SEL_PC = "001" then
			ESCR_PC <= um;
		elsif SEL_PC = "010" then
			ESCR_PC <= S_FLAG;
		elsif SEL_PC = "011" then
			ESCR_PC <= Operando1(7);
		elsif SEL_PC = "100" then
			ESCR_PC <= NOT(Operando1(0) or Operando1(1) or Operando1(2) or Operando1(3) or Operando1(4) or Operando1(5) or Operando1(6) or Operando1(7));
		end if;
	end process;

end Behavioral;