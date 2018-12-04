library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Controlador_VGA is

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

end Controlador_VGA;

architecture compControlador_VGA of Controlador_VGA is

	-------------------------------------------------
	-- ESTADOS DEL JUEGO                           --
	-------------------------------------------------
	
	type   estados is ( intro, juego, sigNivel, fin );
	signal presente : estados := intro;

	-------------------------------------------------
	-- NIVELES                                     --
	-------------------------------------------------
	
	type   niveles is ( n0, n1, n2, n3, n4, n5, n6 );
	signal nivel : niveles := n0;
	
	-------------------------------------------------
	-- ESTADOS DE MARIO                            --
	-------------------------------------------------
	
	type   estadosMario is ( mini, super );
	signal presenteMario : estadosMario := mini;
	
	type   estMarioDer  is ( prog0, prog1, prog2, prog3 );
	signal marioDerecha   : estMarioDer := prog0;
	signal marioIzquierda : estMarioDer := prog0; 
	
	-------------------------------------------------
	-------------------------------------------------
	
	-------------------------------------------------
	-- ESTADOS DE GOOMBA                           --
	-------------------------------------------------
	
	type   estadosGoomba is ( prog0, prog1 );
	signal goombaMov : estadosGoomba := prog0;
	
	signal velGoomba  : integer := 250000;
	signal contGoomba : integer := 0;
	
	-------------------------------------------------
	
	-- Colores para enviar al monitor
	signal R, G, B : std_logic_vector( 7 downto 0 );
	
	-- Limites para la pantalla
	signal limiteArriba    : integer := 35; -- 35
	signal limiteDerecha   : integer := 640;-- 480
	signal limiteIzquierda : integer := 35; -- 30
	signal limiteAbajo     : integer := 480;-- 350
	
	-- Señales auxiliares para mover figuras en pantalla
	signal izquierdaAux : std_logic := '0';
	signal derechaAux   : std_logic := '0';
	signal saltoAux     : std_logic := '0';
	signal pausaAux 	  : std_logic := '0';
	
	signal contadorDer  : integer := 0;
	signal contadorIzq  : integer := 0;

	signal miniMarioESI_x : integer := limiteIzquierda + 20;
	signal miniMarioESD_x : integer := limiteIzquierda + 20 + 15;
	signal miniMarioEID_x : integer := limiteIzquierda + 20 + 15;
	signal miniMarioEII_x : integer := limiteIzquierda + 20; 
	
	signal miniMarioESI_y : integer := limiteAbajo - 32 - 16;
	signal miniMarioESD_y : integer := limiteAbajo - 32 - 16;
	signal miniMarioEID_y : integer := limiteAbajo - 32;
	signal miniMarioEII_y : integer := limiteAbajo - 32; 
	
	signal rutinaSaltoVert: std_logic := '0';
	signal marioSalto     : std_logic := '0';
	signal contSaltoVert  : integer   :=  0;
	
	-------------------------------------------------
	-- ENEMIGOS POR NIVEL                          --
	-------------------------------------------------
	
	-- N1
	
	signal goomba1ESI_x_aux : integer := 450 - 15;
	signal goomba1ESD_x_aux : integer := 450;
	signal goomba1EII_x_aux : integer := 450 - 15;
	signal goomba1EID_x_aux : integer := 450;
	
	signal goomba1ESI_x : integer := 450 - 15;
	signal goomba1ESD_x : integer := 450;
	signal goomba1EII_x : integer := 450 - 15;
	signal goomba1EID_x : integer := 450;
	
	signal goomba1ESI_y : integer := limiteAbajo - 32 - 15;
	signal goomba1ESD_y : integer := limiteAbajo - 32 - 15;
	signal goomba1EII_y : integer := limiteAbajo - 32;
	signal goomba1EID_y : integer := limiteAbajo - 32;
	
	-- N5
	
	signal koopaESI_x : integer := 400;
	signal koopaESD_x : integer := 400 + 39;
	signal koopaEII_x : integer := 400;
	signal koopaEID_x : integer := 400 + 39;
	
	signal koopaESI_y : integer := limiteAbajo - 32 - 39;
	signal koopaESD_y : integer := limiteAbajo - 32 - 39;
	signal koopaEII_y : integer := limiteAbajo - 32;
	signal koopaEID_y : integer := limiteAbajo - 32;
	
	signal velFuego : integer := 250000;
	
	signal fuegoESI_x_aux : integer := 400;
	signal fuegoESD_x_aux : integer := 400 + 25;
	signal fuegoEII_x_aux : integer := 400;
	signal fuegoEID_x_aux : integer := 400 + 25;
	
	signal fuegoESI_x : integer := 400;
	signal fuegoESD_x : integer := 400 + 25;
	signal fuegoEII_x : integer := 400;
	signal fuegoEID_x : integer := 400 + 25;
	
	signal fuegoESI_y : integer := limiteAbajo - 32 - 34;
	signal fuegoESD_y : integer := limiteAbajo - 32 - 34;
	signal fuegoEII_y : integer := limiteAbajo - 32 - 25;
	signal fuegoEID_y : integer := limiteAbajo - 32 - 25;
	
	-------------------------------------------------
	
	-------------------------------------------------
	-- SEÑALES ADICIONALES                         --
	-------------------------------------------------
	
	signal perder, borrarGoomba1 : std_logic := '0';
	signal goombaDer, goombaIzq  : std_logic := '0';
	signal contNivel             : integer   :=  0 ;
	signal contFuego             : integer   :=  0 ;
	signal contParpadeo          : integer   :=  0 ;
	signal parpadeo              : std_logic := '0';
	signal contFin               : integer   :=  0 ;
	signal maxNivel              : integer   :=  0 ;
	signal ganar                 : std_logic := '0';
	
begin

	---------------------------------------
	-- Control de estados el juego       --
	---------------------------------------

	process( clk, pausa )
	
	begin
	
		if rising_edge( clk ) then
		
			------------------------------------
			-- La pantalla inicial se queda   --
			-- hasta que presionen start      --
			------------------------------------
		
			if( presente = intro ) then
			
				if( pausa = '1' ) then
				
					presente <= juego;
				
				end if;
			
			----------------------------------------
			-- Este estado indica el inicio de la --
			-- logica del juego                   --
			----------------------------------------
			
			elsif( presente = juego ) then
			
				if( perder = '1' ) then
				
					presente <= fin;
				
				elsif( ganar = '1' ) then
				
					presente <= sigNivel;
				
				end if;
			
			elsif( presente = sigNivel ) then
			
				contFin <= contFin + 1;
				
				if( contFin =  50000000 ) then
				
					contFin  <= 0;
					maxNivel <= maxNivel + 1;
					presente <= juego;
				
				end if;
			
			elsif( presente = fin ) then
			
				contFin <= contFin + 1;
				
				if( contFin =  50000000 ) then
				
					contFin  <= 0;
					maxNivel <= 0;
					presente <= intro;
				
				end if;
			
			end if;
		
		end if;
	
	end process;
	
	----------------------------------------------
	-- Control de Mario                         --
	----------------------------------------------
	
	process( clk )
	
	begin
	
		if rising_edge( clk ) then
		
			if( presente = intro ) then
			
				contParpadeo <= contParpadeo + 1;
			
				if( contParpadeo = 12500000 ) then
				
					contParpadeo <= 0;
					parpadeo <= not( parpadeo );
				
				end if;
		
			elsif( presente = juego ) then
					
				------------------------------------------------------
				-- CAMBIO DE ESCENARIO                              --
				------------------------------------------------------
				
				ganar  <= '0';
				perder <= '0';
				
				-- Inicializacion
				if( nivel = n0 ) then
				
					miniMarioEII_x <= limiteIzquierda + 20;
					miniMarioESI_x <= limiteIzquierda + 20;
					miniMarioESD_x <= limiteIzquierda + 20 + 15;
					miniMarioEID_x <= limiteIzquierda + 20 + 15;
					
					goomba1ESD_x <= goomba1ESD_x_aux;
					goomba1ESI_x <= goomba1ESI_x_aux;
					goomba1EID_x <= goomba1EID_x_aux;
					goomba1EII_x <= goomba1EII_x_aux;	
					
					borrarGoomba1 <= '0';
					velGoomba  <= 250000;
					velFuego   <= 250000;
					contGoomba <= 0;
					contFuego  <= 0;
					
					goombaIzq <= '1';
					
					contNivel <= 0;
					
					nivel <= n1;
				
				elsif( miniMarioESD_X = limiteDerecha and nivel = n1 ) then
				
					miniMarioEII_x <= limiteIzquierda + 20;
					miniMarioESI_x <= limiteIzquierda + 20;
					miniMarioESD_x <= limiteIzquierda + 20 + 15;
					miniMarioEID_x <= limiteIzquierda + 20 + 15;
					
					goomba1ESD_x <= limiteDerecha;
					goomba1ESI_x <= limiteDerecha - 15;
					goomba1EID_x <= limiteDerecha;
					goomba1EII_x <= limiteDerecha - 15;
					
					borrarGoomba1 <= '0';
					contGoomba <= 0;
					
					nivel <= n2;
				
				elsif( miniMarioESD_X = limiteDerecha and nivel = n2 ) then
				
					miniMarioEII_x <= limiteIzquierda + 20;
					miniMarioESI_x <= limiteIzquierda + 20;
					miniMarioESD_x <= limiteIzquierda + 20 + 15;
					miniMarioEID_x <= limiteIzquierda + 20 + 15;
					
					goomba1ESD_x <= 450;
					goomba1ESI_x <= 450 - 15;
					goomba1EID_x <= 450;
					goomba1EII_x <= 450 - 15;
					
					borrarGoomba1 <= '0';
					contGoomba <= 0;
					
					nivel <= n3;
					
				elsif( miniMarioESD_X = limiteDerecha and nivel = n3 ) then
				
					miniMarioEII_x <= limiteIzquierda + 20;
					miniMarioESI_x <= limiteIzquierda + 20;
					miniMarioESD_x <= limiteIzquierda + 20 + 15;
					miniMarioEID_x <= limiteIzquierda + 20 + 15;
					
					goomba1ESD_x <= limiteDerecha;
					goomba1ESI_x <= limiteDerecha - 15;
					goomba1EID_x <= limiteDerecha;
					goomba1EII_x <= limiteDerecha - 15;
					
					borrarGoomba1 <= '0';
					contGoomba <= 0;
					
					nivel <= n4;
					
				elsif( miniMarioESD_X = limiteDerecha and nivel = n4 ) then
				
					miniMarioEII_x <= limiteIzquierda + 20;
					miniMarioESI_x <= limiteIzquierda + 20;
					miniMarioESD_x <= limiteIzquierda + 20 + 15;
					miniMarioEID_x <= limiteIzquierda + 20 + 15;
					
					goomba1ESD_x <= 350;
					goomba1ESI_x <= 350 - 15;
					goomba1EID_x <= 350;
					goomba1EII_x <= 350 - 15;
					
					borrarGoomba1 <= '0';
					contGoomba <= 0;
					
					fuegoESD_x <= fuegoESD_x_aux;
					fuegoESI_x <= fuegoESI_x_aux;
					fuegoEID_x <= fuegoEID_x_aux;
					fuegoEII_x <= fuegoEII_x_aux;	
					
					nivel <= n5;
				
				end if;
				
				if( nivel = n5 and miniMarioESD_x = limiteDerecha - 90 ) then
				
					contNivel <= contNivel + 1;
					
					-- En el siguiente nivel aumentamos la velocidad de goomba
					
					-- velFuego  <= velFuego  - 50000;
					borrarGoomba1 <= '0';
					
					contGoomba <= 0;
					contFuego  <= 0;
					
					miniMarioEII_x <= limiteIzquierda + 20;
					miniMarioESI_x <= limiteIzquierda + 20;
					miniMarioESD_x <= limiteIzquierda + 20 + 15;
					miniMarioEID_x <= limiteIzquierda + 20 + 15;
					
					goomba1ESD_x <= goomba1ESD_x_aux;
					goomba1ESI_x <= goomba1ESI_x_aux;
					goomba1EID_x <= goomba1EID_x_aux;
					goomba1EII_x <= goomba1EII_x_aux;	
					
					nivel <= n6;
					
					goombaIzq <= '1';
					
					ganar <= '1';
				
				end if;
				
				if( nivel = n6 ) then
				
					velGoomba <= velGoomba - 50000;
					
					contGoomba <= 0;
					contFuego  <= 0;
					
					miniMarioEII_x <= limiteIzquierda + 20;
					miniMarioESI_x <= limiteIzquierda + 20;
					miniMarioESD_x <= limiteIzquierda + 20 + 15;
					miniMarioEID_x <= limiteIzquierda + 20 + 15;
					
					goomba1ESD_x <= goomba1ESD_x_aux;
					goomba1ESI_x <= goomba1ESI_x_aux;
					goomba1EID_x <= goomba1EID_x_aux;
					goomba1EII_x <= goomba1EII_x_aux;
					
					nivel <= n1;
				
				end if;
				
				------------ Colisiones con enemigos -----------------
				
				
				if( nivel = n1 or nivel = n2 or nivel = n3 or nivel = n4 or nivel = n5 ) then
					
					-- Caso mario
					--      -----
					--      goomba
					if( ( miniMarioEID_x < goomba1ESD_x and miniMarioEID_x > goomba1ESI_x and 
						   miniMarioEID_y = goomba1ESI_y - 1 ) or
						 ( miniMarioEII_x < goomba1ESD_x and miniMarioEII_x > goomba1ESI_x and 
						   miniMarioEID_y = goomba1ESI_y - 1 ) ) then
					
						borrarGoomba1 <= '1';
					
					-- Caso: mario | goomba
					elsif ( miniMarioEID_x = goomba1ESI_x and miniMarioEID_y > goomba1ESI_y and borrarGoomba1 = '0' ) then
					
						   if( presenteMario = mini ) then
						
								nivel <= n0;
							   perder <= '1';
							   borrarGoomba1 <= '1';
						
						   end if;
					
					
					-- Caso goomba | mario
					elsif( miniMarioEII_x = goomba1EID_x and miniMarioEII_y > goomba1ESD_y and borrarGoomba1 = '0' ) then
					
						   if( presenteMario = mini ) then
								
								nivel <= n0;
							   perder <= '1';
							   borrarGoomba1 <= '1';
						
						   end if;
					
					else
					
						perder <= '0';
					
					end if;
				
				end if;
				
				if( nivel = n5 ) then
				
					if( ( miniMarioESD_x > fuegoEII_x and miniMarioESD_x < fuegoEID_x and miniMarioESD_y = fuegoEII_y ) or
						 ( miniMarioESI_x > fuegoEII_x and miniMarioESI_x < fuegoEID_x and miniMarioESD_y = fuegoEII_y ) or 
						 ( miniMarioESI_x > fuegoEII_x and miniMarioESI_x < fuegoEID_x and miniMarioEID_y = fuegoESI_y ) or
						 ( miniMarioESD_x > fuegoEII_x and miniMarioESD_x < fuegoEID_x and miniMarioEID_y = fuegoESI_y ) ) then
					
						nivel  <= n0;
						perder <= '1';
					
					end if;
				
				end if;
				
				if( nivel = n5 ) then
				
					if( ( miniMarioEID_x < koopaESD_x - 10 and miniMarioEID_x > koopaESI_x and 
						   miniMarioEID_y = koopaESI_y + 15 ) or
						 ( miniMarioEII_x < koopaESD_x - 10 and miniMarioEII_x > koopaESI_x and 
						   miniMarioEID_y = koopaESI_y + 15 ) ) then
							
						nivel <= n0;
						perder <= '1';
							
					elsif( miniMarioEID_x = koopaESI_x + 10 and miniMarioEID_y > koopaESI_y + 15 ) then
							
						nivel  <= n0;
						perder <= '1';
							
					elsif( miniMarioEII_x = koopaEID_x - 10 and miniMarioEII_y > koopaESD_y + 15 ) then
							
						nivel <= n0;
						perder <= '1';
							
					end if;
				
				end if;
				
				---------------------- ENEMIGOS ----------------------
				
				if( nivel = n1 ) then
				
					contGoomba <= contGoomba + 1;
					
					if( contGoomba = velGoomba ) then
					
						contGoomba <= 0;
						
						goomba1ESD_x <= goomba1ESD_x - 1;
						goomba1ESI_x <= goomba1ESI_x - 1;
						goomba1EID_x <= goomba1EID_x - 1;
						goomba1EII_x <= goomba1EII_x - 1;	
					
					end if;
				
				end if;
					
				if( nivel = n2 or nivel = n4 ) then
				
					contGoomba <= contGoomba + 1;
					
					if( goomba1ESD_x = limiteDerecha ) then
					
						goombaIzq <= '1';
						goombaDer <= '0';
						
					elsif( goomba1ESI_x = 308 ) then
					
						goombaDer <= '1';
						goombaIzq <= '0';
					
					end if;
					
					if( contGoomba = velGoomba ) then
					
						contGoomba <= 0;
						
						if( goombaIzq = '1' ) then
						
							goomba1ESD_x <= goomba1ESD_x - 1;
							goomba1ESI_x <= goomba1ESI_x - 1;
							goomba1EID_x <= goomba1EID_x - 1;
							goomba1EII_x <= goomba1EII_x - 1;	
							
						elsif( goombaDer = '1' ) then
						
							goomba1ESD_x <= goomba1ESD_x + 1;
							goomba1ESI_x <= goomba1ESI_x + 1;
							goomba1EID_x <= goomba1EID_x + 1;
							goomba1EII_x <= goomba1EII_x + 1;
							
						end if;
					
					end if;
					
				
				end if;
				
				if( nivel = n3 ) then
				
					contGoomba <= contGoomba + 1;
					
					if( goomba1ESD_x = 450 ) then
					
						goombaIzq <= '1';
						goombaDer <= '0';
						
					elsif( goomba1ESI_x = 235 ) then
					
						goombaDer <= '1';
						goombaIzq <= '0';
					
					end if;
					
					if( contGoomba = velGoomba ) then
					
						contGoomba <= 0;
						
						if( goombaIzq = '1' ) then
						
							goomba1ESD_x <= goomba1ESD_x - 1;
							goomba1ESI_x <= goomba1ESI_x - 1;
							goomba1EID_x <= goomba1EID_x - 1;
							goomba1EII_x <= goomba1EII_x - 1;	
							
						elsif( goombaDer = '1' ) then
						
							goomba1ESD_x <= goomba1ESD_x + 1;
							goomba1ESI_x <= goomba1ESI_x + 1;
							goomba1EID_x <= goomba1EID_x + 1;
							goomba1EII_x <= goomba1EII_x + 1;
							
						end if;
					
					end if;
				
				end if;
				
				if( nivel = n5 ) then
				
					contGoomba <= contGoomba + 1;
					
					if( goomba1ESD_x = 350 ) then
					
						goombaIzq <= '1';
						goombaDer <= '0';
						
					elsif( goomba1ESI_x = limiteIzquierda + 20 ) then
					
						goombaDer <= '1';
						goombaIzq <= '0';
					
					end if;
					
					if( contGoomba = velGoomba ) then
					
						contGoomba <= 0;
						
						if( goombaIzq = '1' ) then
						
							goomba1ESD_x <= goomba1ESD_x - 1;
							goomba1ESI_x <= goomba1ESI_x - 1;
							goomba1EID_x <= goomba1EID_x - 1;
							goomba1EII_x <= goomba1EII_x - 1;	
							
						elsif( goombaDer = '1' ) then
						
							goomba1ESD_x <= goomba1ESD_x + 1;
							goomba1ESI_x <= goomba1ESI_x + 1;
							goomba1EID_x <= goomba1EID_x + 1;
							goomba1EII_x <= goomba1EII_x + 1;
							
						end if;
					
					end if;
				
				end if;
					
				if( nivel = n5 ) then
				
					contFuego <= contFuego + 1;
					
					if( contFuego = velFuego ) then
					
						contFuego <= 0;
						
						if( fuegoESD_x = limiteIzquierda ) then
						
							fuegoESD_x <= fuegoESD_x_aux;
							fuegoESI_x <= fuegoESI_x_aux;
							fuegoEID_x <= fuegoEID_x_aux;
							fuegoEII_x <= fuegoEII_x_aux;	
						
						else
						
							fuegoESD_x <= fuegoESD_x - 1;
							fuegoESI_x <= fuegoESI_x - 1;
							fuegoEID_x <= fuegoEID_x - 1;
							fuegoEII_x <= fuegoEII_x - 1;	
							
						end if;
					
					end if;
				
				end if;
					
				---------------------- ACCIONES ----------------------
			
				if( derecha = '1' ) then
				
						contadorDer <= contadorDer + 1;
				
					if contadorDer = 250000 then
						contadorDer <= 0;
						
						-------------------------------------------
						-- Colision con un pipe                  --
						-------------------------------------------
						
						if( nivel = n1 and miniMarioEII_y = limiteAbajo - 32 - 31 and miniMarioEII_x = 500 + 31 ) then
						
							miniMarioESI_y <= limiteAbajo - 32 - 16;
							miniMarioESD_y <= limiteAbajo - 32 - 16;
							miniMarioEID_y <= limiteAbajo - 32;
							miniMarioEII_y <= limiteAbajo - 32;
						
						elsif( ( nivel = n2 or nivel = n4 ) and miniMarioEII_y = limiteAbajo - 32 - 47 and miniMarioEII_x = 50 + 225 + 31 ) then
						
							miniMarioESI_y <= limiteAbajo - 32 - 16;
							miniMarioESD_y <= limiteAbajo - 32 - 16;
							miniMarioEID_y <= limiteAbajo - 32;
							miniMarioEII_y <= limiteAbajo - 32;
							
						elsif( nivel = n3  and miniMarioEII_y = limiteAbajo - 32 - 45 - 5 and miniMarioEII_x = 200 + 15 + 16  ) then 
						
							miniMarioESI_y <= limiteAbajo - 32 - 16;
							miniMarioESD_y <= limiteAbajo - 32 - 16;
							miniMarioEID_y <= limiteAbajo - 32;
							miniMarioEII_y <= limiteAbajo - 32;
							
						elsif( nivel = n3  and miniMarioEII_y = limiteAbajo - 32 - 27 - 5 and miniMarioEII_x = 200 + 255 + 16  ) then 
						
							miniMarioESI_y <= limiteAbajo - 32 - 16;
							miniMarioESD_y <= limiteAbajo - 32 - 16;
							miniMarioEID_y <= limiteAbajo - 32;
							miniMarioEII_y <= limiteAbajo - 32;
						
						end if;
						
						if( nivel = n1 and miniMarioEID_y > limiteAbajo - 32 - 31 and  miniMarioEID_x = 500 ) then
							-- No hacer nada
						
						elsif( ( nivel = n2 or nivel = n4 ) and miniMarioEID_y > limiteAbajo - 32 - 47 and  miniMarioEID_x = 50 + 224 ) then
							-- No hacer nada
							
						elsif( nivel = n3 and miniMarioEID_y > limiteAbajo - 32 - 45 - 5 and  miniMarioEID_x = 200 + 15 ) then
							-- No hacer nada
							
						elsif( nivel = n3 and miniMarioEID_y > limiteAbajo - 32 - 27 - 5 and  miniMarioEID_x = 200 + 255 ) then
							-- No hacer nada 
							
						elsif ( miniMarioESD_x = limiteDerecha ) then
							-- No hacer nada
						else
							
							miniMarioESI_x <= miniMarioESI_x + 1;
							miniMarioESD_x <= miniMarioESD_x + 1;
							miniMarioEID_x <= miniMarioEID_x + 1;
							miniMarioEII_x <= miniMarioEII_x + 1;
							
						end if;
						
					end if;
				
				else
				
					contadorDer <= 0;
				
				end if;
				
			
				------------------------------------------------------------
				
				if( izquierda = '1' ) then
				
						contadorIzq <= contadorIzq + 1;
				
					if contadorIzq = 250000 then
						contadorIzq <= 0;
						
						-------------------------------------------
						-- Colision con un pipe                  --
						-------------------------------------------
						
						if( nivel = n1 and miniMarioEII_y = limiteAbajo - 32 - 31 and miniMarioEID_x = 500 ) then
				
							miniMarioESI_y <= limiteAbajo - 32 - 16;
							miniMarioESD_y <= limiteAbajo - 32 - 16;
							miniMarioEID_y <= limiteAbajo - 32;
							miniMarioEII_y <= limiteAbajo - 32;
						
						elsif( (nivel = n2 or nivel = n4) and miniMarioEII_y = limiteAbajo - 32 - 47 and miniMarioEID_x = 50 + 224  ) then 
						
							miniMarioESI_y <= limiteAbajo - 32 - 16;
							miniMarioESD_y <= limiteAbajo - 32 - 16;
							miniMarioEID_y <= limiteAbajo - 32;
							miniMarioEII_y <= limiteAbajo - 32;
						
						elsif( nivel = n3  and miniMarioEII_y = limiteAbajo - 32 - 45 - 5 and miniMarioEID_x = 200 + 15  ) then 
						
							miniMarioESI_y <= limiteAbajo - 32 - 16;
							miniMarioESD_y <= limiteAbajo - 32 - 16;
							miniMarioEID_y <= limiteAbajo - 32;
							miniMarioEII_y <= limiteAbajo - 32;
							
						elsif( nivel = n3  and miniMarioEII_y = limiteAbajo - 32 - 27 - 5 and miniMarioEID_x = 200 + 255  ) then 
						
							miniMarioESI_y <= limiteAbajo - 32 - 16;
							miniMarioESD_y <= limiteAbajo - 32 - 16;
							miniMarioEID_y <= limiteAbajo - 32;
							miniMarioEII_y <= limiteAbajo - 32;
						
						end if;
						
						if( nivel = n1 and miniMarioEID_y > limiteAbajo - 32 - 31 and  miniMarioEII_x = 500 + 31 ) then
							-- No hacer nada
							
						elsif( ( nivel = n2 or nivel = n4 ) and miniMarioEID_y > limiteAbajo - 32 - 47 and  miniMarioEII_x = 50 + 224 + 31 ) then
							-- No hacer nada
							
						elsif( nivel = n3 and miniMarioEID_y > limiteAbajo - 32 - 45 - 5 and  miniMarioEII_x = 200 + 15 + 16 ) then
							-- No hacer nada 
							
						elsif( nivel = n3 and miniMarioEID_y > limiteAbajo - 32 - 27 - 5 and  miniMarioEII_x = 200 + 255 + 16 ) then
							-- No hacer nada
							
						elsif ( miniMarioESI_x = limiteIzquierda ) then
							-- No hacer nada
						else
							
							miniMarioESI_x <= miniMarioESI_x - 1;
							miniMarioESD_x <= miniMarioESD_x - 1;
							miniMarioEID_x <= miniMarioEID_x - 1;
							miniMarioEII_x <= miniMarioEII_x - 1;
							
						end if;
						
					end if;
				
				else
				
					contadorIzq <= 0;
				
				end if;
				
				-----------------------------------------------------------
			
				if( salto = '1' and saltoAux = '0' ) then
				
					rutinaSaltoVert <= '1';
				
				end if;
				
				saltoAux <= salto;
			
				if( rutinaSaltoVert = '1' ) then
			
					marioSalto <= '1';
					contSaltoVert <= contSaltoVert + 1;
					
					if( contSaltoVert < 12000000 ) then
					
						if( contSaltoVert mod 150000 = 0 ) then
					
							miniMarioESI_y <= miniMarioESI_y - 1;
							miniMarioESD_y <= miniMarioESD_y - 1;
							miniMarioEID_y <= miniMarioEID_y - 1;
							miniMarioEII_y <= miniMarioEII_y - 1;
							
						end if;
					
					elsif( contSaltoVert >= 12000000 and contSaltoVert < 20000000 ) then
					
						--------------------------------------
						-- Quedarse parado en un pipe       --
						--------------------------------------
									
						if( miniMarioEID_x > 500 and miniMarioEID_x < 500 + 31 + 15 and
							 miniMarioEII_y = limiteAbajo - 32 - 31 and nivel = n1) then
									
								miniMarioEID_y <= limiteAbajo - 32 - 31;
								miniMarioEII_y <= limiteAbajo - 32 - 31;
								miniMarioESD_y <= limiteAbajo - 32 - 31 - 16;
								miniMarioESI_y <= limiteAbajo - 32 - 31 - 16;
									
								contSaltoVert <= 20000000 - 1;
								marioSalto    <= '0';
						
						elsif( miniMarioEID_x > 50 + 225 and miniMarioEID_x < 50 + 225 + 31 + 15 and
							    miniMarioEII_y = limiteAbajo - 32 - 47 and (nivel = n2 or nivel = n4) ) then
					
								miniMarioEID_y <= limiteAbajo - 32 - 47;
								miniMarioEII_y <= limiteAbajo - 32 - 47;
								miniMarioESD_y <= limiteAbajo - 32 - 47 - 16;
								miniMarioESI_y <= limiteAbajo - 32 - 47 - 16;
									
								contSaltoVert <= 20000000 - 1;
								marioSalto    <= '0';
					
						elsif( miniMarioEID_x > 200 + 15 and miniMarioEID_x < 200 + 15 + 16 + 15 and
							    miniMarioEII_y = limiteAbajo - 32 - 45 - 5 and nivel = n3 ) then
					
								miniMarioEID_y <= limiteAbajo - 32 - 45 - 5;
								miniMarioEII_y <= limiteAbajo - 32 - 45 - 5;
								miniMarioESD_y <= limiteAbajo - 32 - 45 - 5 - 16;
								miniMarioESI_y <= limiteAbajo - 32 - 45 - 5 - 16;
									
								contSaltoVert <= 20000000 - 1;
								marioSalto    <= '0';
								
						elsif( miniMarioEID_x > 200 + 255 and miniMarioEID_x < 200 + 255 + 16 + 15 and
							    miniMarioEII_y = limiteAbajo - 32 - 27 - 5 and nivel = n3 ) then
					
								miniMarioEID_y <= limiteAbajo - 32 - 27 - 5;
								miniMarioEII_y <= limiteAbajo - 32 - 27 - 5;
								miniMarioESD_y <= limiteAbajo - 32 - 27 - 5 - 16;
								miniMarioESI_y <= limiteAbajo - 32 - 27 - 5 - 16;
									
								contSaltoVert <= 20000000 - 1;
								marioSalto    <= '0';
							
						elsif( contSaltoVert mod 100000 = 0 ) then
					
							miniMarioESI_y <= miniMarioESI_y + 1;
							miniMarioESD_y <= miniMarioESD_y + 1;
							miniMarioEID_y <= miniMarioEID_y + 1;
							miniMarioEII_y <= miniMarioEII_y + 1;
							
						end if;
					
					elsif( contSaltoVert = 20000000 ) then
					
						rutinaSaltoVert <= '0';
						contSaltoVert   <=  0;
						marioSalto      <= '0';
					
					end if;
			
				end if;
			
				-----------------------------------------------------------
			else -- sigNivel y fin
			
			end if;
		
		end if; -- rising edge
	
	end process;
	
	--------------------------------------------------
	-- Progresiones de mario                        --
	--------------------------------------------------
	
	------------------ A la derecha ------------------
	
	process( clk )
	
	begin
	
		if rising_edge( clk ) and contadorDer = 250000 and derecha = '1' and salto = '0' then
		
			if marioDerecha = prog0 then
			
				marioDerecha <= prog1;
			
			elsif marioDerecha = prog1 then
			
				marioDerecha <= prog2;
			
			elsif marioDerecha = prog2 then
			
				marioDerecha <= prog3;
			
			elsif marioDerecha = prog3 then
			
				marioDerecha <= prog1;
			
			end if;
		
		elsif rising_edge( clk ) and derecha = '0' then
		
			marioDerecha <= prog0;
		
		end if;
	
	end process;
	
	------------------ A la izquierda ------------------
	
	process( clk )
	
	begin
	
		if rising_edge( clk ) and contadorIzq = 250000 and izquierda = '1' and salto = '0' then
		
			if marioIzquierda = prog0 then
			
				marioIzquierda <= prog1;
			
			elsif marioIzquierda = prog1 then
			
				marioIzquierda <= prog2;
			
			elsif marioIzquierda = prog2 then
			
				marioIzquierda <= prog3;
			
			elsif marioIzquierda = prog3 then
			
				marioIzquierda <= prog1;
			
			end if;
		
		elsif rising_edge( clk ) and izquierda = '0' then
		
			marioIzquierda <= prog0;
		
		end if;
	
	end process;
	
	------------------- FIN progresiones mario -------------------
	
	------------------- Progresiones de goomba -------------------
	
	process( clk )
	
	begin
	
		if rising_edge( clk ) and contGoomba = velGoomba then
		
			if( goombaMov = prog0 ) then
			
				goombaMov <= prog1;
			
			elsif( goombaMov = prog1 ) then
			
				goombaMov <= prog0;
			
			end if;
			
		
		end if;
	
	end process;
	
	------------------ FIN progresiones goomba --------------------
	
	---------------------------------------------------
	-- Imprimir en pantalla                          --
	---------------------------------------------------
	
	process( clk )
	
	begin
	
		if rising_edge( clk ) then
		
			---------------------------------------
			-- Pantalla de inicio del juego      --
			---------------------------------------
		
			if( presente = intro ) then
				
				if( pos_x >= 100 and pos_x < 163 and pos_y >= 50 and pos_y < 73 ) then
				
					dir_nube1_y <= pos_y - 50;
					dir_nube1_x <= pos_x - 100 + 1;
					
					R <= nube1_R;
					G <= nube1_G;
					B <= nube1_B;
					
				elsif( pos_x >= 400 and pos_x < 463 and pos_y >= 50 and pos_y < 73 ) then
				
					dir_nube1_y <= pos_y - 50;
					dir_nube1_x <= pos_x - 400 + 1;
					
					R <= nube1_R;
					G <= nube1_G;
					B <= nube1_B;
				
				elsif( pos_x >= 220 + 1 and pos_x < 398 and pos_y >= 150 + 2 and pos_y < 240 ) then
					 
					 dir_titulo_y <= pos_y - 150;
					 dir_titulo_x <= pos_x - 220;
					 
					 R <= titulo_R;
					 G <= titulo_G;
					 B <= titulo_B;
					 
				elsif( pos_x >= 280 and pos_x < 280 + 58  and pos_y >= 280 and pos_y < 280 + 28 and parpadeo = '1' ) then
				
					dir_start_y <= pos_y - 150;
					dir_start_x <= pos_x - 220;
					 
					R <= start_R;
					G <= start_G;
					B <= start_B;
					
					
				elsif( pos_x >= limiteIzquierda and pos_x < limiteDerecha and 
					 pos_y >= limiteAbajo - 32 and pos_y < limiteAbajo ) then

					
					dir_piso_y <= pos_y mod 16;
					dir_piso_x <= pos_x mod 16;
					
					R <= piso_R;
					G <= piso_G;
					B <= piso_B;
				
				else

					R <= std_logic_vector(to_unsigned(0  , R'length));
					G <= std_logic_vector(to_unsigned(0  , G'length));
					B <= std_logic_vector(to_unsigned(0  , B'length));
				
				end if;
			
			
			-----------------------------------------------
			-- Escenario del juego
			-----------------------------------------------
			
			
			elsif( presente = juego ) then
			
				if( pos_x >= 100 and pos_x < 163 and pos_y >= 50 and pos_y < 73 ) then
				
					dir_nube1_y <= pos_y - 50;
					dir_nube1_x <= pos_x - 100 + 1;
					
					R <= nube1_R;
					G <= nube1_G;
					B <= nube1_B;
					
				elsif( pos_x >= 400 and pos_x < 463 and pos_y >= 50 and pos_y < 73 ) then
				
					dir_nube1_y <= pos_y - 50;
					dir_nube1_x <= pos_x - 400 + 1;
					
					R <= nube1_R;
					G <= nube1_G;
					B <= nube1_B;
				
				-------------------------- Nivel 1: Stage 1 FIn --------------------------
				
				elsif( pos_x >= goomba1ESI_x and pos_x < goomba1ESD_x and 
						 pos_y >= goomba1ESI_y and pos_y < goomba1EII_y and goombaMov = prog0 
						 and borrarGoomba1 = '0' and nivel /= n0 ) then
						 
					dir_goomba1_y <= pos_y - goomba1ESI_y;
					dir_goomba1_x <= pos_x - goomba1ESI_x;
					
					R <= goomba1_R;
					G <= goomba1_G;
					B <= goomba1_B;
						 
				elsif( pos_x >= goomba1ESI_x and pos_x < goomba1ESD_x and 
						 pos_y >= goomba1ESI_y and pos_y < goomba1EII_y and goombaMov = prog1 
						 and borrarGoomba1 = '0' and nivel /= n0 ) then
						 
					dir_goomba2_y <= pos_y - goomba1ESI_y;
					dir_goomba2_x <= pos_x - goomba1ESI_x;
					
					R <= goomba2_R;
					G <= goomba2_G;
					B <= goomba2_B;
				
				elsif( pos_x >= 500 and pos_x < 532 and pos_y >= limiteAbajo - 32 - 31 and pos_y < limiteAbajo - 32
						 and nivel = n1 ) then
				
					dir_pipe1_y <= pos_y - limiteAbajo - 32 - 31;
					dir_pipe1_x <= pos_x - 500;
					
					R <= pipe1_R;
					G <= pipe1_G;
					B <= pipe1_B;
			
				elsif( pos_x >= 200 and pos_x < 217 and pos_y >= limiteAbajo - 120 - 16 and pos_y < limiteAbajo - 120
						 and nivel = n1 ) then
						 
					dir_bloque_y <= pos_y - limiteAbajo - 120 - 16;
					dir_bloque_x <= pos_x - 200;
					
					R <= bloque_R;
					G <= bloque_G;
					B <= bloque_B;
			
				-------------------------- Nivel 1: Stage 1 FIn --------------------------
				
				-------------------------------- Nivel 5 ---------------------------------
				
				elsif( pos_x >= koopaESI_x and pos_x < koopaESD_x and 
						 pos_y >= koopaESI_y and pos_y < koopaEII_y and nivel = n5 ) then
				
					dir_koopa_y <= pos_y - koopaESI_y;
					dir_koopa_x <= pos_x - koopaESI_x;
					
					R <= koopa_R;
					G <= koopa_G;
					B <= koopa_B;
				
				elsif( pos_x >= fuegoESI_x and pos_x < fuegoESD_x and
						 pos_y >= fuegoESI_y and pos_y < fuegoEII_y and nivel = n5 ) then
						 
					dir_fuego_y <= pos_y - fuegoESI_y;
					dir_fuego_x <= pos_x - fuegoESI_x;
					
					R <= fuego_R;
					G <= fuego_G;
					B <= fuego_B;
				
				-- Imprimiendo alguna progresion de Mario
				
				elsif( pos_x >= miniMarioESI_x and pos_x < miniMarioESD_x and
						 pos_y >= miniMarioESI_y and pos_y < miniMarioEII_y and marioSalto = '1' ) then
						 
					dir_mariods_y <= pos_y - miniMarioESI_y;
					dir_mariods_x <= pos_x - miniMarioESI_x + 1;
					
					if( mariods_R > x"E0" and mariods_G > x"E0" and mariods_B > x"E0" ) then
					
						R <= std_logic_vector(to_unsigned(0  , R'length));
						G <= std_logic_vector(to_unsigned(0  , G'length));
						B <= std_logic_vector(to_unsigned(0  , B'length));
					
					else
					
						R <= mariods_R;
						G <= mariods_G;
						B <= mariods_B;
			
					end if;
						 
				
				elsif( pos_x >= miniMarioESI_x + 2 and pos_x < miniMarioESD_x - 3 and
					    pos_y >= miniMarioESI_y and pos_y < miniMarioEII_y and marioDerecha = prog0 and izquierda = '0'
					    and marioSalto = '0' ) then
			
					dir_mariod0_y <= pos_y - miniMarioESI_y;
					dir_mariod0_x <= pos_x - miniMarioESI_x;
					
					if( mariod0_R > x"E0" and mariod0_G > x"E0" and mariod0_B > x"E0" ) then
					
						R <= std_logic_vector(to_unsigned(0  , R'length));
						G <= std_logic_vector(to_unsigned(0  , G'length));
						B <= std_logic_vector(to_unsigned(0  , B'length));
					
					else
					
						R <= mariod0_R;
						G <= mariod0_G;
						B <= mariod0_B;
			
					end if;
			
				elsif( pos_x >= miniMarioESI_x + 1 and pos_x < miniMarioESD_x - 2 and
						 pos_y >= miniMarioESI_y and pos_y < miniMarioEII_y and marioDerecha = prog1 and izquierda = '0'
						 and marioSalto = '0') then
		
					dir_mariod1_y <= pos_y - miniMarioESI_y;
					dir_mariod1_x <= pos_x - miniMarioESI_x;
					
					if( mariod1_R > x"E0" and mariod1_G > x"E0" and mariod1_B > x"E0" ) then
					
						R <= std_logic_vector(to_unsigned(0  , R'length));
						G <= std_logic_vector(to_unsigned(0  , G'length));
						B <= std_logic_vector(to_unsigned(0  , B'length));
					
					else
					
						R <= mariod1_R;
						G <= mariod1_G;
						B <= mariod1_B;
			
					end if;
			
				elsif( pos_x >= miniMarioESI_x + 1 and pos_x < miniMarioESD_x - 4 and
						 pos_y >= miniMarioESI_y and pos_y < miniMarioEII_y and marioDerecha = prog2 and izquierda = '0'
						 and marioSalto = '0') then
		
					dir_mariod2_y <= pos_y - miniMarioESI_y;
					dir_mariod2_x <= pos_x - miniMarioESI_x;
					
					if( mariod2_R > x"E0" and mariod2_G > x"E0" and mariod2_B > x"E0" ) then
					
						R <= std_logic_vector(to_unsigned(0  , R'length));
						G <= std_logic_vector(to_unsigned(0  , G'length));
						B <= std_logic_vector(to_unsigned(0  , B'length));
					
					else
					
						R <= mariod2_R;
						G <= mariod2_G;
						B <= mariod2_B;
			
					end if;
			
				elsif( pos_x >= miniMarioESI_x + 1 and pos_x < miniMarioESD_x and
						 pos_y >= miniMarioESI_y and pos_y < miniMarioEII_y and marioDerecha = prog3 and izquierda = '0'
						 and marioSalto = '0') then
		
					dir_mariod3_y <= pos_y - miniMarioESI_y;
					dir_mariod3_x <= pos_x - miniMarioESI_x;
					
					if( mariod3_R > x"E0" and mariod3_G > x"E0" and mariod3_B > x"E0" ) then
					
						R <= std_logic_vector(to_unsigned(0  , R'length));
						G <= std_logic_vector(to_unsigned(0  , G'length));
						B <= std_logic_vector(to_unsigned(0  , B'length));
					
					else
					
						R <= mariod3_R;
						G <= mariod3_G;
						B <= mariod3_B;
			
					end if;
			
				----------------------------------------------------------------------------------------------
				
				elsif( pos_x >= miniMarioESI_x + 2 and pos_x < miniMarioESD_x - 3 and
					 pos_y >= miniMarioESI_y and pos_y < miniMarioEII_y and marioIzquierda = prog0 and marioSalto = '0') then
			
					dir_mariod0_y <= 15 - (pos_y - miniMarioESI_y);
					dir_mariod0_x <= 15 - (pos_x - miniMarioESI_x);
					
					if( mariod0_R > x"E0" and mariod0_G > x"E0" and mariod0_B > x"E0" ) then
					
						R <= std_logic_vector(to_unsigned(0  , R'length));
						G <= std_logic_vector(to_unsigned(0  , G'length));
						B <= std_logic_vector(to_unsigned(0  , B'length));
					
					else
					
						R <= mariod0_R;
						G <= mariod0_G;
						B <= mariod0_B;
			
					end if;
			
				elsif( pos_x >= miniMarioESI_x + 1 and pos_x < miniMarioESD_x - 2 and
						 pos_y >= miniMarioESI_y and pos_y < miniMarioEII_y and marioIzquierda = prog1 and marioSalto = '0') then
		
					dir_mariod1_y <= pos_y - miniMarioESI_y;
					dir_mariod1_x <= 15 - (pos_x - miniMarioESI_x);
					
					if( mariod1_R > x"E0" and mariod1_G > x"E0" and mariod1_B > x"E0" ) then
					
						R <= std_logic_vector(to_unsigned(0  , R'length));
						G <= std_logic_vector(to_unsigned(0  , G'length));
						B <= std_logic_vector(to_unsigned(0  , B'length));
					
					else
					
						R <= mariod1_R;
						G <= mariod1_G;
						B <= mariod1_B;
			
					end if;
			
				elsif( pos_x >= miniMarioESI_x + 1 and pos_x < miniMarioESD_x - 4 and
						 pos_y >= miniMarioESI_y and pos_y < miniMarioEII_y and marioIzquierda = prog2 and marioSalto = '0') then
		
					dir_mariod2_y <= pos_y - miniMarioESI_y;
					dir_mariod2_x <= 15 - (pos_x - miniMarioESI_x);
					
					if( mariod2_R > x"E0" and mariod2_G > x"E0" and mariod2_B > x"E0" ) then
					
						R <= std_logic_vector(to_unsigned(0  , R'length));
						G <= std_logic_vector(to_unsigned(0  , G'length));
						B <= std_logic_vector(to_unsigned(0  , B'length));
					
					else
					
						R <= mariod2_R;
						G <= mariod2_G;
						B <= mariod2_B;
			
					end if;
			
				elsif( pos_x >= miniMarioESI_x + 1 and pos_x < miniMarioESD_x and
						 pos_y >= miniMarioESI_y and pos_y < miniMarioEII_y and marioIzquierda = prog3 and marioSalto = '0') then
		
					dir_mariod3_y <= pos_y - miniMarioESI_y;
					dir_mariod3_x <= 15 - (pos_x - miniMarioESI_x);
					
					if( mariod3_R > x"E0" and mariod3_G > x"E0" and mariod3_B > x"E0" ) then
					
						R <= std_logic_vector(to_unsigned(0  , R'length));
						G <= std_logic_vector(to_unsigned(0  , G'length));
						B <= std_logic_vector(to_unsigned(0  , B'length));
					
					else
					
						R <= mariod3_R;
						G <= mariod3_G;
						B <= mariod3_B;
			
					end if;
				
				----------------------------------------------------------------------------------------------
			
				elsif( pos_x >= 552 and pos_x < 570 and pos_y >= 50 and pos_y < 70 ) then
				
						 dir_num_y <= pos_y - 50;
						 dir_num_x <= pos_x - 550;
						 
						 dig <= contNivel;
						 
						 R <= num_R;
						 G <= num_G;
						 B <= num_B;
			
				--------------------------------------- ESCENARIOS -------------------------------------------
			
				elsif( pos_x >= 50 and pos_x < 50 + 398 and  
						 pos_y >= limiteAbajo - 32 - 90  and pos_y < limiteAbajo - 32 and nivel = n1 ) then
						 
						 dir_bg_y <= pos_y - limiteAbajo - 32 - 90; 
						 dir_bg_x <= pos_x - 50;
						 
						 R <= bg_R;
						 G <= bg_G;
						 B <= bg_B;
			
				elsif( pos_x >= 50 and pos_x < 50 + 530 and
						 pos_y >= limiteAbajo - 32 - 60   and pos_y < limiteAbajo - 32 and ( nivel = n2 or nivel = n4) ) then
						
						 dir_bg2_y <= pos_y - limiteAbajo - 32 - 80; -- -80
						 dir_bg2_x <= pos_x - 50;
						 
						 R <= bg2_R;
						 G <= bg2_G;
						 B <= bg2_B;
						 
				elsif( pos_x >= 200 and pos_x < 200 + 274 and
						 pos_y >= limiteAbajo - 32 - 50 and pos_y < limiteAbajo - 32 and nivel = n3 ) then
			
						 dir_bg3_y <= pos_y - limiteAbajo - 32 - 78; -- 58
						 dir_bg3_x <= pos_x - 200;
						 
						 R <= bg3_R;
						 G <= bg3_G;
						 B <= bg3_B;
			
				elsif( pos_x >= 500 and pos_x < 500 + 120 and
						 pos_y >= limiteAbajo - 32 - 80 and pos_y < limiteAbajo - 32 and nivel = n5 ) then
						 
						 dir_bg4_y <= pos_y - limiteAbajo - 32 - 110;  -- 90
						 dir_bg4_x <= pos_x - 500;
						 
						 R <= bg4_R;
						 G <= bg4_G;
						 B <= bg4_B;
			
				-- Imprimiendo el piso 
				elsif( pos_x >= limiteIzquierda and pos_x < limiteDerecha and 
					    pos_y >= limiteAbajo - 32 and pos_y < limiteAbajo ) then

					
					dir_piso_y <= pos_y mod 16;
					dir_piso_x <= pos_x mod 16;
					
					R <= piso_R;
					G <= piso_G;
					B <= piso_B;
				
				else
				
					R <= std_logic_vector(to_unsigned(0  , R'length));
					G <= std_logic_vector(to_unsigned(0  , G'length));
					B <= std_logic_vector(to_unsigned(0  , B'length));
				
				end if;
			
			------------------------- Pantalla de siguiente nivel ----------------------------
			
			elsif( presente = sigNivel ) then
			
				if( pos_x >= 100 and pos_x < 163 and pos_y >= 50 and pos_y < 73 ) then
				
					dir_nube1_y <= pos_y - 50;
					dir_nube1_x <= pos_x - 100 + 1;
					
					R <= nube1_R;
					G <= nube1_G;
					B <= nube1_B;
					
				elsif( pos_x >= 310 and pos_x < 359 and pos_y >= 250 and pos_y < 269) then
					
					dir_nivel_y <= pos_y - 250;
					dir_nivel_x <= pos_x - 310;
					
					R <= nivel_R;
					G <= nivel_G;
					B <= nivel_B;
					
				elsif( pos_x >= 372 and pos_x < 390 and pos_y >= 250 and pos_y < 270 ) then
				
					dir_num_y <= pos_y - 250;
					dir_num_x <= pos_x - 370;
						 
					dig <= contNivel;
						 
					R <= num_R;
					G <= num_G;
					B <= num_B;
					
				elsif( pos_x >= 400 and pos_x < 463 and pos_y >= 50 and pos_y < 73 ) then
				
					dir_nube1_y <= pos_y - 50;
					dir_nube1_x <= pos_x - 400 + 1;
					
					R <= nube1_R;
					G <= nube1_G;
					B <= nube1_B;
			
				-- Imprimiendo el piso 
				elsif( pos_x >= limiteIzquierda and pos_x < limiteDerecha and 
					    pos_y >= limiteAbajo - 32 and pos_y < limiteAbajo ) then

					
					dir_piso_y <= pos_y mod 16;
					dir_piso_x <= pos_x mod 16;
					
					R <= piso_R;
					G <= piso_G;
					B <= piso_B;
				
				else
				
					R <= std_logic_vector(to_unsigned(0  , R'length));
					G <= std_logic_vector(to_unsigned(0  , G'length));
					B <= std_logic_vector(to_unsigned(0  , B'length));
				
				end if;
			
			------------------------- Pantalla para fin del juego -----------------------------
			
			elsif( presente = fin ) then
			
				if( pos_x >= 100 and pos_x < 163 and pos_y >= 50 and pos_y < 73 ) then
				
					dir_nube1_y <= pos_y - 50;
					dir_nube1_x <= pos_x - 100 + 1;
					
					R <= nube1_R;
					G <= nube1_G;
					B <= nube1_B;
					
				elsif( pos_x >= 400 and pos_x < 463 and pos_y >= 50 and pos_y < 73 ) then
				
					dir_nube1_y <= pos_y - 50;
					dir_nube1_x <= pos_x - 400 + 1;
					
					R <= nube1_R;
					G <= nube1_G;
					B <= nube1_B;
			
				elsif( pos_x >= 270 and pos_x < 469 and pos_y >= 150 and pos_y < 229 ) then
				
					dir_fin_y <= pos_y - 150;
					dir_fin_x <= pos_x - 270 ;
					
					R <= fin_R;
					G <= fin_G;
					B <= fin_B;
					
				elsif( pos_x >= 352 and pos_x < 370 and pos_y >= 240 and pos_y < 260 ) then
				
					dir_num_y <= pos_y - 240;
					dir_num_x <= pos_x - 350;
						 
					dig <= maxNivel;
						 
					R <= num_R;
					G <= num_G;
					B <= num_B;
			
				-- Imprimiendo el piso 
				elsif( pos_x >= limiteIzquierda and pos_x < limiteDerecha and 
					    pos_y >= limiteAbajo - 32 and pos_y < limiteAbajo ) then

					
					dir_piso_y <= pos_y mod 16;
					dir_piso_x <= pos_x mod 16;
					
					R <= piso_R;
					G <= piso_G;
					B <= piso_B;
				
				else
				
					R <= std_logic_vector(to_unsigned(0  , R'length));
					G <= std_logic_vector(to_unsigned(0  , G'length));
					B <= std_logic_vector(to_unsigned(0  , B'length));
				
				end if;
			
			end if;
		
		end if; -- rising edge
	
	end process;

	vga_R <= R( 7 downto 4 );
	vga_G <= G( 7 downto 4 );
	vga_B <= B( 7 downto 4 );

end compControlador_VGA;