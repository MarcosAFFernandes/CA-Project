----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:11:21 02/25/2024 
-- Design Name: 
-- Module Name:    MUX_R - Behavioral 
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

entity MUX_R is
    Port ( Constante : in  STD_LOGIC_VECTOR (7 downto 0);
           Dados_M : in  STD_LOGIC_VECTOR (7 downto 0);
           Dados_IN : in  STD_LOGIC_VECTOR (7 downto 0);
           Resultado : in  STD_LOGIC_VECTOR (7 downto 0);
           SEL_Dados : in  STD_LOGIC_VECTOR (1 downto 0);
           Dados_R : out  STD_LOGIC_VECTOR (7 downto 0));
end MUX_R;

architecture Behavioral of MUX_R is

begin

	process (Constante, Dados_M, Dados_IN, Resultado, SEL_Dados)
	begin
		case SEL_Dados is 
			when "00" =>
				Dados_R <= Resultado;
			when "01" =>
				Dados_R <= Dados_IN;
			when "10" =>
				Dados_R <= Dados_M;
			when "11" =>
				Dados_R <= Constante;
			when others =>
				Dados_R <= (others => 'X');
		end case;
	end process;

end Behavioral;