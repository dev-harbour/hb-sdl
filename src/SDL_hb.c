/*
 * SDL library: SDL_hb.c
 * version 2.0.16
 *
 * Copyright 2021 Rafał Jopek ( rafaljopek at hotmail com )
 *
 */

#include "hbsdl.h"

/* =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= */

/* type EventType() */
HB_FUNC( EVENTTYPE )
{
   SDL_Event event;

   if( SDL_WaitEvent( &event ) )
   {
      hb_retni( ( Uint32 ) event.type );
   }
   else
   {
      hb_ret();
   }
}

/* key KeyDown() */
HB_FUNC( KEYDOWN )
{
   SDL_Event event;

   if( SDL_WaitEvent( &event ) )
   {
      hb_retni( event.key.keysym.sym );
   }
   else
   {
      hb_ret();
   }
}
