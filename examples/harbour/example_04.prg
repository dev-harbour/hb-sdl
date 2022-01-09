/*
 *
 */

#include "hbsdl.ch"

PROCEDURE Main()

   LOCAL pWindow
   LOCAL lQuit := .F.
   LOCAL nEvent

   IF( SDL_Init( SDL_INIT_VIDEO ) != 0 )
      OutStd( e"Unable to initialize SDL: \n", SDL_GetError() )
      RETURN
   ENDIF

   pWindow := SDL_CreateWindow( "Example 4", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, 720, 450, 0 )
   IF( pWindow == NIL )
      OutStd( e"Could not create window: \n", SDL_GetError() )
      RETURN
   ENDIF

   DO WHILE( ! lQuit )

      SDL_WaitEvent( @nEvent )

      SWITCH( nEvent )

      CASE SDL_QUIT
         lQuit := .T.
         EXIT

      CASE SDL_KEYDOWN

         SWITCH( KeyDown() )

         CASE SDLK_UP
            SDL_SetWindowTitle( pWindow, "SDLK_UP" )
            EXIT

         CASE SDLK_DOWN
            SDL_SetWindowTitle( pWindow, "SDLK_DOWN" )
            EXIT

         CASE SDLK_LEFT
            SDL_SetWindowTitle( pWindow, "SDLK_LEFT" )
            EXIT

         CASE SDLK_RIGHT
            SDL_SetWindowTitle( pWindow, "SDLK_RIGHT" )
            EXIT

         ENDSWITCH

         EXIT

      ENDSWITCH

   ENDDO

   SDL_Quit()

   RETURN
