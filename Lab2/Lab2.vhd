----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:58:26 01/29/2018 
-- Design Name: 
-- Module Name:    Lab2 - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Lab2 is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Y : out  STD_LOGIC_VECTOR (6 downto 0);
			  clock : in  STD_LOGIC;
           COM : out  STD_LOGIC_VECTOR (1 downto 0) );
			  
end Lab2;

architecture Behavioral of Lab2 is

	signal X : STD_LOGIC_VECTOR (4 downto 0);
	signal y0 : STD_LOGIC_VECTOR (6 downto 0);
	signal y1 : STD_LOGIC_VECTOR (6 downto 0);
	signal CLKsignal : STD_LOGIC;
	signal fre_count : integer range(0) to (100000) := 0;
	
begin


	X <=  ('0' & not A) + ('0' & not B);
	y0 <= "1110001" when X(3 downto 0) = "1111" else --F
		  "1111001" when X(3 downto 0) = "1110" else	--E
		  "1011110" when X(3 downto 0) = "1101" else	--d
		  "0111001" when X(3 downto 0) = "1100" else	--C
		  "1111100" when X(3 downto 0) = "1011" else	--b
		  "1110111" when X(3 downto 0) = "1010" else	--A
		  "1101111" when X(3 downto 0) = "1001" else	--9	  
		  "1111111" when X(3 downto 0) = "1000" else	--8
		  "0000111" when X(3 downto 0) = "0111" else	--7
		  "1111101" when X(3 downto 0) = "0110" else	--6
		  "1101101" when X(3 downto 0) = "0101" else	--5
		  "1100110" when X(3 downto 0) = "0100" else	--4
		  "1001111" when X(3 downto 0) = "0011" else	--3
		  "1011011" when X(3 downto 0) = "0010" else	--2
		  "0000110" when X(3 downto 0) = "0001" else	--1
		  "0111111";	--0	
	y1 <= "0111111" when X(4) = '0' else "0000110";
	Y <= y0 when CLKsignal = '0' else y1;
	COM(0) <= CLKsignal;
	COM(1) <= not CLKsignal;
	
process (clock)
begin
	if(clock'event and clock = '1') then
		fre_count <= fre_count+1;
		if(fre_count < 50000) then
			CLKsignal <= '0';
			else
			CLKsignal <= '1';
		end if;
	end if;
end process;		  
end Behavioral;

