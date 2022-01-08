/*
 *
 */

#include "hbsdl.ch"

PROCEDURE Main()

   LOCAL pWindow
   LOCAL lQuit := .F.

   IF( SDL_Init( SDL_INIT_VIDEO ) != 0 )
      OutStd( e"Unable to initialize SDL: \n", SDL_GetError() )
      RETURN
   ENDIF

   pWindow := SDL_CreateWindow( "Tutorial 3", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, 640, 380, 0 )
   IF( pWindow == NIL )
      OutStd( e"Could not create window: \n", SDL_GetError() )
      RETURN
   ENDIF

   DO WHILE( ! lQuit )

      SWITCH( EventType() )

      CASE SDL_QUIT
         lQuit := .T.
         EXIT

      ENDSWITCH

   ENDDO

   SDL_Quit()

   RETURN
