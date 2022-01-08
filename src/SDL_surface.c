/*
 * SDL library: SDL_surface.c
 * version 2.0.16
 *
 * Copyright 2021 Rafał Jopek ( rafaljopek at hotmail com )
 *
 */

#include "hbsdl.h"

/* =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= */
/* SDL_Surface */
static HB_GARBAGE_FUNC( hb_surface_destructor )
{
   SDL_Surface ** ppSDL_Surface = ( SDL_Surface ** ) Cargo;

   if( *ppSDL_Surface )
   {
      *ppSDL_Surface = NULL;
   }
}

static const HB_GC_FUNCS s_gcSurfaceFuncs =
{
   hb_surface_destructor,
   hb_gcDummyMark
};

SDL_Surface * hb_surface_Param( int iParam )
{
   SDL_Surface ** ppSDL_Surface = ( SDL_Surface ** ) hb_parptrGC( &s_gcSurfaceFuncs, iParam );

   if( ppSDL_Surface && *ppSDL_Surface )
   {
      return *ppSDL_Surface;
   }
   else
   {
      HB_ERR_ARGS();
      return NULL;
   }
}

PHB_ITEM hb_surface_ItemPut( PHB_ITEM pItem, SDL_Surface * pSDL_Surface )
{
   SDL_Surface ** ppSDL_Surface = ( SDL_Surface ** ) hb_gcAllocate( sizeof( SDL_Surface * ), &s_gcSurfaceFuncs );
   *ppSDL_Surface = pSDL_Surface;
   return hb_itemPutPtrGC( pItem, ppSDL_Surface );
}

void hb_surface_Return( SDL_Surface * pSDL_Surface )
{
   if( pSDL_Surface )
   {
      hb_surface_ItemPut( hb_param( -1, HB_IT_ANY ), pSDL_Surface );
   }
   else
   {
      hb_ret();
   }
}

/* =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= */

// extern DECLSPEC SDL_Surface *SDLCALL SDL_CreateRGBSurface (Uint32 flags, int width, int height, int depth, Uint32 Rmask, Uint32 Gmask, Uint32 Bmask, Uint32 Amask);

// extern DECLSPEC SDL_Surface *SDLCALL SDL_CreateRGBSurfaceWithFormat (Uint32 flags, int width, int height, int depth, Uint32 format);

// extern DECLSPEC SDL_Surface *SDLCALL SDL_CreateRGBSurfaceFrom(void *pixels, int width, int height, int depth, int pitch, Uint32 Rmask, Uint32 Gmask, Uint32 Bmask, Uint32 Amask);

// extern DECLSPEC SDL_Surface *SDLCALL SDL_CreateRGBSurfaceWithFormatFrom (void *pixels, int width, int height, int depth, int pitch, Uint32 format);

// extern DECLSPEC void SDLCALL SDL_FreeSurface(SDL_Surface * surface);
HB_FUNC( SDL_FREESURFACE )
{
   // TO DO
   SDL_Surface * surface = hb_surface_Param( 1 );

   if( surface )
   {
      SDL_FreeSurface( surface );
   }
   else
   {
      HB_ERR_ARGS();
   }
}

// extern DECLSPEC int SDLCALL SDL_SetSurfacePalette(SDL_Surface * surface, SDL_Palette * palette);

// extern DECLSPEC int SDLCALL SDL_LockSurface(SDL_Surface * surface);
HB_FUNC( SDL_LOCKSURFACE )
{
   SDL_Surface * surface = hb_surface_Param( 1 );

   if( surface )
   {
      hb_retni( SDL_LockSurface( surface ) );
   }
   else
   {
      HB_ERR_ARGS();
   }
}

// extern DECLSPEC void SDLCALL SDL_UnlockSurface(SDL_Surface * surface);
HB_FUNC( SDL_UNLOCKSURFACE )
{
   SDL_Surface * surface = hb_surface_Param( 1 );

   if( surface )
   {
      SDL_UnlockSurface( surface );
   }
   else
   {
      HB_ERR_ARGS();
   }
}

// extern DECLSPEC SDL_Surface *SDLCALL SDL_LoadBMP_RW(SDL_RWops * src, int freesrc);
HB_FUNC( SDL_LOADBMP_RW )
{
   if( hb_param( 1, HB_IT_POINTER ) != NULL && hb_param( 2, HB_IT_INTEGER ) != NULL )
   {
      hb_surface_Return( SDL_LoadBMP_RW( hb_parptr( 1 ), hb_parni( 2 ) ) );
   }
   else
   {
      HB_ERR_ARGS();
   }
}

// extern DECLSPEC int SDLCALL SDL_SaveBMP_RW(SDL_Surface * surface, SDL_RWops * dst, int freedst);
HB_FUNC( SDL_SAVEBMP_RW )
{
   SDL_Surface * surface = hb_surface_Param( 1 );

   if( surface && hb_param( 2, HB_IT_POINTER ) != NULL && hb_param( 3, HB_IT_INTEGER ) != NULL )
   {
      hb_retni( SDL_SaveBMP_RW( surface, hb_parptr( 2 ), hb_parni( 3 ) ) );
   }
   else
   {
      HB_ERR_ARGS();
   }
}


// extern DECLSPEC int SDLCALL SDL_SetSurfaceRLE(SDL_Surface * surface, int flag);

// extern DECLSPEC SDL_bool SDLCALL SDL_HasSurfaceRLE(SDL_Surface * surface);

// extern DECLSPEC int SDLCALL SDL_SetColorKey(SDL_Surface * surface, int flag, Uint32 key);

// extern DECLSPEC SDL_bool SDLCALL SDL_HasColorKey(SDL_Surface * surface);

// extern DECLSPEC int SDLCALL SDL_GetColorKey(SDL_Surface * surface, Uint32 * key);

// extern DECLSPEC int SDLCALL SDL_SetSurfaceColorMod(SDL_Surface * surface, Uint8 r, Uint8 g, Uint8 b);

// extern DECLSPEC int SDLCALL SDL_GetSurfaceColorMod(SDL_Surface * surface, Uint8 * r, Uint8 * g, Uint8 * b);

// extern DECLSPEC int SDLCALL SDL_SetSurfaceAlphaMod(SDL_Surface * surface, Uint8 alpha);

// extern DECLSPEC int SDLCALL SDL_GetSurfaceAlphaMod(SDL_Surface * surface, Uint8 * alpha);

// extern DECLSPEC int SDLCALL SDL_SetSurfaceBlendMode(SDL_Surface * surface, SDL_BlendMode blendMode);

// extern DECLSPEC int SDLCALL SDL_GetSurfaceBlendMode(SDL_Surface * surface, SDL_BlendMode *blendMode);

// extern DECLSPEC SDL_bool SDLCALL SDL_SetClipRect(SDL_Surface * surface, const SDL_Rect * rect);

// extern DECLSPEC void SDLCALL SDL_GetClipRect(SDL_Surface * surface, SDL_Rect * rect);

// extern DECLSPEC SDL_Surface *SDLCALL SDL_DuplicateSurface(SDL_Surface * surface);

// extern DECLSPEC SDL_Surface *SDLCALL SDL_ConvertSurface(SDL_Surface * src, const SDL_PixelFormat * fmt, Uint32 flags);

// extern DECLSPEC SDL_Surface *SDLCALL SDL_ConvertSurfaceFormat(SDL_Surface * src, Uint32 pixel_format, Uint32 flags);

// extern DECLSPEC int SDLCALL SDL_ConvertPixels(int width, int height, Uint32 src_format, const void * src, int src_pitch, Uint32 dst_format, void * dst, int dst_pitch);

// extern DECLSPEC int SDLCALL SDL_FillRect(SDL_Surface * dst, const SDL_Rect * rect, Uint32 color);

// extern DECLSPEC int SDLCALL SDL_FillRects(SDL_Surface * dst, const SDL_Rect * rects, int count, Uint32 color);

// extern DECLSPEC int SDLCALL SDL_UpperBlit(SDL_Surface * src, const SDL_Rect * srcrect, SDL_Surface * dst, SDL_Rect * dstrect);

// extern DECLSPEC int SDLCALL SDL_LowerBlit(SDL_Surface * src, SDL_Rect * srcrect, SDL_Surface * dst, SDL_Rect * dstrect);

// extern DECLSPEC int SDLCALL SDL_SoftStretch(SDL_Surface * src, const SDL_Rect * srcrect, SDL_Surface * dst, const SDL_Rect * dstrect);

// extern DECLSPEC int SDLCALL SDL_SoftStretchLinear(SDL_Surface * src, const SDL_Rect * srcrect, SDL_Surface * dst, const SDL_Rect * dstrect);

// extern DECLSPEC int SDLCALL SDL_UpperBlitScaled(SDL_Surface * src, const SDL_Rect * srcrect, SDL_Surface * dst, SDL_Rect * dstrect);

// extern DECLSPEC int SDLCALL SDL_LowerBlitScaled(SDL_Surface * src, SDL_Rect * srcrect, SDL_Surface * dst, SDL_Rect * dstrect);

// extern DECLSPEC void SDLCALL SDL_SetYUVConversionMode(SDL_YUV_CONVERSION_MODE mode);

// extern DECLSPEC SDL_YUV_CONVERSION_MODE SDLCALL SDL_GetYUVConversionMode(void);

// extern DECLSPEC SDL_YUV_CONVERSION_MODE SDLCALL SDL_GetYUVConversionModeForResolution(int width, int height);

// typedef int (SDLCALL *SDL_blit) (struct SDL_Surface * src, SDL_Rect * srcrect, struct SDL_Surface * dst, SDL_Rect * dstrect);
