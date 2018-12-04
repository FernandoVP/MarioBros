library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mariod0_ROM is

	Port(
	
		dir_y : in integer;
		dir_x : in integer;
		
		dat_R : out std_logic_vector( 7 downto 0 );
		dat_G : out std_logic_vector( 7 downto 0 );
		dat_B : out std_logic_vector( 7 downto 0 )
		
	);

end mariod0_ROM;

architecture comp of mariod0_ROM is

	type arreglo is array( 0 to 11 ) of std_logic_vector( 0 to 7 );

	type ROM is array( 0 to 14 ) of arreglo;

	constant mario_R : ROM :=
	(
	
		(x"F5",x"FF",x"FF",x"F8",x"F8",x"FF",x"F3",x"FF",x"F5",x"FF",x"FF",x"F5"),
		(x"FF",x"FC",x"F9",x"EF",x"FA",x"FF",x"ED",x"FD",x"F4",x"F9",x"EF",x"F0"),
		(x"FF",x"F5",x"AB",x"A5",x"B2",x"FA",x"FE",x"B3",x"FF",x"F9",x"F2",x"FF"),
		(x"FF",x"AD",x"FF",x"AC",x"FF",x"EE",x"FF",x"A7",x"F3",x"FF",x"FF",x"FF"),
		(x"E9",x"B4",x"F9",x"B0",x"A9",x"FF",x"FF",x"FD",x"A6",x"FF",x"FD",x"F3"),
		(x"FF",x"B1",x"AD",x"FF",x"FF",x"F4",x"FF",x"A1",x"AD",x"B5",x"B5",x"AE"),
		(x"FD",x"FB",x"FC",x"F5",x"FF",x"FB",x"F2",x"FF",x"FF",x"FF",x"FA",x"F6"),
		(x"FF",x"FA",x"AF",x"AB",x"F3",x"B0",x"B8",x"AB",x"A9",x"FF",x"F6",x"FC"),
		(x"F6",x"B5",x"A7",x"A4",x"EE",x"AB",x"A4",x"FB",x"C0",x"AA",x"A1",x"AF"),
		(x"B3",x"A0",x"AE",x"AC",x"FF",x"FF",x"F4",x"F7",x"9B",x"A5",x"B4",x"AE"),
		(x"FF",x"FE",x"A2",x"EE",x"FF",x"F2",x"F0",x"FF",x"F2",x"A7",x"FF",x"FE"),
		(x"FF",x"F1",x"FF",x"FD",x"EC",x"F8",x"F9",x"FC",x"FF",x"F8",x"FE",x"FF"),
		(x"FF",x"FF",x"F8",x"FF",x"FF",x"EB",x"EB",x"FE",x"F0",x"FF",x"FF",x"FF"),
		(x"F2",x"FE",x"F6",x"F5",x"F8",x"F5",x"FF",x"FF",x"F9",x"ED",x"FF",x"F7"),
		(x"F6",x"A7",x"B4",x"B5",x"A0",x"FF",x"FF",x"FE",x"A4",x"AF",x"AA",x"A9")
	
	);
	
	constant mario_G : ROM :=
	(
	
		(x"FF",x"F7",x"F8",x"3A",x"38",x"36",x"40",x"34",x"32",x"FD",x"F8",x"FF"),
		(x"FC",x"FF",x"3D",x"3D",x"35",x"32",x"32",x"34",x"3F",x"38",x"3D",x"37"),
		(x"FE",x"FF",x"78",x"80",x"76",x"A7",x"A3",x"7F",x"A3",x"AC",x"FF",x"F6"),
		(x"F8",x"79",x"A7",x"7C",x"AA",x"A8",x"A8",x"73",x"A4",x"96",x"A3",x"98"),
		(x"FF",x"77",x"A1",x"7A",x"79",x"A8",x"A1",x"A4",x"82",x"A4",x"A6",x"A9"),
		(x"F6",x"85",x"74",x"A8",x"9D",x"9C",x"A5",x"83",x"78",x"76",x"75",x"80"),
		(x"FD",x"FF",x"F4",x"AC",x"A7",x"AB",x"A4",x"9D",x"A6",x"A7",x"A4",x"F7"),
		(x"FF",x"F9",x"83",x"7C",x"31",x"7E",x"7C",x"7F",x"7B",x"FC",x"FF",x"FF"),
		(x"FF",x"7F",x"80",x"78",x"3F",x"82",x"7B",x"34",x"72",x"7D",x"84",x"78"),
		(x"78",x"71",x"7D",x"7D",x"34",x"2A",x"3F",x"3D",x"80",x"88",x"71",x"80"),
		(x"9E",x"A9",x"7D",x"40",x"A5",x"3A",x"37",x"A1",x"39",x"77",x"A9",x"94"),
		(x"A0",x"AF",x"9E",x"2C",x"3C",x"34",x"3F",x"33",x"3B",x"A5",x"A3",x"A4"),
		(x"A1",x"A3",x"37",x"37",x"32",x"4D",x"33",x"34",x"34",x"32",x"A3",x"A7"),
		(x"FF",x"FF",x"38",x"37",x"36",x"37",x"FF",x"33",x"3E",x"3D",x"29",x"FF"),
		(x"FD",x"7D",x"7E",x"7E",x"81",x"F8",x"FA",x"FF",x"80",x"77",x"7B",x"87")
	
	);
	
	constant mario_B : ROM :=
	(
	
		(x"FA",x"FF",x"FF",x"00",x"00",x"18",x"00",x"00",x"14",x"F3",x"FF",x"FC"),
		(x"FA",x"FB",x"00",x"0F",x"01",x"01",x"0F",x"00",x"06",x"00",x"0D",x"00"),
		(x"FF",x"FE",x"05",x"00",x"04",x"41",x"4A",x"00",x"3F",x"3A",x"EE",x"FF"),
		(x"FF",x"09",x"3F",x"00",x"2C",x"39",x"44",x"00",x"47",x"3E",x"48",x"37"),
		(x"EC",x"0C",x"47",x"10",x"00",x"4A",x"30",x"48",x"14",x"3B",x"45",x"3E"),
		(x"F4",x"00",x"03",x"47",x"3E",x"3B",x"4B",x"01",x"00",x"00",x"00",x"06"),
		(x"FB",x"FF",x"E9",x"50",x"52",x"3C",x"42",x"4F",x"4E",x"43",x"59",x"F9"),
		(x"F8",x"FF",x"00",x"00",x"00",x"03",x"00",x"00",x"00",x"FF",x"F2",x"FF"),
		(x"FE",x"00",x"01",x"00",x"10",x"00",x"00",x"0B",x"03",x"00",x"00",x"04"),
		(x"04",x"15",x"07",x"00",x"0D",x"00",x"0A",x"02",x"00",x"10",x"00",x"00"),
		(x"34",x"3E",x"00",x"00",x"50",x"00",x"00",x"3F",x"01",x"0B",x"44",x"3C"),
		(x"40",x"34",x"4C",x"0D",x"00",x"0C",x"0C",x"09",x"03",x"49",x"3A",x"44"),
		(x"4C",x"35",x"00",x"04",x"00",x"00",x"01",x"10",x"00",x"05",x"41",x"3C"),
		(x"FF",x"FF",x"04",x"03",x"00",x"00",x"F3",x"00",x"09",x"01",x"10",x"FF"),
		(x"ED",x"04",x"00",x"00",x"02",x"FB",x"FF",x"FD",x"00",x"0A",x"0F",x"00")
	
	);
	
begin

	dat_R <= mario_R( dir_y )( dir_x );
	dat_G <= mario_G( dir_y )( dir_x );
	dat_B <= mario_B( dir_y )( dir_x );

end comp;