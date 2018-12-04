library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity goomba2_ROM is

	Port(
	
		dir_y : in integer;
		dir_x : in integer;
		
		dat_R : out std_logic_vector( 7 downto 0 );
		dat_G : out std_logic_vector( 7 downto 0 );
		dat_B : out std_logic_vector( 7 downto 0 )
		
	);

end goomba2_ROM;

architecture comp of goomba2_ROM is

	type arreglo is array( 0 to 14 ) of std_logic_vector( 0 to 7 );

	type ROM is array( 0 to 14 ) of arreglo;

	constant goomba_R : ROM :=
	(
	
		(x"00",x"00",x"03",x"04",x"00",x"00",x"E5",x"E4",x"E4",x"E5",x"00",x"00",x"04",x"03",x"00"),
		(x"07",x"08",x"07",x"00",x"10",x"D9",x"E9",x"F1",x"F1",x"E9",x"D9",x"10",x"00",x"07",x"08"),
		(x"07",x"00",x"10",x"00",x"DE",x"EB",x"DA",x"E1",x"E1",x"DA",x"EB",x"DE",x"00",x"10",x"00"),
		(x"04",x"00",x"05",x"E5",x"EB",x"DD",x"E7",x"E3",x"E3",x"E7",x"DD",x"EB",x"E5",x"05",x"00"),
		(x"00",x"0D",x"D9",x"26",x"1F",x"F2",x"E3",x"DF",x"DF",x"E3",x"F2",x"1F",x"26",x"D9",x"0D"),
		(x"0D",x"E3",x"EA",x"E5",x"ED",x"23",x"DF",x"E6",x"E6",x"DF",x"23",x"ED",x"E5",x"EA",x"E3"),
		(x"10",x"D2",x"EE",x"E9",x"FA",x"1D",x"25",x"21",x"21",x"25",x"1D",x"FA",x"E9",x"EE",x"D2"),
		(x"E3",x"D8",x"F4",x"DC",x"EF",x"1F",x"F4",x"E1",x"E1",x"F4",x"1F",x"EF",x"DC",x"F4",x"D8"),
		(x"DF",x"DD",x"E7",x"E6",x"F2",x"FA",x"F9",x"E3",x"DE",x"F1",x"F3",x"FF",x"DA",x"EE",x"E4"),
		(x"E9",x"EE",x"EB",x"EF",x"D9",x"DA",x"E5",x"DE",x"E7",x"DD",x"F4",x"E6",x"E7",x"DE",x"DF"),
		(x"02",x"E5",x"E3",x"C6",x"EB",x"F8",x"F3",x"FA",x"F7",x"FD",x"FA",x"D7",x"D8",x"EA",x"EA"),
		(x"00",x"00",x"1A",x"00",x"FB",x"F8",x"EC",x"FA",x"EA",x"FF",x"EF",x"F8",x"01",x"0E",x"0A"),
		(x"00",x"08",x"01",x"00",x"F2",x"F0",x"EE",x"FF",x"F7",x"E3",x"FD",x"EC",x"11",x"28",x"00"),
		(x"00",x"0A",x"03",x"17",x"22",x"FF",x"FA",x"EB",x"F2",x"FF",x"20",x"29",x"29",x"1F",x"18"),
		(x"00",x"0A",x"00",x"2B",x"1C",x"2B",x"F4",x"F0",x"F3",x"1A",x"27",x"23",x"1F",x"27",x"23")
	
	);
	
	constant goomba_G : ROM :=
	(
	
		(x"05",x"05",x"00",x"00",x"00",x"09",x"5A",x"55",x"55",x"5A",x"09",x"00",x"00",x"00",x"05"),
		(x"00",x"00",x"00",x"03",x"00",x"5D",x"4C",x"54",x"54",x"4C",x"5D",x"00",x"03",x"00",x"00"),
		(x"07",x"07",x"00",x"03",x"5A",x"5C",x"58",x"61",x"61",x"58",x"5C",x"5A",x"03",x"00",x"07"),
		(x"00",x"09",x"01",x"50",x"5B",x"58",x"55",x"56",x"56",x"55",x"58",x"5B",x"50",x"01",x"09"),
		(x"05",x"03",x"5A",x"2B",x"21",x"51",x"5A",x"57",x"57",x"5A",x"51",x"21",x"2B",x"5A",x"03"),
		(x"00",x"5B",x"57",x"48",x"D1",x"2A",x"54",x"5D",x"5D",x"54",x"2A",x"D1",x"48",x"57",x"5B"),
		(x"05",x"54",x"5F",x"5D",x"D2",x"1A",x"26",x"19",x"19",x"26",x"1A",x"D2",x"5D",x"5F",x"54"),
		(x"58",x"57",x"58",x"56",x"DD",x"20",x"D4",x"5E",x"5E",x"D4",x"20",x"DD",x"56",x"58",x"57"),
		(x"5D",x"5B",x"56",x"5A",x"CD",x"D0",x"D4",x"5A",x"59",x"DA",x"CC",x"D4",x"5B",x"49",x"64"),
		(x"54",x"5B",x"58",x"57",x"5E",x"5F",x"56",x"60",x"5D",x"58",x"59",x"57",x"62",x"61",x"53"),
		(x"02",x"4E",x"5A",x"5C",x"55",x"D4",x"CF",x"CD",x"D0",x"C7",x"D8",x"59",x"53",x"68",x"58"),
		(x"01",x"06",x"00",x"05",x"D5",x"D4",x"CD",x"D1",x"DD",x"DA",x"CE",x"DB",x"01",x"00",x"00"),
		(x"06",x"00",x"00",x"06",x"D2",x"CC",x"DF",x"DB",x"D6",x"CA",x"D9",x"CE",x"24",x"1F",x"06"),
		(x"03",x"08",x"01",x"1F",x"22",x"CF",x"DD",x"C7",x"D0",x"D4",x"25",x"24",x"18",x"21",x"1F"),
		(x"06",x"00",x"05",x"1F",x"1A",x"21",x"D0",x"D5",x"DB",x"25",x"18",x"19",x"23",x"27",x"19")
	
	);
	
	constant goomba_B : ROM :=
	(
	
		(x"00",x"05",x"0E",x"04",x"0C",x"01",x"15",x"11",x"11",x"15",x"01",x"0C",x"04",x"0E",x"05"),
		(x"04",x"00",x"00",x"07",x"00",x"05",x"17",x"07",x"07",x"17",x"05",x"00",x"07",x"00",x"00"),
		(x"05",x"00",x"00",x"00",x"05",x"24",x"0A",x"16",x"16",x"0A",x"24",x"05",x"00",x"00",x"00"),
		(x"0E",x"00",x"00",x"18",x"1F",x"13",x"1A",x"07",x"07",x"1A",x"13",x"1F",x"18",x"00",x"00"),
		(x"00",x"0E",x"0D",x"25",x"1C",x"00",x"12",x"09",x"09",x"12",x"00",x"1C",x"25",x"0D",x"0E"),
		(x"00",x"0F",x"00",x"15",x"C5",x"22",x"1D",x"15",x"15",x"1D",x"22",x"C5",x"15",x"00",x"0F"),
		(x"01",x"07",x"13",x"22",x"AF",x"15",x"18",x"24",x"24",x"18",x"15",x"AF",x"22",x"13",x"07"),
		(x"15",x"16",x"0B",x"0F",x"AD",x"25",x"BD",x"06",x"06",x"BD",x"25",x"AD",x"0F",x"0B",x"16"),
		(x"0F",x"1D",x"03",x"0F",x"C5",x"C0",x"9D",x"14",x"1E",x"B0",x"BD",x"B7",x"18",x"0F",x"0B"),
		(x"04",x"0B",x"0B",x"14",x"18",x"01",x"08",x"14",x"05",x"15",x"07",x"13",x"15",x"05",x"06"),
		(x"02",x"17",x"12",x"04",x"16",x"BC",x"B7",x"C8",x"AF",x"BD",x"B3",x"0F",x"10",x"12",x"1C"),
		(x"02",x"05",x"00",x"04",x"A8",x"BA",x"BB",x"A5",x"B3",x"B0",x"A3",x"BD",x"0B",x"00",x"07"),
		(x"00",x"00",x"00",x"00",x"AB",x"BC",x"B4",x"B7",x"B3",x"B4",x"BF",x"A8",x"2B",x"24",x"00"),
		(x"00",x"20",x"00",x"2A",x"20",x"AE",x"BF",x"A7",x"B5",x"B7",x"29",x"20",x"11",x"2E",x"29"),
		(x"10",x"00",x"04",x"1F",x"27",x"17",x"B6",x"C0",x"B7",x"29",x"15",x"21",x"26",x"1D",x"1A")
	
	);
	
begin

	dat_R <= goomba_R( dir_y )( dir_x );
	dat_G <= goomba_G( dir_y )( dir_x );
	dat_B <= goomba_B( dir_y )( dir_x );


end comp;