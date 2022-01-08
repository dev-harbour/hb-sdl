/*
 * SDL library: SDL_error.c
 * version 2.0.16
 *
 * Copyright 2021 Rafał Jopek ( rafaljopek at hotmail com )
 *
 */

#include "hbsdl.h"

/* =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= */

// extern DECLSPEC int SDLCALL SDL_SetError(SDL_PRINTF_FORMAT_STRING const char *fmt, ...) SDL_PRINTF_VARARG_FUNC(1);

// extern DECLSPEC const char *SDLCALL SDL_GetError(void);
HB_FUNC( SDL_GETERROR )
{
   hb_retc( SDL_GetError() );
}

// extern DECLSPEC char * SDLCALL SDL_GetErrorMsg(char *errstr, int maxlen);

// extern DECLSPEC void SDLCALL SDL_ClearError(void);
HB_FUNC( SDL_CLEARERROR )
{
   SDL_ClearError();
}

// extern DECLSPEC int SDLCALL SDL_Error( SDL_errorcode code );
HB_FUNC( SDL_ERROR )
{
   if( hb_param( 1, HB_IT_INTEGER ) != NULL )
   {
      hb_retni( SDL_Error( hb_parni( 1 ) ) );
   }
   else
   {
      HB_ERR_ARGS();
   }
}
