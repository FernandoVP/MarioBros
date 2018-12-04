library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity goomba1_ROM is

	Port(
	
		dir_y : in integer;
		dir_x : in integer;
		
		dat_R : out std_logic_vector( 7 downto 0 );
		dat_G : out std_logic_vector( 7 downto 0 );
		dat_B : out std_logic_vector( 7 downto 0 )
		
	);

end goomba1_ROM;

architecture comp of goomba1_ROM is

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
		(x"E7",x"E4",x"EE",x"DA",x"FF",x"F3",x"F1",x"DE",x"E3",x"F9",x"FA",x"F2",x"E6",x"E7",x"DD"),
		(x"ED",x"DF",x"DE",x"E7",x"E6",x"F4",x"DD",x"E7",x"DE",x"E5",x"DA",x"D9",x"EF",x"EB",x"EE"),
		(x"00",x"EA",x"EA",x"D8",x"D7",x"FA",x"FD",x"F7",x"FA",x"F3",x"F8",x"EB",x"C6",x"E3",x"E5"),
		(x"00",x"0A",x"0E",x"01",x"F8",x"EF",x"FF",x"EA",x"FA",x"EC",x"F8",x"FB",x"00",x"1A",x"00"),
		(x"00",x"00",x"28",x"11",x"EC",x"FD",x"E3",x"F7",x"FF",x"EE",x"F0",x"F2",x"00",x"01",x"08"),
		(x"01",x"18",x"1F",x"29",x"29",x"20",x"FF",x"F2",x"EB",x"FA",x"FF",x"22",x"17",x"03",x"0A"),
		(x"08",x"23",x"27",x"1F",x"23",x"27",x"1A",x"F3",x"F0",x"F4",x"2B",x"1C",x"2B",x"00",x"0A")
	
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
		(x"53",x"64",x"49",x"5B",x"D4",x"CC",x"DA",x"59",x"5A",x"D4",x"D0",x"CD",x"5A",x"56",x"5B"),
		(x"56",x"53",x"61",x"62",x"57",x"59",x"58",x"5D",x"60",x"56",x"5F",x"5E",x"57",x"58",x"5B"),
		(x"00",x"58",x"68",x"53",x"59",x"D8",x"C7",x"D0",x"CD",x"CF",x"D4",x"55",x"5C",x"5A",x"4E"),
		(x"05",x"00",x"00",x"01",x"DB",x"CE",x"DA",x"DD",x"D1",x"CD",x"D4",x"D5",x"05",x"00",x"06"),
		(x"06",x"06",x"1F",x"24",x"CE",x"D9",x"CA",x"D6",x"DB",x"DF",x"CC",x"D2",x"06",x"00",x"00"),
		(x"01",x"1F",x"21",x"18",x"24",x"25",x"D4",x"D0",x"C7",x"DD",x"CF",x"22",x"1F",x"01",x"08"),
		(x"00",x"19",x"27",x"23",x"19",x"18",x"25",x"DB",x"D5",x"D0",x"21",x"1A",x"1F",x"05",x"00")
	
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
		(x"15",x"0B",x"0F",x"18",x"B7",x"BD",x"B0",x"1E",x"14",x"9D",x"C0",x"C5",x"0F",x"03",x"1D"),
		(x"0D",x"06",x"05",x"15",x"13",x"07",x"15",x"05",x"14",x"08",x"01",x"18",x"14",x"0B",x"0B"),
		(x"0C",x"1C",x"12",x"10",x"0F",x"B3",x"BD",x"AF",x"C8",x"B7",x"BC",x"16",x"04",x"12",x"17"),
		(x"00",x"07",x"00",x"0B",x"BD",x"A3",x"B0",x"B3",x"A5",x"BB",x"BA",x"A8",x"04",x"00",x"05"),
		(x"00",x"00",x"24",x"2B",x"A8",x"BF",x"B4",x"B3",x"B7",x"B4",x"BC",x"AB",x"00",x"00",x"00"),
		(x"00",x"29",x"2E",x"11",x"20",x"29",x"B7",x"B5",x"A7",x"BF",x"AE",x"20",x"2A",x"00",x"20"),
		(x"0C",x"1A",x"1D",x"26",x"21",x"15",x"29",x"B7",x"C0",x"B6",x"17",x"27",x"1F",x"04",x"00")
	
	);
	
begin

	dat_R <= goomba_R( dir_y )( dir_x );
	dat_G <= goomba_G( dir_y )( dir_x );
	dat_B <= goomba_B( dir_y )( dir_x );


end comp;