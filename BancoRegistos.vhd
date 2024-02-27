----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:24:49 02/25/2024 
-- Design Name: 
-- Module Name:    BancoRegistos - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

entity BancoRegistos is
    Port ( Dados_R : in  STD_LOGIC_VECTOR (7 downto 0);
           SEL_R : in  STD_LOGIC_VECTOR (5 downto 0);
           clk : in  STD_LOGIC;
           ESCR_R : in  STD_LOGIC_VECTOR (1 downto 0);
           Operando1 : out  STD_LOGIC_VECTOR (7 downto 0);
           Operando2 : out  STD_LOGIC_VECTOR (7 downto 0));
end BancoRegistos;

architecture Behavioral of BancoRegistos is

begin
	process (Dados_R, SEL_R, clk, ESCR_R)
	type reg_array is array (0 to 7) of STD_LOGIC_VECTOR (7 downto 0);
	variable registos : reg_array;
	
	begin
	
		if ESCR_R(0) = '1' then 
			if rising_edge(clk) then 
				case SEL_R(2 downto 0) is
					when "000" =>
						registos(0) := Dados_R;
					when "001" =>
						registos(1) := Dados_R;
					when "010" =>
						registos(2) := Dados_R;
					when "011" =>
						registos(3) := Dados_R;
					when "100" =>
						registos(4) := Dados_R;
					when "101" =>
						registos(5) := Dados_R;
					when "110" =>
						registos(6) := Dados_R;
					when "111" =>
						registos(7) := Dados_R;
				end case;
			end if;
		end if;
		
		Operando1 <= registos(TO_INTEGER(unsigned(SEL_R(2 downto 0))));
		Operando2 <= registos(TO_INTEGER(unsigned(SEL_R(5 downto 3))));
	
	end process;

end Behavioral;