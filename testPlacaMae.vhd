--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:15:19 03/13/2024
-- Design Name:   
-- Module Name:   C:/Xilinx/14.7/ISE_DS/ISE/CA-Project/testPlacaMae.vhd
-- Project Name:  CA-Project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PlacaMae
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
 
ENTITY testPlacaMae IS
END testPlacaMae;
 
ARCHITECTURE behavior OF testPlacaMae IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PlacaMae
    PORT(
         PIN : IN  std_logic_vector(7 downto 0);
         POUT : OUT  std_logic_vector(7 downto 0);
         reset : IN  std_logic;
         clock : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal PIN : std_logic_vector(7 downto 0) := (others => '0');
   signal reset : std_logic := '0';
   signal clock : std_logic := '0';

 	--Outputs
   signal POUT : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PlacaMae PORT MAP (
          PIN => PIN,
          POUT => POUT,
          reset => reset,
          clock => clock
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		

      reset <= '1'; wait for clock_period*2;
		reset <= '0'; PIN <= "11111111"; wait for clock_period*44; 
		reset <= '1'; wait for clock_period*2;
		reset <= '0'; PIN <= "11111110"; wait for clock_period*44; 
		reset <= '1'; wait for clock_period*2;
		reset <= '0'; PIN <= "11111101"; wait for clock_period*44; 
		reset <= '1'; wait for clock_period*2;
		reset <= '0'; PIN <= "11111100"; wait for clock_period*44; 
		reset <= '1'; wait for clock_period*2;
		reset <= '0'; PIN <= "11111011"; wait for clock_period*44; 
		reset <= '1'; wait for clock_period*2;
		reset <= '0'; PIN <= "11111010"; wait for clock_period*44; 
		reset <= '1'; wait for clock_period*2;
		reset <= '0'; PIN <= "11111001"; wait for clock_period*44; 
		reset <= '1'; wait for clock_period*2;
		reset <= '0'; PIN <= "11111000"; wait for clock_period*44; 
		reset <= '1'; wait for clock_period*2;
		reset <= '0'; PIN <= "11110111"; wait for clock_period*44; 
		reset <= '1'; wait for clock_period*2;
		reset <= '0'; PIN <= "11110110"; wait for clock_period*44; 
		reset <= '1'; wait for clock_period*2;
		reset <= '0'; PIN <= "10000000"; wait for clock_period*44; 
		reset <= '1'; wait for clock_period*2;
		reset <= '0'; PIN <= "00000000"; wait for clock_period*44;
		reset <= '1'; wait for clock_period*2;
--		reset <= '0'; PIN <= "00000001"; wait for clock_period*44;
--		reset <= '1'; wait for clock_period*2;
--		reset <= '0'; PIN <= "00000010"; wait for clock_period*44;
--		reset <= '1'; wait for clock_period*2;
--		reset <= '0'; PIN <= "00000011"; wait for clock_period*44;
--		reset <= '1'; wait for clock_period*2;
--		reset <= '0'; PIN <= "00000100"; wait for clock_period*44;
--		reset <= '1'; wait for clock_period*2;
--		reset <= '0'; PIN <= "00000101"; wait for clock_period*44;
--		reset <= '1'; wait for clock_period*2;
--		reset <= '0'; PIN <= "00000110"; wait for clock_period*44;
--		reset <= '1'; wait for clock_period*2;
--		reset <= '0'; PIN <= "00000111"; wait for clock_period*44;
--		reset <= '1'; wait for clock_period*2;
--		reset <= '0'; PIN <= "00001000"; wait for clock_period*44;
--		reset <= '1'; wait for clock_period*2;
--		reset <= '0'; PIN <= "00001001"; wait for clock_period*44;
--		reset <= '1'; wait for clock_period*2;
--		reset <= '0'; PIN <= "00001010"; wait for clock_period*44;
--		reset <= '1'; wait for clock_period*2;
--		reset <= '0'; PIN <= "00001011"; wait for clock_period*44;
--		reset <= '1'; wait for clock_period*2;
--		reset <= '0'; PIN <= "00001100"; wait for clock_period*44;
--		reset <= '1'; wait for clock_period*2;
--		reset <= '0'; PIN <= "00001101"; wait for clock_period*44;
--		reset <= '1'; wait for clock_period*2;
--		reset <= '0'; PIN <= "00001110"; wait for clock_period*44;
--		reset <= '1'; wait for clock_period*2;
--		reset <= '0'; PIN <= "00001111"; wait for clock_period*44;
--		reset <= '1'; wait for clock_period*2;
--		reset <= '0'; PIN <= "00010000"; wait for clock_period*44;
--		reset <= '1'; wait for clock_period*2;
--		reset <= '0'; PIN <= "00010001"; wait for clock_period*44;
--		reset <= '1'; wait for clock_period*2;
--		reset <= '0'; PIN <= "00010010"; wait for clock_period*44;
--		reset <= '1'; wait for clock_period*2;
--		reset <= '0'; PIN <= "00010011"; wait for clock_period*44;
--		reset <= '1'; wait for clock_period*2;
--		reset <= '0'; PIN <= "00010100"; wait for clock_period*44;
--		reset <= '1'; wait for clock_period*2;
--		reset <= '0'; PIN <= "00010101"; wait for clock_period*44;
--		reset <= '1'; wait for clock_period*2;
--		reset <= '0'; PIN <= "00010110"; wait for clock_period*44;
--		reset <= '1'; wait for clock_period*2;
--		reset <= '0'; PIN <= "00010111"; wait for clock_period*44;
      
		assert false report "Todos os testes foram executados." severity failure;
		
   end process;

END;
