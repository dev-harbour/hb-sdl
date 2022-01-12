#ifndef HB_SDL_H_
#define HB_SDL_H_

#include "hbapi.h"
#include "hbapierr.h"
#include "hbapiitm.h"
#include "hbstack.h"

#include <SDL2/SDL.h>

typedef enum
{
   EVENT_KEY_TYPE = 1,
   EVENT_KEY_TIMESTAMP,
   EVENT_KEY_WINDOWID,
   EVENT_KEY_STATE,
   EVENT_KEY_REPEAT,
   EVENT_KEY_PADDING2,
   EVENT_KEY_PADDING3,
   EVENT_KEY_KEYSYM_SCANCODE,
   EVENT_KEY_KEYSYM_SYM,
   EVENT_KEY_KEYSYM_MOD,
   EVENT_KEY_KEYSYM_UNUSED
} KeyboardEvent;

HB_EXTERN_BEGIN

/* SDL_Renderer */
extern HB_EXPORT SDL_Renderer * hb_renderer_Param( int iParam );
extern HB_EXPORT PHB_ITEM       hb_renderer_ItemPut( PHB_ITEM pItem, SDL_Renderer * pSDL_Renderer );
extern HB_EXPORT void           hb_renderer_Return( SDL_Renderer * );

/* SDL_Surface */
extern HB_EXPORT SDL_Surface * hb_surface_Param( int iParam );
extern HB_EXPORT PHB_ITEM      hb_surface_ItemPut( PHB_ITEM pItem, SDL_Surface * pSDL_Renderer );
extern HB_EXPORT void          hb_surface_Return( SDL_Surface * );

/* SDL_Texture */
extern HB_EXPORT SDL_Texture * hb_texture_Param( int iParam );
extern HB_EXPORT PHB_ITEM      hb_texture_ItemPut( PHB_ITEM pItem, SDL_Texture * pSDL_Texture );
extern HB_EXPORT void          hb_texture_Return( SDL_Texture * );

/* SDL_Window */
extern HB_EXPORT SDL_Window * hb_window_Param( int iParam );
extern HB_EXPORT PHB_ITEM     hb_window_ItemPut( PHB_ITEM pItem, SDL_Window * pSDL_Window );
extern HB_EXPORT void         hb_window_Return( SDL_Window * );

HB_EXTERN_END

#define UNUSED( x ) ( ( void ) ( x ) )
#define HB_ERR_ARGS() ( hb_errRT_BASE_SubstR( EG_ARG, 3012, NULL, HB_ERR_FUNCNAME, HB_ERR_ARGS_BASEPARAMS ) )

#endif /* HB_SDL_H_ */
