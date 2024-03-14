----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:32:48 02/26/2024 
-- Design Name: 
-- Module Name:    RegistoFlags - Behavioral 
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

entity RegistoFlags is
    Port ( E_FLAGS : in  STD_LOGIC_VECTOR (4 downto 0);
           ESCR_R : in  STD_LOGIC_VECTOR (1 downto 0);
           SEL_FLAG : in  STD_LOGIC_VECTOR (2 downto 0);
           clk : in  STD_LOGIC;
           S_FLAG : out  STD_LOGIC);
end RegistoFlags;

architecture Behavioral of RegistoFlags is

begin
	process(E_FLAGS, ESCR_R, SEL_FLAG, clk)
	
	variable registo: STD_LOGIC_VECTOR (4 downto 0);
	
	begin
		if rising_edge(clk) then
			if ESCR_R(1) = '1' then
				registo := E_FLAGS;
			end if;
		end if;
		
		case SEL_FLAG is
			when "000" =>
				S_FLAG <= registo(0);
			when "001" =>
				S_FLAG <= registo(1);
			when "010" =>
				S_FLAG <= registo(2);
			when "011" =>
				S_FLAG <= registo(3);
			when "100" =>
				S_FLAG <= registo(4);
			when others =>
				S_FLAG <= 'X';
		end case;
		
	end process;

end Behavioral;