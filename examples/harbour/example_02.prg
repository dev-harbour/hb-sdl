/*
 *
 */

#include "hbsdl.ch"

PROCEDURE Main()

   LOCAL pWindow

   IF( SDL_Init( SDL_INIT_VIDEO ) != 0 )
      OutStd( e"Unable to initialize SDL: \n", SDL_GetError() )
      RETURN
   ENDIF

   pWindow := SDL_CreateWindow( "Example 2", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, 720, 450, 0 )
   IF( pWindow == NIL )
      OutStd( e"Could not create window: \n", SDL_GetError() )
      RETURN
   ENDIF

   SDL_Delay( 3000 )

   SDL_Quit()

   RETURN
