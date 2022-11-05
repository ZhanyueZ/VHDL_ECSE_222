library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity clock_divider is
port(reset: in std_logic;
     clk  : in std_logic;
	  en_out: out std_logic
);
end clock_divider;


architecture divi of clock_divider is
signal count : integer :=49999999;
begin
process(clk,reset)
begin
if(reset='0') then count<=49999999;
en_out <='0';
else
if(rising_edge(clk))then
if(count=0) then en_out<='1';
count<=49999999;
else
count<=count-1;
en_out <= '0';
end if;
end if;
end if;

end process;
end divi;