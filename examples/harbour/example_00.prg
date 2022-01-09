/*
 *
 */

#include "hbsdl.ch"

PROCEDURE Main()

   IF( SDL_Init( hb_bitOr( SDL_INIT_VIDEO ) != 0 )
      OutStd( "Unable to initialize SDL: ", SDL_GetError() )
      RETURN
   ENDIF

   SDL_Delay( 1000 )

   SDL_Quit()

   RETURN
