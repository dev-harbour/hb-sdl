/*
 *
 */

#include "hbsdl.ch"

PROCEDURE Main()

   LOCAL pWindow
   LOCAL pRenderer
   LOCAL aSurface
   LOCAL pTexture
   LOCAL lQuit := .F.

   IF( SDL_Init( SDL_INIT_VIDEO ) != 0 )
      OutStd( e"Unable to initialize SDL: \n", SDL_GetError() )
      RETURN
   ENDIF

   pWindow := SDL_CreateWindow( "Example 4", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, 720, 450, 0 )
   IF( pWindow == NIL )
      OutStd( e"Could not create Window: \n", SDL_GetError() )
      RETURN
   ENDIF

   pRenderer := SDL_CreateRenderer( pWindow, - 1, SDL_RENDERER_ACCELERATED )
   IF( pRenderer == NIL )
      OutStd( e"Could not create Renderer: \n", SDL_GetError() )
      RETURN
   ENDIF

   aSurface := SDL_LoadBMP( "../../docs/assets/img/harbour_sdl.bmp" )
   IF( aSurface == NIL )
      OutStd( e"Could not create Surface: \n", SDL_GetError() )
      RETURN
   ENDIF

   pTexture := SDL_CreateTextureFromSurface( pRenderer, aSurface )
   IF( pTexture == NIL )
      OutStd( e"Could not create Texture: \n", SDL_GetError() )
      RETURN
   ENDIF

   SDL_FreeSurface( aSurface )

   DO WHILE( ! lQuit )

      SWITCH EventType()

      CASE SDL_QUIT
         lQuit := .T.
         EXIT

      ENDSWITCH

      SDL_RenderClear( pRenderer )
      SDL_RenderCopy( pRenderer, pTexture, { 0, 0, 450, 450 }, {0, 0, 450, 450 } )
      SDL_RenderPresent( pRenderer )

   ENDDO

   SDL_Quit()

   RETURN
