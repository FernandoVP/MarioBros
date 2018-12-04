library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mariod3_ROM is

	Port(
	
		dir_y : in integer;
		dir_x : in integer;
		
		dat_R : out std_logic_vector( 7 downto 0 );
		dat_G : out std_logic_vector( 7 downto 0 );
		dat_B : out std_logic_vector( 7 downto 0 )
		
	);

end mariod3_ROM;

architecture comp of mariod3_ROM is

	type arreglo is array( 0 to 14 ) of std_logic_vector( 0 to 7 );
	type ROM is array( 0 to 14 ) of arreglo;
	
	constant mario_R : ROM := 
	(
	
		(x"FF",x"EE",x"FF",x"FF",x"FF",x"FF",x"F6",x"F4",x"F9",x"FF",x"F4",x"F8",x"FF",x"F8",x"FF"),
		(x"FB",x"FC",x"FA",x"FF",x"F2",x"FA",x"F2",x"FF",x"FB",x"EE",x"F1",x"FA",x"F6",x"FE",x"FF"),
		(x"FF",x"F0",x"F8",x"FF",x"A9",x"A0",x"AC",x"FF",x"FF",x"B4",x"F0",x"FF",x"F6",x"F1",x"FC"),
		(x"FF",x"FF",x"FF",x"AE",x"FF",x"AA",x"FF",x"FA",x"FF",x"9F",x"FF",x"FF",x"FF",x"FD",x"FF"),
		(x"FF",x"F8",x"FF",x"9A",x"FF",x"BB",x"A8",x"FF",x"F5",x"FF",x"A9",x"FA",x"FF",x"FF",x"FF"),
		(x"F1",x"FF",x"F8",x"B6",x"9B",x"FF",x"FC",x"FB",x"FF",x"AA",x"AB",x"9F",x"A8",x"AB",x"F6"),
		(x"FF",x"FA",x"F6",x"F7",x"FF",x"F0",x"FF",x"FF",x"FF",x"FA",x"F9",x"FF",x"FF",x"F9",x"F2"),
		(x"FF",x"FF",x"AD",x"AD",x"A6",x"AE",x"F8",x"EA",x"A8",x"B4",x"A3",x"FF",x"F8",x"FF",x"FF"),
		(x"FF",x"FB",x"AB",x"A6",x"A6",x"B8",x"FC",x"F4",x"F8",x"AB",x"B4",x"A8",x"FE",x"FF",x"FD"),
		(x"F3",x"F4",x"FF",x"FF",x"B3",x"A5",x"F5",x"FF",x"EF",x"FF",x"FF",x"A0",x"A5",x"FF",x"F2"),
		(x"FF",x"FF",x"F4",x"FF",x"FF",x"F1",x"E5",x"F8",x"F5",x"FA",x"E9",x"FD",x"FF",x"A4",x"BC"),
		(x"FF",x"F9",x"F0",x"FF",x"FF",x"F5",x"FA",x"F9",x"FF",x"ED",x"F3",x"FF",x"A2",x"B4",x"AB"),
		(x"FF",x"F4",x"FC",x"F7",x"FA",x"FA",x"FF",x"FF",x"FA",x"F4",x"EF",x"FF",x"A4",x"AD",x"A6"),
		(x"F5",x"A2",x"BA",x"F2",x"FD",x"EC",x"F0",x"FF",x"FF",x"F9",x"F4",x"F3",x"B5",x"AB",x"A1"),
		(x"FE",x"AD",x"AA",x"A0",x"A8",x"FF",x"F7",x"F0",x"FF",x"FF",x"FF",x"EE",x"FA",x"FF",x"FF")
	
	);
	
	constant mario_G : ROM := 
	(
	
		(x"FB",x"FF",x"FE",x"FB",x"F9",x"2C",x"3B",x"39",x"34",x"3C",x"34",x"FF",x"FC",x"F8",x"F8"),
		(x"FA",x"FD",x"FA",x"FF",x"3C",x"40",x"39",x"33",x"35",x"3D",x"36",x"3E",x"39",x"44",x"FA"),
		(x"F9",x"FF",x"FF",x"F9",x"7B",x"84",x"74",x"AB",x"A8",x"7B",x"B0",x"97",x"FF",x"FF",x"FF"),
		(x"FD",x"FC",x"FC",x"79",x"A0",x"80",x"A0",x"A3",x"A8",x"79",x"A0",x"A6",x"A4",x"AA",x"FD"),
		(x"FB",x"FF",x"FA",x"7D",x"AD",x"76",x"7E",x"A4",x"9E",x"A7",x"78",x"A0",x"A2",x"99",x"A9"),
		(x"FF",x"F6",x"FF",x"77",x"77",x"9E",x"AB",x"A1",x"A9",x"7C",x"7D",x"85",x"84",x"7A",x"FF"),
		(x"FD",x"FA",x"FD",x"FF",x"FD",x"99",x"A6",x"A1",x"A3",x"9D",x"AB",x"A1",x"96",x"FF",x"FF"),
		(x"FE",x"FF",x"7C",x"7A",x"79",x"81",x"35",x"3C",x"74",x"82",x"80",x"F4",x"FF",x"FD",x"F7"),
		(x"A5",x"A4",x"79",x"7B",x"82",x"7D",x"35",x"37",x"39",x"77",x"7F",x"75",x"AA",x"A0",x"9C"),
		(x"9F",x"B4",x"A2",x"A4",x"74",x"7C",x"37",x"A5",x"3A",x"37",x"37",x"81",x"81",x"A4",x"AD"),
		(x"A7",x"97",x"9F",x"FF",x"37",x"37",x"3D",x"3B",x"30",x"41",x"31",x"3A",x"F7",x"7E",x"6F"),
		(x"FA",x"FF",x"FF",x"39",x"31",x"39",x"43",x"30",x"35",x"3B",x"3B",x"32",x"87",x"7B",x"7F"),
		(x"F4",x"F5",x"3A",x"3A",x"2B",x"3B",x"2A",x"38",x"37",x"34",x"40",x"3A",x"76",x"75",x"7B"),
		(x"FE",x"81",x"80",x"2E",x"4B",x"3B",x"39",x"FD",x"F9",x"41",x"31",x"32",x"82",x"79",x"82"),
		(x"F9",x"7D",x"75",x"82",x"77",x"FC",x"FF",x"FF",x"F9",x"FA",x"F6",x"FF",x"F9",x"FE",x"F7")
	
	);
	
	constant mario_B : ROM := 
	(
	
		(x"FF",x"F2",x"FF",x"FF",x"FF",x"00",x"06",x"04",x"09",x"00",x"0F",x"FD",x"FB",x"F6",x"FF"),
		(x"F8",x"FF",x"F0",x"F3",x"00",x"00",x"03",x"00",x"00",x"00",x"09",x"00",x"00",x"07",x"FF"),
		(x"FF",x"F2",x"FF",x"EF",x"0C",x"00",x"05",x"3A",x"40",x"07",x"42",x"4B",x"EA",x"FF",x"FF"),
		(x"FF",x"F4",x"FF",x"05",x"3C",x"00",x"4F",x"46",x"50",x"00",x"35",x"48",x"4C",x"40",x"F8"),
		(x"F8",x"EB",x"FF",x"00",x"54",x"0E",x"00",x"4B",x"41",x"54",x"00",x"40",x"4B",x"37",x"46"),
		(x"FF",x"FF",x"FF",x"06",x"00",x"33",x"36",x"4B",x"45",x"00",x"03",x"0A",x"0A",x"04",x"FE"),
		(x"FF",x"F2",x"F5",x"FF",x"F6",x"49",x"48",x"43",x"34",x"4F",x"3C",x"37",x"39",x"E8",x"FF"),
		(x"FF",x"F6",x"00",x"0F",x"04",x"00",x"00",x"00",x"06",x"00",x"02",x"FF",x"F4",x"FF",x"FB"),
		(x"43",x"33",x"00",x"0A",x"00",x"09",x"0C",x"00",x"02",x"0A",x"00",x"00",x"30",x"4A",x"31"),
		(x"3D",x"4A",x"43",x"45",x"02",x"00",x"00",x"4F",x"03",x"00",x"00",x"0D",x"07",x"4D",x"36"),
		(x"42",x"44",x"35",x"FA",x"05",x"00",x"00",x"01",x"0D",x"0B",x"00",x"00",x"FF",x"00",x"05"),
		(x"F7",x"FB",x"FF",x"00",x"00",x"16",x"00",x"02",x"02",x"00",x"07",x"0C",x"00",x"0A",x"00"),
		(x"FF",x"EF",x"07",x"02",x"01",x"07",x"06",x"00",x"00",x"00",x"01",x"07",x"00",x"00",x"0A"),
		(x"F9",x"0E",x"00",x"08",x"05",x"00",x"00",x"FE",x"FF",x"00",x"00",x"00",x"03",x"00",x"00"),
		(x"FF",x"00",x"01",x"06",x"00",x"F4",x"FF",x"FF",x"FF",x"FA",x"FF",x"FF",x"F5",x"FF",x"FF")
	
	);

begin

	dat_R <= mario_R( dir_y )( dir_x );
	dat_G <= mario_G( dir_y )( dir_x );
	dat_B <= mario_B( dir_y )( dir_x );

end comp;	
