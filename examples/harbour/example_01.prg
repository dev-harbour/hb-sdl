/*
 *
 */

#include "hbsdl.ch"

PROCEDURE Main()

   OutStd( e"Initializing SDL.\n" )

   IF( SDL_Init( SDL_INIT_VIDEO + SDL_INIT_AUDIO ) != 0 )
      OutStd( e"Unable to initialize SDL: %s.\n", SDL_GetError() )
      RETURN
   ENDIF

   OutStd( e"SDL initialized.\n" )

   OutStd( e"Quiting SDL.\n" )

   SDL_Quit()

   OutStd( e"Quiting....\n" )

   RETURN
