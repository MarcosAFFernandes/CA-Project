--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:33:14 03/12/2024
-- Design Name:   
-- Module Name:   C:/Xilinx/14.7/ISE_DS/ISE/CA-Project/testeMuxPC.vhd
-- Project Name:  CA-Project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MUX_PC
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
 
ENTITY testeMuxPC IS
END testeMuxPC;
 
ARCHITECTURE behavior OF testeMuxPC IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX_PC
    PORT(
         S_FLAG : IN  std_logic;
         Operando1 : IN  std_logic_vector(7 downto 0);
         SEL_PC : IN  std_logic_vector(2 downto 0);
         ESCR_PC : OUT  std_logic;
         um : IN  std_logic;
         zero : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal S_FLAG : std_logic := '0';
   signal Operando1 : std_logic_vector(7 downto 0) := (others => '0');
   signal SEL_PC : std_logic_vector(2 downto 0) := (others => '0');
   signal um : std_logic := '0';
   signal zero : std_logic := '0';

 	--Outputs
   signal ESCR_PC : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX_PC PORT MAP (
          S_FLAG => S_FLAG,
          Operando1 => Operando1,
          SEL_PC => SEL_PC,
          ESCR_PC => ESCR_PC,
          um => um,
          zero => zero
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		zero <= '0';
		um <= '1';
		
		S_FLAG <= '1';
		
		Operando1 <= "00000000";
		
		SEL_PC <= "000"; wait for 50 ns;
		SEL_PC <= "001"; wait for 50 ns;
		SEL_PC <= "010"; wait for 50 ns;
		SEL_PC <= "011"; wait for 50 ns;
		SEL_PC <= "100"; wait for 50 ns;
		
		

      wait;
   end process;

END;
