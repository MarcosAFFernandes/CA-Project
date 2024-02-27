----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:05:08 02/26/2024 
-- Design Name: 
-- Module Name:    ROM - Behavioral 
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

entity ROM is
    Port ( opcode : in  STD_LOGIC_VECTOR (4 downto 0);
           WR : out  STD_LOGIC;
           ESCR_P : out  STD_LOGIC;
           SEL_Dados : out  STD_LOGIC_VECTOR (1 downto 0);
           ESCR_R : out  STD_LOGIC_VECTOR (1 downto 0);
           SEL_ALU : out  STD_LOGIC_VECTOR (3 downto 0);
           SEL_FLAG : out  STD_LOGIC_VECTOR (2 downto 0);
           SEL_PC : out  STD_LOGIC_VECTOR (2 downto 0));
end ROM;

architecture Behavioral of ROM is

begin
	process (opcode)
	begin 
		-- LDP Ri
		if opcode = "00000" then
			SEL_ALU <= "XXXX"; ESCR_P <= '0'; SEL_Dados <= "01"; ESCR_R <= "01"; 
			WR <= '0'; SEL_PC <= "000"; SEL_FLAG <= "XXX";
		-- STP Ri
		elsif opcode = "00001" then 
			SEL_ALU <= "XXXX"; ESCR_P <= '1'; SEL_Dados <= "XX"; ESCR_R <= "00"; 
			WR <= '0'; SEL_PC <= "000"; SEL_FLAG <= "XXX";
		-- LD Ri, constante
		elsif opcode = "00010" then
			SEL_ALU <= "XXXX"; ESCR_P <= '0'; SEL_Dados <= "11"; ESCR_R <= "01"; 
			WR <= '0'; SEL_PC <= "000"; SEL_FLAG <= "XXX";
		-- LD Ri, [constante]
		elsif opcode = "00011" then 
			SEL_ALU <= "XXXX"; ESCR_P <= '0'; SEL_Dados <= "10"; ESCR_R <= "01"; 
			WR <= '0'; SEL_PC <= "000"; SEL_FLAG <= "XXX";
		-- ST [constante], Ri
		elsif opcode = "00100" then 
			SEL_ALU <= "XXXX"; ESCR_P <= '0'; SEL_Dados <= "XX"; ESCR_R <= "00"; 
			WR <= '1'; SEL_PC <= "000"; SEL_FLAG <= "XXX";
		-- ADD Ri, Rj 
		elsif opcode = "00101" then
			SEL_ALU <= "0000"; ESCR_P <= '0'; SEL_Dados <= "00"; ESCR_R <= "01"; 
			WR <= '0'; SEL_PC <= "000"; SEL_FLAG <= "XXX";
		-- SUB Ri, Rj 
		elsif opcode = "00110" then 
			SEL_ALU <= "0001"; ESCR_P <= '0'; SEL_Dados <= "00"; ESCR_R <= "01"; 
			WR <= '0'; SEL_PC <= "000"; SEL_FLAG <= "XXX";
		-- AND Ri, Rj 
		elsif opcode = "00111" then 
			SEL_ALU <= "0010"; ESCR_P <= '0'; SEL_Dados <= "00"; ESCR_R <= "01"; 
			WR <= '0'; SEL_PC <= "000"; SEL_FLAG <= "XXX";
		-- NAND Ri, Rj  
		elsif opcode = "01000" then 
			SEL_ALU <= "0011"; ESCR_P <= '0'; SEL_Dados <= "00"; ESCR_R <= "01"; 
			WR <= '0'; SEL_PC <= "000"; SEL_FLAG <= "XXX";
		-- OR Ri, Rj 
		elsif opcode = "01001" then 
			SEL_ALU <= "0100"; ESCR_P <= '0'; SEL_Dados <= "00"; ESCR_R <= "01"; 
			WR <= '0'; SEL_PC <= "000"; SEL_FLAG <= "XXX";
		-- NOR Ri, Rj
		elsif opcode = "01010" then 
			SEL_ALU <= "0101"; ESCR_P <= '0'; SEL_Dados <= "00"; ESCR_R <= "01"; 
			WR <= '0'; SEL_PC <= "000"; SEL_FLAG <= "XXX";
		-- XOR Ri, Rj 
		elsif opcode = "01011" then 
			SEL_ALU <= "0110"; ESCR_P <= '0'; SEL_Dados <= "00"; ESCR_R <= "01"; 
			WR <= '0'; SEL_PC <= "000"; SEL_FLAG <= "XXX";
		-- XNOR Ri, Rj
		elsif opcode = "01100" then 
			SEL_ALU <= "0111"; ESCR_P <= '0'; SEL_Dados <= "00"; ESCR_R <= "01"; 
			WR <= '0'; SEL_PC <= "000"; SEL_FLAG <= "XXX";
		-- CMP Ri, Rj
		elsif opcode = "01101" then 
			SEL_ALU <= "1000"; ESCR_P <= '0'; SEL_Dados <= "XX"; ESCR_R <= "10"; 
			WR <= '0'; SEL_PC <= "000"; SEL_FLAG <= "XXX";
		-- JL constante
		elsif opcode = "01110" then 
			SEL_ALU <= "XXXX"; ESCR_P <= '0'; SEL_Dados <= "XX"; ESCR_R <= "00"; 
			WR <= '0'; SEL_PC <= "010"; SEL_FLAG <= "000";
		-- JLE constante
		elsif opcode = "01111" then 
			SEL_ALU <= "XXXX"; ESCR_P <= '0'; SEL_Dados <= "XX"; ESCR_R <= "00"; 
			WR <= '0'; SEL_PC <= "010"; SEL_FLAG <= "001";
		-- JE constante
		elsif opcode = "10000" then 
			SEL_ALU <= "XXXX"; ESCR_P <= '0'; SEL_Dados <= "XX"; ESCR_R <= "00"; 
			WR <= '0'; SEL_PC <= "010"; SEL_FLAG <= "010";
		-- JGE constante 
		elsif opcode = "10001" then 
			SEL_ALU <= "XXXX"; ESCR_P <= '0'; SEL_Dados <= "XX"; ESCR_R <= "00"; 
			WR <= '0'; SEL_PC <= "010"; SEL_FLAG <= "011";
		-- JG constante 
		elsif opcode = "10010" then 
			SEL_ALU <= "XXXX"; ESCR_P <= '0'; SEL_Dados <= "XX"; ESCR_R <= "00"; 
			WR <= '0'; SEL_PC <= "010"; SEL_FLAG <= "100";
		-- JMP constante
		elsif opcode = "10011" then 
			SEL_ALU <= "XXXX"; ESCR_P <= '0'; SEL_Dados <= "XX"; ESCR_R <= "00"; 
			WR <= '0'; SEL_PC <= "001"; SEL_FLAG <= "XXX";
		-- JZ Ri, constante 
		elsif opcode = "10100" then 
			SEL_ALU <= "XXXX"; ESCR_P <= '0'; SEL_Dados <= "XX"; ESCR_R <= "00"; 
			WR <= '0'; SEL_PC <= "100"; SEL_FLAG <= "XXX";
		-- JN Ri, constante 
		elsif opcode = "10101" then 
			SEL_ALU <= "XXXX"; ESCR_P <= '0'; SEL_Dados <= "XX"; ESCR_R <= "00"; 
			WR <= '0'; SEL_PC <= "011"; SEL_FLAG <= "XXX";
		-- NOP 
		else 
			SEL_ALU <= "XXXX"; ESCR_P <= '0'; SEL_Dados <= "XX"; ESCR_R <= "00"; 
			WR <= '0'; SEL_PC <= "000"; SEL_FLAG <= "XXX";
		end if; 
	end process;

end Behavioral;