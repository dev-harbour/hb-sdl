/*
 *
 */

#include "hbsdl.ch"

PROCEDURE Main()

   LOCAL pWindow

   IF( SDL_Init( SDL_INIT_VIDEO + SDL_INIT_AUDIO ) != 0 )
      OutStd( e"Unable to initialize SDL: \n", SDL_GetError() )
      RETURN
   ENDIF

   pWindow := SDL_CreateWindow( "Tutorial 2", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, 640, 480, 0 )
   IF( pWindow == NIL )
      OutStd( e"Could not create window: \n", SDL_GetError() )
      RETURN
   ENDIF

   SDL_Delay( 3000 )

   SDL_Quit()

   RETURN
