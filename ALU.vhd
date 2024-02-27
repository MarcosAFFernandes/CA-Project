----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:19:18 02/26/2024 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use IEEE.STD_LOGIC_SIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity ALU is
    Port ( Operando1 : in  STD_LOGIC_VECTOR (7 downto 0);
           Operando2 : in  STD_LOGIC_VECTOR (7 downto 0);
           SEL_ALU : in  STD_LOGIC_VECTOR (3 downto 0);
           Resultado : out  STD_LOGIC_VECTOR (7 downto 0);
           E_FLAG : out  STD_LOGIC_VECTOR (4 downto 0));
end ALU;

architecture Behavioral of ALU is
begin
	process(Operando1, Operando2, SEL_ALU)
	begin
		if SEL_ALU = "0000" then
			Resultado <= (Operando1 + Operando2);
		elsif SEL_ALU = "0001" then
			Resultado <= (Operando1 - Operando2);
		elsif SEL_ALU = "0010" then
			Resultado <= (Operando1 AND Operando2);
		elsif SEL_ALU = "0011" then
			Resultado <= (Operando1 NAND Operando2);
		elsif SEL_ALU = "0100" then
			Resultado <= (Operando1 OR Operando2);
		elsif SEL_ALU = "0101" then
			Resultado <= (Operando1 NOR Operando2);
		elsif SEL_ALU = "0110" then
			Resultado <= (Operando1 XOR Operando2);
		elsif SEL_ALU = "0111" then
			Resultado <= (Operando1 XNOR Operando2);
		elsif SEL_ALU = "1000" then
			if (Operando1 < Operando2) then 
				E_FLAG(0) <= '1';
			else
				E_FLAG(0) <= '0';
			end if;
			
			if (Operando1 <= Operando2) then 
				E_FLAG(1) <= '1';
			else
				E_FLAG(1) <= '0';
			end if;
			
			if (Operando1 = Operando2) then
				E_FLAG(2) <= '1';
			else
				E_FLAG(2) <= '0';
			end if;
			
			if (Operando1 >= Operando2) then
				E_FLAG(3) <= '1';
			else
				E_FLAG(3) <= '0';
			end if;

			if (Operando1 > Operando2) then
				E_FLAG(4) <= '1';
			else
				E_FLAG(4) <= '0';
			end if;
		end if;
	end process;

end Behavioral;