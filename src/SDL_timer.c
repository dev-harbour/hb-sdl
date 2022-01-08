/*
 * SDL library: SDL_timer.c
 * version 2.0.16
 *
 * Copyright 2021 Rafał Jopek ( rafaljopek at hotmail com )
 *
 */

#include "hbsdl.h"

/* =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= */

// extern DECLSPEC Uint32 SDLCALL SDL_GetTicks(void);

// extern DECLSPEC Uint64 SDLCALL SDL_GetPerformanceCounter(void);

// extern DECLSPEC Uint64 SDLCALL SDL_GetPerformanceFrequency(void);

// extern DECLSPEC void SDLCALL SDL_Delay(Uint32 ms);
HB_FUNC( SDL_DELAY )
{
   if( hb_param( 1, HB_IT_INTEGER ) != NULL )
   {
      SDL_Delay( ( Uint32 ) hb_parni( 1 ) );
   }
   else
   {
      HB_ERR_ARGS();
   }
}

// typedef Uint32 (SDLCALL * SDL_TimerCallback) (Uint32 interval, void *param);

// extern DECLSPEC SDL_TimerID SDLCALL SDL_AddTimer(Uint32 interval, SDL_TimerCallback callback, void *param);

// extern DECLSPEC SDL_bool SDLCALL SDL_RemoveTimer(SDL_TimerID id);
