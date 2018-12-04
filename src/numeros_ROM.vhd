library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity numeros_ROM is

	Port(
	
		dir_y : in integer;
		dir_x : in integer;
		dig   : in integer;
		
		dat_R : out std_logic_vector( 7 downto 0 );
		dat_G : out std_logic_vector( 7 downto 0 );
		dat_B : out std_logic_vector( 7 downto 0 )
		
	);

end numeros_ROM;

architecture comp of numeros_ROM is

	type ROM is array( 0 to 19 ) of std_logic_vector( 0 to 19 );

	constant numero0 : ROM :=
	(
	
		"00001111111111110000",
		"00001111111111110000",
		"11110000000000001111",
		"11110000000000001111",
		"11110000000000001111",
		"11110000000000001111",
		"11110000000000001111",
		"11110000000000001111",
		"11110000000000001111",
		"11110000000000001111",
		"11110000000000001111",
		"11110000000000001111",
		"11110000000000001111",
		"11110000000000001111",
		"11110000000000001111",
		"11110000000000001111",
		"11110000000000001111",
		"11110000000000001111",
		"00001111111111110000",
		"00001111111111110000"
		
	);
	
	constant numero1 : ROM :=
	(
		
		"00000001111110000000",
		"00000001111110000000",
		"00011111111110000000",
		"00011111111110000000",
		"00011111111110000000",
		"00000001111110000000",
		"00000001111110000000",
		"00000001111110000000",
		"00000001111110000000",
		"00000001111110000000",
		"00000001111110000000",
		"00000001111110000000",
		"00000001111110000000",
		"00000001111110000000",
		"00000001111110000000",
		"00000001111110000000",
		"00000001111110000000",
		"00000001111110000000",
		"00011111111111111000",
		"00011111111111111000"
		
	);
	
	constant numero2 : ROM :=
	(
		"00001111111111110000",
		"00001111111111110000",
		"11110000000000001111",
		"11110000000000001111",
		"00000000000000001111",
		"00000000000000001111",
		"00000000000011110000",
		"00000000000011110000",
		"00000000000011110000",
		"00000000111100000000",
		"00000000111100000000",
		"00000000111100000000",
		"00001111000000000000",
		"00001111000000000000",
		"00001111000000000000",
		"11110000000000000000",
		"11110000000000000000",
		"11110000000000000000",
		"11111111111111111111",
		"11111111111111111111"
		
	);
	
	constant numero3 : ROM :=
	(
		
		"00001111111111110000",
		"00001111111111110000",
		"11110000000000001111",
		"11110000000000001111",
		"00000000000000001111",
		"00000000000000001111",
		"00000000000000001111",
		"00000011111111110000",
		"00000011111111110000",
		"00000011111111110000",
		"00000000000000001111",
		"00000000000000001111",
		"00000000000000001111",
		"00000000000000001111",
		"00000000000000001111",
		"00000000000000001111",
		"11110000000000001111",
		"11110000000000001111",
		"00001111111111110000",
		"00001111111111110000"
		
	);
	
	constant numero4 : ROM :=
	(
		
		"00000000000001111000",
		"00000000000001111000",
		"00000000011111111000",
		"00000000011111111000",
		"00000000011111111000",
		"00000111100001111000",
		"00000111100001111000",
		"00000111100001111000",
		"01111000000001111000",
		"01111000000001111000",
		"01111111111111111111",
		"01111111111111111111",
		"00000000000001111000",
		"00000000000001111000",
		"00000000000001111000",
		"00000000000001111000",
		"00000000000001111000",
		"00000000000001111000",
		"00000000000001111000",
		"00000000000001111000"
		
	);
	
	constant numero5 : ROM :=
	(
		
		"11111111111111111111",
		"11111111111111111111",
		"11110000000000000000",
		"11110000000000000000",
		"11110000000000000000",
		"11110000000000000000",
		"11110000000000000000",
		"11110000000000000000",
		"11110000000000000000",
		"11111111111111110000",
		"11111111111111110000",
		"00000000000000001111",
		"00000000000000001111",
		"00000000000000001111",
		"00000000000000001111",
		"00000000000000001111",
		"11110000000000001111",
		"11110000000000001111",
		"00001111111111110000",
		"00001111111111110000"
		
	);
	
	constant numero6 : ROM :=
	(
		
		"00000000111111111000",
		"00000000111111111000",
		"00001111000000000000",
		"00001111000000000000",
		"00001111000000000000",
		"11110000000000000000",
		"11110000000000000000",
		"11110000000000000000",
		"11111111111111111000",
		"11111111111111111000",
		"11110000000000001111",
		"11110000000000001111",
		"11110000000000001111",
		"11110000000000001111",
		"11110000000000001111",
		"11110000000000001111",
		"11110000000000001111",
		"11110000000000001111",
		"00001111111111110000",
		"00001111111111110000"
		
	);
	
	constant numero7 : ROM :=
	(
		
		"11111111111111111111",
		"11111111111111111111",
		"00000000000000011111",
		"00000000000000011111",
		"00000000000000011111",
		"00000000000111100000",
		"00000000000111100000",
		"00000000000111100000",
		"00000000000111100000",
		"00000000000111100000",
		"00000001111000000000",
		"00000001111000000000",
		"00000001111000000000",
		"00000001111000000000",
		"00000001111000000000",
		"00011110000000000000",
		"00011110000000000000",
		"00011110000000000000",
		"00011110000000000000",
		"00011110000000000000"
		
	);
		
	constant numero8 : ROM :=
	(
		
		"00001111111111110000",
		"00001111111111110000",
		"11110000000000001111",
		"11110000000000001111",
		"11110000000000001111",
		"11110000000000001111",
		"11110000000000001111",
		"00001111111111110000",
		"00001111111111110000",
		"00001111111111110000",
		"11110000000000001111",
		"11110000000000001111",
		"11110000000000001111",
		"11110000000000001111",
		"11110000000000001111",
		"11110000000000001111",
		"11110000000000001111",
		"11110000000000001111",
		"00001111111111110000",
		"00001111111111110000"
		
	);
	
	constant numero9 : ROM :=
	(
		
		"00001111111111110000",
		"00001111111111110000",
		"11110000000000001111",
		"11110000000000001111",
		"11110000000000001111",
		"11110000000000001111",
		"11110000000000001111",
		"11110000000000001111",
		"11110000000000001111",
		"11110000000000001111",
		"00001111111111111111",
		"00001111111111111111",
		"00000000000000001111",
		"00000000000000001111",
		"00000000000000001111",
		"00000000000011110000",
		"00000000000011110000",
		"00000000000011110000",
		"00001111111100000000",
		"00001111111100000000"
	
	);
	
begin

	process( dir_y, dir_x )
	
	begin
	
		if( dig = 0 ) then
		
			if( numero0( dir_y )( dir_x ) = '1' ) then
		
				dat_R <= std_logic_vector(to_unsigned(255, dat_R'length));
				dat_G <= std_logic_vector(to_unsigned(255, dat_G'length));
				dat_B <= std_logic_vector(to_unsigned(255, dat_B'length));
			
			else
			
				dat_R <= std_logic_vector(to_unsigned(0  , dat_R'length));
				dat_G <= std_logic_vector(to_unsigned(0  , dat_G'length));
				dat_B <= std_logic_vector(to_unsigned(0  , dat_B'length));
		
			end if;
		
		elsif( dig = 1 ) then
		
			if( numero1( dir_y )( dir_x ) = '1' ) then
		
				dat_R <= std_logic_vector(to_unsigned(255, dat_R'length));
				dat_G <= std_logic_vector(to_unsigned(255, dat_G'length));
				dat_B <= std_logic_vector(to_unsigned(255, dat_B'length));
			
			else
			
				dat_R <= std_logic_vector(to_unsigned(0  , dat_R'length));
				dat_G <= std_logic_vector(to_unsigned(0  , dat_G'length));
				dat_B <= std_logic_vector(to_unsigned(0  , dat_B'length));
		
			end if;
		
		elsif( dig = 2 ) then
		
			if( numero2( dir_y )( dir_x ) = '1' ) then
		
				dat_R <= std_logic_vector(to_unsigned(255, dat_R'length));
				dat_G <= std_logic_vector(to_unsigned(255, dat_G'length));
				dat_B <= std_logic_vector(to_unsigned(255, dat_B'length));
			
			else
			
				dat_R <= std_logic_vector(to_unsigned(0  , dat_R'length));
				dat_G <= std_logic_vector(to_unsigned(0  , dat_G'length));
				dat_B <= std_logic_vector(to_unsigned(0  , dat_B'length));
		
			end if;
		
		elsif( dig = 3 ) then
		
			if( numero3( dir_y )( dir_x ) = '1' ) then
		
				dat_R <= std_logic_vector(to_unsigned(255, dat_R'length));
				dat_G <= std_logic_vector(to_unsigned(255, dat_G'length));
				dat_B <= std_logic_vector(to_unsigned(255, dat_B'length));
			
			else
			
				dat_R <= std_logic_vector(to_unsigned(0  , dat_R'length));
				dat_G <= std_logic_vector(to_unsigned(0  , dat_G'length));
				dat_B <= std_logic_vector(to_unsigned(0  , dat_B'length));
		
			end if;
		
		elsif( dig = 4 ) then
		
			if( numero4( dir_y )( dir_x ) = '1' ) then
		
				dat_R <= std_logic_vector(to_unsigned(255, dat_R'length));
				dat_G <= std_logic_vector(to_unsigned(255, dat_G'length));
				dat_B <= std_logic_vector(to_unsigned(255, dat_B'length));
			
			else
			
				dat_R <= std_logic_vector(to_unsigned(0  , dat_R'length));
				dat_G <= std_logic_vector(to_unsigned(0  , dat_G'length));
				dat_B <= std_logic_vector(to_unsigned(0  , dat_B'length));
		
			end if;
		
		elsif( dig = 5 ) then
		
			if( numero5( dir_y )( dir_x ) = '1' ) then
		
				dat_R <= std_logic_vector(to_unsigned(255, dat_R'length));
				dat_G <= std_logic_vector(to_unsigned(255, dat_G'length));
				dat_B <= std_logic_vector(to_unsigned(255, dat_B'length));
			
			else
			
				dat_R <= std_logic_vector(to_unsigned(0  , dat_R'length));
				dat_G <= std_logic_vector(to_unsigned(0  , dat_G'length));
				dat_B <= std_logic_vector(to_unsigned(0  , dat_B'length));
		
			end if;
		
		elsif( dig = 6 ) then
		
			if( numero6( dir_y )( dir_x ) = '1' ) then
		
				dat_R <= std_logic_vector(to_unsigned(255, dat_R'length));
				dat_G <= std_logic_vector(to_unsigned(255, dat_G'length));
				dat_B <= std_logic_vector(to_unsigned(255, dat_B'length));
			
			else
			
				dat_R <= std_logic_vector(to_unsigned(0  , dat_R'length));
				dat_G <= std_logic_vector(to_unsigned(0  , dat_G'length));
				dat_B <= std_logic_vector(to_unsigned(0  , dat_B'length));
		
			end if;
		
		elsif( dig = 7 ) then
			
			if( numero7( dir_y )( dir_x ) = '1' ) then
		
				dat_R <= std_logic_vector(to_unsigned(255, dat_R'length));
				dat_G <= std_logic_vector(to_unsigned(255, dat_G'length));
				dat_B <= std_logic_vector(to_unsigned(255, dat_B'length));
			
			else
			
				dat_R <= std_logic_vector(to_unsigned(0  , dat_R'length));
				dat_G <= std_logic_vector(to_unsigned(0  , dat_G'length));
				dat_B <= std_logic_vector(to_unsigned(0  , dat_B'length));
		
			end if;
		
		
		elsif( dig = 8 ) then
		
			if( numero8( dir_y )( dir_x ) = '1' ) then
		
				dat_R <= std_logic_vector(to_unsigned(255, dat_R'length));
				dat_G <= std_logic_vector(to_unsigned(255, dat_G'length));
				dat_B <= std_logic_vector(to_unsigned(255, dat_B'length));
			
			else
			
				dat_R <= std_logic_vector(to_unsigned(0  , dat_R'length));
				dat_G <= std_logic_vector(to_unsigned(0  , dat_G'length));
				dat_B <= std_logic_vector(to_unsigned(0  , dat_B'length));
		
			end if;
		
		elsif( dig = 9 ) then
		
			if( numero9( dir_y )( dir_x ) = '1' ) then
		
				dat_R <= std_logic_vector(to_unsigned(255, dat_R'length));
				dat_G <= std_logic_vector(to_unsigned(255, dat_G'length));
				dat_B <= std_logic_vector(to_unsigned(255, dat_B'length));
			
			else
			
				dat_R <= std_logic_vector(to_unsigned(0  , dat_R'length));
				dat_G <= std_logic_vector(to_unsigned(0  , dat_G'length));
				dat_B <= std_logic_vector(to_unsigned(0  , dat_B'length));
		
			end if;
		
		end if;
	
	end process;


end comp;