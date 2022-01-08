/*
 * SDL library: SDL.c
 * version 2.0.16
 *
 * Copyright 2021 Rafał Jopek ( rafaljopek at hotmail com )
 *
 */

#include "hbsdl.h"

/* =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= */

// extern DECLSPEC int SDLCALL SDL_Init(Uint32 flags);
HB_FUNC( SDL_INIT )
{
   if( hb_param( 1, HB_IT_INTEGER ) != NULL )
   {
      hb_retni( SDL_Init( ( Uint32 ) hb_parni( 1 ) ) );
   }
   else
   {
      HB_ERR_ARGS();
   }
}

// extern DECLSPEC int SDLCALL SDL_InitSubSystem(Uint32 flags);
HB_FUNC( SDL_INITSUBSYSTEM )
{
   if( hb_param( 1, HB_IT_INTEGER ) != NULL )
   {
      hb_retni( SDL_InitSubSystem( ( Uint32 ) hb_parni( 1 ) ) );
   }
   else
   {
      HB_ERR_ARGS();
   }
}

// extern DECLSPEC void SDLCALL SDL_QuitSubSystem(Uint32 flags);
HB_FUNC( SDL_QUITSUBSYSTEM )
{
   if( hb_param( 1, HB_IT_INTEGER ) != NULL )
   {
      SDL_QuitSubSystem( ( Uint32 ) hb_parni( 1 ) );
   }
   else
   {
      HB_ERR_ARGS();
   }
}

// extern DECLSPEC Uint32 SDLCALL SDL_WasInit(Uint32 flags);
HB_FUNC( SDL_WASINIT )
{
   if( hb_param( 1, HB_IT_INTEGER ) != NULL )
   {
      hb_retni( SDL_WasInit( ( Uint32 ) hb_parni( 1 ) ) ); // TO DO
   }
   else
   {
      HB_ERR_ARGS();
   }
}

// extern DECLSPEC void SDLCALL SDL_Quit(void);
HB_FUNC( SDL_QUIT )
{
   SDL_Quit();
}
