library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
entity zhanyue_zhang_wrapper is
Port(  reset : in std_logic;
       clk   : in std_logic;
		 HEX0  : out std_logic_vector (6 downto 0);
		 HEX5  : out std_logic_vector (6 downto 0) 
);
end zhanyue_zhang_wrapper;


architecture wrapper of zhanyue_zhang_wrapper is

signal enable : std_logic;
signal input  : std_logic;
signal out1,out2 : std_logic_vector(2 downto 0);
signal in1,in2   : std_logic_vector(3 downto 0);
signal Nreset: std_logic;
signal en :std_logic := '1';

component clock_divider 
port(reset: in std_logic;
     clk  : in std_logic;
	  en_out: out std_logic
);
end component;

component ROM
port(clk : in std_logic;
    reset : in std_logic;
    data : out std_logic
);
end component;

component sequence_counter
port(seq: in std_logic;
     enable: in std_logic;
	  reset : in std_logic;
	  clk   : in std_logic;
	  cnt_1 : out std_logic_vector(2 downto 0);
	  cnt_2 : out std_logic_vector(2 downto 0)
);
end component;

component seven_segment_decoder
port(code :in std_logic_vector(3 downto 0);
     segments_out: out std_logic_vector(6 downto 0));
end component;
begin
P1 : clock_divider port map (reset,clk,enable);
Nreset <= not reset;
P2 : ROM  PORT MAP (enable,Nreset,input);
P3 : sequence_counter PORT MAP (input,en,reset,enable,out1,out2);
in1 <= '0'& out1;
in2 <= '0'& out2;
P4 : seven_segment_decoder port map (in1, HEX0);
P5 : seven_segment_decoder port map (in2, HEX5);

end wrapper;