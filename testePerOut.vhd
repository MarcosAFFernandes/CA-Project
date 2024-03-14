--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:11:17 03/12/2024
-- Design Name:   
-- Module Name:   C:/Xilinx/14.7/ISE_DS/ISE/CA-Project/testePerOut.vhd
-- Project Name:  CA-Project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PerifericoSaida
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
 
ENTITY testePerOut IS
END testePerOut;
 
ARCHITECTURE behavior OF testePerOut IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PerifericoSaida
    PORT(
         ESCR_P : IN  std_logic;
         Operando1 : IN  std_logic_vector(7 downto 0);
         clk : IN  std_logic;
         POUT : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ESCR_P : std_logic := '0';
   signal Operando1 : std_logic_vector(7 downto 0) := (others => '0');
   signal clk : std_logic := '0';

 	--Outputs
   signal POUT : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PerifericoSaida PORT MAP (
          ESCR_P => ESCR_P,
          Operando1 => Operando1,
          clk => clk,
          POUT => POUT
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

      ESCR_P <= '1';
		
		Operando1 <= "00000011";
		
		wait for 100 ns;
		
		ESCR_P <= '0';
		
		wait for 100 ns;
		
		ESCR_P <= '1';
		
		Operando1 <= "00000010";
		
      wait;
   end process;

END;
