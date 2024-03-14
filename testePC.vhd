--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:25:39 03/12/2024
-- Design Name:   
-- Module Name:   C:/Xilinx/14.7/ISE_DS/ISE/CA-Project/testePC.vhd
-- Project Name:  CA-Project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PC
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
 
ENTITY testePC IS
END testePC;
 
ARCHITECTURE behavior OF testePC IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PC
    PORT(
         Reset : IN  std_logic;
         clk : IN  std_logic;
         ESCR_PC : IN  std_logic;
         Constante : IN  std_logic_vector(7 downto 0);
         Endereco : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Reset : std_logic := '0';
   signal clk : std_logic := '0';
   signal ESCR_PC : std_logic := '0';
   signal Constante : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal Endereco : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PC PORT MAP (
          Reset => Reset,
          clk => clk,
          ESCR_PC => ESCR_PC,
          Constante => Constante,
          Endereco => Endereco
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		Constante <= "00010000";
		
		ESCR_PC <= '0';
		
		wait for 10 ns;
		
		ESCR_PC <= '1';
		
		wait for 100 ns;
		
		Reset <= '1';

      wait;
   end process;

END;
