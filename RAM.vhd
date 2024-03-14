----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:37:54 02/26/2024 
-- Design Name: 
-- Module Name:    RAM - Behavioral 
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

entity RAM is
    Port ( clk : in  STD_LOGIC;
           Operando1 : in  STD_LOGIC_VECTOR (7 downto 0);
           WR : in  STD_LOGIC;
           Constante : in  STD_LOGIC_VECTOR (7 downto 0);
           Dados_M : out  STD_LOGIC_VECTOR (7 downto 0));
end RAM;

architecture Behavioral of RAM is

type mem_array is array (0 to 255) of STD_LOGIC_VECTOR(7 downto 0);
signal memoria : mem_array;

begin
	process (clk, Operando1, WR, Constante)
	begin
		if rising_edge(clk) then
			if WR = '1' then 
				memoria(TO_INTEGER(unsigned(Constante))) <= Operando1;
			end if;
		end if;
		
		Dados_M <= memoria(TO_INTEGER(unsigned(Constante)));
		
	end process;
end Behavioral;