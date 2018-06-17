----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:06:58 05/07/2018 
-- Design Name: 
-- Module Name:    counter15 - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter15 is
    Port ( com : out  STD_LOGIC;
           Y : out  STD_LOGIC_VECTOR (6 downto 0);
           clock : in  STD_LOGIC);
end counter15;

architecture Behavioral of counter15 is
	signal clock1000ms : STD_LOGIC;
	signal x : integer range (0) to (15);
	signal count : integer range (0) to (15);
	signal fre : integer range (0) to (6250000);
	
begin
	Y <= "1110001" when x = 15 else	--F
		  "1111001" when x = 14 else	--E
		  "1011110" when x = 13 else	--D
		  "0111001" when x = 12 else	--C
		  "1111100" when x = 11 else	--B
		  "1110111" when x = 10 else	--A
		  "1101111" when x = 9  else	--9	  
		  "1111111" when x = 8  else	--8
		  "0000111" when x = 7  else	--7
		  "1111101" when x = 6  else	--6
		  "1101101" when x = 5  else	--5
		  "1100110" when x = 4  else	--4
		  "1001111" when x = 3  else	--3
		  "1011011" when x = 2  else	--2
		  "0000110" when x = 1  else	--1
		  "0111111";	--0		  	  
	com <= '0';

process (clock)
begin
	if (clock'event and clock = '1') then
			fre <= fre+1;
			if (fre = 6250000) then
				  clock1000ms <= not clock1000ms;
				  fre<=1;
				  if(count = 10)then 
						count <= 0;
				  end if;
				  count <= count + 1;
			end if;
	end if;
end process;

process (count)
begin
	if(count = 0) then
		x <= 0;
	elsif(count = 1)then
		x <= 2;
	elsif(count = 2) then
		x <= 4;
	elsif(count = 3)then
		x <= 6;
	elsif(count = 4) then
		x <= 7;
	elsif(count = 5)then
		x <= 8;
	elsif(count = 6) then
		x <= 9;
	elsif(count = 7)then
		x <= 10;
	elsif(count = 8)then
		x <= 12;
	elsif(count = 9) then
		x <= 13;
	elsif(count = 10)then
		x <= 14;
	end if;	
end process;

end Behavioral;

