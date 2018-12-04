library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Mario is

	Port(
		
		clk       : in  std_logic; 
		
		izquierda : in  std_logic;
		derecha   : in  std_logic;
		salto     : in  std_logic;
		pausa     : in  std_logic;
		
		hsync     : out std_logic;
		vsync     : out std_logic;
		
		vga_R     : out std_logic_vector( 3 downto 0 );
		vga_G     : out std_logic_vector( 3 downto 0 );
		vga_B     : out std_logic_vector( 3 downto 0 )
	
	);
	
end Mario;

architecture compMario of Mario is

	-----------------------------------------
	-- Con este modulo se controla a Mario --
	-----------------------------------------

	component Controlador_VGA is
	
		Port(
		
			clk       : in  std_logic; 
			
			-- Matriz de pixeles para mandar objetos al monitor
			
			pos_x     : in integer;
			pos_y     : in integer;
			blank_n   : in std_logic;
			
			-- Botones de entrada
			
			izquierda : in  std_logic;
			derecha   : in  std_logic;
			salto     : in  std_logic;
			pausa     : in  std_logic;
			
			-- Salidas al monitor
			
			vga_R     : out std_logic_vector( 3 downto 0 );
			vga_G     : out std_logic_vector( 3 downto 0 );
			vga_B     : out std_logic_vector( 3 downto 0 );
		
			-- ROM del piso
			
			dir_piso_y : out integer;
			dir_piso_x : out integer;
			piso_R     : in  std_logic_vector( 7 downto 0 );
			piso_G     : in  std_logic_vector( 7 downto 0 );
			piso_B     : in  std_logic_vector( 7 downto 0 );
		
			-- ROM mario a la derecha: progresion 0
			
			dir_mariod0_y : out integer;
			dir_mariod0_x : out integer;
			mariod0_R     : in  std_logic_vector( 7 downto 0 ); 
			mariod0_G     : in  std_logic_vector( 7 downto 0 );
			mariod0_B     : in  std_logic_vector( 7 downto 0 );
			
			-- ROM mario a la derecha: progresion 1
			
			dir_mariod1_y : out integer;
			dir_mariod1_x : out integer;
			mariod1_R     : in  std_logic_vector( 7 downto 0 ); 
			mariod1_G     : in  std_logic_vector( 7 downto 0 );
			mariod1_B     : in  std_logic_vector( 7 downto 0 );
		
			-- ROM mario a la derecha: progresion 2
			
			dir_mariod2_y : out integer;
			dir_mariod2_x : out integer;
			mariod2_R     : in  std_logic_vector( 7 downto 0 ); 
			mariod2_G     : in  std_logic_vector( 7 downto 0 );
			mariod2_B     : in  std_logic_vector( 7 downto 0 );
		
			-- ROM mario a la derecha: progresion 3
			
			dir_mariod3_y : out integer;
			dir_mariod3_x : out integer;
			mariod3_R     : in  std_logic_vector( 7 downto 0 ); 
			mariod3_G     : in  std_logic_vector( 7 downto 0 );
			mariod3_B     : in  std_logic_vector( 7 downto 0 );
		
			-- ROM mario a la derecha saltando
			dir_mariods_y : out integer;
			dir_mariods_x : out integer;
			mariods_R     : in  std_logic_vector( 7 downto 0 ); 
			mariods_G     : in  std_logic_vector( 7 downto 0 );
			mariods_B     : in  std_logic_vector( 7 downto 0 );
		
			-- ROM goomba: progresion 1
			dir_goomba1_y : out integer;
			dir_goomba1_x : out integer;
			goomba1_R     : in  std_logic_vector( 7 downto 0 );
			goomba1_G     : in  std_logic_vector( 7 downto 0 );
			goomba1_B     : in  std_logic_vector( 7 downto 0 );
		
			-- ROM goomba: progresion 2
			dir_goomba2_y    : out integer;
			dir_goomba2_x    : out integer;
			goomba2_R        : in  std_logic_vector( 7 downto 0 ); 
			goomba2_G        : in  std_logic_vector( 7 downto 0 );
			goomba2_B        : in  std_logic_vector( 7 downto 0 );
		
			-- ROM nube1
			dir_nube1_y      : out integer;
			dir_nube1_x      : out integer;
			nube1_R          : in  std_logic_vector( 7 downto 0 );
			nube1_G          : in  std_logic_vector( 7 downto 0 );
			nube1_B          : in  std_logic_vector( 7 downto 0 );

			-- ROM pipe1
			dir_pipe1_y      : out integer;
			dir_pipe1_x      : out integer;
			pipe1_R     	  : in  std_logic_vector( 7 downto 0 );
			pipe1_G          : in  std_logic_vector( 7 downto 0 );
			pipe1_B          : in  std_logic_vector( 7 downto 0 );
		
			-- ROM caja
			dir_caja_y       : out integer;
			dir_caja_x       : out integer;
			caja_R           : in  std_logic_vector( 7 downto 0 );
			caja_G           : in  std_logic_vector( 7 downto 0 );
			caja_B           : in  std_logic_vector( 7 downto 0 );
		
			-- ROM bloque
			dir_bloque_y     : out integer;
			dir_bloque_x     : out integer;
			bloque_R         : in  std_logic_vector( 7 downto 0 );
			bloque_G         : in  std_logic_vector( 7 downto 0 );
			bloque_B         : in  std_logic_vector( 7 downto 0 );
		
			-- ROM fondo
			dir_bg_y         : out integer;
			dir_bg_x         : out integer;
			bg_R             : in  std_logic_vector( 7 downto 0 );
			bg_G             : in  std_logic_vector( 7 downto 0 );
			bg_B             : in  std_logic_vector( 7 downto 0 );
			
			-- ROM fondo 2
			dir_bg2_y        : out integer;
			dir_bg2_x        : out integer;
			bg2_R            : in  std_logic_vector( 7 downto 0 );
			bg2_G            : in  std_logic_vector( 7 downto 0 );
			bg2_B            : in  std_logic_vector( 7 downto 0 );
			
			-- ROM fondo 3
			dir_bg3_y        : out integer;
			dir_bg3_x        : out integer;
			bg3_R            : in  std_logic_vector( 7 downto 0 );
			bg3_G            : in  std_logic_vector( 7 downto 0 );
			bg3_B            : in  std_logic_vector( 7 downto 0 );
			
			-- ROM fondo 4
			dir_bg4_y        : out integer;
			dir_bg4_x        : out integer;
			bg4_R            : in  std_logic_vector( 7 downto 0 );
			bg4_G            : in  std_logic_vector( 7 downto 0 );
			bg4_B            : in  std_logic_vector( 7 downto 0 );
		
			-- Numeros
			dir_num_y        : out integer;
			dir_num_x        : out integer;
			dig              : out integer;
			num_R            : in  std_logic_vector( 7 downto 0 );
			num_G            : in  std_logic_vector( 7 downto 0 );
			num_B            : in  std_logic_vector( 7 downto 0 );
		
			-- Koopa
			dir_koopa_y        : out integer;
			dir_koopa_x        : out integer;
			koopa_R            : in  std_logic_vector( 7 downto 0 );
			koopa_G            : in  std_logic_vector( 7 downto 0 );
			koopa_B            : in  std_logic_vector( 7 downto 0 );
		
			-- Fuego
			dir_fuego_y        : out integer;
			dir_fuego_x        : out integer;
			fuego_R            : in  std_logic_vector( 7 downto 0 );
			fuego_G            : in  std_logic_vector( 7 downto 0 );
			fuego_B            : in  std_logic_vector( 7 downto 0 );
		
			-- Start
			dir_start_y        : out integer;
			dir_start_x        : out integer;
			start_R            : in  std_logic_vector( 7 downto 0 );
			start_G            : in  std_logic_vector( 7 downto 0 );
			start_B            : in  std_logic_vector( 7 downto 0 );
		
			-- Nivel
			dir_nivel_y        : out integer;
			dir_nivel_x        : out integer;
			nivel_R            : in  std_logic_vector( 7 downto 0 );
			nivel_G            : in  std_logic_vector( 7 downto 0 );
			nivel_B            : in  std_logic_vector( 7 downto 0 );
		
			-- Fin
			dir_fin_y        : out integer;
			dir_fin_x        : out integer;
			fin_R            : in  std_logic_vector( 7 downto 0 );
			fin_G            : in  std_logic_vector( 7 downto 0 );
			fin_B            : in  std_logic_vector( 7 downto 0 );
		
			-- ROM titulo del juego
			dir_titulo_y : out integer; 
			dir_titulo_x : out integer;
			titulo_R     : in  std_logic_vector( 7 downto 0 );
			titulo_G     : in  std_logic_vector( 7 downto 0 );
			titulo_B     : in  std_logic_vector( 7 downto 0 )
		
		);
		
	end component;

	-----------------------------------------
	-- Sincronizacion con el monitor       --
	-----------------------------------------
	
	component Sync_VGA is
	
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
	
	end component;
	
	-----------------------------------------
	-- ROM de cada elemento                --
	-----------------------------------------
	
	component titulo_ROM is
	
		Port(
	
			dir_y : in integer;
			dir_x : in integer;
			
			dat_R : out std_logic_vector( 7 downto 0 );
			dat_G : out std_logic_vector( 7 downto 0 );
			dat_B : out std_logic_vector( 7 downto 0 )
			
		);
	
	end component;
	
	component piso_ROM is
	
		Port(
	
			dir_y : in integer;
			dir_x : in integer;
			
			dat_R : out std_logic_vector( 7 downto 0 );
			dat_G : out std_logic_vector( 7 downto 0 );
			dat_B : out std_logic_vector( 7 downto 0 )
			
		);
	
	end component;
	
	----------------------------------------
	-- Mario requiere de varias ROM       --
	----------------------------------------
	
	component mariod0_ROM is
	
		Port(
	
			dir_y : in integer;
			dir_x : in integer;
			
			dat_R : out std_logic_vector( 7 downto 0 );
			dat_G : out std_logic_vector( 7 downto 0 );
			dat_B : out std_logic_vector( 7 downto 0 )
			
		);
	
	end component;
	
	component mariod1_ROM is
	
		Port(
	
			dir_y : in integer;
			dir_x : in integer;
			
			dat_R : out std_logic_vector( 7 downto 0 );
			dat_G : out std_logic_vector( 7 downto 0 );
			dat_B : out std_logic_vector( 7 downto 0 )
			
		);
	
	end component;
	
	component mariod2_ROM is
	
		Port(
	
			dir_y : in integer;
			dir_x : in integer;
			
			dat_R : out std_logic_vector( 7 downto 0 );
			dat_G : out std_logic_vector( 7 downto 0 );
			dat_B : out std_logic_vector( 7 downto 0 )
			
		);
	
	end component;
	
	component mariod3_ROM is
	
		Port(
	
			dir_y : in integer;
			dir_x : in integer;
			
			dat_R : out std_logic_vector( 7 downto 0 );
			dat_G : out std_logic_vector( 7 downto 0 );
			dat_B : out std_logic_vector( 7 downto 0 )
			
		);
	
	end component;
	
	component mariods_ROM is
	
		Port(
	
			dir_y : in integer;
			dir_x : in integer;
			
			dat_R : out std_logic_vector( 7 downto 0 );
			dat_G : out std_logic_vector( 7 downto 0 );
			dat_B : out std_logic_vector( 7 downto 0 )
			
		);
	
	end component;
	
	component caja_ROM is
	
		Port(
	
			dir_y : in integer;
			dir_x : in integer;
			
			dat_R : out std_logic_vector( 7 downto 0 );
			dat_G : out std_logic_vector( 7 downto 0 );
			dat_B : out std_logic_vector( 7 downto 0 )
			
		);
	
	end component;
	
	component bloque_ROM is
	
		Port(
	
			dir_y : in integer;
			dir_x : in integer;
			
			dat_R : out std_logic_vector( 7 downto 0 );
			dat_G : out std_logic_vector( 7 downto 0 );
			dat_B : out std_logic_vector( 7 downto 0 )
			
		);
	
	end component;
	
	component nube1_ROM is
	
		Port(
	
			dir_y : in integer;
			dir_x : in integer;
			
			dat_R : out std_logic_vector( 7 downto 0 );
			dat_G : out std_logic_vector( 7 downto 0 );
			dat_B : out std_logic_vector( 7 downto 0 )
			
		);
	
	end component;
	
	component pipe1_ROM is
	
		Port(
	
			dir_y : in integer;
			dir_x : in integer;
			
			dat_R : out std_logic_vector( 7 downto 0 );
			dat_G : out std_logic_vector( 7 downto 0 );
			dat_B : out std_logic_vector( 7 downto 0 )
			
		);
	
	end component;
	
	component goomba1_ROM is
	
		Port(
	
			dir_y : in integer;
			dir_x : in integer;
			
			dat_R : out std_logic_vector( 7 downto 0 );
			dat_G : out std_logic_vector( 7 downto 0 );
			dat_B : out std_logic_vector( 7 downto 0 )
			
		);
	
	end component;
	
	component goomba2_ROM is
	
		Port(
	
			dir_y : in integer;
			dir_x : in integer;
			
			dat_R : out std_logic_vector( 7 downto 0 );
			dat_G : out std_logic_vector( 7 downto 0 );
			dat_B : out std_logic_vector( 7 downto 0 )
			
		);
	
	end component;
	
	component bg_ROM is
	
		Port(
	
			dir_y : in integer;
			dir_x : in integer;
			
			dat_R : out std_logic_vector( 7 downto 0 );
			dat_G : out std_logic_vector( 7 downto 0 );
			dat_B : out std_logic_vector( 7 downto 0 )
			
		);
	
	end component;
	
	component bg2_ROM is
	
		Port(
	
			dir_y : in integer;
			dir_x : in integer;
			
			dat_R : out std_logic_vector( 7 downto 0 );
			dat_G : out std_logic_vector( 7 downto 0 );
			dat_B : out std_logic_vector( 7 downto 0 )
			
		);
	
	end component;
	
	component bg3_ROM is
	
		Port(
	
			dir_y : in integer;
			dir_x : in integer;
			
			dat_R : out std_logic_vector( 7 downto 0 );
			dat_G : out std_logic_vector( 7 downto 0 );
			dat_B : out std_logic_vector( 7 downto 0 )
			
		);
	
	end component;
	
	component bg4_ROM is
	
		Port(
	
			dir_y : in integer;
			dir_x : in integer;
			
			dat_R : out std_logic_vector( 7 downto 0 );
			dat_G : out std_logic_vector( 7 downto 0 );
			dat_B : out std_logic_vector( 7 downto 0 )
			
		);
	
	end component;
	
	component numeros_ROM is
	
		Port(
	
			dir_y : in integer;
			dir_x : in integer;
			dig   : in integer;
			
			dat_R : out std_logic_vector( 7 downto 0 );
			dat_G : out std_logic_vector( 7 downto 0 );
			dat_B : out std_logic_vector( 7 downto 0 )
			
		);
	
	end component;
	
	component koopa_ROM is
	
		Port(
	
			dir_y : in integer;
			dir_x : in integer;
			
			dat_R : out std_logic_vector( 7 downto 0 );
			dat_G : out std_logic_vector( 7 downto 0 );
			dat_B : out std_logic_vector( 7 downto 0 )
			
		);
	
	end component;
	
	component fuego_ROM is
	
		Port(
	
			dir_y : in integer;
			dir_x : in integer;
			
			dat_R : out std_logic_vector( 7 downto 0 );
			dat_G : out std_logic_vector( 7 downto 0 );
			dat_B : out std_logic_vector( 7 downto 0 )
			
		);
	
	end component;
	
	component start_ROM is
	
		Port(
	
			dir_y : in integer;
			dir_x : in integer;
			
			dat_R : out std_logic_vector( 7 downto 0 );
			dat_G : out std_logic_vector( 7 downto 0 );
			dat_B : out std_logic_vector( 7 downto 0 )
			
		);
	
	end component;
	
	component nivel_ROM is
	
		Port(
	
			dir_y : in integer;
			dir_x : in integer;
			
			dat_R : out std_logic_vector( 7 downto 0 );
			dat_G : out std_logic_vector( 7 downto 0 );
			dat_B : out std_logic_vector( 7 downto 0 )
			
		);
	
	end component;
	
	component fin_ROM is
	
		Port(
	
			dir_y : in integer;
			dir_x : in integer;
			
			dat_R : out std_logic_vector( 7 downto 0 );
			dat_G : out std_logic_vector( 7 downto 0 );
			dat_B : out std_logic_vector( 7 downto 0 )
			
		);
	
	end component;
	
	-- Reloj a 25 [ MHz ]
	signal clk_25MHz : std_logic := '0';
	
	-- Matriz de pixeles validos 
	signal x, y  : integer := 0;
	
	-- Momento cuando es valido imprimir en pantalla
	signal blank : std_logic := '0';
	
	-- Referente a la ROM del titulo
	signal titulo_y, titulo_x : integer := 0;
	signal titulo_R, titulo_G, titulo_B : std_logic_vector( 7 downto 0 );
	
	-- Referente a la ROM del piso
	signal piso_y, piso_x : integer := 0;
	signal piso_R, piso_G, piso_B : std_logic_vector( 7 downto 0 );
	
	-- Mario viendo a la derecha: progresion 0
	signal mariod0_x, mariod0_y : integer := 0;
	signal mariod0_R, mariod0_G, mariod0_B : std_logic_vector( 7 downto 0 );
	
	-- Mario viendo a la derecha: progresion 1
	signal mariod1_x, mariod1_y : integer := 0;
	signal mariod1_R, mariod1_G, mariod1_B : std_logic_vector( 7 downto 0 );
	
	-- Mario viendo a la derecha: progresion 2
	signal mariod2_x, mariod2_y : integer := 0;
	signal mariod2_R, mariod2_G, mariod2_B : std_logic_vector( 7 downto 0 );
	
	-- Mario viendo a la derecha: progresion 3
	signal mariod3_x, mariod3_y : integer := 0;
	signal mariod3_R, mariod3_G, mariod3_B : std_logic_vector( 7 downto 0 );
	
	-- Mario viendo a la derecha: salto
	signal mariods_x, mariods_y : integer := 0;
	signal mariods_R, mariods_G, mariods_B : std_logic_vector( 7 downto 0 );
	
	-- Nube larga
	signal nube1_x, nube1_y : integer := 0;
	signal nube1_R, nube1_G, nube1_B : std_logic_vector( 7 downto 0 );
	
	-- Bloque
	signal bloque_x, bloque_y : integer := 0;
	signal bloque_R, bloque_G, bloque_B : std_logic_vector( 7 downto 0 );
	
	-- Caja
	signal caja_x, caja_y : integer := 0;
	signal caja_R, caja_G, caja_B : std_logic_vector( 7 downto 0 );
	
	-- Pipe corto
	signal pipe1_x, pipe1_y : integer := 0;
	signal pipe1_R, pipe1_G, pipe1_B : std_logic_vector( 7 downto 0 );
	
	-- Goomba : progresion 1
	signal goomba1_x, goomba1_y : integer := 0;
	signal goomba1_R, goomba1_G, goomba1_B : std_logic_vector( 7 downto 0 );
	
	-- Goomba : progresion 2
	signal goomba2_x, goomba2_y : integer := 0;
	signal goomba2_R, goomba2_G, goomba2_B : std_logic_vector( 7 downto 0 );
	
	-- Fondo
	signal bg_x, bg_y : integer := 0;
	signal bg_R, bg_G, bg_B : std_logic_vector( 7 downto 0 );
	
	-- Fondo2
	signal bg2_x, bg2_y : integer := 0;
	signal bg2_R, bg2_G, bg2_B : std_logic_vector( 7 downto 0 );
	
	-- Fondo3
	signal bg3_x, bg3_y : integer := 0;
	signal bg3_R, bg3_G, bg3_B : std_logic_vector( 7 downto 0 );
	
	-- Fondo4
	signal bg4_x, bg4_y : integer := 0;
	signal bg4_R, bg4_G, bg4_B : std_logic_vector( 7 downto 0 );
	
	-- Numeros
	signal num_x, num_y : integer := 0;
	signal num_R, num_G, num_B : std_logic_vector( 7 downto 0 );
	signal dig          : integer := 0;
	
	-- Koopa
	signal koopa_x, koopa_y : integer := 0;
	signal koopa_R, koopa_G, koopa_B : std_logic_vector( 7 downto 0 );
	
	-- Fuego
	signal fuego_x, fuego_y : integer := 0;
	signal fuego_R, fuego_G, fuego_B : std_logic_vector( 7 downto 0 );
	
	-- Start
	signal start_x, start_y : integer := 0;
	signal start_R, start_G, start_B : std_logic_vector( 7 downto 0 );
	
	-- Nivel
	signal nivel_x, nivel_y : integer := 0;
	signal nivel_R, nivel_G, nivel_B : std_logic_vector( 7 downto 0 );
	
	-- FIn
	signal fin_x, fin_y : integer := 0;
	signal fin_R, fin_G, fin_B : std_logic_vector( 7 downto 0 );
	
begin

	-- Reloj @ 25 [MHz]
	process( clk )
	begin
	
		if rising_edge( clk ) then
			clk_25MHz <= not( clk_25MHz );
		end if;
	
	end process;

	comp_Sync       : Sync_VGA Port Map(
	
		clk     => clk_25MHz, 
		pos_x   => x, 
		pos_y   => y, 
		blank_n => blank,
		hsync   => hsync,
		vsync   => vsync  );

	comp_Piso       : piso_ROM Port Map(
	
		dir_y => piso_y,
		dir_x => piso_x,
		dat_R => piso_R,
		dat_G => piso_G, 
		dat_B => piso_B
		
	);
	
	comp_Titulo     : titulo_ROM port map(
	
		dir_y => titulo_y,
		dir_x => titulo_x,
		dat_R => titulo_R,
		dat_G => titulo_G, 
		dat_B => titulo_B
	
	);
	
	comp_mariod0    : mariod0_ROM Port Map(
	
		dir_y => mariod0_y,
		dir_x => mariod0_x,
		dat_R => mariod0_R,
		dat_G => mariod0_G, 
		dat_B => mariod0_B
	
	);
		
	comp_mariod1    : mariod1_ROM Port Map(
	
		dir_y => mariod1_y,
		dir_x => mariod1_x,
		dat_R => mariod1_R,
		dat_G => mariod1_G, 
		dat_B => mariod1_B
	
	);
	
	comp_mariod2    : mariod2_ROM Port Map(
	
		dir_y => mariod2_y,
		dir_x => mariod2_x,
		dat_R => mariod2_R,
		dat_G => mariod2_G, 
		dat_B => mariod2_B
	
	);
	
	comp_mariod3    : mariod3_ROM Port Map(
	
		dir_y => mariod3_y,
		dir_x => mariod3_x,
		dat_R => mariod3_R,
		dat_G => mariod3_G, 
		dat_B => mariod3_B
	
	);
	
	comp_mariods    : mariods_ROM Port Map(
	
		dir_y => mariods_y,
		dir_x => mariods_x,
		dat_R => mariods_R,
		dat_G => mariods_G, 
		dat_B => mariods_B	
	
	);
	
	comp_nube1      : nube1_ROM Port Map(
	
		dir_y => nube1_y,
		dir_x => nube1_x,
		dat_R => nube1_R,
		dat_G => nube1_G, 
		dat_B => nube1_B
	
	
	);
	
	comp_pipe1      : pipe1_ROM Port Map(
	
		dir_y => pipe1_y,
		dir_x => pipe1_x,
		dat_R => pipe1_R,
		dat_G => pipe1_G, 
		dat_B => pipe1_B
	
	);
	
	comp_caja       : caja_ROM Port Map(
	
		dir_y => caja_y,
		dir_x => caja_x,
		dat_R => caja_R,
		dat_G => caja_G, 
		dat_B => caja_B
	
	);
	
	comp_bloque     : bloque_ROM Port Map(
	
		dir_y => bloque_y,
		dir_x => bloque_x,
		dat_R => bloque_R,
		dat_G => bloque_G, 
		dat_B => bloque_B
	
	);
	
	comp_goomba1    : goomba1_ROM Port Map(
	
		dir_y => goomba1_y,
		dir_x => goomba1_x,
		dat_R => goomba1_R,
		dat_G => goomba1_G, 
		dat_B => goomba1_B
	
	);
	
	comp_goomba2    : goomba1_ROM Port Map(
	
		dir_y => goomba2_y,
		dir_x => goomba2_x,
		dat_R => goomba2_R,
		dat_G => goomba2_G, 
		dat_B => goomba2_B
	
	);
	
	comp_bg         : bg_ROM Port Map(
	
		dir_y => bg_y,
		dir_x => bg_x,
		dat_R => bg_R,
		dat_G => bg_G, 
		dat_B => bg_B
	
	);
	
	comp_bg2        : bg2_ROM Port Map(
	
		dir_y => bg2_y,
		dir_x => bg2_x,
		dat_R => bg2_R,
		dat_G => bg2_G, 
		dat_B => bg2_B
	
	);
	
	comp_bg3        : bg3_ROM Port Map(
	
		dir_y => bg3_y,
		dir_x => bg3_x,
		dat_R => bg3_R,
		dat_G => bg3_G, 
		dat_B => bg3_B
	
	);
	
	comp_bg4        : bg4_ROM Port Map(
	
		dir_y => bg4_y,
		dir_x => bg4_x,
		dat_R => bg4_R,
		dat_G => bg4_G, 
		dat_B => bg4_B
	
	);
	
	comp_numeros    : numeros_ROM Port Map(
	
		dir_y => num_y,
		dir_x => num_x,
		dig   => dig,
		dat_R => num_R,
		dat_G => num_G, 
		dat_B => num_B
	
	);
	
	comp_koopa      : koopa_ROM Port Map(
	
		dir_y => koopa_y,
		dir_x => koopa_x,
		dat_R => koopa_R,
		dat_G => koopa_G, 
		dat_B => koopa_B
	
	);
	
	comp_fuego      : fuego_ROM Port Map(
	
		dir_y => fuego_y,
		dir_x => fuego_x,
		dat_R => fuego_R,
		dat_G => fuego_G, 
		dat_B => fuego_B
	
	);
	
	comp_start      : start_ROM Port Map(
	
		dir_y => start_y,
		dir_x => start_x,
		dat_R => start_R,
		dat_G => start_G, 
		dat_B => start_B
	
	);
	
	comp_nivel      : nivel_ROM Port Map(
	
		dir_y => nivel_y,
		dir_x => nivel_x,
		dat_R => nivel_R,
		dat_G => nivel_G, 
		dat_B => nivel_B
	
	);
	
	comp_fin        : fin_ROM Port Map(
	
		dir_y => fin_y,
		dir_x => fin_x,
		dat_R => fin_R,
		dat_G => fin_G, 
		dat_B => fin_B
	
	);
	
	comp_Controlador: Controlador_VGA Port Map( 
	
		clk       => clk_25MHz, 
      pos_x     => x,
		pos_y     => y,
		blank_n   => blank,
		izquierda => izquierda,
		derecha   => derecha,
		salto     => salto,
		pausa     => pausa,
		vga_R     => vga_R,
		vga_G     => vga_G,
		vga_B     => vga_B,
	
		-- ROM DEL PISO
		
		dir_piso_y => piso_y,
		dir_piso_x => piso_x,
		piso_R     => piso_R,
		piso_G     => piso_G,
		piso_B     => piso_B,
		
		-- ROM mario a la derecha: progresion 0
		
		dir_mariod0_y => mariod0_y,
		dir_mariod0_x => mariod0_x,
		mariod0_R     => mariod0_R, 
		mariod0_G     => mariod0_G,
		mariod0_B     => mariod0_B,
		
		-- ROM mario a la derecha: progresion 1
		
		dir_mariod1_y => mariod1_y,
		dir_mariod1_x => mariod1_x,
		mariod1_R     => mariod1_R, 
		mariod1_G     => mariod1_G,
		mariod1_B     => mariod1_B,

		-- ROM mario a la derecha: progresion 2
		
		dir_mariod2_y => mariod2_y,
		dir_mariod2_x => mariod2_x,
		mariod2_R     => mariod2_R, 
		mariod2_G     => mariod2_G,
		mariod2_B     => mariod2_B,
		
		-- ROM mario a la derecha: progresion 0
		
		dir_mariod3_y => mariod3_y,
		dir_mariod3_x => mariod3_x,
		mariod3_R     => mariod3_R, 
		mariod3_G     => mariod3_G,
		mariod3_B     => mariod3_B,
		
		-- ROM mario a la derecha saltando
		dir_mariods_y => mariods_y,
		dir_mariods_x => mariods_x,
		mariods_R     => mariods_R, 
		mariods_G     => mariods_G,
		mariods_B     => mariods_B,
		
		-- ROM goomba: progresion 1
		dir_goomba1_y => goomba1_y,
		dir_goomba1_x => goomba1_x,
		goomba1_R     => goomba1_R, 
		goomba1_G     => goomba1_G,
		goomba1_B     => goomba1_B,
		
		-- ROM goomba: progresion 2
		dir_goomba2_y => goomba2_y,
		dir_goomba2_x => goomba2_x,
		goomba2_R     => goomba2_R, 
		goomba2_G     => goomba2_G,
		goomba2_B     => goomba2_B,
		
		-- ROM nube1
		dir_nube1_y => nube1_y,
		dir_nube1_x => nube1_x,
		nube1_R     => nube1_R, 
		nube1_G     => nube1_G,
		nube1_B     => nube1_B,

		-- ROM pipe1
		dir_pipe1_y => pipe1_y,
		dir_pipe1_x => pipe1_x,
		pipe1_R     => pipe1_R, 
		pipe1_G     => pipe1_G,
		pipe1_B     => pipe1_B,
		
		-- ROM caja
		dir_caja_y => caja_y,
		dir_caja_x => caja_x,
		caja_R     => caja_R, 
		caja_G     => caja_G,
		caja_B     => caja_B,
		
		-- ROM bloque
		dir_bloque_y => bloque_y,
		dir_bloque_x => bloque_x,
		bloque_R     => bloque_R, 
		bloque_G     => bloque_G,
		bloque_B     => bloque_B,
		
		-- ROM fondo
		
		dir_bg_y => bg_y,
		dir_bg_x => bg_x,
		bg_R     => bg_R, 
		bg_G     => bg_G,
		bg_B     => bg_B,
		
		-- ROM fondo 2
		
		dir_bg2_y => bg2_y,
		dir_bg2_x => bg2_x,
		bg2_R     => bg2_R, 
		bg2_G     => bg2_G,
		bg2_B     => bg2_B,
		
		-- ROM fondo 3
		
		dir_bg3_y => bg3_y,
		dir_bg3_x => bg3_x,
		bg3_R     => bg3_R, 
		bg3_G     => bg3_G,
		bg3_B     => bg3_B,
		
		-- ROM fondo 4
		
		dir_bg4_y => bg4_y,
		dir_bg4_x => bg4_x,
		bg4_R     => bg4_R, 
		bg4_G     => bg4_G,
		bg4_B     => bg4_B,
		
		-- Numeros
		
		dir_num_y => num_y,
		dir_num_x => num_x,
		dig       => dig,
		num_R     => num_R, 
		num_G     => num_G,
		num_B     => num_B,
		
		-- Koopa
		
		dir_koopa_y => koopa_y,
		dir_koopa_x => koopa_x,
		koopa_R     => koopa_R, 
		koopa_G     => koopa_G,
		koopa_B     => koopa_B,
		
		-- Fuego
		
		dir_fuego_y => fuego_y,
		dir_fuego_x => fuego_x,
		fuego_R     => fuego_R, 
		fuego_G     => fuego_G,
		fuego_B     => fuego_B,
		
		-- Start
		
		dir_start_y => start_y,
		dir_start_x => start_x,
		start_R     => start_R, 
		start_G     => start_G,
		start_B     => start_B,
		
		-- Start
		
		dir_nivel_y => nivel_y,
		dir_nivel_x => nivel_x,
		nivel_R     => nivel_R, 
		nivel_G     => nivel_G,
		nivel_B     => nivel_B,
		
		-- Start
		
		dir_fin_y => fin_y,
		dir_fin_x => fin_x,
		fin_R     => fin_R, 
		fin_G     => fin_G,
		fin_B     => fin_B,
		
		-- ROM titulo del juego
		
		dir_titulo_y => titulo_y,
		dir_titulo_x => titulo_x,
		titulo_R     => titulo_R,
		titulo_G     => titulo_G,
		titulo_B     => titulo_B
		
		);
	

end compMario;