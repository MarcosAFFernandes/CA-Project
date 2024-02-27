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
	begin
		if rising_edge(clk) then
			if ESCR_R(1) = '1' then
				if SEL_FLAG = "000" then
					S_FLAG <= E_FLAGS(0);
				elsif SEL_FLAG = "001" then
					S_FLAG <= E_FLAGS(1);
				elsif SEL_FLAG = "010" then
					S_FLAG <= E_FLAGS(2);
				elsif SEL_FLAG = "011" then
					S_FLAG <= E_FLAGS(3);
				elsif SEL_FLAG = "100" then
					S_FLAG <= E_FLAGS(4);
				end if;
			end if;
		end if;
	end process;

end Behavioral;