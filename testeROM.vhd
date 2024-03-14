--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:42:28 03/12/2024
-- Design Name:   
-- Module Name:   C:/Xilinx/14.7/ISE_DS/ISE/CA-Project/testeROM.vhd
-- Project Name:  CA-Project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ROM
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testeROM IS
END testeROM;
 
ARCHITECTURE behavior OF testeROM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ROM
    PORT(
         opcode : IN  std_logic_vector(4 downto 0);
         WR : OUT  std_logic;
         ESCR_P : OUT  std_logic;
         SEL_Dados : OUT  std_logic_vector(1 downto 0);
         ESCR_R : OUT  std_logic_vector(1 downto 0);
         SEL_ALU : OUT  std_logic_vector(3 downto 0);
         SEL_FLAG : OUT  std_logic_vector(2 downto 0);
         SEL_PC : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal opcode : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal WR : std_logic;
   signal ESCR_P : std_logic;
   signal SEL_Dados : std_logic_vector(1 downto 0);
   signal ESCR_R : std_logic_vector(1 downto 0);
   signal SEL_ALU : std_logic_vector(3 downto 0);
   signal SEL_FLAG : std_logic_vector(2 downto 0);
   signal SEL_PC : std_logic_vector(2 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ROM PORT MAP (
          opcode => opcode,
          WR => WR,
          ESCR_P => ESCR_P,
          SEL_Dados => SEL_Dados,
          ESCR_R => ESCR_R,
          SEL_ALU => SEL_ALU,
          SEL_FLAG => SEL_FLAG,
          SEL_PC => SEL_PC
        );

   -- Clock process definitions

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      opcode <= "00000"; wait for 50ns;
		opcode <= "00001"; wait for 50ns;
		opcode <= "00010"; wait for 50ns;
		opcode <= "00011"; wait for 50ns;
		opcode <= "00100"; wait for 50ns;
		opcode <= "00101"; wait for 50ns;
		opcode <= "00110"; wait for 50ns;
		opcode <= "00111"; wait for 50ns;
		opcode <= "01000"; wait for 50ns;
		opcode <= "01001"; wait for 50ns;
		opcode <= "01010"; wait for 50ns;
		opcode <= "01011"; wait for 50ns;
		opcode <= "01100"; wait for 50ns;
		opcode <= "01101"; wait for 50ns;
		opcode <= "01110"; wait for 50ns;
		opcode <= "01111"; wait for 50ns;
		opcode <= "10000"; wait for 50ns;
		opcode <= "10001"; wait for 50ns;
		opcode <= "10010"; wait for 50ns;
		opcode <= "10011"; wait for 50ns;
		opcode <= "10100"; wait for 50ns;
		opcode <= "10101"; wait for 50ns;
		opcode <= "10110"; wait for 50ns;
		


      wait;
   end process;

END;
