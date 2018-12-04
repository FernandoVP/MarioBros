library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mariod1_ROM is

	Port(
	
		dir_y : in integer;
		dir_x : in integer;
		
		dat_R : out std_logic_vector( 7 downto 0 );
		dat_G : out std_logic_vector( 7 downto 0 );
		dat_B : out std_logic_vector( 7 downto 0 )
		
	);

end mariod1_ROM;

architecture comp of mariod1_ROM is

	type arreglo is array( 0 to 12 ) of std_logic_vector( 0 to 7 );
	type ROM is array( 0 to 13 ) of arreglo;
	
	constant mario_R : ROM :=
	(
	
		(x"FF",x"FC",x"F8",x"FF",x"FF",x"ED",x"EF",x"FC",x"FF",x"F8",x"FE",x"FF",x"FF"),
		(x"FC",x"FF",x"FF",x"F9",x"F9",x"FB",x"FA",x"FF",x"EC",x"FF",x"F7",x"F0",x"F8"),
		(x"FF",x"F4",x"F9",x"A8",x"9F",x"A4",x"FF",x"F0",x"B0",x"FB",x"FF",x"FF",x"FC"),
		(x"F7",x"FF",x"98",x"FF",x"A5",x"FF",x"FF",x"FF",x"AB",x"F6",x"FF",x"F8",x"F2"),
		(x"FF",x"F9",x"C1",x"FC",x"B7",x"A8",x"FD",x"FC",x"FF",x"A9",x"F1",x"FF",x"FF"),
		(x"F6",x"FF",x"9E",x"A8",x"FF",x"F3",x"FF",x"F8",x"BA",x"AA",x"A4",x"AC",x"B4"),
		(x"F9",x"F6",x"FC",x"FF",x"FF",x"FD",x"FC",x"FF",x"FD",x"FF",x"FD",x"FF",x"ED"),
		(x"FF",x"F2",x"FC",x"AB",x"9E",x"BF",x"A6",x"FA",x"A6",x"AD",x"F2",x"FF",x"FF"),
		(x"FF",x"FE",x"FF",x"A5",x"BA",x"A1",x"A4",x"BE",x"9E",x"FF",x"FF",x"FF",x"FF"),
		(x"FF",x"FF",x"FB",x"FF",x"A8",x"99",x"B6",x"A9",x"A1",x"FF",x"FF",x"F9",x"FF"),
		(x"F2",x"AB",x"92",x"FF",x"FB",x"FF",x"FF",x"E5",x"FF",x"FC",x"FF",x"FF",x"F3"),
		(x"FC",x"A6",x"FF",x"F9",x"F2",x"FB",x"FC",x"FD",x"F7",x"F6",x"E9",x"FF",x"EC"),
		(x"AD",x"BA",x"EA",x"F9",x"FC",x"FC",x"F3",x"F2",x"F3",x"EF",x"F5",x"FF",x"FF"),
		(x"AB",x"AC",x"FE",x"FC",x"F7",x"AF",x"AE",x"A9",x"AE",x"F7",x"FF",x"FF",x"F2")
			
	);
	
	constant mario_G : ROM :=
	(
	
		(x"FF",x"FF",x"FE",x"FB",x"37",x"42",x"37",x"38",x"39",x"34",x"FF",x"FF",x"FF"),
		(x"FE",x"FC",x"FA",x"3D",x"35",x"27",x"3C",x"36",x"3A",x"35",x"33",x"3F",x"30"),
		(x"F9",x"FF",x"FF",x"79",x"77",x"87",x"AE",x"9B",x"77",x"A8",x"A8",x"F5",x"FD"),
		(x"FF",x"FC",x"77",x"A9",x"81",x"A5",x"A0",x"A0",x"7A",x"9E",x"A5",x"AB",x"AA"),
		(x"FB",x"FF",x"71",x"9D",x"82",x"79",x"A5",x"A6",x"B1",x"87",x"A0",x"9A",x"A2"),
		(x"FA",x"FF",x"77",x"7D",x"9B",x"A2",x"A1",x"A9",x"68",x"7B",x"81",x"85",x"7C"),
		(x"FD",x"FF",x"FE",x"FD",x"A5",x"A2",x"A7",x"9C",x"A6",x"AE",x"9E",x"9E",x"FF"),
		(x"F6",x"FF",x"FF",x"7A",x"7D",x"7C",x"76",x"3F",x"7F",x"74",x"A7",x"A8",x"FA"),
		(x"FD",x"FF",x"A1",x"74",x"7E",x"87",x"7C",x"70",x"89",x"9E",x"99",x"A6",x"A4"),
		(x"FA",x"A3",x"AB",x"37",x"7B",x"7D",x"70",x"81",x"75",x"A9",x"AD",x"A7",x"FA"),
		(x"FF",x"79",x"82",x"34",x"33",x"2F",x"3B",x"40",x"37",x"37",x"2F",x"FE",x"FC"),
		(x"FA",x"80",x"39",x"31",x"3B",x"3A",x"35",x"34",x"33",x"3B",x"2F",x"FC",x"FF"),
		(x"7A",x"77",x"3E",x"34",x"3D",x"35",x"3A",x"39",x"3C",x"40",x"FF",x"FF",x"F6"),
		(x"83",x"79",x"F4",x"FE",x"FB",x"76",x"75",x"83",x"7B",x"FA",x"FE",x"F7",x"FC")
			
	);
	
	constant mario_B : ROM :=
	(
	
		(x"FF",x"F8",x"F4",x"FF",x"0C",x"00",x"01",x"00",x"00",x"0E",x"FF",x"FD",x"FF"),
		(x"FF",x"F6",x"FE",x"00",x"0D",x"00",x"0C",x"00",x"00",x"08",x"00",x"00",x"00"),
		(x"FF",x"FF",x"F8",x"03",x"00",x"00",x"37",x"4A",x"10",x"3E",x"41",x"ED",x"FF"),
		(x"F1",x"F7",x"04",x"44",x"00",x"41",x"35",x"50",x"01",x"3D",x"4B",x"43",x"3C"),
		(x"FC",x"FD",x"12",x"49",x"00",x"03",x"4C",x"1D",x"48",x"00",x"44",x"49",x"49"),
		(x"FF",x"EC",x"02",x"00",x"40",x"46",x"41",x"4A",x"00",x"00",x"09",x"00",x"05"),
		(x"FF",x"DE",x"FF",x"F8",x"56",x"47",x"56",x"3D",x"3F",x"47",x"4A",x"50",x"EB"),
		(x"FF",x"FF",x"FA",x"00",x"00",x"00",x"00",x"00",x"00",x"03",x"42",x"39",x"FF"),
		(x"FF",x"F4",x"46",x"00",x"00",x"00",x"00",x"0B",x"00",x"4B",x"3A",x"46",x"4B"),
		(x"FF",x"2A",x"3C",x"04",x"14",x"00",x"00",x"00",x"00",x"4A",x"39",x"39",x"FC"),
		(x"FF",x"00",x"00",x"09",x"00",x"0E",x"0E",x"00",x"14",x"0A",x"00",x"FF",x"F9"),
		(x"FF",x"00",x"10",x"00",x"00",x"01",x"00",x"06",x"01",x"00",x"09",x"FD",x"FF"),
		(x"00",x"1C",x"00",x"09",x"06",x"00",x"00",x"03",x"03",x"01",x"F6",x"E8",x"FF"),
		(x"00",x"00",x"E8",x"FF",x"FF",x"02",x"0A",x"00",x"00",x"F3",x"FF",x"FF",x"FF")
			
	);

begin

	dat_R <= mario_R( dir_y )( dir_x );
	dat_G <= mario_G( dir_y )( dir_x );
	dat_B <= mario_B( dir_y )( dir_x );

end comp;