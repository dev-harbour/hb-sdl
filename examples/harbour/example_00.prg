/*
 *
 */

#include "hbsdl.ch"

PROCEDURE Main()

   IF( SDL_Init( SDL_INIT_VIDEO + SDL_INIT_AUDIO ) != 0 )
      OutStd( "Unable to initialize SDL: ", SDL_GetError() )
      RETURN
   ENDIF

   SDL_Delay( 1000 )

   SDL_Quit()

   RETURN
