/*
 * SDL library: SDL_hb.c
 * version 2.0.16
 *
 * Copyright 2021 Rafał Jopek ( rafaljopek at hotmail com )
 *
 */

#include "hbsdl.h"

/* =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= */

/* KeyboardEvent */
HB_FUNC( KEYBOARDEVENT )
{
   SDL_Event event;
   KeyboardEvent event_type = hb_parni( 1 );

   if( SDL_WaitEvent( &event ) )
   {
      switch( event_type )
      {
      case EVENT_KEY_TYPE:
         break;
      case EVENT_KEY_TIMESTAMP:
         break;
      case EVENT_KEY_WINDOWID:
         break;
      case EVENT_KEY_STATE:
         break;
      case EVENT_KEY_REPEAT:
         break;
      case EVENT_KEY_PADDING2:
         break;
      case EVENT_KEY_PADDING3:
         break;
      case EVENT_KEY_KEYSYM_SCANCODE:
         break;
      case EVENT_KEY_KEYSYM_SYM:
         hb_retni( event.key.keysym.sym );
         break;
      case EVENT_KEY_KEYSYM_MOD:
         break;
      case EVENT_KEY_KEYSYM_UNUSED:
         break;

      default:
         hb_ret();
         break;
      }
   }
   else
   {
      hb_ret();
   }
}
