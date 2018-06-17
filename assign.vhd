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
    Port ( 
			  led : out STD_LOGIC;
			  sw : in STD_LOGIC;
			  sw1 : in STD_LOGIC;
			  sel : in STD_LOGIC;
			  button : in STD_LOGIC_VECTOR (3 downto 0);  -- 1 2 5 10
			  priceseg : out  STD_LOGIC_VECTOR (6 downto 0);
           pricecom : out  STD_LOGIC_VECTOR (1 downto 0);
           changeseg : out  STD_LOGIC_VECTOR (6 downto 0);
           changecom : out  STD_LOGIC_VECTOR (3 downto 0);
           buzzer : out  STD_LOGIC;
           clock : in  STD_LOGIC);
end display;

architecture Behavioral of display is
		signal station : integer range (0) to (24);
		
		signal price : integer range (0) to (24);
		signal price0 : STD_LOGIC;
		signal price1 : STD_LOGIC;
		signal price2 : STD_LOGIC;
		signal price3 : STD_LOGIC;
		
		Signal c : integer range (0) to (50000);
		Signal x : integer range (0) to (9);	
		Signal z : integer range (0) to (24);
		
		Signal chk : integer range (0) to (1):=0;
		Signal control0 : STD_LOGIC;
		Signal control1 : STD_LOGIC;
		Signal control2 : STD_LOGIC;
		Signal control3 : STD_LOGIC;
		Signal sum : integer range (0) to (10):=0;
		Signal count : integer range (0) to (9):=0;
		Signal countsum : integer range (0) to (2):=0;
		
		Signal statecount : STD_LOGIC := '0';
		Signal stateprice : STD_LOGIC := '0';
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
					  
		--changeseg <="1101111" when z = 9 else	--9	  
		--			  "1111111" when z = 8 else	--8
		--			  "0000111" when z = 7 else	--7
		--			  "1111101" when z = 6 else	--6
		--			  "1101101" when z = 5 else	--5
		--			  "1100110" when z = 4 else	--4
		--			  "1001111" when z = 3 else	--3
		--			  "1011011" when z = 2 else	--2
		--			  "0000110" when z = 1 else	--1
		--			  "0111111";	--0
		--			  changecom <= "1110";
					  --z<= money - price when price > station else
					  --0;	
					  
		test <= "0000100001";	
		station <= price when sw = '1' else
					24 when z = 9 else
			     22 when z = 8 else
				  20 when z = 7 else
				  18 when z = 6 else
				  16 when z = 5 else
				  14 when z = 4 else
				  12 when z = 3 else
				  10 when z = 2 else
				  8 when z = 1 else
				  0 ;
		
		
--		price <= station - 1 when button(0) = '1' and price > 0 else
--					station - 2 when button(1) = '1' and price > 0 else
--				  	station - 5 when button(2) = '1' and price > 0 else				  
--					station - 10 when button(3) = '1' and price > 0 else
--					station;

		price <= station - 1 when price0 = '1' else
--					station - 2 when button(1) = '1' and price > 0 else
--				  	station - 5 when button(2) = '1' and price > 0 else				  
--					station - 10 when button(3) = '1' and price > 0 else
					station;
					
		

process(button(0))
begin
	if(falling_edge(button(0)))then
		price0 <= not price0;
		led <= price0;
	end if;
end process;

--process(button(1))
--begin
--	if(falling_edge(button(1)))then
--		price1 <= station - 1;
--	end if;
--end process;
--
--process(button(2))
--begin
--	if(falling_edge(button(2)))then
--		price2 <= station - 1;
--	end if;
--end process;
--
--process(button(3))
--begin
--	if(falling_edge(button(3)))then
--		price3 <= station - 1;
--	end if;
--end process;


		
process(clock,statecount)	 -- check station
begin		
		if (clock'event and clock = '1' and statecount = '0') then
			
			if test(count) = '1' then
				countsum <= countsum+1;			
			end if;	
			
			if countsum = 1 then			
				sum <=sum+1;
			end if;	
			
			if count = 9 then
				z<=sum;
				count <=0;	
				statecount <= '1'; --*
			end if;
			
			count <= count+1;
			
		end if;
		
end process;			

process(clock,price)  -- 
begin
	if (clock'event and clock = '1') then
		c<= c+1;
		if(c <= 25000) then
			x <= price mod 10;
			pricecom<="10";
		elsif (c > 25001 and c <= 50000) then
			x <= price / 10;
			pricecom<="01";
		end if;			
	end if;
end process;


end Behavioral;