library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mariods_ROM is

	Port(
	
		dir_y : in integer;
		dir_x : in integer;
		
		dat_R : out std_logic_vector( 7 downto 0 );
		dat_G : out std_logic_vector( 7 downto 0 );
		dat_B : out std_logic_vector( 7 downto 0 )
		
	);

end mariods_ROM;

architecture comp of mariods_ROM is

	type arreglo is array( 0 to 15 ) of std_logic_vector( 0 to 7 );

	type ROM is array( 0 to 14 ) of arreglo;

	constant mario_R : ROM :=
	(
	
		(x"FF",x"ED",x"F7",x"FF",x"F9",x"F1",x"FF",x"FF",x"FF",x"FF",x"F9",x"FC",x"EC",x"FF",x"FF",x"F8"),
		(x"FB",x"FF",x"FD",x"FC",x"FF",x"FA",x"F6",x"FB",x"F3",x"F2",x"FF",x"EF",x"FF",x"FF",x"FF",x"FE"),
		(x"FC",x"F6",x"FF",x"F9",x"FF",x"F7",x"F5",x"F5",x"F1",x"FF",x"FD",x"FB",x"FA",x"F1",x"F8",x"FC"),
		(x"FE",x"FF",x"E9",x"FE",x"FF",x"AF",x"B0",x"B1",x"FE",x"F3",x"A6",x"FF",x"F0",x"B4",x"A2",x"AC"),
		(x"FF",x"FF",x"F7",x"F3",x"AC",x"F8",x"B3",x"F4",x"F8",x"FF",x"B0",x"F9",x"FF",x"B0",x"B4",x"AB"),
		(x"F2",x"FF",x"FB",x"FF",x"A3",x"FF",x"AD",x"A8",x"F4",x"FF",x"FF",x"A3",x"F9",x"F8",x"F6",x"C1"),
		(x"FF",x"FE",x"F7",x"FF",x"A1",x"B3",x"FA",x"FF",x"F5",x"FF",x"C1",x"A2",x"AF",x"B7",x"A9",x"9F"),
		(x"F6",x"FE",x"FF",x"FF",x"FF",x"FF",x"F8",x"FB",x"FF",x"F3",x"FD",x"F7",x"FF",x"A3",x"A6",x"FF"),
		(x"FF",x"EE",x"B4",x"98",x"BC",x"A8",x"9E",x"FE",x"A5",x"B3",x"A1",x"FB",x"B7",x"B6",x"F4",x"FF"),
		(x"F3",x"BC",x"A7",x"AC",x"AA",x"AA",x"B7",x"A9",x"FF",x"A4",x"AC",x"A6",x"FA",x"F1",x"F7",x"A0"),
		(x"FF",x"F8",x"AF",x"AD",x"B2",x"AE",x"BE",x"AE",x"F1",x"F4",x"FF",x"FF",x"FF",x"F9",x"ED",x"BC"),
		(x"F3",x"FF",x"FD",x"FF",x"F8",x"F1",x"B1",x"EF",x"F5",x"FF",x"F4",x"F1",x"FD",x"F3",x"B9",x"AD"),
		(x"FF",x"FE",x"F8",x"AF",x"F8",x"F6",x"EB",x"F2",x"FE",x"F8",x"FF",x"F7",x"FD",x"F5",x"B6",x"AB"),
		(x"FF",x"FF",x"B0",x"9F",x"B3",x"FF",x"F9",x"FB",x"F3",x"F7",x"F3",x"EF",x"F6",x"EE",x"B4",x"A8"),
		(x"F9",x"9B",x"B0",x"B0",x"FB",x"F1",x"FF",x"F2",x"EF",x"FE",x"F6",x"FF",x"FF",x"FC",x"FE",x"F0")
	
	);
	
	constant mario_G : ROM :=
	(
	
		(x"F9",x"FF",x"FF",x"F8",x"FF",x"FE",x"FE",x"FC",x"FE",x"F3",x"FF",x"FF",x"FF",x"9E",x"A8",x"A9"),
		(x"FF",x"F9",x"F0",x"FF",x"FA",x"FF",x"3A",x"38",x"36",x"3E",x"2D",x"3A",x"FC",x"9A",x"A5",x"98"),
		(x"FF",x"FF",x"F8",x"FF",x"FA",x"37",x"38",x"36",x"3B",x"34",x"35",x"3B",x"34",x"33",x"A3",x"AB"),
		(x"FF",x"FA",x"FB",x"FE",x"FF",x"74",x"7F",x"72",x"AC",x"96",x"7F",x"A3",x"A9",x"80",x"77",x"7F"),
		(x"F6",x"FF",x"FF",x"FD",x"7C",x"A8",x"7E",x"AC",x"A1",x"A4",x"7E",x"9C",x"A4",x"74",x"7B",x"7E"),
		(x"FF",x"EE",x"FF",x"FC",x"7B",x"9D",x"78",x"75",x"A7",x"A1",x"A0",x"7A",x"AB",x"B0",x"9B",x"72"),
		(x"FB",x"FD",x"FC",x"FF",x"7E",x"7A",x"AA",x"A6",x"A7",x"A8",x"7A",x"84",x"7A",x"75",x"86",x"83"),
		(x"FF",x"FC",x"FE",x"FF",x"FB",x"FF",x"A3",x"A4",x"9D",x"A4",x"A5",x"A7",x"9C",x"84",x"7D",x"F9"),
		(x"FA",x"FF",x"7D",x"7E",x"7F",x"81",x"75",x"39",x"7B",x"80",x"7D",x"37",x"78",x"78",x"FF",x"F8"),
		(x"FD",x"77",x"80",x"70",x"80",x"77",x"7F",x"81",x"37",x"76",x"83",x"76",x"36",x"3D",x"FF",x"80"),
		(x"AE",x"A0",x"7B",x"7B",x"7C",x"7B",x"7E",x"70",x"3E",x"34",x"38",x"38",x"32",x"37",x"FF",x"75"),
		(x"9B",x"A5",x"A8",x"9F",x"3D",x"38",x"7D",x"3F",x"35",x"AA",x"2E",x"38",x"A6",x"3B",x"76",x"7B"),
		(x"FA",x"A7",x"A4",x"80",x"32",x"37",x"37",x"40",x"3B",x"33",x"3D",x"3A",x"3F",x"32",x"7F",x"7A"),
		(x"FA",x"F9",x"79",x"81",x"78",x"35",x"35",x"38",x"39",x"38",x"35",x"3E",x"37",x"34",x"6E",x"86"),
		(x"FF",x"82",x"7A",x"7E",x"3C",x"34",x"3E",x"35",x"39",x"2F",x"40",x"2E",x"FF",x"FF",x"FD",x"FC")
	
	);
	
	constant mario_B : ROM :=
	(
	
		(x"FD",x"FD",x"FF",x"F3",x"FF",x"FF",x"FA",x"F3",x"F8",x"FE",x"FF",x"FA",x"F8",x"3D",x"3E",x"42"),
		(x"ED",x"FF",x"FA",x"F6",x"FF",x"F8",x"00",x"02",x"00",x"00",x"10",x"00",x"FD",x"44",x"57",x"36"),
		(x"FA",x"FF",x"FF",x"FF",x"FF",x"06",x"00",x"19",x"00",x"0F",x"00",x"00",x"00",x"00",x"46",x"40"),
		(x"FF",x"FF",x"E1",x"FC",x"F6",x"00",x"00",x"00",x"49",x"2F",x"08",x"52",x"33",x"12",x"06",x"00"),
		(x"FF",x"F8",x"FA",x"FF",x"00",x"39",x"0E",x"34",x"40",x"3E",x"0D",x"3C",x"60",x"00",x"00",x"07"),
		(x"FA",x"FA",x"F6",x"FF",x"01",x"48",x"06",x"00",x"31",x"3F",x"35",x"00",x"2D",x"4E",x"30",x"23"),
		(x"FF",x"FF",x"F6",x"FA",x"18",x"00",x"39",x"4C",x"45",x"41",x"12",x"00",x"00",x"04",x"00",x"00"),
		(x"FC",x"FF",x"F3",x"FA",x"FF",x"FF",x"38",x"3B",x"44",x"3B",x"4B",x"36",x"54",x"00",x"0B",x"FF"),
		(x"FF",x"FD",x"08",x"0D",x"00",x"0A",x"00",x"0E",x"0B",x"00",x"02",x"03",x"07",x"01",x"EC",x"FF"),
		(x"F5",x"00",x"00",x"00",x"00",x"01",x"08",x"00",x"00",x"00",x"05",x"00",x"04",x"0A",x"FF",x"00"),
		(x"4D",x"47",x"16",x"00",x"02",x"00",x"03",x"00",x"00",x"00",x"03",x"00",x"0D",x"04",x"F1",x"03"),
		(x"37",x"2F",x"2B",x"44",x"00",x"09",x"00",x"03",x"04",x"43",x"00",x"00",x"3F",x"00",x"0B",x"08"),
		(x"FF",x"60",x"30",x"0A",x"15",x"01",x"04",x"00",x"0D",x"00",x"1D",x"00",x"03",x"06",x"00",x"00"),
		(x"FF",x"FF",x"02",x"00",x"00",x"04",x"0F",x"00",x"08",x"00",x"03",x"00",x"03",x"03",x"0E",x"00"),
		(x"ED",x"03",x"00",x"00",x"00",x"00",x"14",x"00",x"00",x"00",x"00",x"18",x"EA",x"FA",x"FF",x"EE")
	
	);
	
begin

	dat_R <= mario_R( dir_y )( dir_x );
	dat_G <= mario_G( dir_y )( dir_x );
	dat_B <= mario_B( dir_y )( dir_x );

end comp;