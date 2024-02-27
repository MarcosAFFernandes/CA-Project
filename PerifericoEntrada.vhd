----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:04:33 02/25/2024 
-- Design Name: 
-- Module Name:    PerifericoEntrada - Behavioral 
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

entity PerifericoEntrada is
    Port ( PIN : in  STD_LOGIC_VECTOR (7 downto 0);
           ESCR_P : in  STD_LOGIC;
           Dados_IN : out  STD_LOGIC_VECTOR (7 downto 0));
end PerifericoEntrada;

architecture Behavioral of PerifericoEntrada is

begin

	process (PIN, ESCR_P)
	begin
		if ESCR_P = '0' then
			Dados_IN <= PIN;
		end if;
	end process;

end Behavioral;