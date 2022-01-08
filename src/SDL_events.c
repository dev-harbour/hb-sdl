/*
 * SDL library: SDL_events.c
 * version 2.0.16
 *
 * Copyright 2021 Rafał Jopek ( rafaljopek at hotmail com )
 *
 */

#include "hbsdl.h"

/* =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= */

// SDL_COMPILE_TIME_ASSERT(SDL_Event, sizeof(SDL_Event) == sizeof(((SDL_Event *)NULL)->padding));

// extern DECLSPEC void SDLCALL SDL_PumpEvents(void);

// extern DECLSPEC int SDLCALL SDL_PeepEvents(SDL_Event * events, int numevents, SDL_eventaction action,

// extern DECLSPEC SDL_bool SDLCALL SDL_HasEvent(Uint32 type);

// extern DECLSPEC SDL_bool SDLCALL SDL_HasEvents(Uint32 minType, Uint32 maxType);

// extern DECLSPEC void SDLCALL SDL_FlushEvent(Uint32 type);

// extern DECLSPEC void SDLCALL SDL_FlushEvents(Uint32 minType, Uint32 maxType);

// extern DECLSPEC int SDLCALL SDL_PollEvent(SDL_Event * event);

// extern DECLSPEC int SDLCALL SDL_WaitEvent(SDL_Event * event);
HB_FUNC( SDL_WAITEVENT )
{
   SDL_Event event;

   if( hb_param( 1, HB_IT_BYREF ) != NULL )
   {
      SDL_WaitEvent( &event );
      hb_stornint( event.type, 1 );
   }
   else
   {
      hb_ret();
   }
}

// extern DECLSPEC int SDLCALL SDL_WaitEventTimeout(SDL_Event * event, int timeout);

// extern DECLSPEC int SDLCALL SDL_PushEvent(SDL_Event * event);

// typedef int (SDLCALL * SDL_EventFilter) (void *userdata, SDL_Event * event);

// extern DECLSPEC void SDLCALL SDL_SetEventFilter(SDL_EventFilter filter, void *userdata);

// extern DECLSPEC SDL_bool SDLCALL SDL_GetEventFilter(SDL_EventFilter * filter, void **userdata);

// extern DECLSPEC void SDLCALL SDL_AddEventWatch(SDL_EventFilter filter, void *userdata);

// extern DECLSPEC void SDLCALL SDL_DelEventWatch(SDL_EventFilter filter, void *userdata);

// extern DECLSPEC void SDLCALL SDL_FilterEvents(SDL_EventFilter filter, void *userdata);

// extern DECLSPEC Uint8 SDLCALL SDL_EventState(Uint32 type, int state);

// extern DECLSPEC Uint32 SDLCALL SDL_RegisterEvents(int numevents);
