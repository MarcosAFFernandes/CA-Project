----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:06:58 02/26/2024 
-- Design Name: 
-- Module Name:    PC - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PC is
    Port ( Reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           ESCR_PC : in  STD_LOGIC;
           Constante : in  STD_LOGIC_VECTOR (7 downto 0);
           Endereco : out  STD_LOGIC_VECTOR (7 downto 0));
end PC;

architecture Behavioral of PC is

begin
	process (Reset, clk, ESCR_PC, Constante)
	variable contagem : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
	begin
		if rising_edge(clk) then
			if Reset = '1' then
				contagem := "00000000";
			else
				if ESCR_PC = '0' then 
					contagem := contagem + "00000001";
				else
					contagem := Constante;
				end if;
			end if;
			Endereco <= contagem;
		end if;
	end process;
end Behavioral;