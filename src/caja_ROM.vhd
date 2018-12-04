library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity caja_ROM is

	Port(
	
		dir_y : in integer;
		dir_x : in integer;
		
		dat_R : out std_logic_vector( 7 downto 0 );
		dat_G : out std_logic_vector( 7 downto 0 );
		dat_B : out std_logic_vector( 7 downto 0 )
		
	);

end caja_ROM;

architecture comp of caja_ROM is

	type arreglo is array( 0 to 13 ) of std_logic_vector( 0 to 7 );

	type ROM is array( 0 to 13 ) of arreglo;

	constant caja_R : ROM :=
	(
	
		(x"FF",x"D5",x"D5",x"D5",x"D5",x"D5",x"D5",x"D5",x"D5",x"D5",x"D5",x"D5",x"D5",x"D5"),
		(x"D5",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF"),
		(x"FF",x"FF",x"00",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"00"),
		(x"D5",x"FF",x"FF",x"FF",x"FF",x"FF",x"D5",x"FF",x"D5",x"FF",x"FF",x"FF",x"FF",x"FF"),
		(x"FF",x"FF",x"FF",x"FF",x"FF",x"D5",x"00",x"00",x"00",x"D5",x"FF",x"FF",x"FF",x"FF"),
		(x"D5",x"FF",x"FF",x"FF",x"D5",x"FF",x"00",x"FF",x"FF",x"FF",x"D5",x"00",x"FF",x"FF"),
		(x"FF",x"FF",x"FF",x"FF",x"FF",x"D5",x"00",x"FF",x"FF",x"D5",x"FF",x"00",x"FF",x"FF"),
		(x"D5",x"FF",x"FF",x"FF",x"FF",x"00",x"00",x"FF",x"D5",x"FF",x"D5",x"00",x"FF",x"FF"),
		(x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"D5",x"FF",x"00",x"00",x"00",x"FF",x"FF"),
		(x"D5",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"D5",x"00",x"FF",x"FF",x"FF",x"FF"),
		(x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"00",x"00",x"FF",x"FF",x"FF",x"FF"),
		(x"D5",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"D5",x"FF",x"FF",x"FF",x"FF",x"FF"),
		(x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"D5",x"FF",x"00",x"FF",x"FF",x"FF",x"FF"),
		(x"D5",x"FF",x"00",x"FF",x"FF",x"FF",x"FF",x"FF",x"00",x"00",x"FF",x"FF",x"FF",x"00")
	
	);
	
	constant caja_G : ROM :=
	(
	
		(x"FF",x"55",x"55",x"55",x"55",x"55",x"55",x"55",x"55",x"55",x"55",x"55",x"55",x"55"),
		(x"55",x"AA",x"AA",x"AA",x"AA",x"AA",x"AA",x"AA",x"AA",x"AA",x"AA",x"AA",x"AA",x"AA"),
		(x"55",x"AA",x"00",x"80",x"AA",x"80",x"AA",x"80",x"AA",x"AA",x"AA",x"80",x"AA",x"00"),
		(x"55",x"AA",x"AA",x"AA",x"AA",x"55",x"55",x"55",x"55",x"55",x"AA",x"AA",x"AA",x"AA"),
		(x"55",x"80",x"AA",x"80",x"55",x"55",x"00",x"00",x"00",x"55",x"55",x"80",x"AA",x"80"),
		(x"55",x"AA",x"AA",x"AA",x"55",x"55",x"00",x"AA",x"AA",x"55",x"55",x"00",x"AA",x"AA"),
		(x"55",x"80",x"AA",x"80",x"55",x"55",x"00",x"80",x"AA",x"55",x"55",x"00",x"AA",x"80"),
		(x"55",x"AA",x"AA",x"AA",x"AA",x"00",x"00",x"AA",x"55",x"55",x"55",x"00",x"AA",x"AA"),
		(x"55",x"80",x"AA",x"80",x"AA",x"80",x"AA",x"55",x"55",x"00",x"00",x"00",x"AA",x"80"),
		(x"55",x"AA",x"AA",x"AA",x"AA",x"AA",x"AA",x"55",x"55",x"00",x"AA",x"AA",x"AA",x"AA"),
		(x"55",x"AA",x"AA",x"80",x"AA",x"80",x"AA",x"80",x"00",x"00",x"AA",x"80",x"AA",x"80"),
		(x"55",x"AA",x"AA",x"AA",x"AA",x"AA",x"AA",x"55",x"55",x"AA",x"AA",x"AA",x"AA",x"AA"),
		(x"55",x"80",x"AA",x"80",x"AA",x"80",x"AA",x"55",x"55",x"00",x"AA",x"80",x"AA",x"80"),
		(x"55",x"AA",x"00",x"AA",x"AA",x"AA",x"AA",x"AA",x"00",x"00",x"AA",x"AA",x"AA",x"00")
	
	);
	
	constant caja_B : ROM :=
	(
	
		(x"FF",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00"),
		(x"00",x"55",x"55",x"55",x"55",x"55",x"55",x"55",x"55",x"55",x"55",x"55",x"55",x"55"),
		(x"00",x"55",x"00",x"55",x"55",x"55",x"55",x"55",x"55",x"55",x"55",x"55",x"55",x"00"),
		(x"00",x"55",x"55",x"55",x"55",x"00",x"00",x"00",x"00",x"00",x"55",x"55",x"55",x"55"),
		(x"00",x"55",x"55",x"55",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"55",x"55",x"55"),
		(x"00",x"55",x"55",x"55",x"00",x"00",x"00",x"55",x"55",x"00",x"00",x"00",x"55",x"55"),
		(x"00",x"55",x"55",x"55",x"00",x"00",x"00",x"55",x"55",x"00",x"00",x"00",x"55",x"55"),
		(x"00",x"55",x"55",x"55",x"55",x"00",x"00",x"55",x"00",x"00",x"00",x"00",x"55",x"55"),
		(x"00",x"55",x"55",x"55",x"55",x"55",x"55",x"00",x"00",x"00",x"00",x"00",x"55",x"55"),
		(x"00",x"55",x"55",x"55",x"55",x"55",x"55",x"00",x"00",x"00",x"55",x"55",x"55",x"55"),
		(x"00",x"55",x"55",x"55",x"55",x"55",x"55",x"55",x"00",x"00",x"55",x"55",x"55",x"55"),
		(x"00",x"55",x"55",x"55",x"55",x"55",x"55",x"00",x"00",x"55",x"55",x"55",x"55",x"55"),
		(x"00",x"55",x"55",x"55",x"55",x"55",x"55",x"00",x"00",x"00",x"55",x"55",x"55",x"55"),
		(x"00",x"55",x"00",x"55",x"55",x"55",x"55",x"55",x"00",x"00",x"55",x"55",x"55",x"00")
	
	);
	
begin

	dat_R <= caja_R( dir_y )( dir_x );
	dat_G <= caja_G( dir_y )( dir_x );
	dat_B <= caja_B( dir_y )( dir_x );

end comp;