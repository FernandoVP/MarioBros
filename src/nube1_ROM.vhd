library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity nube1_ROM is

	Port(
	
		dir_y : in integer;
		dir_x : in integer;
		
		dat_R : out std_logic_vector( 7 downto 0 );
		dat_G : out std_logic_vector( 7 downto 0 );
		dat_B : out std_logic_vector( 7 downto 0 )
		
	);

end nube1_ROM;

architecture comp of nube1_ROM is

	type arreglo is array( 0 to 62 ) of std_logic_vector( 0 to 7 );

	type ROM is array( 0 to 22 ) of arreglo;

	constant nube_R : ROM :=
	(
	
		(x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"0A",x"07",x"07",x"00",x"01",x"03",x"11",x"07",x"01",x"00",x"0F",x"00",x"00",x"00",x"00",x"00",x"0A",x"07",x"07",x"00",x"01",x"03",x"11",x"07",x"01",x"00",x"0F",x"00",x"00",x"00",x"00",x"00",x"0A",x"07",x"07",x"00",x"01",x"03",x"11",x"07",x"01",x"00",x"0F",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00"),
		(x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"08",x"05",x"00",x"00",x"07",x"00",x"FF",x"FF",x"FF",x"FF",x"00",x"02",x"00",x"03",x"1D",x"00",x"08",x"05",x"00",x"00",x"07",x"00",x"FF",x"FF",x"FF",x"FF",x"00",x"02",x"00",x"03",x"1D",x"00",x"08",x"05",x"00",x"00",x"07",x"00",x"FF",x"FF",x"FF",x"FF",x"00",x"02",x"00",x"03",x"1D",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00"),
		(x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"06",x"01",x"04",x"06",x"00",x"FF",x"F2",x"F5",x"FF",x"F5",x"FD",x"02",x"05",x"06",x"03",x"00",x"06",x"01",x"04",x"06",x"00",x"FF",x"F2",x"F5",x"FF",x"F5",x"FD",x"02",x"05",x"06",x"03",x"00",x"06",x"01",x"04",x"06",x"00",x"FF",x"F2",x"F5",x"FF",x"F5",x"FD",x"02",x"05",x"06",x"03",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00"),
		(x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"03",x"00",x"0D",x"FF",x"FE",x"FF",x"FF",x"FF",x"FF",x"FA",x"FF",x"00",x"0F",x"01",x"00",x"00",x"03",x"00",x"0D",x"FF",x"FE",x"FF",x"FF",x"FF",x"FF",x"FA",x"FF",x"00",x"0F",x"01",x"00",x"00",x"03",x"00",x"0D",x"FF",x"FE",x"FF",x"FF",x"FF",x"FF",x"FA",x"FF",x"00",x"0F",x"01",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00"),
		(x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"05",x"0A",x"01",x"FD",x"F7",x"F7",x"F6",x"FF",x"FE",x"FD",x"FF",x"F1",x"04",x"FF",x"0C",x"0F",x"05",x"0A",x"01",x"FD",x"F7",x"F7",x"F6",x"FF",x"FE",x"FD",x"FF",x"F1",x"04",x"FF",x"0C",x"0F",x"05",x"0A",x"01",x"FD",x"F7",x"F7",x"F6",x"FF",x"FE",x"FD",x"FF",x"F1",x"04",x"FF",x"0C",x"0F",x"00",x"00",x"00",x"00",x"00",x"00",x"00"),
		(x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"03",x"00",x"06",x"FF",x"FF",x"FF",x"FB",x"F3",x"FF",x"07",x"FF",x"FD",x"FF",x"F6",x"F4",x"00",x"03",x"00",x"06",x"FF",x"FF",x"FF",x"FB",x"F3",x"FF",x"07",x"FF",x"FD",x"FF",x"F6",x"F4",x"00",x"03",x"00",x"06",x"FF",x"FF",x"FF",x"FB",x"F3",x"FF",x"07",x"FF",x"FD",x"FF",x"F6",x"F4",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00"),
		(x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"07",x"00",x"F2",x"FC",x"FF",x"00",x"00",x"FF",x"FF",x"ED",x"05",x"FF",x"FB",x"F5",x"FF",x"08",x"07",x"00",x"F2",x"FC",x"FF",x"00",x"00",x"FF",x"FF",x"ED",x"05",x"FF",x"FB",x"F5",x"FF",x"08",x"07",x"00",x"F2",x"FC",x"FF",x"00",x"00",x"FF",x"FF",x"ED",x"05",x"FF",x"FB",x"F5",x"FF",x"08",x"00",x"00",x"00",x"00",x"00",x"00",x"00"),
		(x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"09",x"FF",x"EA",x"FF",x"01",x"F6",x"FF",x"FF",x"F8",x"FF",x"FF",x"F9",x"FF",x"FE",x"FF",x"05",x"09",x"FF",x"EA",x"FF",x"01",x"F6",x"FF",x"FF",x"F8",x"FF",x"FF",x"F9",x"FF",x"FE",x"FF",x"05",x"09",x"FF",x"EA",x"FF",x"01",x"F6",x"FF",x"FF",x"F8",x"FF",x"FF",x"F9",x"FF",x"FE",x"FF",x"05",x"00",x"00",x"00",x"00",x"00",x"00",x"00"),
		(x"00",x"02",x"00",x"02",x"00",x"00",x"07",x"02",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"04",x"01",x"00",x"05",x"01",x"00",x"01"),
		(x"04",x"00",x"09",x"00",x"00",x"FF",x"FC",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"01",x"05",x"00",x"FD",x"04",x"03",x"02"),
		(x"00",x"00",x"00",x"05",x"FF",x"FF",x"FD",x"FB",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"07",x"FF",x"F9",x"03",x"00",x"00"),
		(x"05",x"00",x"02",x"FF",x"FE",x"FF",x"FF",x"FE",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FC",x"F8",x"FF",x"FF",x"04",x"09",x"00"),
		(x"00",x"04",x"00",x"FF",x"FE",x"FF",x"FB",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FB",x"FF",x"FC",x"FD",x"01",x"FF"),
		(x"02",x"FF",x"FF",x"FF",x"FD",x"FF",x"FC",x"FD",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FC",x"FD",x"FE",x"FE",x"FD",x"FD"),
		(x"06",x"FA",x"F9",x"FD",x"FF",x"FA",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FE",x"FF",x"FF",x"FF",x"FD",x"FF"),
		(x"01",x"06",x"FF",x"FF",x"F6",x"FF",x"FF",x"F7",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FC",x"FF",x"FB",x"FF",x"FF",x"04"),
		(x"07",x"00",x"04",x"FF",x"FC",x"07",x"FE",x"FE",x"FF",x"FF",x"FF",x"FF",x"FC",x"FF",x"FF",x"F8",x"FC",x"0C",x"F5",x"F9",x"FF",x"F4",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FC",x"FF",x"FF",x"F8",x"FC",x"0C",x"F5",x"F9",x"FF",x"F4",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FC",x"FF",x"FF",x"F8",x"FC",x"0C",x"F5",x"F9",x"FF",x"F4",x"FF",x"FF",x"FF",x"FC",x"FF",x"FF",x"FA",x"02",x"05"),
		(x"00",x"00",x"0D",x"0E",x"E5",x"FF",x"00",x"FC",x"F9",x"05",x"EF",x"F4",x"FF",x"FC",x"EE",x"FF",x"00",x"FF",x"F8",x"F5",x"FF",x"F1",x"FE",x"FC",x"F9",x"05",x"EF",x"F4",x"FF",x"FC",x"EE",x"FF",x"00",x"FF",x"F8",x"F5",x"FF",x"F1",x"FE",x"FC",x"F9",x"05",x"EF",x"F4",x"FF",x"FC",x"EE",x"FF",x"00",x"FF",x"F8",x"F5",x"FF",x"F1",x"FE",x"FC",x"FE",x"FF",x"FB",x"FA",x"FF",x"FF",x"00"),
		(x"0C",x"00",x"00",x"00",x"00",x"FF",x"FF",x"09",x"05",x"00",x"02",x"FF",x"F8",x"FF",x"00",x"00",x"06",x"00",x"FE",x"FF",x"FF",x"FD",x"00",x"FF",x"05",x"00",x"02",x"FF",x"F8",x"FF",x"00",x"00",x"06",x"00",x"FE",x"FF",x"FF",x"FD",x"00",x"FF",x"05",x"00",x"02",x"FF",x"F8",x"FF",x"00",x"00",x"06",x"00",x"FE",x"FF",x"FF",x"FD",x"00",x"FF",x"FF",x"FF",x"FF",x"FF",x"FD",x"FC",x"FE"),
		(x"01",x"03",x"00",x"0D",x"11",x"F4",x"E3",x"FF",x"F4",x"FF",x"01",x"07",x"00",x"00",x"02",x"0B",x"F0",x"02",x"02",x"00",x"00",x"04",x"F1",x"FF",x"F4",x"FF",x"01",x"07",x"00",x"00",x"02",x"0B",x"F0",x"02",x"02",x"00",x"00",x"04",x"F1",x"FF",x"F4",x"FF",x"01",x"07",x"00",x"00",x"02",x"0B",x"F0",x"02",x"02",x"00",x"00",x"04",x"F1",x"FF",x"FE",x"FC",x"F9",x"FE",x"FC",x"FF",x"FF"),
		(x"00",x"00",x"0E",x"00",x"0D",x"0E",x"0B",x"12",x"F7",x"F0",x"FF",x"FF",x"00",x"00",x"F0",x"FF",x"FF",x"F5",x"00",x"01",x"04",x"F8",x"F0",x"FD",x"F7",x"F0",x"FF",x"FF",x"00",x"00",x"F0",x"FF",x"FF",x"F5",x"00",x"01",x"04",x"F8",x"F0",x"FD",x"F7",x"F0",x"FF",x"FF",x"00",x"00",x"F0",x"FF",x"FF",x"F5",x"00",x"01",x"04",x"F8",x"F0",x"FD",x"FF",x"FD",x"FF",x"FD",x"FF",x"00",x"04"),
		(x"00",x"01",x"04",x"0B",x"00",x"00",x"0B",x"00",x"06",x"F7",x"FF",x"FF",x"FF",x"FE",x"FF",x"07",x"FF",x"FF",x"F2",x"FF",x"FF",x"FF",x"FF",x"FF",x"06",x"F7",x"FF",x"FF",x"FF",x"FE",x"FF",x"07",x"FF",x"FF",x"F2",x"FF",x"FF",x"FF",x"FF",x"FF",x"06",x"F7",x"FF",x"FF",x"FF",x"FE",x"FF",x"07",x"FF",x"FF",x"F2",x"FF",x"FF",x"FF",x"FF",x"FF",x"00",x"FF",x"FF",x"00",x"00",x"00",x"00"),
		(x"00",x"03",x"01",x"01",x"08",x"00",x"03",x"00",x"04",x"0B",x"00",x"FF",x"F4",x"FF",x"01",x"00",x"03",x"08",x"FF",x"F7",x"FF",x"FF",x"11",x"00",x"04",x"0B",x"00",x"FF",x"F4",x"FF",x"01",x"00",x"03",x"08",x"FF",x"F7",x"FF",x"FF",x"11",x"00",x"04",x"0B",x"00",x"FF",x"F4",x"FF",x"01",x"00",x"03",x"08",x"FF",x"F7",x"FF",x"FF",x"11",x"00",x"03",x"00",x"0C",x"00",x"04",x"07",x"00")
	
	);
	
	constant nube_G : ROM :=
	(
	
		(x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"03",x"00",x"00",x"01",x"02",x"00",x"03",x"04",x"02",x"02",x"05",x"00",x"05",x"05",x"01",x"00",x"03",x"00",x"00",x"01",x"02",x"00",x"03",x"04",x"02",x"02",x"05",x"00",x"05",x"05",x"01",x"00",x"03",x"00",x"00",x"01",x"02",x"00",x"03",x"04",x"02",x"02",x"05",x"00",x"05",x"05",x"01",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00"),
		(x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"09",x"04",x"01",x"08",x"01",x"FF",x"FB",x"FE",x"FE",x"04",x"03",x"00",x"00",x"00",x"02",x"00",x"09",x"04",x"01",x"08",x"01",x"FF",x"FB",x"FE",x"FE",x"04",x"03",x"00",x"00",x"00",x"02",x"00",x"09",x"04",x"01",x"08",x"01",x"FF",x"FB",x"FE",x"FE",x"04",x"03",x"00",x"00",x"00",x"02",x"00",x"00",x"00",x"00",x"00",x"00",x"00"),
		(x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"09",x"00",x"0C",x"00",x"0A",x"FF",x"FF",x"FF",x"FF",x"FF",x"FD",x"02",x"04",x"05",x"00",x"01",x"09",x"00",x"0C",x"00",x"0A",x"FF",x"FF",x"FF",x"FF",x"FF",x"FD",x"02",x"04",x"05",x"00",x"01",x"09",x"00",x"0C",x"00",x"0A",x"FF",x"FF",x"FF",x"FF",x"FF",x"FD",x"02",x"04",x"05",x"00",x"01",x"00",x"00",x"00",x"00",x"00",x"00",x"00"),
		(x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"05",x"FB",x"FB",x"FC",x"F9",x"FD",x"FC",x"FF",x"FF",x"00",x"00",x"00",x"01",x"05",x"00",x"00",x"05",x"FB",x"FB",x"FC",x"F9",x"FD",x"FC",x"FF",x"FF",x"00",x"00",x"00",x"01",x"05",x"00",x"00",x"05",x"FB",x"FB",x"FC",x"F9",x"FD",x"FC",x"FF",x"FF",x"00",x"00",x"00",x"01",x"05",x"00",x"00",x"00",x"00",x"00",x"00",x"00"),
		(x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"04",x"00",x"00",x"FA",x"FF",x"FB",x"FE",x"FB",x"FF",x"FC",x"FB",x"FF",x"04",x"FF",x"0D",x"00",x"04",x"00",x"00",x"FA",x"FF",x"FB",x"FE",x"FB",x"FF",x"FC",x"FB",x"FF",x"04",x"FF",x"0D",x"00",x"04",x"00",x"00",x"FA",x"FF",x"FB",x"FE",x"FB",x"FF",x"FC",x"FB",x"FF",x"04",x"FF",x"0D",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00"),
		(x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"05",x"13",x"FA",x"F7",x"FF",x"FF",x"FA",x"FE",x"97",x"F7",x"F8",x"FF",x"F6",x"FB",x"05",x"00",x"05",x"13",x"FA",x"F7",x"FF",x"FF",x"FA",x"FE",x"97",x"F7",x"F8",x"FF",x"F6",x"FB",x"05",x"00",x"05",x"13",x"FA",x"F7",x"FF",x"FF",x"FA",x"FE",x"97",x"F7",x"F8",x"FF",x"F6",x"FB",x"05",x"00",x"00",x"00",x"00",x"00",x"00",x"00"),
		(x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"02",x"07",x"FF",x"F0",x"FD",x"99",x"9C",x"FB",x"FA",x"FF",x"95",x"FF",x"FF",x"FF",x"FD",x"09",x"02",x"07",x"FF",x"F0",x"FD",x"99",x"9C",x"FB",x"FA",x"FF",x"95",x"FF",x"FF",x"FF",x"FD",x"09",x"02",x"07",x"FF",x"F0",x"FD",x"99",x"9C",x"FB",x"FA",x"FF",x"95",x"FF",x"FF",x"FF",x"FD",x"09",x"00",x"00",x"00",x"00",x"00",x"00",x"00"),
		(x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"04",x"F5",x"FF",x"FB",x"93",x"FD",x"FF",x"FC",x"FF",x"FE",x"FE",x"FA",x"FE",x"FE",x"FE",x"00",x"04",x"F5",x"FF",x"FB",x"93",x"FD",x"FF",x"FC",x"FF",x"FE",x"FE",x"FA",x"FE",x"FE",x"FE",x"00",x"04",x"F5",x"FF",x"FB",x"93",x"FD",x"FF",x"FC",x"FF",x"FE",x"FE",x"FA",x"FE",x"FE",x"FE",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00"),
		(x"00",x"02",x"00",x"02",x"00",x"00",x"07",x"02",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"04",x"01",x"00",x"05",x"01",x"00",x"01"),
		(x"04",x"00",x"09",x"00",x"00",x"FF",x"FC",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"01",x"05",x"00",x"FD",x"04",x"03",x"02"),
		(x"00",x"00",x"00",x"05",x"FF",x"FF",x"FD",x"FB",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"07",x"FF",x"F9",x"03",x"00",x"00"),
		(x"05",x"00",x"02",x"FF",x"FE",x"FF",x"FF",x"FE",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FC",x"F8",x"FF",x"FF",x"04",x"09",x"00"),
		(x"00",x"04",x"00",x"FF",x"FE",x"FF",x"FB",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FB",x"FF",x"FC",x"FD",x"01",x"FF"),
		(x"02",x"FF",x"FF",x"FF",x"FD",x"FF",x"FC",x"FD",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FC",x"FD",x"FE",x"FE",x"FD",x"FD"),
		(x"06",x"FA",x"F9",x"FD",x"FF",x"FA",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FE",x"FF",x"FF",x"FF",x"FD",x"FF"),
		(x"01",x"06",x"FF",x"FF",x"F6",x"FF",x"FF",x"F7",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FC",x"FF",x"FB",x"FF",x"FF",x"04"),
		(x"00",x"03",x"0B",x"F5",x"F8",x"92",x"FF",x"FE",x"FD",x"FD",x"FE",x"FD",x"FC",x"FD",x"FC",x"FC",x"FD",x"96",x"FF",x"FC",x"F8",x"FF",x"FF",x"FD",x"FD",x"FD",x"FE",x"FD",x"FC",x"FD",x"FC",x"FC",x"FD",x"96",x"FF",x"FC",x"F8",x"FF",x"FF",x"FD",x"FD",x"FD",x"FE",x"FD",x"FC",x"FD",x"FC",x"FC",x"FD",x"96",x"FF",x"FC",x"F8",x"FF",x"FF",x"FD",x"FF",x"FC",x"FF",x"FF",x"FA",x"02",x"05"),
		(x"05",x"03",x"00",x"0A",x"FF",x"FA",x"99",x"FD",x"FF",x"93",x"FF",x"FF",x"FE",x"FE",x"FD",x"FE",x"90",x"FD",x"FC",x"FF",x"FA",x"FF",x"FE",x"F7",x"FF",x"93",x"FF",x"FF",x"FE",x"FE",x"FD",x"FE",x"90",x"FD",x"FC",x"FF",x"FA",x"FF",x"FE",x"F7",x"FF",x"93",x"FF",x"FF",x"FE",x"FE",x"FD",x"FE",x"90",x"FD",x"FC",x"FF",x"FA",x"FF",x"FE",x"F7",x"FE",x"FF",x"FB",x"FA",x"FF",x"FF",x"00"),
		(x"00",x"04",x"04",x"00",x"09",x"FF",x"FC",x"94",x"96",x"96",x"93",x"FF",x"FE",x"F7",x"96",x"91",x"9B",x"92",x"FF",x"FB",x"F6",x"F8",x"8C",x"FF",x"96",x"96",x"93",x"FF",x"FE",x"F7",x"96",x"91",x"9B",x"92",x"FF",x"FB",x"F6",x"F8",x"8C",x"FF",x"96",x"96",x"93",x"FF",x"FE",x"F7",x"96",x"91",x"9B",x"92",x"FF",x"FB",x"F6",x"F8",x"8C",x"FF",x"FF",x"FF",x"FF",x"FF",x"FD",x"FC",x"FE"),
		(x"00",x"00",x"08",x"00",x"00",x"FF",x"FF",x"FC",x"FA",x"FA",x"8E",x"95",x"96",x"99",x"92",x"90",x"FD",x"97",x"96",x"8A",x"8D",x"9E",x"FF",x"FD",x"FA",x"FA",x"8E",x"95",x"96",x"99",x"92",x"90",x"FD",x"97",x"96",x"8A",x"8D",x"9E",x"FF",x"FD",x"FA",x"FA",x"8E",x"95",x"96",x"99",x"92",x"90",x"FD",x"97",x"96",x"8A",x"8D",x"9E",x"FF",x"FD",x"FE",x"FC",x"F9",x"FE",x"FC",x"FF",x"FF"),
		(x"00",x"01",x"01",x"00",x"00",x"11",x"07",x"00",x"FF",x"F9",x"FF",x"FE",x"96",x"94",x"FA",x"FE",x"F6",x"FF",x"94",x"9A",x"A0",x"FC",x"FF",x"F5",x"FF",x"F9",x"FF",x"FE",x"96",x"94",x"FA",x"FE",x"F6",x"FF",x"94",x"9A",x"A0",x"FC",x"FF",x"F5",x"FF",x"F9",x"FF",x"FE",x"96",x"94",x"FA",x"FE",x"F6",x"FF",x"94",x"9A",x"A0",x"FC",x"FF",x"F5",x"FF",x"FD",x"FF",x"FD",x"FF",x"00",x"04"),
		(x"02",x"02",x"00",x"00",x"04",x"04",x"00",x"03",x"08",x"FF",x"F9",x"FC",x"FE",x"F1",x"FF",x"00",x"FD",x"F6",x"FF",x"FB",x"FB",x"FA",x"FB",x"FD",x"08",x"FF",x"F9",x"FC",x"FE",x"F1",x"FF",x"00",x"FD",x"F6",x"FF",x"FB",x"FB",x"FA",x"FB",x"FD",x"08",x"FF",x"F9",x"FC",x"FE",x"F1",x"FF",x"00",x"FD",x"F6",x"FF",x"FB",x"FB",x"FA",x"FB",x"FD",x"00",x"FF",x"FF",x"00",x"00",x"00",x"00"),
		(x"04",x"00",x"02",x"02",x"03",x"04",x"0E",x"03",x"00",x"07",x"02",x"FF",x"FC",x"FA",x"02",x"06",x"00",x"03",x"FB",x"FF",x"FC",x"FF",x"01",x"02",x"00",x"07",x"02",x"FF",x"FC",x"FA",x"02",x"06",x"00",x"03",x"FB",x"FF",x"FC",x"FF",x"01",x"02",x"00",x"07",x"02",x"FF",x"FC",x"FA",x"02",x"06",x"00",x"03",x"FB",x"FF",x"FC",x"FF",x"01",x"02",x"03",x"00",x"0C",x"00",x"04",x"07",x"00")
	
	);
	
	constant nube_B : ROM :=
	(
	
		(x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"0B",x"07",x"00",x"03",x"00",x"10",x"0D",x"00",x"00",x"04",x"0B",x"00",x"19",x"09",x"05",x"00",x"0B",x"07",x"00",x"03",x"00",x"10",x"0D",x"00",x"00",x"04",x"0B",x"00",x"19",x"09",x"05",x"00",x"0B",x"07",x"00",x"03",x"00",x"10",x"0D",x"00",x"00",x"04",x"0B",x"00",x"19",x"09",x"05",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00"),
		(x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"08",x"00",x"0D",x"02",x"02",x"F3",x"F8",x"F8",x"FB",x"0A",x"05",x"02",x"00",x"00",x"06",x"00",x"08",x"00",x"0D",x"02",x"02",x"F3",x"F8",x"F8",x"FB",x"0A",x"05",x"02",x"00",x"00",x"06",x"00",x"08",x"00",x"0D",x"02",x"02",x"F3",x"F8",x"F8",x"FB",x"0A",x"05",x"02",x"00",x"00",x"06",x"00",x"00",x"00",x"00",x"00",x"00",x"00"),
		(x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"0E",x"00",x"01",x"02",x"0C",x"FA",x"FA",x"FF",x"FF",x"FF",x"FD",x"02",x"02",x"03",x"00",x"05",x"0E",x"00",x"01",x"02",x"0C",x"FA",x"FA",x"FF",x"FF",x"FF",x"FD",x"02",x"02",x"03",x"00",x"05",x"0E",x"00",x"01",x"02",x"0C",x"FA",x"FA",x"FF",x"FF",x"FF",x"FD",x"02",x"02",x"03",x"00",x"05",x"00",x"00",x"00",x"00",x"00",x"00",x"00"),
		(x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"15",x"02",x"FF",x"F6",x"FF",x"EB",x"FF",x"F9",x"FF",x"FF",x"00",x"00",x"00",x"03",x"19",x"00",x"15",x"02",x"FF",x"F6",x"FF",x"EB",x"FF",x"F9",x"FF",x"FF",x"00",x"00",x"00",x"03",x"19",x"00",x"15",x"02",x"FF",x"F6",x"FF",x"EB",x"FF",x"F9",x"FF",x"FF",x"00",x"00",x"00",x"03",x"19",x"00",x"00",x"00",x"00",x"00",x"00",x"00"),
		(x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"0A",x"00",x"00",x"FF",x"FF",x"FF",x"FF",x"F6",x"FF",x"FA",x"F7",x"FF",x"04",x"FF",x"0F",x"00",x"0A",x"00",x"00",x"FF",x"FF",x"FF",x"FF",x"F6",x"FF",x"FA",x"F7",x"FF",x"04",x"FF",x"0F",x"00",x"0A",x"00",x"00",x"FF",x"FF",x"FF",x"FF",x"F6",x"FF",x"FA",x"F7",x"FF",x"04",x"FF",x"0F",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00"),
		(x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"04",x"00",x"00",x"FF",x"F0",x"EC",x"EF",x"FF",x"FA",x"FF",x"EC",x"F4",x"FF",x"F6",x"FF",x"0B",x"04",x"00",x"00",x"FF",x"F0",x"EC",x"EF",x"FF",x"FA",x"FF",x"EC",x"F4",x"FF",x"F6",x"FF",x"0B",x"04",x"00",x"00",x"FF",x"F0",x"EC",x"EF",x"FF",x"FA",x"FF",x"EC",x"F4",x"FF",x"F6",x"FF",x"0B",x"00",x"00",x"00",x"00",x"00",x"00",x"00"),
		(x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"09",x"00",x"F6",x"FA",x"FA",x"FF",x"FE",x"FD",x"F6",x"FF",x"FF",x"FD",x"FF",x"FF",x"FA",x"0B",x"09",x"00",x"F6",x"FA",x"FA",x"FF",x"FE",x"FD",x"F6",x"FF",x"FF",x"FD",x"FF",x"FF",x"FA",x"0B",x"09",x"00",x"F6",x"FA",x"FA",x"FF",x"FE",x"FD",x"F6",x"FF",x"FF",x"FD",x"FF",x"FF",x"FA",x"0B",x"00",x"00",x"00",x"00",x"00",x"00",x"00"),
		(x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"0B",x"E0",x"FF",x"FF",x"FF",x"FF",x"F6",x"FF",x"FF",x"FA",x"FA",x"FC",x"FB",x"FE",x"F8",x"00",x"0B",x"E0",x"FF",x"FF",x"FF",x"FF",x"F6",x"FF",x"FF",x"FA",x"FA",x"FC",x"FB",x"FE",x"F8",x"00",x"0B",x"E0",x"FF",x"FF",x"FF",x"FF",x"F6",x"FF",x"FF",x"FA",x"FA",x"FC",x"FB",x"FE",x"F8",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00"),
		(x"00",x"02",x"00",x"02",x"00",x"00",x"07",x"02",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"04",x"01",x"00",x"05",x"01",x"00",x"01"),
		(x"04",x"00",x"09",x"00",x"00",x"FF",x"FC",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"01",x"05",x"00",x"FD",x"04",x"03",x"02"),
		(x"00",x"00",x"00",x"05",x"FF",x"FF",x"FD",x"FB",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"07",x"FF",x"F9",x"03",x"00",x"00"),
		(x"05",x"00",x"02",x"FF",x"FE",x"FF",x"FF",x"FE",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FC",x"F8",x"FF",x"FF",x"04",x"09",x"00"),
		(x"00",x"04",x"00",x"FF",x"FE",x"FF",x"FB",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FB",x"FF",x"FC",x"FD",x"01",x"FF"),
		(x"02",x"FF",x"FF",x"FF",x"FD",x"FF",x"FC",x"FD",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FC",x"FD",x"FE",x"FE",x"FD",x"FD"),
		(x"06",x"FA",x"F9",x"FD",x"FF",x"FA",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FE",x"FF",x"FF",x"FF",x"FD",x"FF"),
		(x"01",x"06",x"FF",x"FF",x"F6",x"FF",x"FF",x"F7",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FC",x"FF",x"FB",x"FF",x"FF",x"04"),
		(x"06",x"05",x"04",x"F9",x"FF",x"EF",x"FF",x"FF",x"F2",x"FF",x"FF",x"FF",x"FC",x"EA",x"FD",x"FF",x"FF",x"EE",x"FD",x"FF",x"F1",x"FF",x"F1",x"FF",x"F2",x"FF",x"FF",x"FF",x"FC",x"EA",x"FD",x"FF",x"FF",x"EE",x"FD",x"FF",x"F1",x"FF",x"F1",x"FF",x"F2",x"FF",x"FF",x"FF",x"FC",x"EA",x"FD",x"FF",x"FF",x"EE",x"FD",x"FF",x"F1",x"FF",x"F1",x"FF",x"FF",x"FC",x"FF",x"FF",x"FA",x"02",x"05"),
		(x"01",x"05",x"00",x"00",x"FF",x"F8",x"FF",x"FF",x"FF",x"F7",x"FF",x"FE",x"FB",x"FF",x"FF",x"F1",x"FF",x"FA",x"FF",x"FF",x"F6",x"FF",x"FF",x"FD",x"FF",x"F7",x"FF",x"FE",x"FB",x"FF",x"FF",x"F1",x"FF",x"FA",x"FF",x"FF",x"F6",x"FF",x"FF",x"FD",x"FF",x"F7",x"FF",x"FE",x"FB",x"FF",x"FF",x"F1",x"FF",x"FA",x"FF",x"FF",x"F6",x"FF",x"FF",x"FD",x"FE",x"FF",x"FB",x"FA",x"FF",x"FF",x"00"),
		(x"00",x"00",x"0C",x"05",x"04",x"EF",x"FA",x"F1",x"FF",x"FD",x"FE",x"EF",x"FC",x"F3",x"FF",x"FA",x"F7",x"FF",x"FF",x"FF",x"EF",x"FC",x"FC",x"F1",x"FF",x"FD",x"FE",x"EF",x"FC",x"F3",x"FF",x"FA",x"F7",x"FF",x"FF",x"FF",x"EF",x"FC",x"FC",x"F1",x"FF",x"FD",x"FE",x"EF",x"FC",x"F3",x"FF",x"FA",x"F7",x"FF",x"FF",x"FF",x"EF",x"FC",x"FC",x"F1",x"FF",x"FF",x"FF",x"FF",x"FD",x"FC",x"FE"),
		(x"0E",x"04",x"00",x"00",x"08",x"FE",x"FF",x"FF",x"EE",x"ED",x"F8",x"FF",x"FF",x"FF",x"FF",x"F7",x"FF",x"F3",x"EE",x"F7",x"FF",x"FE",x"FA",x"FD",x"EE",x"ED",x"F8",x"FF",x"FF",x"FF",x"FF",x"F7",x"FF",x"F3",x"EE",x"F7",x"FF",x"FE",x"FA",x"FD",x"EE",x"ED",x"F8",x"FF",x"FF",x"FF",x"FF",x"F7",x"FF",x"F3",x"EE",x"F7",x"FF",x"FE",x"FA",x"FD",x"FE",x"FC",x"F9",x"FE",x"FC",x"FF",x"FF"),
		(x"10",x"00",x"00",x"10",x"00",x"16",x"00",x"00",x"FF",x"FF",x"FD",x"FF",x"FF",x"F8",x"FF",x"FF",x"F5",x"FF",x"F8",x"FF",x"FF",x"E5",x"FF",x"FF",x"FF",x"FF",x"FD",x"FF",x"FF",x"F8",x"FF",x"FF",x"F5",x"FF",x"F8",x"FF",x"FF",x"E5",x"FF",x"FF",x"FF",x"FF",x"FD",x"FF",x"FF",x"F8",x"FF",x"FF",x"F5",x"FF",x"F8",x"FF",x"FF",x"E5",x"FF",x"FF",x"FF",x"FD",x"FF",x"FD",x"FF",x"00",x"04"),
		(x"08",x"00",x"00",x"00",x"00",x"0C",x"00",x"00",x"15",x"FF",x"F3",x"F1",x"FF",x"FA",x"FA",x"00",x"FF",x"F6",x"FF",x"F8",x"F8",x"F8",x"F8",x"FF",x"15",x"FF",x"F3",x"F1",x"FF",x"FA",x"FA",x"00",x"FF",x"F6",x"FF",x"F8",x"F8",x"F8",x"F8",x"FF",x"15",x"FF",x"F3",x"F1",x"FF",x"FA",x"FA",x"00",x"FF",x"F6",x"FF",x"F8",x"F8",x"F8",x"F8",x"FF",x"00",x"FF",x"FF",x"00",x"00",x"00",x"00"),
		(x"00",x"0B",x"00",x"00",x"09",x"00",x"10",x"05",x"04",x"00",x"08",x"F6",x"FF",x"FF",x"00",x"10",x"0E",x"0A",x"F2",x"FF",x"F3",x"FF",x"01",x"19",x"04",x"00",x"08",x"F6",x"FF",x"FF",x"00",x"10",x"0E",x"0A",x"F2",x"FF",x"F3",x"FF",x"01",x"19",x"04",x"00",x"08",x"F6",x"FF",x"FF",x"00",x"10",x"0E",x"0A",x"F2",x"FF",x"F3",x"FF",x"01",x"19",x"03",x"00",x"0C",x"00",x"04",x"07",x"00")
	
	);
	
begin

	dat_R <= nube_R( dir_y )( dir_x );
	dat_G <= nube_G( dir_y )( dir_x );
	dat_B <= nube_B( dir_y )( dir_x );

end comp;