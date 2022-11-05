library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity zhanyue_zhang_FSM is 

Port (seq : in std_logic;
      enable : in std_logic;
		reset  : in std_logic;
		clk    : in std_logic;
		out_1  : out std_logic;
		out_2  : out std_logic
);

end zhanyue_zhang_FSM;

architecture Behavioral of zhanyue_zhang_FSM is

type MOORE1 is (s0,s1,s2,s3,s4);
signal current_s , next_s : MOORE1;
type MOORE2 is (t0,t1,t2,t3,t4);
signal current_t , next_t : MOORE2;

begin

process(clk,reset)

begin

if(reset='0') then current_s <= s0; current_t <=t0;
elsif(enable='0') then current_s <= current_s;current_t<=current_t;
elsif(rising_edge(clk)) then current_s <= next_s; current_t <= next_t;

end if;
end process;

process(current_s,seq)
begin
  case(current_s)is
  when s0 => 
  if (seq='1') then
  next_s <= s1;
  else
  next_s <= s0;
  end if;
  
  when s1 =>
  if (seq='1') then
  next_s <= s1;
  ELSE
  next_s <= s2;
  end if;
  
  when s2 =>
  if (seq='1')then
  next_s <= s3;
  else
  next_s <= s0;
  end if;
  
  when s3 =>
  if (seq='1')then
  next_s <= s4;
  else
  next_s <= s2;
  end if;
  
  when s4 =>
  if (seq='1')then
  next_s <= s1;
  else
  next_s <= s2;
  end if;
  when others=>null;
  end case;
  end process;

  process(current_s)
 
 begin 
   case current_s is
	when s0 =>
	out_1 <= '0';
	when s1 =>
	out_1 <= '0';
	when s2 =>
	out_1 <= '0';
	when s3 =>
	out_1 <= '0';
  when s4 =>
	out_1 <= '1';
	when others => null;
	end case;
	end process;
  
process(current_t,seq)
begin 
  
  case(current_t)is 
  when t0 =>
  if(seq='1')then
  next_t <= t0;
  else 
  next_t <= t1;
  end if;
  
  when t1 =>
  if(seq='1')then
  next_t <= t0;
  else 
  next_t <= t2;
  end if;
  
  when t2 =>
  if(seq='1')then
  next_t <= t3;
  else 
  next_t <= t2;
  end if;
  
  when t3 =>
  if(seq='1')then
  next_t <= t0;
  else 
  next_t <= t4;
  end if;
  
  when t4 =>
  if(seq='1')then
  next_t <= t0;
  else 
  next_t <= t2;
  end if;
  
  when others => null;
  end case;
end process;  
   
 
	
process(current_t)
begin
  case current_t is
  when t0 =>
	out_2 <= '0';
	when t1 =>
	out_2 <= '0';
	when t2 =>
	out_2 <= '0';
	when t3 =>
	out_2 <= '0';
  when t4 =>
	out_2 <= '1';
	when others => null;
	end case;
end process;
  
	
end Behavioral;