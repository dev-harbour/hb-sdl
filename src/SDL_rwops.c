/*
 * SDL library: SDL_rwops.c
 * version 2.0.16
 *
 * Copyright 2021 Rafał Jopek ( rafaljopek at hotmail com )
 *
 */

#include "hbsdl.h"

/* =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= */

// extern DECLSPEC SDL_RWops *SDLCALL SDL_RWFromFile(const char *file, const char *mode);
HB_FUNC( SDL_RWFROMFILE )
{
   if( hb_param( 1, HB_IT_STRING ) != NULL && hb_param( 2, HB_IT_STRING ) != NULL )
   {
      hb_retptr( SDL_RWFromFile( hb_parc( 1 ), hb_parc( 2 ) ) );
   }
   else
   {
      HB_ERR_ARGS();
   }
}

// #ifdef HAVE_STDIO_H
// extern DECLSPEC SDL_RWops *SDLCALL SDL_RWFromFP(FILE * fp, SDL_bool autoclose);
// #else
// extern DECLSPEC SDL_RWops *SDLCALL SDL_RWFromFP(void * fp, SDL_bool autoclose);
// #endif

// extern DECLSPEC SDL_RWops *SDLCALL SDL_RWFromMem(void *mem, int size);

// extern DECLSPEC SDL_RWops *SDLCALL SDL_RWFromConstMem(const void *mem, int size);
// extern DECLSPEC SDL_RWops *SDLCALL SDL_AllocRW(void);

// extern DECLSPEC void SDLCALL SDL_FreeRW(SDL_RWops * area);

// extern DECLSPEC Sint64 SDLCALL SDL_RWsize(SDL_RWops *context);

// extern DECLSPEC Sint64 SDLCALL SDL_RWseek(SDL_RWops *context, Sint64 offset, int whence);

// extern DECLSPEC Sint64 SDLCALL SDL_RWtell(SDL_RWops *context);

// extern DECLSPEC size_t SDLCALL SDL_RWread(SDL_RWops *context, void *ptr, size_t size, size_t maxnum);

// extern DECLSPEC size_t SDLCALL SDL_RWwrite(SDL_RWops *context, const void *ptr, size_t size, size_t num);

// extern DECLSPEC int SDLCALL SDL_RWclose(SDL_RWops *context);

// extern DECLSPEC void *SDLCALL SDL_LoadFile_RW(SDL_RWops *src, size_t *datasize, int freesrc);

// extern DECLSPEC void *SDLCALL SDL_LoadFile(const char *file, size_t *datasize);

// extern DECLSPEC Uint8 SDLCALL SDL_ReadU8(SDL_RWops * src);

// extern DECLSPEC Uint16 SDLCALL SDL_ReadLE16(SDL_RWops * src);

// extern DECLSPEC Uint16 SDLCALL SDL_ReadBE16(SDL_RWops * src);

// extern DECLSPEC Uint32 SDLCALL SDL_ReadLE32(SDL_RWops * src);

// extern DECLSPEC Uint32 SDLCALL SDL_ReadBE32(SDL_RWops * src);

// extern DECLSPEC Uint64 SDLCALL SDL_ReadLE64(SDL_RWops * src);

// extern DECLSPEC Uint64 SDLCALL SDL_ReadBE64(SDL_RWops * src);

// extern DECLSPEC size_t SDLCALL SDL_WriteU8(SDL_RWops * dst, Uint8 value);

// extern DECLSPEC size_t SDLCALL SDL_WriteLE16(SDL_RWops * dst, Uint16 value);

// extern DECLSPEC size_t SDLCALL SDL_WriteBE16(SDL_RWops * dst, Uint16 value);

// extern DECLSPEC size_t SDLCALL SDL_WriteLE32(SDL_RWops * dst, Uint32 value);

// extern DECLSPEC size_t SDLCALL SDL_WriteBE32(SDL_RWops * dst, Uint32 value);

// extern DECLSPEC size_t SDLCALL SDL_WriteLE64(SDL_RWops * dst, Uint64 value);

// extern DECLSPEC size_t SDLCALL SDL_WriteBE64(SDL_RWops * dst, Uint64 value);
