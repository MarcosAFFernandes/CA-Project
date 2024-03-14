--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:34:55 03/12/2024
-- Design Name:   
-- Module Name:   C:/Xilinx/14.7/ISE_DS/ISE/CA-Project/testeBancoReg.vhd
-- Project Name:  CA-Project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: BancoRegistos
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
 
ENTITY testeBancoReg IS
END testeBancoReg;
 
ARCHITECTURE behavior OF testeBancoReg IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT BancoRegistos
    PORT(
         Dados_R : IN  std_logic_vector(7 downto 0);
         SEL_R : IN  std_logic_vector(5 downto 0);
         clk : IN  std_logic;
         ESCR_R : IN  std_logic_vector(1 downto 0);
         Operando1 : OUT  std_logic_vector(7 downto 0);
         Operando2 : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Dados_R : std_logic_vector(7 downto 0) := (others => '0');
   signal SEL_R : std_logic_vector(5 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal ESCR_R : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal Operando1 : std_logic_vector(7 downto 0);
   signal Operando2 : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: BancoRegistos PORT MAP (
          Dados_R => Dados_R,
          SEL_R => SEL_R,
          clk => clk,
          ESCR_R => ESCR_R,
          Operando1 => Operando1,
          Operando2 => Operando2
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

      wait for clk_period*10;

      ESCR_R(0) <= '1'; SEL_R <= "XXX000"; Dados_R <= "00000001"; wait for 10 ns;
		
		ESCR_R(0) <= '1'; SEL_R <= "XXX001"; Dados_R <= "00000010"; wait for 10 ns;
		

      wait;
   end process;

END;
