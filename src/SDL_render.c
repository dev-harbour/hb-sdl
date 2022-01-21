/*
 * SDL library: SDL_render.c
 * version 2.0.16
 *
 * Copyright 2021 Rafał Jopek ( rafaljopek at hotmail com )
 *
 */

#include "hbsdl.h"

/* =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= */
/* SDL_Renderer */
static HB_GARBAGE_FUNC( hb_renderer_destructor )
{
   SDL_Renderer ** ppSDL_Renderer = ( SDL_Renderer ** ) Cargo;

   if( *ppSDL_Renderer )
   {
      SDL_DestroyRenderer( *ppSDL_Renderer );
      *ppSDL_Renderer = NULL;
   }
}

static const HB_GC_FUNCS s_gcRendererFuncs =
{
   hb_renderer_destructor,
   hb_gcDummyMark
};

SDL_Renderer * hb_renderer_Param( int iParam )
{
   SDL_Renderer ** ppSDL_Renderer = ( SDL_Renderer ** ) hb_parptrGC( &s_gcRendererFuncs, iParam );

   if( ppSDL_Renderer && *ppSDL_Renderer )
   {
      return *ppSDL_Renderer;
   }
   else
   {
      HB_ERR_ARGS();
      return NULL;
   }
}

PHB_ITEM hb_renderer_ItemPut( PHB_ITEM pItem, SDL_Renderer * pSDL_Renderer )
{
   SDL_Renderer ** ppSDL_Renderer = ( SDL_Renderer ** ) hb_gcAllocate( sizeof( SDL_Renderer * ), &s_gcRendererFuncs );
   *ppSDL_Renderer = pSDL_Renderer;
   return hb_itemPutPtrGC( pItem, ppSDL_Renderer );
}

void hb_renderer_Return( SDL_Renderer * pSDL_Renderer )
{
   if( pSDL_Renderer )
   {
      hb_renderer_ItemPut( hb_param( -1, HB_IT_ANY ), pSDL_Renderer );
   }
   else
   {
      hb_ret();
   }
}

// extern DECLSPEC void SDLCALL SDL_DestroyRenderer(SDL_Renderer * renderer);
HB_FUNC( SDL_DESTROYRENDERER )
{
   SDL_Renderer ** ppSDL_Renderer = ( SDL_Renderer ** ) hb_parptrGC( &s_gcRendererFuncs, 1 );

   if( ppSDL_Renderer && *ppSDL_Renderer )
   {
      SDL_DestroyRenderer( *ppSDL_Renderer );
      *ppSDL_Renderer = NULL;
   }
   else
   {
      HB_ERR_ARGS();
   }
}

/* =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= */
/* SDL_Texture */
static HB_GARBAGE_FUNC( hb_texture_destructor )
{
   SDL_Texture ** ppSDL_Texture = ( SDL_Texture ** ) Cargo;

   if( *ppSDL_Texture )
   {
      SDL_DestroyTexture( *ppSDL_Texture );
      *ppSDL_Texture = NULL;
   }
}

static const HB_GC_FUNCS s_gcTextureFuncs =
{
   hb_texture_destructor,
   hb_gcDummyMark
};

SDL_Texture * hb_texture_Param( int iParam )
{
   SDL_Texture ** ppSDL_Texture = ( SDL_Texture ** ) hb_parptrGC( &s_gcTextureFuncs, iParam );

   if( ppSDL_Texture && *ppSDL_Texture )
   {
      return *ppSDL_Texture;
   }
   else
   {
      HB_ERR_ARGS();
      return NULL;
   }
}

PHB_ITEM hb_texture_ItemPut( PHB_ITEM pItem, SDL_Texture * pSDL_Texture )
{
   SDL_Texture ** ppSDL_Texture = ( SDL_Texture ** ) hb_gcAllocate( sizeof( SDL_Texture * ), &s_gcTextureFuncs );
   *ppSDL_Texture = pSDL_Texture;
   return hb_itemPutPtrGC( pItem, ppSDL_Texture );
}

void hb_texture_Return( SDL_Texture * pSDL_Texture )
{
   if( pSDL_Texture )
   {
      hb_texture_ItemPut( hb_param( -1, HB_IT_ANY ), pSDL_Texture );
   }
   else
   {
      hb_ret();
   }

}

// extern DECLSPEC void SDLCALL SDL_DestroyTexture(SDL_Texture * texture);
HB_FUNC( SDL_DESTROYTEXTURE )
{
   SDL_Texture ** ppSDL_Texture = ( SDL_Texture ** ) hb_parptrGC( &s_gcTextureFuncs, 1 );

   if( ppSDL_Texture && *ppSDL_Texture )
   {
      SDL_DestroyTexture( *ppSDL_Texture );
      *ppSDL_Texture = NULL;
   }
   else
   {
      HB_ERR_ARGS();
   }
}

/* =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= */

// extern DECLSPEC int SDLCALL SDL_GetNumRenderDrivers(void);

// extern DECLSPEC int SDLCALL SDL_GetRenderDriverInfo(int index, SDL_RendererInfo * info);

// extern DECLSPEC int SDLCALL SDL_CreateWindowAndRenderer( int width, int height, Uint32 window_flags, SDL_Window **window, SDL_Renderer **renderer);

// extern DECLSPEC SDL_Renderer * SDLCALL SDL_CreateRenderer(SDL_Window * window, int index, Uint32 flags);
HB_FUNC( SDL_CREATERENDERER )
{
   SDL_Window * window = hb_window_Param( 1 );

   if( window && hb_param( 2, HB_IT_INTEGER ) != NULL && hb_param( 3, HB_IT_INTEGER ) != NULL )
   {
      hb_renderer_Return( SDL_CreateRenderer( window, hb_parni( 2 ), ( Uint32 ) hb_parni( 3 ) ) );
   }
   else
   {
      HB_ERR_ARGS();
   }
}

// extern DECLSPEC SDL_Renderer * SDLCALL SDL_CreateSoftwareRenderer(SDL_Surface * surface);

// extern DECLSPEC SDL_Renderer * SDLCALL SDL_GetRenderer(SDL_Window * window);

// extern DECLSPEC int SDLCALL SDL_GetRendererInfo(SDL_Renderer * renderer, SDL_RendererInfo * info);

// extern DECLSPEC int SDLCALL SDL_GetRendererOutputSize(SDL_Renderer * renderer, int *w, int *h);

// extern DECLSPEC SDL_Texture * SDLCALL SDL_CreateTexture(SDL_Renderer * renderer, Uint32 format, int access, int w, int h);

// extern DECLSPEC SDL_Texture * SDLCALL SDL_CreateTextureFromSurface(SDL_Renderer * renderer, SDL_Surface * surface);
HB_FUNC( SDL_CREATETEXTUREFROMSURFACE )
{
   SDL_Renderer * renderer = hb_renderer_Param( 1 );
   SDL_Surface * surface = hb_surface_Param( 2 );

   if( renderer && surface )
   {
      hb_texture_Return( SDL_CreateTextureFromSurface( renderer, surface ) );
   }
   else
   {
      HB_ERR_ARGS();
   }
}

// extern DECLSPEC int SDLCALL SDL_QueryTexture(SDL_Texture * texture, Uint32 * format, int *access, int *w, int *h);

// extern DECLSPEC int SDLCALL SDL_SetTextureColorMod(SDL_Texture * texture, Uint8 r, Uint8 g, Uint8 b);

// extern DECLSPEC int SDLCALL SDL_GetTextureColorMod(SDL_Texture * texture, Uint8 * r, Uint8 * g, Uint8 * b);

// extern DECLSPEC int SDLCALL SDL_SetTextureAlphaMod(SDL_Texture * texture, Uint8 alpha);

// extern DECLSPEC int SDLCALL SDL_GetTextureAlphaMod(SDL_Texture * texture, Uint8 * alpha);

// extern DECLSPEC int SDLCALL SDL_SetTextureBlendMode(SDL_Texture * texture, SDL_BlendMode blendMode);

// extern DECLSPEC int SDLCALL SDL_GetTextureBlendMode(SDL_Texture * texture, SDL_BlendMode *blendMode);

// extern DECLSPEC int SDLCALL SDL_SetTextureScaleMode(SDL_Texture * texture, SDL_ScaleMode scaleMode);

// extern DECLSPEC int SDLCALL SDL_GetTextureScaleMode(SDL_Texture * texture, SDL_ScaleMode *scaleMode);

// extern DECLSPEC int SDLCALL SDL_SetTextureUserData(SDL_Texture * texture, void *userdata);

// extern DECLSPEC void * SDLCALL SDL_GetTextureUserData(SDL_Texture * texture);

// extern DECLSPEC int SDLCALL SDL_UpdateTexture(SDL_Texture * texture, const SDL_Rect * rect, const void *pixels, int pitch);

// extern DECLSPEC int SDLCALL SDL_UpdateYUVTexture(SDL_Texture * texture, const SDL_Rect * rect, const Uint8 *Yplane, int Ypitch, const Uint8 *Uplane, int Upitch, const Uint8 *Vplane, int Vpitch);

// extern DECLSPEC int SDLCALL SDL_UpdateNVTexture(SDL_Texture * texture, const SDL_Rect * rect, const Uint8 *Yplane, int Ypitch, const Uint8 *UVplane, int UVpitch);

// extern DECLSPEC int SDLCALL SDL_LockTexture(SDL_Texture * texture, const SDL_Rect * rect, void **pixels, int *pitch);

// extern DECLSPEC int SDLCALL SDL_LockTextureToSurface(SDL_Texture *texture, const SDL_Rect *rect, SDL_Surface **surface);

// extern DECLSPEC void SDLCALL SDL_UnlockTexture(SDL_Texture * texture);

// extern DECLSPEC SDL_bool SDLCALL SDL_RenderTargetSupported(SDL_Renderer *renderer);

// extern DECLSPEC int SDLCALL SDL_SetRenderTarget(SDL_Renderer *renderer, SDL_Texture *texture);

// extern DECLSPEC SDL_Texture * SDLCALL SDL_GetRenderTarget(SDL_Renderer *renderer);

// extern DECLSPEC int SDLCALL SDL_RenderSetLogicalSize(SDL_Renderer * renderer, int w, int h);

// extern DECLSPEC void SDLCALL SDL_RenderGetLogicalSize(SDL_Renderer * renderer, int *w, int *h);

// extern DECLSPEC int SDLCALL SDL_RenderSetIntegerScale(SDL_Renderer * renderer, SDL_bool enable);

// extern DECLSPEC SDL_bool SDLCALL SDL_RenderGetIntegerScale(SDL_Renderer * renderer);

// extern DECLSPEC int SDLCALL SDL_RenderSetViewport(SDL_Renderer * renderer, const SDL_Rect * rect);

// extern DECLSPEC void SDLCALL SDL_RenderGetViewport(SDL_Renderer * renderer, SDL_Rect * rect);

// extern DECLSPEC int SDLCALL SDL_RenderSetClipRect(SDL_Renderer * renderer, const SDL_Rect * rect);

// extern DECLSPEC void SDLCALL SDL_RenderGetClipRect(SDL_Renderer * renderer, SDL_Rect * rect);

// extern DECLSPEC SDL_bool SDLCALL SDL_RenderIsClipEnabled(SDL_Renderer * renderer);

// extern DECLSPEC int SDLCALL SDL_RenderSetScale(SDL_Renderer * renderer, float scaleX, float scaleY);

// extern DECLSPEC void SDLCALL SDL_RenderGetScale(SDL_Renderer * renderer, float *scaleX, float *scaleY);

// extern DECLSPEC int SDLCALL SDL_SetRenderDrawColor(SDL_Renderer * renderer, Uint8 r, Uint8 g, Uint8 b, Uint8 a);
HB_FUNC( SDL_SETRENDERDRAWCOLOR )
{
   SDL_Renderer * renderer = hb_renderer_Param( 1 );

   if( renderer &&
      hb_param( 2, HB_IT_INTEGER ) != NULL &&
      hb_param( 3, HB_IT_INTEGER ) != NULL &&
      hb_param( 4, HB_IT_INTEGER ) != NULL &&
      hb_param( 5, HB_IT_INTEGER ) != NULL )
   {
      hb_retni( SDL_SetRenderDrawColor( renderer, ( Uint8 ) hb_parni( 2 ), ( Uint8 ) hb_parni( 3 ), ( Uint8 ) hb_parni( 4 ), ( Uint8 ) hb_parni( 5 ) ) );
   }
   else
   {
      HB_ERR_ARGS();
   }
}

// extern DECLSPEC int SDLCALL SDL_GetRenderDrawColor(SDL_Renderer * renderer, Uint8 * r, Uint8 * g, Uint8 * b, Uint8 * a);

// extern DECLSPEC int SDLCALL SDL_SetRenderDrawBlendMode(SDL_Renderer * renderer, SDL_BlendMode blendMode);

// extern DECLSPEC int SDLCALL SDL_GetRenderDrawBlendMode(SDL_Renderer * renderer, SDL_BlendMode *blendMode);

// extern DECLSPEC int SDLCALL SDL_RenderClear(SDL_Renderer * renderer);
HB_FUNC( SDL_RENDERCLEAR )
{
   SDL_Renderer * renderer = hb_renderer_Param( 1 );

   if( renderer )
   {
      hb_retni( SDL_RenderClear( renderer ) );
   }
   else
   {
      HB_ERR_ARGS();
   }
}

// extern DECLSPEC int SDLCALL SDL_RenderDrawPoint(SDL_Renderer * renderer, int x, int y);

// extern DECLSPEC int SDLCALL SDL_RenderDrawPoints(SDL_Renderer * renderer, const SDL_Point * points, int count);

// extern DECLSPEC int SDLCALL SDL_RenderDrawLine(SDL_Renderer * renderer, int x1, int y1, int x2, int y2);

// extern DECLSPEC int SDLCALL SDL_RenderDrawLines(SDL_Renderer * renderer, const SDL_Point * points, int count);

// extern DECLSPEC int SDLCALL SDL_RenderDrawRect(SDL_Renderer * renderer, const SDL_Rect * rect);

// extern DECLSPEC int SDLCALL SDL_RenderDrawRects(SDL_Renderer * renderer, const SDL_Rect * rects, int count);

// extern DECLSPEC int SDLCALL SDL_RenderFillRect(SDL_Renderer * renderer, const SDL_Rect * rect);

// extern DECLSPEC int SDLCALL SDL_RenderFillRects(SDL_Renderer * renderer, const SDL_Rect * rects, int count);

// extern DECLSPEC int SDLCALL SDL_RenderCopy(SDL_Renderer * renderer, SDL_Texture * texture, const SDL_Rect * srcrect, const SDL_Rect * dstrect);
HB_FUNC( SDL_RENDERCOPY )
{
   SDL_Renderer * renderer = hb_renderer_Param( 1 );
   SDL_Texture * texture = hb_texture_Param( 2 );
   PHB_ITEM pItem1, pItem2;

   if( renderer && texture &&
     ( pItem1 = hb_param( 3, HB_IT_ARRAY ) ) != NULL && hb_arrayLen( pItem1 ) == 4 &&
     ( pItem2 = hb_param( 4, HB_IT_ARRAY ) ) != NULL && hb_arrayLen( pItem2 ) == 4 )
   {
      SDL_Rect srcrect;

      srcrect.x = hb_arrayGetNI( pItem1, 1 );
      srcrect.y = hb_arrayGetNI( pItem1, 2 );
      srcrect.w = hb_arrayGetNI( pItem1, 3 );
      srcrect.h = hb_arrayGetNI( pItem1, 4 );

      SDL_Rect dstrect;

      dstrect.x = hb_arrayGetNI( pItem2, 1 );
      dstrect.y = hb_arrayGetNI( pItem2, 2 );
      dstrect.w = hb_arrayGetNI( pItem2, 3 );
      dstrect.h = hb_arrayGetNI( pItem2, 4 );

      hb_retni( SDL_RenderCopy( renderer, texture, &srcrect, &dstrect ) );
   }
   else
   {
      HB_ERR_ARGS();
   }
}

// extern DECLSPEC int SDLCALL SDL_RenderCopyEx(SDL_Renderer * renderer, SDL_Texture * texture, const SDL_Rect * srcrect, const SDL_Rect * dstrect, const double angle, const SDL_Point *center, const SDL_RendererFlip flip);

// extern DECLSPEC int SDLCALL SDL_RenderDrawPointF(SDL_Renderer * renderer, float x, float y);

// extern DECLSPEC int SDLCALL SDL_RenderDrawPointsF(SDL_Renderer * renderer, const SDL_FPoint * points, int count);

// extern DECLSPEC int SDLCALL SDL_RenderDrawLineF(SDL_Renderer * renderer, float x1, float y1, float x2, float y2);

// extern DECLSPEC int SDLCALL SDL_RenderDrawLinesF(SDL_Renderer * renderer, const SDL_FPoint * points, int count);

// extern DECLSPEC int SDLCALL SDL_RenderDrawRectF(SDL_Renderer * renderer, const SDL_FRect * rect);

// extern DECLSPEC int SDLCALL SDL_RenderDrawRectsF(SDL_Renderer * renderer, const SDL_FRect * rects, int count);

// extern DECLSPEC int SDLCALL SDL_RenderFillRectF(SDL_Renderer * renderer, const SDL_FRect * rect);

// extern DECLSPEC int SDLCALL SDL_RenderFillRectsF(SDL_Renderer * renderer, const SDL_FRect * rects, int count);

// extern DECLSPEC int SDLCALL SDL_RenderCopyF(SDL_Renderer * renderer, SDL_Texture * texture, const SDL_Rect * srcrect, const SDL_FRect * dstrect);

// extern DECLSPEC int SDLCALL SDL_RenderCopyExF(SDL_Renderer * renderer, SDL_Texture * texture, const SDL_Rect * srcrect, const SDL_FRect * dstrect, const double angle, const SDL_FPoint *center, const SDL_RendererFlip flip);

// extern DECLSPEC int SDLCALL SDL_RenderGeometry(SDL_Renderer *renderer, SDL_Texture *texture, const SDL_Vertex *vertices, int num_vertices, const int *indices, int num_indices);

// extern DECLSPEC int SDLCALL SDL_RenderGeometryRaw(SDL_Renderer *renderer, SDL_Texture *texture, const float *xy, int xy_stride, const int *color, int color_stride, const float *uv, int uv_stride, int num_vertices, const void *indices, int num_indices, int size_indices);

// extern DECLSPEC int SDLCALL SDL_RenderReadPixels(SDL_Renderer * renderer, const SDL_Rect * rect, Uint32 format, void *pixels, int pitch);

// extern DECLSPEC void SDLCALL SDL_RenderPresent(SDL_Renderer * renderer);
HB_FUNC( SDL_RENDERPRESENT )
{
   SDL_Renderer * renderer = hb_renderer_Param( 1 );

   if( renderer )
   {
      SDL_RenderPresent( renderer );
   }
   else
   {
      HB_ERR_ARGS();
   }
}

// extern DECLSPEC int SDLCALL SDL_RenderFlush(SDL_Renderer * renderer);

// extern DECLSPEC int SDLCALL SDL_GL_BindTexture(SDL_Texture *texture, float *texw, float *texh);

// extern DECLSPEC int SDLCALL SDL_GL_UnbindTexture(SDL_Texture *texture);

// extern DECLSPEC void *SDLCALL SDL_RenderGetMetalLayer(SDL_Renderer * renderer);

// extern DECLSPEC void *SDLCALL SDL_RenderGetMetalCommandEncoder(SDL_Renderer * renderer);

// extern DECLSPEC int SDLCALL SDL_RenderSetVSync(SDL_Renderer* renderer, int vsync);
