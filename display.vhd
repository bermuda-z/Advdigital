----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:30:59 05/19/2018 
-- Design Name: 
-- Module Name:    display - Behavioral 
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

entity display is
    Port ( priceseg : out  STD_LOGIC_VECTOR (6 downto 0);
           pricecom : out  STD_LOGIC_VECTOR (1 downto 0);
           changeseg : out  STD_LOGIC_VECTOR (6 downto 0);
           changecom : out  STD_LOGIC_VECTOR (1 downto 0);
           rg : out  STD_LOGIC_VECTOR (0 downto 0);
           rgcom : out  STD_LOGIC_VECTOR (9 downto 0);
           buzzer : out  STD_LOGIC;
           clock : in  STD_LOGIC);
end display;

architecture Behavioral of display is
		constant money : integer := 24;
		constant price : integer := 20;
		Signal c : integer range (0) to (50000);
		Signal x : integer range (0) to (9);	
		Signal z : integer range (0) to (9);
		
		Signal count : integer range (0) to (2);
		Signal test : STD_LOGIC_VECTOR (9 downto 0);
begin
		priceseg <="1101111" when x = 9 else	--9	  
					  "1111111" when x = 8 else	--8
					  "0000111" when x = 7 else	--7
					  "1111101" when x = 6 else	--6
					  "1101101" when x = 5 else	--5
					  "1100110" when x = 4 else	--4
					  "1001111" when x = 3 else	--3
					  "1011011" when x = 2 else	--2
					  "0000110" when x = 1 else	--1
					  "0111111";	--0
					  
		changeseg <="1101111" when z = 9 else	--9	  
					  "1111111" when z = 8 else	--8
					  "0000111" when z = 7 else	--7
					  "1111101" when z = 6 else	--6
					  "1101101" when z = 5 else	--5
					  "1100110" when z = 4 else	--4
					  "1001111" when z = 3 else	--3
					  "1011011" when z = 2 else	--2
					  "0000110" when z = 1 else	--1
					  "0111111";	--0
					  changecom <= "10";
					  --z<= money - price when money > price else
					  --0;
		test <= "0100010000";	
process
begin
		for i in 9 downto 0 loop
			if test(i) = '1' then
			count <= count + 1;
			end if;
			if count = 1 then
			z <= z + 1;
			end if;		
		end loop;
end process;			

process
begin
	if (clock'event and clock = '1') then
		c<= c+1;
		if(c <= 25000) then
			x <= money mod 10;
			pricecom<="10";
		elsif (c > 25001 and c <= 50000) then
			x <= money / 10;
			pricecom<="01";
		end if;			
	end if;
end process;



end Behavioral;

