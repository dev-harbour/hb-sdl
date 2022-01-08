/*
 * SDL library: SDL_video.c
 * version 2.0.16
 *
 * Copyright 2021 Rafał Jopek ( rafaljopek at hotmail com )
 *
 */

#include "hbsdl.h"

/* =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= */
/* SDL_Window */
static HB_GARBAGE_FUNC( hb_window_destructor )
{
   SDL_Window ** ppSDL_Window = ( SDL_Window ** ) Cargo;

   if( *ppSDL_Window )
   {
      SDL_Window * pSDL_Window = * ppSDL_Window;
      *ppSDL_Window = NULL;
      SDL_DestroyWindow( pSDL_Window );
   }
}

static const HB_GC_FUNCS s_gcWindowFuncs =
{
   hb_window_destructor,
   hb_gcDummyMark
};

SDL_Window * hb_window_Param( int iParam )
{
   SDL_Window ** ppSDL_Window = ( SDL_Window ** ) hb_parptrGC( &s_gcWindowFuncs, iParam );

   if( ppSDL_Window && *ppSDL_Window )
   {
      return *ppSDL_Window;
   }
   else
   {
      HB_ERR_ARGS();
      return NULL;
   }
}

PHB_ITEM hb_window_ItemPut( PHB_ITEM pItem, SDL_Window * pSDL_Window )
{
   SDL_Window ** ppSDL_Window = ( SDL_Window ** ) hb_gcAllocate( sizeof( SDL_Window * ), &s_gcWindowFuncs );
   *ppSDL_Window = pSDL_Window;
   return hb_itemPutPtrGC( pItem, ppSDL_Window );
}

void hb_window_Return( SDL_Window * pSDL_Window )
{
   if( pSDL_Window )
   {
      hb_window_ItemPut( hb_param( -1, HB_IT_ANY ), pSDL_Window );
   }
   else
   {
      hb_ret();
   }
}

// extern DECLSPEC void SDLCALL SDL_DestroyWindow(SDL_Window * window);
HB_FUNC( SDL_DESTROYWINDOW )
{
   SDL_Window ** ppSDL_Window = ( SDL_Window ** ) hb_parptrGC( &s_gcWindowFuncs, 1 );

   if( ppSDL_Window && *ppSDL_Window )
   {
      SDL_Window * pSDL_Window = * ppSDL_Window;
      *ppSDL_Window = NULL;
      SDL_DestroyWindow( pSDL_Window );
   }
   else
   {
      HB_ERR_ARGS();
   }
}

/* =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= */

// extern DECLSPEC int SDLCALL SDL_GetNumVideoDrivers(void);
HB_FUNC( SDL_GETNUMVIDEODRIVERS )
{
   hb_retni( SDL_GetNumVideoDrivers() );
}

// extern DECLSPEC const char *SDLCALL SDL_GetVideoDriver(int index);
HB_FUNC( SDL_GETVIDEODRIVER )
{
   if( hb_param( 1, HB_IT_INTEGER ) != NULL )
   {
      hb_retc( SDL_GetVideoDriver( hb_parni( 1 ) ) );
   }
   else
   {
      HB_ERR_ARGS();
   }
}

// extern DECLSPEC int SDLCALL SDL_VideoInit(const char *driver_name);
HB_FUNC( SDL_VIDEOINIT )
{
   if( hb_param( 1, HB_IT_STRING ) != NULL )
   {
      hb_retni( SDL_VideoInit( hb_parc( 1 ) ) );
   }
   else
   {
      HB_ERR_ARGS();
   }
}

// extern DECLSPEC void SDLCALL SDL_VideoQuit(void);
HB_FUNC( SDL_VIDEOQUIT )
{
   SDL_VideoQuit();
}

// extern DECLSPEC const char *SDLCALL SDL_GetCurrentVideoDriver(void);
HB_FUNC( SDL_GETCURRENTVIDEODRIVER )
{
   hb_retc( SDL_GetCurrentVideoDriver() );
}

// extern DECLSPEC int SDLCALL SDL_GetNumVideoDisplays(void);
HB_FUNC( SDL_GETNUMVIDEODISPLAYS )
{
   hb_retni( SDL_GetNumVideoDisplays() );
}

// extern DECLSPEC const char * SDLCALL SDL_GetDisplayName(int displayIndex);
HB_FUNC( SDL_GETDISPLAYNAME )
{
   if( hb_param( 1, HB_IT_INTEGER ) != NULL )
   {
      hb_retc( SDL_GetDisplayName( hb_parni( 1 ) ) );
   }
   else
   {
      HB_ERR_ARGS();
   }
}

// extern DECLSPEC int SDLCALL SDL_GetDisplayBounds(int displayIndex, SDL_Rect * rect);
HB_FUNC( SDL_GETDISPLAYBOUNDS )
{
   PHB_ITEM pItem;

   if( hb_param( 1, HB_IT_INTEGER ) != NULL && ( pItem = hb_param( 1, HB_IT_ARRAY ) ) != NULL && hb_arrayLen( pItem ) == 4 )
   {
      SDL_Rect rect;

      rect.x = hb_arrayGetNI( pItem, 1 );
      rect.y = hb_arrayGetNI( pItem, 2 );
      rect.w = hb_arrayGetNI( pItem, 3 );
      rect.h = hb_arrayGetNI( pItem, 4 );

      hb_retni( SDL_GetDisplayBounds( hb_parni( 1 ), &rect ) );
   }
   else
   {
      HB_ERR_ARGS();
   }
}

// extern DECLSPEC int SDLCALL SDL_GetDisplayUsableBounds(int displayIndex, SDL_Rect * rect);
HB_FUNC( SDL_GETDISPLAYUSABLEBOUNDS )
{
   PHB_ITEM pItem;

   if( hb_param( 1, HB_IT_INTEGER ) != NULL && ( pItem = hb_param( 1, HB_IT_ARRAY ) ) != NULL && hb_arrayLen( pItem ) == 4 )
   {
      SDL_Rect rect;

      rect.x = hb_arrayGetNI( pItem, 1 );
      rect.y = hb_arrayGetNI( pItem, 2 );
      rect.w = hb_arrayGetNI( pItem, 3 );
      rect.h = hb_arrayGetNI( pItem, 4 );

      hb_retni( SDL_GetDisplayUsableBounds( hb_parni( 1 ), &rect ) );
   }
   else
   {
      HB_ERR_ARGS();
   }
}

// extern DECLSPEC int SDLCALL SDL_GetDisplayDPI(int displayIndex, float * ddpi, float * hdpi, float * vdpi);

// extern DECLSPEC SDL_DisplayOrientation SDLCALL SDL_GetDisplayOrientation(int displayIndex);

// extern DECLSPEC int SDLCALL SDL_GetNumDisplayModes(int displayIndex);
HB_FUNC( SDL_GETNUMDISPLAYMODES )
{
   if( hb_param( 1, HB_IT_INTEGER ) != NULL )
   {
      hb_retni( SDL_GetNumDisplayModes( hb_parni( 1 ) ) );
   }
   else
   {
      HB_ERR_ARGS();
   }
}

// extern DECLSPEC int SDLCALL SDL_GetDisplayMode(int displayIndex, int modeIndex, SDL_DisplayMode * mode);
HB_FUNC( SDL_GETDISPLAYMODE )
{
   PHB_ITEM pItem;

   if(         hb_param( 1, HB_IT_INTEGER ) != NULL &&
               hb_param( 2, HB_IT_INTEGER ) != NULL &&
     ( pItem = hb_param( 3, HB_IT_ARRAY ) ) != NULL && hb_arrayLen( pItem ) == 5 )
   {
      SDL_DisplayMode mode;

      mode.format       = ( Uint32 ) hb_arrayGetNI( pItem, 1 );
      mode.w            =            hb_arrayGetNI( pItem, 2 );
      mode.h            =            hb_arrayGetNI( pItem, 3 );
      mode.refresh_rate =            hb_arrayGetNI( pItem, 4 );
      mode.driverdata   =            hb_arrayGetPtr( pItem, 5 );

      hb_retni( SDL_GetDisplayMode( hb_parni( 1 ), hb_parni( 2 ), &mode ) );
   }
   else
   {
      HB_ERR_ARGS();
   }
}

// extern DECLSPEC int SDLCALL SDL_GetDesktopDisplayMode(int displayIndex, SDL_DisplayMode * mode);
HB_FUNC( SDL_GETDESKTOPDISPLAYMODE )
{
   PHB_ITEM pItem;

   if(         hb_param( 1, HB_IT_INTEGER ) != NULL &&
     ( pItem = hb_param( 2, HB_IT_ARRAY ) ) != NULL && hb_arrayLen( pItem ) == 5 )
   {
      SDL_DisplayMode mode;

      mode.format       = ( Uint32 ) hb_arrayGetNI( pItem, 1 );
      mode.w            =            hb_arrayGetNI( pItem, 2 );
      mode.h            =            hb_arrayGetNI( pItem, 3 );
      mode.refresh_rate =            hb_arrayGetNI( pItem, 4 );
      mode.driverdata   =            hb_arrayGetPtr( pItem, 5 );

      hb_retni( SDL_GetDesktopDisplayMode( hb_parni( 1 ), &mode ) );
   }
   else
   {
      HB_ERR_ARGS();
   }
}

// extern DECLSPEC int SDLCALL SDL_GetCurrentDisplayMode(int displayIndex, SDL_DisplayMode * mode);
HB_FUNC( SDL_GETCURRENTDISPLAYMODE )
{
   PHB_ITEM pItem;

   if(         hb_param( 1, HB_IT_INTEGER ) != NULL &&
     ( pItem = hb_param( 2, HB_IT_ARRAY ) ) != NULL && hb_arrayLen( pItem ) == 5 )
   {
      SDL_DisplayMode mode;

      mode.format       = ( Uint32 ) hb_arrayGetNI( pItem, 1 );
      mode.w            =            hb_arrayGetNI( pItem, 2 );
      mode.h            =            hb_arrayGetNI( pItem, 3 );
      mode.refresh_rate =            hb_arrayGetNI( pItem, 4 );
      mode.driverdata   =            hb_arrayGetPtr( pItem, 5 );

      hb_retni( SDL_GetCurrentDisplayMode( hb_parni( 1 ), &mode ) );
   }
   else
   {
      HB_ERR_ARGS();
   }
}

// extern DECLSPEC SDL_DisplayMode * SDLCALL SDL_GetClosestDisplayMode(int displayIndex, const SDL_DisplayMode * mode, SDL_DisplayMode * closest);

// extern DECLSPEC int SDLCALL SDL_GetWindowDisplayIndex(SDL_Window * window);
HB_FUNC( SDL_GETWINDOWDISPLAYINDEX )
{
   SDL_Window * window = hb_window_Param( 1 );

   if( window )
   {
      hb_retni( SDL_GetWindowDisplayIndex( window ) );
   }
   else
   {
      HB_ERR_ARGS();
   }
}

// extern DECLSPEC int SDLCALL SDL_SetWindowDisplayMode(SDL_Window * window, const SDL_DisplayMode * mode);
HB_FUNC( SDL_SETWINDOWDISPLAYMODE )
{
   SDL_Window * window = hb_window_Param( 1 );
   PHB_ITEM pItem;

   if( window && ( pItem = hb_param( 2, HB_IT_ARRAY ) ) != NULL && hb_arrayLen( pItem ) == 5 )
   {
      SDL_DisplayMode mode;

      mode.format       = ( Uint32 ) hb_arrayGetNI( pItem, 1 );
      mode.w            =            hb_arrayGetNI( pItem, 2 );
      mode.h            =            hb_arrayGetNI( pItem, 3 );
      mode.refresh_rate =            hb_arrayGetNI( pItem, 4 );
      mode.driverdata   =            hb_arrayGetPtr( pItem, 5 );

      hb_retni( SDL_SetWindowDisplayMode( window, &mode ) );
   }
   else
   {
      HB_ERR_ARGS();
   }
}

// extern DECLSPEC int SDLCALL SDL_GetWindowDisplayMode(SDL_Window * window, SDL_DisplayMode * mode);
HB_FUNC( SDL_GETWINDOWDISPLAYMODE )
{
   SDL_Window * window = hb_window_Param( 1 );
   PHB_ITEM pItem;

   if( window && ( pItem = hb_param( 2, HB_IT_ARRAY ) ) != NULL && hb_arrayLen( pItem ) == 5 )
   {
      SDL_DisplayMode mode;

      mode.format       = ( Uint32 ) hb_arrayGetNI( pItem, 1 );
      mode.w            =            hb_arrayGetNI( pItem, 2 );
      mode.h            =            hb_arrayGetNI( pItem, 3 );
      mode.refresh_rate =            hb_arrayGetNI( pItem, 4 );
      mode.driverdata   =            hb_arrayGetPtr( pItem, 5 );

      hb_retni( SDL_GetWindowDisplayMode( window, &mode ) );
   }
   else
   {
      HB_ERR_ARGS();
   }
}

// extern DECLSPEC void* SDLCALL SDL_GetWindowICCProfile(SDL_Window * window, size_t* size);

// extern DECLSPEC Uint32 SDLCALL SDL_GetWindowPixelFormat(SDL_Window * window);
HB_FUNC( SDL_GETWINDOWPIXELFORMAT )
{
   SDL_Window * window = hb_window_Param( 1 );

   if( window )
   {
      hb_retni( ( Uint32 ) SDL_GetWindowPixelFormat( window ) );
   }
   else
   {
      HB_ERR_ARGS();
   }
}

// extern DECLSPEC SDL_Window * SDLCALL SDL_CreateWindow(const char *title, int x, int y, int w, int h, Uint32 flags);
HB_FUNC( SDL_CREATEWINDOW )
{
   if( hb_param( 1, HB_IT_STRING ) != NULL &&
       hb_param( 2, HB_IT_INTEGER ) != NULL &&
       hb_param( 3, HB_IT_INTEGER ) != NULL &&
       hb_param( 4, HB_IT_INTEGER ) != NULL &&
       hb_param( 5, HB_IT_INTEGER ) != NULL &&
       hb_param( 6, HB_IT_INTEGER ) != NULL )
   {
      hb_window_Return( SDL_CreateWindow( hb_parc( 1 ), hb_parni( 2 ), hb_parni( 3 ), hb_parni( 4 ), hb_parni( 5 ), ( Uint32 ) hb_parni( 6 ) ) );
   }
   else
   {
      HB_ERR_ARGS();
   }
}

// extern DECLSPEC SDL_Window * SDLCALL SDL_CreateWindowFrom(const void *data);

// extern DECLSPEC Uint32 SDLCALL SDL_GetWindowID(SDL_Window * window);
HB_FUNC( SDL_GETWINDOWID )
{
   SDL_Window * window = hb_window_Param( 1 );

   if( window )
   {
      hb_retni( ( Uint32 ) SDL_GetWindowID( window ) );
   }
   else
   {
      HB_ERR_ARGS();
   }
}

// extern DECLSPEC SDL_Window * SDLCALL SDL_GetWindowFromID(Uint32 id);
HB_FUNC( SDL_GETWINDOWFROMID )
{
   if( hb_param( 1, HB_IT_INTEGER ) != NULL )
   {
      hb_window_Return( SDL_GetWindowFromID( ( Uint32 ) hb_parni( 1 ) ) );
   }
   else
   {
      HB_ERR_ARGS();
   }
}

// extern DECLSPEC Uint32 SDLCALL SDL_GetWindowFlags(SDL_Window * window);
HB_FUNC( SDL_GETWINDOWFLAGS )
{
   SDL_Window * window = hb_window_Param( 1 );

   if( window )
   {
      hb_retni( ( Uint32 ) SDL_GetWindowFlags( window ) );
   }
   else
   {
      HB_ERR_ARGS();
   }
}

// extern DECLSPEC void SDLCALL SDL_SetWindowTitle(SDL_Window * window, const char *title);
HB_FUNC( SDL_SETWINDOWTITLE )
{
   SDL_Window * window = hb_window_Param( 1 );

   if( window && hb_param( 2, HB_IT_STRING ) != NULL )
   {
      SDL_SetWindowTitle( window, hb_parc( 2 ) );
   }
   else
   {
      HB_ERR_ARGS();
   }
}

// extern DECLSPEC const char *SDLCALL SDL_GetWindowTitle(SDL_Window * window);

// extern DECLSPEC void SDLCALL SDL_SetWindowIcon(SDL_Window * window, SDL_Surface * icon);

// extern DECLSPEC void* SDLCALL SDL_SetWindowData(SDL_Window * window, const char *name, void *userdata);

// extern DECLSPEC void *SDLCALL SDL_GetWindowData(SDL_Window * window, const char *name);

// extern DECLSPEC void SDLCALL SDL_SetWindowPosition(SDL_Window * window, int x, int y);

// extern DECLSPEC void SDLCALL SDL_GetWindowPosition(SDL_Window * window, int *x, int *y);

// extern DECLSPEC void SDLCALL SDL_SetWindowSize(SDL_Window * window, int w, int h);

// extern DECLSPEC void SDLCALL SDL_GetWindowSize(SDL_Window * window, int *w, int *h);

// extern DECLSPEC int SDLCALL SDL_GetWindowBordersSize(SDL_Window * window, int *top, int *left, int *bottom, int *right);

// extern DECLSPEC void SDLCALL SDL_SetWindowMinimumSize(SDL_Window * window, int min_w, int min_h);

// extern DECLSPEC void SDLCALL SDL_GetWindowMinimumSize(SDL_Window * window, int *w, int *h);

// extern DECLSPEC void SDLCALL SDL_SetWindowMaximumSize(SDL_Window * window, int max_w, int max_h);

// extern DECLSPEC void SDLCALL SDL_GetWindowMaximumSize(SDL_Window * window, int *w, int *h);

// extern DECLSPEC void SDLCALL SDL_SetWindowBordered(SDL_Window * window, SDL_bool bordered);

// extern DECLSPEC void SDLCALL SDL_SetWindowResizable(SDL_Window * window, SDL_bool resizable);

// extern DECLSPEC void SDLCALL SDL_SetWindowAlwaysOnTop(SDL_Window * window, SDL_bool on_top);

// extern DECLSPEC void SDLCALL SDL_ShowWindow(SDL_Window * window);

// extern DECLSPEC void SDLCALL SDL_HideWindow(SDL_Window * window);

// extern DECLSPEC void SDLCALL SDL_RaiseWindow(SDL_Window * window);

// extern DECLSPEC void SDLCALL SDL_MaximizeWindow(SDL_Window * window);

// extern DECLSPEC void SDLCALL SDL_MinimizeWindow(SDL_Window * window);

// extern DECLSPEC void SDLCALL SDL_RestoreWindow(SDL_Window * window);

// extern DECLSPEC int SDLCALL SDL_SetWindowFullscreen(SDL_Window * window, Uint32 flags);

// extern DECLSPEC SDL_Surface * SDLCALL SDL_GetWindowSurface(SDL_Window * window);

// extern DECLSPEC int SDLCALL SDL_UpdateWindowSurface(SDL_Window * window);

// extern DECLSPEC int SDLCALL SDL_UpdateWindowSurfaceRects(SDL_Window * window, const SDL_Rect * rects, int numrects);

// extern DECLSPEC void SDLCALL SDL_SetWindowGrab(SDL_Window * window, SDL_bool grabbed);

// extern DECLSPEC void SDLCALL SDL_SetWindowKeyboardGrab(SDL_Window * window, SDL_bool grabbed);

// extern DECLSPEC void SDLCALL SDL_SetWindowMouseGrab(SDL_Window * window, SDL_bool grabbed);

// extern DECLSPEC SDL_bool SDLCALL SDL_GetWindowGrab(SDL_Window * window);

// extern DECLSPEC SDL_bool SDLCALL SDL_GetWindowKeyboardGrab(SDL_Window * window);

// extern DECLSPEC SDL_bool SDLCALL SDL_GetWindowMouseGrab(SDL_Window * window);

// extern DECLSPEC SDL_Window * SDLCALL SDL_GetGrabbedWindow(void);

// extern DECLSPEC int SDLCALL SDL_SetWindowBrightness(SDL_Window * window, float brightness);

// extern DECLSPEC float SDLCALL SDL_GetWindowBrightness(SDL_Window * window);

// extern DECLSPEC int SDLCALL SDL_SetWindowOpacity(SDL_Window * window, float opacity);

// extern DECLSPEC int SDLCALL SDL_GetWindowOpacity(SDL_Window * window, float * out_opacity);

// extern DECLSPEC int SDLCALL SDL_SetWindowModalFor(SDL_Window * modal_window, SDL_Window * parent_window);

// extern DECLSPEC int SDLCALL SDL_SetWindowInputFocus(SDL_Window * window);

// extern DECLSPEC int SDLCALL SDL_SetWindowGammaRamp(SDL_Window * window, const Uint16 * red, const Uint16 * green, const Uint16 * blue);

// extern DECLSPEC int SDLCALL SDL_GetWindowGammaRamp(SDL_Window * window, Uint16 * red, Uint16 * green, Uint16 * blue);

// typedef SDL_HitTestResult (SDLCALL *SDL_HitTest)(SDL_Window *win, const SDL_Point *area, void *data);

// extern DECLSPEC int SDLCALL SDL_SetWindowHitTest(SDL_Window * window, SDL_HitTest callback, void *callback_data);

// extern DECLSPEC int SDLCALL SDL_FlashWindow(SDL_Window * window, SDL_FlashOperation operation);

// extern DECLSPEC SDL_bool SDLCALL SDL_IsScreenSaverEnabled(void);

// extern DECLSPEC void SDLCALL SDL_EnableScreenSaver(void);

// extern DECLSPEC void SDLCALL SDL_DisableScreenSaver(void);

// extern DECLSPEC int SDLCALL SDL_GL_LoadLibrary(const char *path);

// extern DECLSPEC void *SDLCALL SDL_GL_GetProcAddress(const char *proc);

// extern DECLSPEC void SDLCALL SDL_GL_UnloadLibrary(void);

// extern DECLSPEC SDL_bool SDLCALL SDL_GL_ExtensionSupported(const char *extension);

// extern DECLSPEC void SDLCALL SDL_GL_ResetAttributes(void);

// extern DECLSPEC int SDLCALL SDL_GL_SetAttribute(SDL_GLattr attr, int value);

// extern DECLSPEC int SDLCALL SDL_GL_GetAttribute(SDL_GLattr attr, int *value);

// extern DECLSPEC SDL_GLContext SDLCALL SDL_GL_CreateContext(SDL_Window * window);

// extern DECLSPEC int SDLCALL SDL_GL_MakeCurrent(SDL_Window * window, SDL_GLContext context);

// extern DECLSPEC SDL_Window* SDLCALL SDL_GL_GetCurrentWindow(void);

// extern DECLSPEC SDL_GLContext SDLCALL SDL_GL_GetCurrentContext(void);

// extern DECLSPEC void SDLCALL SDL_GL_GetDrawableSize(SDL_Window * window, int *w, int *h);

// extern DECLSPEC int SDLCALL SDL_GL_SetSwapInterval(int interval);

// extern DECLSPEC int SDLCALL SDL_GL_GetSwapInterval(void);

// extern DECLSPEC void SDLCALL SDL_GL_SwapWindow(SDL_Window * window);

// extern DECLSPEC void SDLCALL SDL_GL_DeleteContext(SDL_GLContext context);
