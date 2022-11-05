library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity sequence_counter is

Port(seq:    in std_logic;
     enable  : in std_logic;
	  reset   : in std_logic;
	  clk     : in std_logic;
	  cnt_1   : out std_logic_vector(2 downto 0);
	  cnt_2   : out std_logic_vector(2 downto 0)
);


end sequence_counter;


architecture  detect of sequence_counter is

signal o1,o2 :std_logic;

component zhanyue_zhang_FSM 
Port (seq : in std_logic;
      enable : in std_logic;
		reset  : in std_logic;
		clk    : in std_logic;
		out_1  : out std_logic;
		out_2  : out std_logic
);
end component;

component zhanyue_zhang_counter
Port(enable : in std_logic;
     reset :  in std_logic;
	  clk:     in std_logic;
	  count:   out std_logic_vector(2 downto 0)
);
end component;

begin

P1 : zhanyue_zhang_FSM port map (seq,enable,reset,clk,o1,o2);
P2 : zhanyue_zhang_counter port map (o1,reset,clk,cnt_1);
P3 : zhanyue_zhang_counter port map (o2,reset,clk,cnt_2);


end detect;