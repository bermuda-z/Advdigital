library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity lab8 is
	Port ( Y : out  STD_LOGIC_VECTOR(6 downto 0);
			clock : in std_logic;
			--shift : in std_logic;
			com : out  STD_LOGIC_VECTOR(2 downto 0);
			control: in STD_LOGIC_VECTOR(1 downto 0);
			input_A : in STD_LOGIC_VECTOR(7 downto 0);
			input_B : in STD_LOGIC_VECTOR(7 downto 0)
			);
end lab8;

architecture Behavioral of lab8 is

	 
	 signal fre_count : integer range(0) to (100000) := 0;			 
	 signal x1 : std_logic_vector (8 downto 0);
	 signal x2 : std_logic_vector (7 downto 0);
	 signal x3 : std_logic_vector (7 downto 0);
	 signal x4 : std_logic_vector (7 downto 0);	 
	 signal X : std_logic_vector (3 downto 0);
	 signal CLKsignal : STD_LOGIC;
begin

	Y <= "1110001" when X = "1111" else		--F
		  "1111001" when X = "1110" else		--E
		  "1011110" when X = "1101" else		--D
		  "0111001" when X = "1100" else		--C
		  "1111100" when X = "1011" else		--B
		  "1110111" when X = "1010" else		--A
		  "1101111" when X = "1001" else 	--9
		  "1111111" when X = "1000" else		--8
		  "0000111" when X = "0111" else		--7
		  "1111101" when X = "0110" else		--6
		  "1101101" when X = "0101" else		--5
		  "1100110" when X = "0100" else		--4
		  "1001111" when X = "0011" else		--3
		  "1011011" when X = "0010" else		--2
		  "0000110" when X = "0001" else    --1
		  "0111111";                        --0
			
			com(0) <= CLKsignal;
			com(1) <= not CLKsignal;
			
			
process (control)  --ADD
begin	
	if (control = "00") then
		x1 <= ('0'& not input_A) + ('0'& not input_B);		
	end if;
end process;


process (control)  --SUB
begin
	if (control = "01") then	
		x2 <= ('0'& not input_A) - ('0'& not input_B);	
	end if;
end process;


process (control)  --XOR
begin
	if (control = "10") then	
		x3 <= ('0'& not input_A) xor ('0'& not input_B);
	end if;
end process;

process (control)  --SHL
begin
	if (control = "11") then
			x4 <= not input_A(6 downto 0) & '0';
	end if;
end process;

process (clock)
begin
if (clock'event and clock = '1') then
		fre_count <= fre_count+1;
		if(fre_count < 50000) then
			CLKsignal <= '0';
			if		 (control = "00")	then X <= x1(3 downto 0);
			elsif(control = "01") then X <= x2(3 downto 0);
			elsif(control = "10") then X <= x3(3 downto 0); 
			else X <= x4(3 downto 0);
			end if;
		else	
			CLKsignal <= '1';
			if		 (control = "00")	then X <= x1(7 downto 4);
			elsif(control = "01") then X <= x2(7 downto 4);
			elsif(control = "10") then X <= x3(7 downto 4); 
			else X <= x4(7 downto 4);
			end if;
		end if;
	end if;

end process;

end Behavioral;
