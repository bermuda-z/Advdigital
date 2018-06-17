
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity counter is
    Port ( Y : out  STD_LOGIC_VECTOR (6 downto 0);
           com : out  STD_LOGIC_VECTOR (3 downto 0);
			  clock : in std_logic			  
			  );
			
end counter;

architecture Behavioral of counter is
	signal clock1000ms : STD_LOGIC;
	signal x : integer range (0) to (5);
	signal count : integer range (0) to (13);
	signal fre : integer range (0) to (6250000);
	signal co : integer range (0) to (500000);
begin
		 --gfedcba
	Y <= "0001000" when x = 0 else  --3 2 1 0 	  
		  "0010000" when x = 1 else	--4
		  "1000000" when x = 2 else	--5 6 7 8
		  "0000010" when x = 3 else	--       9
		  "0000001" when x = 4 else	--13 12 11 10
		  "0000000";	--else	
		  
process (clock)
begin
	if (clock'event and clock = '1') then
			fre <= fre+1;		
			if (fre = 6250000) then
				  clock1000ms <= not clock1000ms;
				  fre<=1;
				 
				  if (count = 13) then
						count <= 0;			  
					end if;
					 count <= count+1;
			end if;
	end if;
end process;

process (clock,count)
begin
		if(clock'event and clock = '1') then
			co<=co+1;
			
		-- common
			if (co < 125000) then
				if(count = 0) then 
					x <= 0;
				elsif(count = 8) then
					x <= 2;
				elsif(count = 9) then
					x <= 3;
				elsif(count = 10) then
					x <= 4;
				else 
					x <= 5;
				end if;
				com <= "1110";
			end if;
			
			if (co > 125000 and co < 250000) then
				if(count = 1) then 
					x <= 0;
				elsif(count = 7) then
					x <= 2;
				elsif(count = 11) then
					x <= 4;
				else 
					x <= 5;
				end if;
				com <= "1101";		
			end if;
			
			if (co > 250000 and co < 375000) then 
				if(count = 2) then 
					x <= 0;
				elsif(count = 6) then
					x <= 2;
				elsif(count = 12) then
					x <= 4;
				else 
					x <= 5;
				end if;
				com <= "1011";
			end if;
			
			if(co > 375000 and co < 500000) then
				if(count = 3) then 
					x <= 0;
				elsif(count = 4) then
					x <= 1;
				elsif(count = 5) then
					x <= 2;
				elsif(count = 13) then
					x <= 4;
				else 
					x <= 5;
				end if;
				com <= "0111";
			end if;
			
		end if;	
end process;		  
end Behavioral;

