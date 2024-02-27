----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:27:49 02/26/2024 
-- Design Name: 
-- Module Name:    MemoriaInstrucoes - Behavioral 
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

entity MemoriaInstrucoes is
    Port ( Endereco : in  STD_LOGIC_VECTOR (7 downto 0);
           opcode : out  STD_LOGIC_VECTOR (4 downto 0);
           SEL_R : out  STD_LOGIC_VECTOR (5 downto 0);
           Constante : out  STD_LOGIC_VECTOR (7 downto 0));
end MemoriaInstrucoes;

architecture Behavioral of MemoriaInstrucoes is

begin
	process (Endereco)
	type mem_array is array (0 to 255) of STD_LOGIC_VECTOR(18 downto 0);
	variable instrucoes : mem_array;
	begin
		
	
	end process;

end Behavioral;