library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity piso_ROM is

	Port(
	
		dir_y : in integer;
		dir_x : in integer;
		
		dat_R : out std_logic_vector( 7 downto 0 );
		dat_G : out std_logic_vector( 7 downto 0 );
		dat_B : out std_logic_vector( 7 downto 0 )
		
	);

end piso_ROM;

architecture comp of piso_ROM is

	type arreglo is array( 0 to 14 ) of std_logic_vector( 0 to 7 );

	type ROM is array( 0 to 14 ) of arreglo;
	
	constant piso_R : ROM :=
	(
		(x"BE",x"FF",x"F3",x"F9",x"FF",x"F7",x"FE",x"FF",x"EB",x"08",x"D0",x"FD",x"F4",x"F8",x"FF"),
		(x"FF",x"C5",x"B4",x"D0",x"D5",x"C1",x"C1",x"C3",x"D0",x"00",x"FF",x"C5",x"CD",x"BA",x"C6"),
		(x"F7",x"B4",x"C9",x"CC",x"CF",x"C3",x"C7",x"C9",x"CB",x"07",x"FF",x"BE",x"DA",x"CE",x"D3"),
		(x"F4",x"D2",x"D8",x"C6",x"CE",x"BC",x"C8",x"CB",x"C3",x"00",x"FB",x"CE",x"C1",x"CB",x"C9"),
		(x"FF",x"D1",x"C9",x"C2",x"C5",x"C5",x"D8",x"C8",x"DB",x"00",x"FF",x"00",x"CC",x"C3",x"CE"),
		(x"F9",x"C2",x"CA",x"C4",x"C3",x"CD",x"CD",x"BB",x"C7",x"09",x"B9",x"07",x"04",x"00",x"10"),
		(x"FD",x"BC",x"C5",x"C7",x"D5",x"D0",x"C8",x"CF",x"BF",x"00",x"FF",x"FD",x"F0",x"ED",x"FF"),
		(x"FF",x"C7",x"CE",x"C8",x"CB",x"BF",x"C6",x"C4",x"C7",x"0B",x"FA",x"CB",x"CA",x"D7",x"C2"),
		(x"FF",x"CC",x"C8",x"C5",x"CE",x"D2",x"C9",x"C8",x"CF",x"08",x"F9",x"B3",x"CA",x"D0",x"C2"),
		(x"F3",x"C8",x"C9",x"C6",x"BD",x"D0",x"BF",x"C6",x"C6",x"00",x"FF",x"C5",x"C8",x"CB",x"CB"),
		(x"04",x"00",x"C3",x"C2",x"B5",x"CF",x"CA",x"CB",x"00",x"FC",x"D1",x"C7",x"C7",x"CC",x"BF"),
		(x"FE",x"FD",x"18",x"04",x"CD",x"D3",x"CB",x"C6",x"04",x"FF",x"C7",x"C4",x"C5",x"CF",x"BF"),
		(x"FF",x"C5",x"F0",x"FA",x"00",x"00",x"0A",x"07",x"FF",x"C0",x"C0",x"D9",x"CE",x"C3",x"C9"),
		(x"F0",x"C4",x"D6",x"D8",x"F2",x"FF",x"FF",x"00",x"F4",x"D0",x"CA",x"BC",x"B1",x"C5",x"D9"),
		(x"FF",x"B7",x"D8",x"BD",x"CD",x"CE",x"B9",x"00",x"FF",x"C3",x"D9",x"C8",x"D8",x"C7",x"07")
	);
	
	constant piso_G : ROM :=
	(
		(x"51",x"B3",x"C1",x"BE",x"B8",x"BB",x"BF",x"BB",x"C0",x"03",x"4D",x"B9",x"CA",x"B6",x"BF"),
		(x"B3",x"56",x"4C",x"54",x"4A",x"4D",x"4E",x"4C",x"51",x"01",x"C0",x"49",x"48",x"51",x"47"),
		(x"C5",x"4C",x"4F",x"44",x"45",x"4F",x"4E",x"4D",x"42",x"04",x"B9",x"52",x"48",x"49",x"4E"),
		(x"B9",x"56",x"50",x"48",x"57",x"4C",x"49",x"4D",x"55",x"00",x"C2",x"47",x"49",x"50",x"4D"),
		(x"B7",x"46",x"3F",x"4B",x"52",x"49",x"4F",x"4B",x"3E",x"08",x"BE",x"06",x"50",x"4F",x"47"),
		(x"BD",x"4E",x"56",x"54",x"47",x"4A",x"48",x"4C",x"58",x"02",x"48",x"00",x"00",x"02",x"00"),
		(x"BE",x"49",x"4A",x"48",x"4C",x"4B",x"43",x"59",x"4E",x"00",x"C7",x"BB",x"C1",x"BB",x"C4"),
		(x"BA",x"50",x"52",x"4A",x"4E",x"50",x"50",x"4B",x"4D",x"02",x"B9",x"4B",x"4B",x"48",x"45"),
		(x"B8",x"50",x"4E",x"49",x"46",x"48",x"49",x"4D",x"49",x"00",x"BA",x"57",x"52",x"4C",x"48"),
		(x"C1",x"43",x"47",x"57",x"53",x"51",x"51",x"4D",x"4E",x"07",x"B8",x"4C",x"4F",x"42",x"53"),
		(x"00",x"09",x"49",x"54",x"4D",x"4A",x"49",x"51",x"07",x"B5",x"49",x"4C",x"3F",x"53",x"47"),
		(x"B5",x"BE",x"00",x"00",x"50",x"4C",x"4D",x"4D",x"00",x"C1",x"4F",x"50",x"4C",x"59",x"4C"),
		(x"BC",x"50",x"BA",x"B9",x"07",x"09",x"00",x"02",x"B9",x"50",x"48",x"52",x"45",x"49",x"4A"),
		(x"C2",x"47",x"52",x"4E",x"B2",x"BC",x"BD",x"00",x"C3",x"4D",x"4E",x"46",x"50",x"54",x"4A"),
		(x"BB",x"4B",x"52",x"41",x"4E",x"50",x"4C",x"08",x"B3",x"46",x"46",x"55",x"44",x"49",x"00")
	);
	
	constant piso_B : ROM :=
	(
		(x"16",x"98",x"CC",x"B0",x"97",x"B3",x"BA",x"A7",x"B0",x"00",x"00",x"B6",x"B4",x"A8",x"B2"),
		(x"98",x"1E",x"0F",x"0E",x"07",x"1C",x"15",x"08",x"0A",x"07",x"B3",x"15",x"07",x"18",x"12"),
		(x"D0",x"0F",x"00",x"00",x"07",x"14",x"07",x"07",x"0E",x"00",x"A0",x"14",x"17",x"06",x"16"),
		(x"AB",x"10",x"06",x"0D",x"1D",x"0C",x"02",x"12",x"20",x"0B",x"B1",x"0D",x"00",x"03",x"07"),
		(x"96",x"03",x"01",x"11",x"13",x"0D",x"0B",x"0B",x"00",x"00",x"AE",x"02",x"1C",x"00",x"1A"),
		(x"B5",x"1D",x"1B",x"14",x"0B",x"1C",x"0F",x"07",x"11",x"00",x"10",x"16",x"00",x"07",x"11"),
		(x"B9",x"10",x"04",x"01",x"08",x"12",x"02",x"13",x"16",x"02",x"AA",x"AF",x"B1",x"B4",x"AD"),
		(x"A6",x"0C",x"0C",x"0F",x"0E",x"0B",x"0A",x"16",x"0E",x"00",x"A5",x"1C",x"14",x"04",x"05"),
		(x"AE",x"0A",x"03",x"23",x"12",x"00",x"1C",x"07",x"02",x"0F",x"A9",x"0A",x"04",x"02",x"00"),
		(x"B8",x"02",x"0B",x"12",x"05",x"00",x"14",x"08",x"02",x"0C",x"AB",x"17",x"22",x"0B",x"16"),
		(x"07",x"00",x"00",x"09",x"00",x"0F",x"12",x"04",x"00",x"B9",x"0F",x"08",x"0F",x"0E",x"12"),
		(x"BE",x"AF",x"03",x"0E",x"1A",x"12",x"01",x"14",x"02",x"BB",x"10",x"00",x"15",x"00",x"00"),
		(x"B8",x"01",x"9E",x"A7",x"00",x"08",x"05",x"06",x"B7",x"10",x"0C",x"0E",x"00",x"0A",x"29"),
		(x"AB",x"17",x"11",x"10",x"B2",x"A9",x"AE",x"04",x"B4",x"07",x"04",x"00",x"1D",x"10",x"0E"),
		(x"A8",x"0D",x"0B",x"0D",x"09",x"13",x"11",x"00",x"AF",x"0C",x"12",x"12",x"06",x"0F",x"00")
	);

begin
	
	dat_R <= piso_R( dir_y )( dir_x );
	dat_G <= piso_G( dir_y )( dir_x );
	dat_B <= piso_B( dir_y )( dir_x );
	
end comp;