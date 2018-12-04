library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mariod2_ROM is

	Port(
	
		dir_y : in integer;
		dir_x : in integer;
		
		dat_R : out std_logic_vector( 7 downto 0 );
		dat_G : out std_logic_vector( 7 downto 0 );
		dat_B : out std_logic_vector( 7 downto 0 )
		
	);

end mariod2_ROM;

architecture comp of mariod2_ROM is

	type arreglo is array( 0 to 10 ) of std_logic_vector( 0 to 7 );
	type ROM is array( 0 to 14 ) of arreglo;
	
	constant mario_R : ROM := 
	(
	
		(x"FF",x"FF",x"FB",x"F5",x"FB",x"F7",x"F5",x"FA",x"FF",x"EB",x"FF"),
		(x"F6",x"FF",x"E7",x"FB",x"F7",x"FB",x"FF",x"E8",x"F5",x"F8",x"FF"),
		(x"F3",x"B9",x"BB",x"AB",x"FF",x"FD",x"9E",x"FF",x"F8",x"FF",x"FF"),
		(x"A4",x"FF",x"B4",x"FF",x"F2",x"FF",x"9C",x"FF",x"FF",x"FE",x"F9"),
		(x"AE",x"FF",x"A3",x"A2",x"FF",x"FF",x"FA",x"AF",x"FF",x"F2",x"FF"),
		(x"B0",x"B0",x"FF",x"FA",x"FF",x"FC",x"AB",x"B2",x"AF",x"A6",x"B6"),
		(x"FB",x"FC",x"F2",x"F9",x"F4",x"FE",x"FF",x"F4",x"FF",x"FD",x"F8"),
		(x"F3",x"B1",x"AD",x"FF",x"A8",x"B7",x"AA",x"B6",x"FB",x"F8",x"FF"),
		(x"BB",x"9F",x"B0",x"A7",x"FF",x"FD",x"AE",x"A6",x"AD",x"FF",x"FB"),
		(x"AA",x"A9",x"B0",x"F5",x"EE",x"F3",x"FF",x"FE",x"F1",x"FF",x"FF"),
		(x"AF",x"B2",x"A6",x"B4",x"FC",x"FF",x"EF",x"FC",x"F9",x"F7",x"F2"),
		(x"FB",x"9B",x"B0",x"FA",x"FF",x"FD",x"F8",x"F7",x"FB",x"FD",x"FF"),
		(x"FF",x"FE",x"B3",x"FF",x"FF",x"FF",x"F7",x"FF",x"FF",x"E3",x"FF"),
		(x"FF",x"F9",x"E8",x"FF",x"F8",x"9C",x"B0",x"AE",x"B4",x"FF",x"FC"),
		(x"FE",x"EE",x"AF",x"A2",x"A9",x"B0",x"9B",x"B5",x"AA",x"A6",x"FF")
	
	);
	
	constant mario_G : ROM := 
	(
	
		(x"FE",x"FD",x"3B",x"35",x"37",x"3A",x"2F",x"3D",x"FA",x"FF",x"FC"),
		(x"FF",x"37",x"38",x"3B",x"33",x"3D",x"3D",x"34",x"2E",x"41",x"2B"),
		(x"FF",x"71",x"7C",x"7D",x"A5",x"9E",x"7D",x"A3",x"AF",x"F9",x"FC"),
		(x"84",x"A4",x"73",x"9F",x"B1",x"A4",x"77",x"A7",x"A7",x"94",x"A6"),
		(x"81",x"A4",x"81",x"73",x"A1",x"A0",x"A6",x"79",x"AA",x"AA",x"A6"),
		(x"75",x"6E",x"A1",x"B2",x"A6",x"A6",x"87",x"76",x"79",x"78",x"79"),
		(x"FF",x"FF",x"A1",x"AA",x"9D",x"A1",x"9F",x"AD",x"A1",x"A8",x"FF"),
		(x"FF",x"7A",x"7C",x"37",x"7F",x"71",x"81",x"77",x"FF",x"F9",x"FA"),
		(x"80",x"71",x"82",x"80",x"2B",x"3C",x"78",x"7F",x"80",x"F7",x"FF"),
		(x"76",x"89",x"72",x"36",x"46",x"A6",x"26",x"3B",x"A0",x"AE",x"F8"),
		(x"81",x"7A",x"7E",x"76",x"3E",x"32",x"41",x"3B",x"40",x"34",x"FF"),
		(x"37",x"7B",x"7F",x"A8",x"9F",x"9C",x"3A",x"3A",x"35",x"2B",x"FF"),
		(x"FC",x"34",x"7E",x"A7",x"A7",x"3B",x"36",x"2C",x"33",x"FF",x"FF"),
		(x"FB",x"FF",x"3C",x"34",x"2B",x"82",x"85",x"82",x"79",x"FC",x"F9"),
		(x"FF",x"FF",x"7B",x"79",x"80",x"7D",x"7B",x"72",x"77",x"7C",x"FD")
	
	);
	
	constant mario_B : ROM := 
	(
	
		(x"FD",x"F0",x"0A",x"00",x"07",x"00",x"00",x"05",x"FF",x"FC",x"F4"),
		(x"F3",x"0F",x"00",x"0A",x"09",x"00",x"10",x"00",x"05",x"00",x"06"),
		(x"F9",x"1C",x"0A",x"00",x"2D",x"4C",x"00",x"44",x"2F",x"FF",x"FF"),
		(x"00",x"44",x"00",x"3D",x"3D",x"4A",x"04",x"45",x"42",x"48",x"2E"),
		(x"04",x"2B",x"03",x"00",x"59",x"46",x"46",x"00",x"40",x"44",x"3B"),
		(x"00",x"0E",x"50",x"43",x"42",x"37",x"00",x"00",x"00",x"08",x"00"),
		(x"FF",x"FF",x"38",x"43",x"3C",x"41",x"4B",x"45",x"3B",x"4B",x"F8"),
		(x"FC",x"00",x"00",x"00",x"09",x"01",x"00",x"03",x"FF",x"FE",x"FF"),
		(x"00",x"00",x"08",x"01",x"00",x"11",x"00",x"0A",x"01",x"FB",x"FA"),
		(x"00",x"10",x"05",x"09",x"00",x"3A",x"00",x"03",x"37",x"4B",x"FF"),
		(x"00",x"0B",x"00",x"00",x"0E",x"02",x"05",x"00",x"0A",x"00",x"FB"),
		(x"05",x"00",x"08",x"3A",x"37",x"35",x"06",x"02",x"06",x"00",x"F8"),
		(x"FF",x"1C",x"00",x"3F",x"50",x"03",x"00",x"01",x"0B",x"F9",x"F1"),
		(x"FF",x"FF",x"00",x"00",x"00",x"00",x"02",x"09",x"03",x"FD",x"F0"),
		(x"F6",x"FF",x"03",x"10",x"00",x"08",x"02",x"00",x"0C",x"00",x"FF")
	
	);

begin

	dat_R <= mario_R( dir_y )( dir_x );
	dat_G <= mario_G( dir_y )( dir_x );
	dat_B <= mario_B( dir_y )( dir_x );

end comp;