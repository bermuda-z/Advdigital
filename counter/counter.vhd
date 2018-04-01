------------------------------------------------------------------------------------
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
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is
    Port ( Y : out  STD_LOGIC_VECTOR (6 downto 0);
			  clock : in  STD_LOGIC;
           COM : out  STD_LOGIC);
			  
end counter;

architecture Behavioral of counter is

	signal x0 : integer range(0) to (10) := 0;
	signal x1 : STD_LOGIC_VECTOR (3 downto 0);
	signal y0 : STD_LOGIC_VECTOR (6 downto 0);
	signal y1 : STD_LOGIC_VECTOR (6 downto 0);
	signal CLKsignal : STD_LOGIC;
	signal fre_count : integer range(0) to (25000000) := 0;
	
begin

	x1 <= STD_LOGIC_VECTOR(to_unsigned (x0,4));
	Y <= "1101111" when x1 = "1001" else	--9	  
		  "1111111" when x1 = "1000" else	--8
		  "0000111" when x1 = "0111" else	--7
		  "1111101" when x1 = "0110" else	--6
		  "1101101" when x1 = "0101" else	--5
		  "1100110" when x1 = "0100" else	--4
		  "1001111" when x1 = "0011" else	--3
		  "1011011" when x1 = "0010" else	--2
		  "0000110" when x1 = "0001" else	--1
		  "0111111";	--0		  	  
	COM <= '0';
	
process (clock)
begin
	if(clock'event and clock = '1') then
		fre_count <= fre_count+1;
		if (fre_count = 25000000) then
			x0 <= x0+1;
		end if;
		if (x0 = 10) then
			x0 <= 0;
		end if;
	end if;
end process;		  
end Behavioral;


