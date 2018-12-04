library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Sync_VGA is

	Generic(
		
		hori_line    : integer := 800;                            
		hori_back    : integer := 144;
		hori_front   : integer := 16;
		vert_line    : integer := 525;
		vert_back    : integer := 34; 
		vert_front   : integer := 11; 
		H_sync_cycle : integer := 96;
		V_sync_cycle : integer := 2
	
	);
		
	Port(
		
		clk     : in std_logic;
			
		-- MAtriz de pixeles validos
			
		pos_x   : out   integer;
		pos_y   : out   integer;
		blank_n : inout std_logic;
			
		-- Sincronizacion con el monitor
			
		hsync   : out std_logic;
		vsync   : out std_logic
		
	);

end SYnc_VGA;

architecture compSync_VGA of Sync_VGA is

	-- Contadores horizontal y vertical
	signal h_cnt, v_cnt : integer := 0;
	
	-- Validando region para imprimir en pantalla
	signal cHD, cVD     : std_logic := '0';
	signal cDEN         : std_logic := '0';
	signal hori_valid   : std_logic := '0';
	signal vert_valid   : std_logic := '0';
	signal blank        : std_logic := '0';
	
	-- Posicion x e y en la matriz de pixeles
	signal x, y         : integer := 0;
	
	-- Señales para la sincronizacion
	signal HS, VS       : std_logic := '0';


begin

	
	-- Contadores horizontal y vertical
	process( clk ) 
	begin
	
		if falling_edge( clk ) then

			if( h_cnt = hori_line - 1 ) then
			
				h_cnt <= 0;
				if ( v_cnt = vert_line - 1 ) then
					v_cnt <= 0;
					
				else
					v_cnt <= v_cnt + 1;
					
				end if;
			
			else
				h_cnt <= h_cnt + 1;
			
			end if;
		
		end if;
	
	end process;
	
	-- Consideraciones para saber cuando es momento para imprimir en pantalla
	cHD <= '0' when ( h_cnt < H_sync_cycle ) else '1';
	cVD <= '0' when ( v_cnt < V_sync_cycle ) else '1';

	hori_valid <= '1' when ( h_cnt < ( hori_line - hori_front ) and h_cnt >= hori_back ) else '0';
	vert_valid <= '1' when ( v_cnt < ( vert_line - vert_front ) and v_cnt >= vert_back ) else '0';

	cDEN <= hori_valid and vert_valid;
	
	-- HS, VS y blank_n
	process( clk, cHD, cVD, CDEN )
	begin
	
		if falling_edge( clk ) then
		
			HS      <= cHD;
			VS      <= cVD;
			blank   <= cDEN;
		
		end if;
	
	end process;
	
	-- Matrix
	process ( clk, blank_n )
	begin
	
		if( falling_edge( clk ) and blank_n = '1' ) then
	
			x <= h_cnt - hori_back; -- 0 a 640
			y <= v_cnt - vert_back; -- 0 a 480
				
--		elsif ( rising_edge( clk ) and blank_n = '0' ) then
--
--			x <= 0;
--			y <= 0;
		
		end if;
	
	end process;
	
	pos_x   <= x;
	pos_y   <= y;

	blank_n <= blank;
	
	hsync   <= HS;
	vsync   <= VS;

end compSync_VGA;