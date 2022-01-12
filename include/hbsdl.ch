
#ifndef HBSDL_CH_
#define HBSDL_CH_

/* SDL.h */
#define SDL_INIT_TIMER          0x00000001
#define SDL_INIT_AUDIO          0x00000010
#define SDL_INIT_VIDEO          0x00000020
#define SDL_INIT_JOYSTICK       0x00000200
#define SDL_INIT_HAPTIC         0x00001000
#define SDL_INIT_GAMECONTROLLER 0x00002000
#define SDL_INIT_EVENTS         0x00004000
#define SDL_INIT_SENSOR         0x00008000
#define SDL_INIT_NOPARACHUTE    0x00100000
#define SDL_INIT_EVERYTHING     hb_BitOr( SDL_INIT_TIMER, SDL_INIT_AUDIO, SDL_INIT_VIDEO, SDL_INIT_EVENTS, SDL_INIT_JOYSTICK, SDL_INIT_HAPTIC, SDL_INIT_GAMECONTROLLER, SDL_INIT_SENSOR )
/* End SDL.h */

/* SDL_audio.h */
#define SDL_AUDIO_MASK_BITSIZE              (0xFF)
#define SDL_AUDIO_MASK_DATATYPE             (0x100)
#define SDL_AUDIO_MASK_ENDIAN               (40000)
#define SDL_AUDIO_MASK_SIGNED               (200000)
#define SDL_AUDIO_BITSIZE(x)                (x .AND. SDL_AUDIO_MASK_BITSIZE)
#define SDL_AUDIO_ISFLOAT(x)                (x .AND. SDL_AUDIO_MASK_DATATYPE)
#define SDL_AUDIO_ISBIGENDIAN(x)            (x .AND. SDL_AUDIO_MASK_ENDIAN)
#define SDL_AUDIO_ISSIGNED(x)               (x .AND. SDL_AUDIO_MASK_SIGNED)
#define SDL_AUDIO_ISINT(x)                  (!SDL_AUDIO_ISFLOAT(x))
#define SDL_AUDIO_ISLITTLEENDIAN(x)         (!SDL_AUDIO_ISBIGENDIAN(x))
#define SDL_AUDIO_ISUNSIGNED(x)             (!SDL_AUDIO_ISSIGNED(x))

#define SDL_AUDIO_STOPPED                   0
#define SDL_AUDIO_PLAYING                   1
#define SDL_AUDIO_PAUSED                    2

#define AUDIO_U8                            0x0008   /**< Unsigned 8-bit samples */
#define AUDIO_S8                            0x8008   /**< Signed 8-bit samples */
#define AUDIO_U16LSB                        0x0010   /**< Unsigned 16-bit samples */
#define AUDIO_S16LSB                        0x8010   /**< Signed 16-bit samples */
#define AUDIO_U16MSB                        0x1010   /**< As above, but big-endian byte order */
#define AUDIO_S16MSB                        0x9010   /**< As above, but big-endian byte order */
#define AUDIO_U16                           AUDIO_U16LSB
#define AUDIO_S16                           AUDIO_S16LSB

#define AUDIO_S32LSB                        0x8020   /**< 32-bit integer samples */
#define AUDIO_S32MSB                        0x9020   /**< As above, but big-endian byte order */
#define AUDIO_S32                           AUDIO_S32LSB

#define AUDIO_F32LSB                        0x8120   /**< 32-bit floating point samples */
#define AUDIO_F32MSB                        0x9120   /**< As above, but big-endian byte order */
#define AUDIO_F32                           AUDIO_F32LSB

// #if SDL_BYTEORDER == SDL_LIL_ENDIAN
// #define AUDIO_U16SYS                        AUDIO_U16LSB
// #define AUDIO_S16SYS                        AUDIO_S16LSB
// #define AUDIO_S32SYS                        AUDIO_S32LSB
// #define AUDIO_F32SYS                        AUDIO_F32LSB
// #else
// #define AUDIO_U16SYS                        AUDIO_U16MSB
// #define AUDIO_S16SYS                        AUDIO_S16MSB
// #define AUDIO_S32SYS                        AUDIO_S32MSB
// #define AUDIO_F32SYS                        AUDIO_F32MSB
// #endif

#define SDL_AUDIO_ALLOW_FREQUENCY_CHANGE    0x00000001
#define SDL_AUDIO_ALLOW_FORMAT_CHANGE       0x00000002
#define SDL_AUDIO_ALLOW_CHANNELS_CHANGE     0x00000004
#define SDL_AUDIO_ALLOW_SAMPLES_CHANGE      0x00000008
#define SDL_AUDIO_ALLOW_ANY_CHANGE          hb_BitOr( SDL_AUDIO_ALLOW_FREQUENCY_CHANGE, SDL_AUDIO_ALLOW_FORMAT_CHANGE, SDL_AUDIO_ALLOW_CHANNELS_CHANGE, SDL_AUDIO_ALLOW_SAMPLES_CHANGE )

#define SDL_AUDIOCVT_MAX_FILTERS            9

// #define SDL_LoadWAV(file, spec, audio_buf, audio_len)  SDL_LoadWAV_RW(SDL_RWFromFile(file, "rb"),1, spec,audio_buf,audio_len)

#define SDL_MIX_MAXVOLUME 128
/* End SDL.h */

/* SDL_error.h */
#define SDL_OutOfMemory()       SDL_Error(SDL_ENOMEM)
#define SDL_Unsupported()       SDL_Error(SDL_UNSUPPORTED)
// #define SDL_InvalidParamError(param) SDL_SetError("Parameter '%s' is invalid", (param))

#define SDL_ENOMEM      0
#define SDL_EFREAD      1
#define SDL_EFWRITE     2
#define SDL_EFSEEK      3
#define SDL_UNSUPPORTED 4
#define SDL_LASTERROR   5
/* End SDL_error.h */

/* SDL_events.h */
#define SDL_RELEASED 0
#define SDL_PRESSED  1

#define SDL_TEXTEDITINGEVENT_TEXT_SIZE (32)
#define SDL_TEXTINPUTEVENT_TEXT_SIZE (32)

#define SDL_QUERY   -1
#define SDL_IGNORE   0
#define SDL_DISABLE  0
#define SDL_ENABLE   1

// #define SDL_GetEventState(type) SDL_EventState(type, SDL_QUERY)

#define SDL_FIRSTEVENT               0       /**< Unused (do not remove) */
#define SDL_QUIT                     0x100   /**< User-requested quit */
#define SDL_APP_TERMINATING          0x101   /**< The application is being terminated by the OS Called on iOS in applicationWillTerminate() Called on Android in onDestroy() */
#define SDL_APP_LOWMEMORY            0x102   /**< The application is low on memory, free memory if possible. Called on iOS in applicationDidReceiveMemoryWarning() Called on Android in onLowMemory() */
#define SDL_APP_WILLENTERBACKGROUND  0x103   /**< The application is about to enter the background Called on iOS in applicationWillResignActive() Called on Android in onPause() */
#define SDL_APP_DIDENTERBACKGROUND   0x104   /**< The application did enter the background and may not get CPU for some time Called on iOS in applicationDidEnterBackground() Called on Android in onPause() */
#define SDL_APP_WILLENTERFOREGROUND  0x105   /**< The application is about to enter the foreground Called on iOS in applicationWillEnterForeground() Called on Android in onResume() */
#define SDL_APP_DIDENTERFOREGROUND   0x106   /**< The application is now interactive Called on iOS in applicationDidBecomeActive() Called on Android in onResume() */
#define SDL_LOCALECHANGED            0x107   /**< The user's locale preferences have changed. */
#define SDL_DISPLAYEVENT             0x150   /**< Display state change */
#define SDL_WINDOWEVENT              0x200   /**< Window state change */
#define SDL_SYSWMEVENT               0x200   /**< System specific event */
#define SDL_KEYDOWN                  0x300   /**< Key pressed */
#define SDL_KEYUP                    0x301   /**< Key released */
#define SDL_TEXTEDITING              0x302   /**< Keyboard text editing (composition) */
#define SDL_TEXTINPUT                0x303   /**< Keyboard text input */
#define SDL_KEYMAPCHANGED            0x304   /**< Keymap changed due to a system event such as an input language or keyboard layout change. */
#define SDL_MOUSEMOTION              0x400   /**< Mouse moved */
#define SDL_MOUSEBUTTONDOWN          0x401   /**< Mouse button pressed */
#define SDL_MOUSEBUTTONUP            0x402   /**< Mouse button released */
#define SDL_MOUSEWHEEL               0x403   /**< Mouse wheel motion */
#define SDL_JOYAXISMOTION            0x600   /**< Joystick axis motion */
#define SDL_JOYBALLMOTION            0x601   /**< Joystick trackball motion */
#define SDL_JOYHATMOTION             0x602   /**< Joystick hat position change */
#define SDL_JOYBUTTONDOWN            0x603   /**< Joystick button pressed */
#define SDL_JOYBUTTONUP              0x604   /**< Joystick button released */
#define SDL_JOYDEVICEADDED           0x605   /**< A new joystick has been inserted into the system */
#define SDL_JOYDEVICEREMOVED         0x606   /**< An opened joystick has been removed */
#define SDL_CONTROLLERAXISMOTION     0x650   /**< Game controller axis motion */
#define SDL_CONTROLLERBUTTONDOWN     0x651   /**< Game controller button pressed */
#define SDL_CONTROLLERBUTTONUP       0x652   /**< Game controller button released */
#define SDL_CONTROLLERDEVICEADDED    0x653   /**< A new Game controller has been inserted into the system */
#define SDL_CONTROLLERDEVICEREMOVED  0x654   /**< An opened Game controller has been removed */
#define SDL_CONTROLLERDEVICEREMAPPED 0x655   /**< The controller mapping was updated */
#define SDL_CONTROLLERTOUCHPADDOWN   0x656   /**< Game controller touchpad was touched */
#define SDL_CONTROLLERTOUCHPADMOTION 0x657   /**< Game controller touchpad finger was moved */
#define SDL_CONTROLLERTOUCHPADUP     0x658   /**< Game controller touchpad finger was lifted */
#define SDL_CONTROLLERSENSORUPDATE   0x659   /**< Game controller sensor was updated */
#define SDL_FINGERDOWN               0x700
#define SDL_FINGERUP                 0x701
#define SDL_FINGERMOTION             0x702
#define SDL_DOLLARGESTURE            0x800
#define SDL_DOLLARRECORD             0x801
#define SDL_MULTIGESTURE             0x802
#define SDL_CLIPBOARDUPDATE          0x900   /**< The clipboard changed */
#define SDL_DROPFILE                 0x1000  /**< The system requests a file open */
#define SDL_DROPTEXT                 0x1001  /**< text/plain drag-and-drop event */
#define SDL_DROPBEGIN                0x1002  /**< A new set of drops is beginning (NULL filename) */
#define SDL_DROPCOMPLETE             0x1003  /**< Current set of drops is now complete (NULL filename) */
#define SDL_AUDIODEVICEADDED         0x1100  /**< A new audio device is available */
#define SDL_AUDIODEVICEREMOVED       0x1101  /**< An audio device has been removed. */
#define SDL_SENSORUPDATE             0x1200  /**< A sensor was updated */
#define SDL_RENDER_TARGETS_RESET     0x2000  /**< The render targets have been reset and their contents need to be updated */
#define SDL_RENDER_DEVICE_RESET      0x2000  /**< The device has been reset and all textures need to be recreated */
#define SDL_POLLSENTINEL             0x7F00  /**< Signals the end of an event poll cycle */
#define SDL_USEREVENT                0x8000
#define SDL_LASTEVENT                0xFFFF

#define SDL_ADDEVENT  0
#define SDL_PEEKEVENT 1
#define SDL_GETEVENT  2

#define TYPE      1    /**< Event type, shared with all events */
#define COMMON    2    /**< Common event data */
#define DISPLAY   3    /**< Display event data */
#define WINDOW    4    /**< Window event data */
#define KEY       5    /**< Keyboard event data */
#define EDIT      6    /**< Text editing event data */
#define TEXT      7    /**< Text input event data */
#define MOTION    8    /**< Mouse motion event data */
#define BUTTON    9    /**< Mouse button event data */
#define WHEEL     10   /**< Mouse wheel event data */
#define JAXIS     11   /**< Joystick axis event data */
#define JBALL     12   /**< Joystick ball event data */
#define JHAT      13   /**< Joystick hat event data */
#define JBUTTON   14   /**< Joystick button event data */
#define JDEVICE   15   /**< Joystick device change event data */
#define CAXIS     16   /**< Game Controller axis event data */
#define CBUTTON   17   /**< Game Controller button event data */
#define CDEVICE   18   /**< Game Controller device event data */
#define CTOUCHPAD 19   /**< Game Controller touchpad event data */
#define CSENSOR   20   /**< Game Controller sensor event data */
#define ADEVICE   21   /**< Audio device event data */
#define SENSOR    22   /**< Sensor event data */
#define QUIT      23   /**< Quit request event data */
#define USER      24   /**< Custom event data */
#define SYSWM     25   /**< System dependent window event data */
#define TFINGER   26   /**< Touch finger event data */
#define MGESTURE  27   /**< Gesture event data */
#define DGESTURE  28   /**< Gesture event data */
#define DROP      29   /**< Drag and drop event data */
#define PADDING   30
/* SDL_events.h */

/* SDL_keycode.h */
#define SDLK_SCANCODE_MASK (0x40000000)
#define SDL_SCANCODE_TO_KEYCODE(X)  (X + SDLK_SCANCODE_MASK)

#define SDLK_UNKNOWN  0

#define SDLK_RETURN     '\r'
#define SDLK_ESCAPE     '\x1B'
#define SDLK_BACKSPACE  '\b'
#define SDLK_TAB        '\t'
#define SDLK_SPACE      ' '
#define SDLK_EXCLAIM    '!'
#define SDLK_QUOTEDBL   '"'
#define SDLK_HASH       '#'
#define SDLK_PERCENT    '%'
#define SDLK_DOLLAR     '$'
#define SDLK_AMPERSAND  '&'
#define SDLK_QUOTE      "\'"
#define SDLK_LEFTPAREN  '('
#define SDLK_RIGHTPAREN ')'
#define SDLK_ASTERISK   '*'
#define SDLK_PLUS       '+'
#define SDLK_COMMA      ','
#define SDLK_MINUS      '-'
#define SDLK_PERIOD     '.'
#define SDLK_SLASH      '/'
#define SDLK_0          '0'
#define SDLK_1          '1'
#define SDLK_2          '2'
#define SDLK_3          '3'
#define SDLK_4          '4'
#define SDLK_5          '5'
#define SDLK_6          '6'
#define SDLK_7          '7'
#define SDLK_8          '8'
#define SDLK_9          '9'
#define SDLK_COLON      ':'
#define SDLK_SEMICOLON  ';'
#define SDLK_LESS       '<'
#define SDLK_EQUALS     '='
#define SDLK_GREATER    '>'
#define SDLK_QUESTION   '?'
#define SDLK_AT         '@'

#define SDLK_LEFTBRACKET  '['
#define SDLK_BACKSLASH    '\\'
#define SDLK_RIGHTBRACKET ']'
#define SDLK_CARET        '^'
#define SDLK_UNDERSCORE   '_'
#define SDLK_BACKQUOTE    '`'
#define SDLK_a            'a'
#define SDLK_b            'b'
#define SDLK_c            'c'
#define SDLK_d            'd'
#define SDLK_e            'e'
#define SDLK_f            'f'
#define SDLK_g            'g'
#define SDLK_h            'h'
#define SDLK_i            'i'
#define SDLK_j            'j'
#define SDLK_k            'k'
#define SDLK_l            'l'
#define SDLK_m            'm'
#define SDLK_n            'n'
#define SDLK_o            'o'
#define SDLK_p            'p'
#define SDLK_q            'q'
#define SDLK_r            'r'
#define SDLK_s            's'
#define SDLK_t            't'
#define SDLK_u            'u'
#define SDLK_v            'v'
#define SDLK_w            'w'
#define SDLK_x            'x'
#define SDLK_y            'y'
#define SDLK_z            'z'

#define SDLK_CAPSLOCK SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_CAPSLOCK)

#define SDLK_F1  SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F1)
#define SDLK_F2  SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F2)
#define SDLK_F3  SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F3)
#define SDLK_F4  SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F4)
#define SDLK_F5  SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F5)
#define SDLK_F6  SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F6)
#define SDLK_F7  SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F7)
#define SDLK_F8  SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F8)
#define SDLK_F9  SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F9)
#define SDLK_F10 SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F10)
#define SDLK_F11 SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F11)
#define SDLK_F12 SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F12)

#define SDLK_PRINTSCREEN SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_PRINTSCREEN)
#define SDLK_SCROLLLOCK  SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_SCROLLLOCK)
#define SDLK_PAUSE       SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_PAUSE)
#define SDLK_INSERT      SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_INSERT)
#define SDLK_HOME        SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_HOME)
#define SDLK_PAGEUP      SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_PAGEUP)
#define SDLK_DELETE      '\x7F'
#define SDLK_END         SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_END)
#define SDLK_PAGEDOWN    SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_PAGEDOWN)
#define SDLK_RIGHT       SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_RIGHT)
#define SDLK_LEFT        SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_LEFT)
#define SDLK_DOWN        SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_DOWN)
#define SDLK_UP          SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_UP)

#define SDLK_NUMLOCKCLEAR SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_NUMLOCKCLEAR)
#define SDLK_KP_DIVIDE    SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_DIVIDE)
#define SDLK_KP_MULTIPLY  SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_MULTIPLY)
#define SDLK_KP_MINUS     SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_MINUS)
#define SDLK_KP_PLUS      SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_PLUS)
#define SDLK_KP_ENTER     SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_ENTER)
#define SDLK_KP_1         SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_1)
#define SDLK_KP_2         SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_2)
#define SDLK_KP_3         SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_3)
#define SDLK_KP_4         SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_4)
#define SDLK_KP_5         SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_5)
#define SDLK_KP_6         SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_6)
#define SDLK_KP_7         SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_7)
#define SDLK_KP_8         SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_8)
#define SDLK_KP_9         SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_9)
#define SDLK_KP_0         SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_0)
#define SDLK_KP_PERIOD    SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_PERIOD)

#define SDLK_APPLICATION    SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_APPLICATION)
#define SDLK_POWER          SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_POWER)
#define SDLK_KP_EQUALS      SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_EQUALS)
#define SDLK_F13            SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F13)
#define SDLK_F14            SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F14)
#define SDLK_F15            SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F15)
#define SDLK_F16            SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F16)
#define SDLK_F17            SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F17)
#define SDLK_F18            SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F18)
#define SDLK_F19            SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F19)
#define SDLK_F20            SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F20)
#define SDLK_F21            SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F21)
#define SDLK_F22            SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F22)
#define SDLK_F23            SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F23)
#define SDLK_F24            SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_F24)
#define SDLK_EXECUTE        SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_EXECUTE)
#define SDLK_HELP           SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_HELP)
#define SDLK_MENU           SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_MENU)
#define SDLK_SELECT         SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_SELECT)
#define SDLK_STOP           SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_STOP)
#define SDLK_AGAIN          SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AGAIN)
#define SDLK_UNDO           SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_UNDO)
#define SDLK_CUT            SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_CUT)
#define SDLK_COPY           SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_COPY)
#define SDLK_PASTE          SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_PASTE)
#define SDLK_FIND           SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_FIND)
#define SDLK_MUTE           SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_MUTE)
#define SDLK_VOLUMEUP       SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_VOLUMEUP)
#define SDLK_VOLUMEDOWN     SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_VOLUMEDOWN)
#define SDLK_KP_COMMA       SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_COMMA)
#define SDLK_KP_EQUALSAS400 SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_EQUALSAS400)

#define SDLK_ALTERASE   SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_ALTERASE)
#define SDLK_SYSREQ     SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_SYSREQ)
#define SDLK_CANCEL     SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_CANCEL)
#define SDLK_CLEAR      SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_CLEAR)
#define SDLK_PRIOR      SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_PRIOR)
#define SDLK_RETURN2    SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_RETURN2)
#define SDLK_SEPARATOR  SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_SEPARATOR)
#define SDLK_OUT        SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_OUT)
#define SDLK_OPER       SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_OPER)
#define SDLK_CLEARAGAIN SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_CLEARAGAIN)
#define SDLK_CRSEL      SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_CRSEL)
#define SDLK_EXSEL      SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_EXSEL)

#define SDLK_KP_00              SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_00)
#define SDLK_KP_000             SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_000)
#define SDLK_THOUSANDSSEPARATOR SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_THOUSANDSSEPARATOR)
#define SDLK_DECIMALSEPARATOR   SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_DECIMALSEPARATOR)
#define SDLK_CURRENCYUNIT       SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_CURRENCYUNIT)
#define SDLK_CURRENCYSUBUNIT    SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_CURRENCYSUBUNIT)
#define SDLK_KP_LEFTPAREN       SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_LEFTPAREN)
#define SDLK_KP_RIGHTPAREN      SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_RIGHTPAREN)
#define SDLK_KP_LEFTBRACE       SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_LEFTBRACE)
#define SDLK_KP_RIGHTBRACE      SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_RIGHTBRACE)
#define SDLK_KP_TAB             SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_TAB)
#define SDLK_KP_BACKSPACE       SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_BACKSPACE)
#define SDLK_KP_A               SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_A)
#define SDLK_KP_B               SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_B)
#define SDLK_KP_C               SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_C)
#define SDLK_KP_D               SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_D)
#define SDLK_KP_E               SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_E)
#define SDLK_KP_F               SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_F)
#define SDLK_KP_XOR             SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_XOR)
#define SDLK_KP_POWER           SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_POWER)
#define SDLK_KP_PERCENT         SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_PERCENT)
#define SDLK_KP_LESS            SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_LESS)
#define SDLK_KP_GREATER         SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_GREATER)
#define SDLK_KP_AMPERSAND       SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_AMPERSAND)
#define SDLK_KP_DBLAMPERSAND    SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_DBLAMPERSAND)
#define SDLK_KP_VERTICALBAR     SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_VERTICALBAR)
#define SDLK_KP_DBLVERTICALBAR  SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_DBLVERTICALBAR)
#define SDLK_KP_COLON           SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_COLON)
#define SDLK_KP_HASH            SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_HASH)
#define SDLK_KP_SPACE           SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_SPACE)
#define SDLK_KP_AT              SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_AT)
#define SDLK_KP_EXCLAM          SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_EXCLAM)
#define SDLK_KP_MEMSTORE        SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_MEMSTORE)
#define SDLK_KP_MEMRECALL       SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_MEMRECALL)
#define SDLK_KP_MEMCLEAR        SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_MEMCLEAR)
#define SDLK_KP_MEMADD          SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_MEMADD)
#define SDLK_KP_MEMSUBTRACT     SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_MEMSUBTRACT)
#define SDLK_KP_MEMMULTIPLY     SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_MEMMULTIPLY)
#define SDLK_KP_MEMDIVIDE       SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_MEMDIVIDE)
#define SDLK_KP_PLUSMINUS       SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_PLUSMINUS)
#define SDLK_KP_CLEAR           SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_CLEAR)
#define SDLK_KP_CLEARENTRY      SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_CLEARENTRY)
#define SDLK_KP_BINARY          SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_BINARY)
#define SDLK_KP_OCTAL           SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_OCTAL)
#define SDLK_KP_DECIMAL         SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_DECIMAL)
#define SDLK_KP_HEXADECIMAL     SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KP_HEXADECIMAL)

#define SDLK_LCTRL  SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_LCTRL)
#define SDLK_LSHIFT SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_LSHIFT)
#define SDLK_LALT   SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_LALT)
#define SDLK_LGUI   SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_LGUI)
#define SDLK_RCTRL  SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_RCTRL)
#define SDLK_RSHIFT SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_RSHIFT)
#define SDLK_RALT   SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_RALT)
#define SDLK_RGUI   SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_RGUI)

#define SDLK_MODE   SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_MODE)

#define SDLK_AUDIONEXT    SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AUDIONEXT)
#define SDLK_AUDIOPREV    SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AUDIOPREV)
#define SDLK_AUDIOSTOP    SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AUDIOSTOP)
#define SDLK_AUDIOPLAY    SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AUDIOPLAY)
#define SDLK_AUDIOMUTE    SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AUDIOMUTE)
#define SDLK_MEDIASELECT  SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_MEDIASELECT)
#define SDLK_WWW          SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_WWW)
#define SDLK_MAIL         SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_MAIL)
#define SDLK_CALCULATOR   SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_CALCULATOR)
#define SDLK_COMPUTER     SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_COMPUTER)
#define SDLK_AC_SEARCH    SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AC_SEARCH)
#define SDLK_AC_HOME      SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AC_HOME)
#define SDLK_AC_BACK      SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AC_BACK)
#define SDLK_AC_FORWARD   SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AC_FORWARD)
#define SDLK_AC_STOP      SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AC_STOP)
#define SDLK_AC_REFRESH   SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AC_REFRESH)
#define SDLK_AC_BOOKMARKS SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AC_BOOKMARKS)

#define SDLK_BRIGHTNESSDOWN SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_BRIGHTNESSDOWN)
#define SDLK_BRIGHTNESSUP   SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_BRIGHTNESSUP)
#define SDLK_DISPLAYSWITCH  SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_DISPLAYSWITCH)
#define SDLK_KBDILLUMTOGGLE SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KBDILLUMTOGGLE)
#define SDLK_KBDILLUMDOWN   SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KBDILLUMDOWN)
#define SDLK_KBDILLUMUP     SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_KBDILLUMUP)
#define SDLK_EJECT          SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_EJECT)
#define SDLK_SLEEP          SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_SLEEP)
#define SDLK_APP1           SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_APP1)
#define SDLK_APP2           SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_APP2)

#define SDLK_AUDIOREWIND      SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AUDIOREWIND)
#define SDLK_AUDIOFASTFORWARD SDL_SCANCODE_TO_KEYCODE(SDL_SCANCODE_AUDIOFASTFORWARD)

#define KMOD_NONE   0x0000
#define KMOD_LSHIFT 0x0001
#define KMOD_RSHIFT 0x0002
#define KMOD_LCTRL  0x0040
#define KMOD_RCTRL  0x0080
#define KMOD_LALT   0x0100
#define KMOD_RALT   0x0200
#define KMOD_LGUI   0x0400
#define KMOD_RGUI   0x0800
#define KMOD_NUM    0x1000
#define KMOD_CAPS   0x2000
#define KMOD_MODE   0x4000
#define KMOD_SCROLL 0x8000

#define KMOD_CTRL  KMOD_LCTRL  + KMOD_RCTRL
#define KMOD_SHIFT KMOD_LSHIFT + KMOD_RSHIFT
#define KMOD_ALT   KMOD_LALT   + KMOD_RALT
#define KMOD_GUI   KMOD_LGUI   + KMOD_RGUI

#define KMOD_RESERVED KMOD_SCROLL /* This is for source-level compatibility with SDL 2.0.0. */

/* End SDL_keycode.h*/

/* SDL_log.h */
#define SDL_MAX_LOG_MESSAGE 4096

#define SDL_LOG_CATEGORY_APPLICATION 0
#define SDL_LOG_CATEGORY_ERROR       1
#define SDL_LOG_CATEGORY_ASSERT      2
#define SDL_LOG_CATEGORY_SYSTEM      3
#define SDL_LOG_CATEGORY_AUDIO       4
#define SDL_LOG_CATEGORY_VIDEO       5
#define SDL_LOG_CATEGORY_RENDER      6
#define SDL_LOG_CATEGORY_INPUT       7
#define SDL_LOG_CATEGORY_TEST        8
#define SDL_LOG_CATEGORY_RESERVED1   9
#define SDL_LOG_CATEGORY_RESERVED2   10
#define SDL_LOG_CATEGORY_RESERVED3   11
#define SDL_LOG_CATEGORY_RESERVED4   12
#define SDL_LOG_CATEGORY_RESERVED5   13
#define SDL_LOG_CATEGORY_RESERVED6   14
#define SDL_LOG_CATEGORY_RESERVED7   15
#define SDL_LOG_CATEGORY_RESERVED8   16
#define SDL_LOG_CATEGORY_RESERVED9   17
#define SDL_LOG_CATEGORY_RESERVED10  18
#define SDL_LOG_CATEGORY_CUSTOM      19

#define SDL_LOG_PRIORITY_VERBOSE  1
#define SDL_LOG_PRIORITY_DEBUG    2
#define SDL_LOG_PRIORITY_INFO     3
#define SDL_LOG_PRIORITY_WARN     4
#define SDL_LOG_PRIORITY_ERROR    5
#define SDL_LOG_PRIORITY_CRITICAL 6
#define SDL_NUM_LOG_PRIORITIES    7
/* End SDL_log.h */

/* SDL_mutex.h */
#define SDL_MUTEX_TIMEDOUT  1
//#define SDL_MUTEX_MAXWAIT   (~(Uint32)0)
//#define SDL_mutexP(m)   SDL_LockMutex(m)
//#define SDL_mutexV(m)   SDL_UnlockMutex(m)
/* END SDL_mutex.h */

/* SDL_render.h */
#define SDL_RENDERER_SOFTWARE      0x00000001   /**< The renderer is a software fallback */
#define SDL_RENDERER_ACCELERATED   0x00000002   /**< The renderer uses hardware acceleration */
#define SDL_RENDERER_PRESENTVSYNC  0x00000004   /**< Present is synchronized with the refresh rate */
#define SDL_RENDERER_TARGETTEXTURE 0x00000008   /**< The renderer supports rendering to texture */

#define SDL_ScaleModeNearest 0   /**< nearest pixel sampling */
#define SDL_ScaleModeLinear  1   /**< linear filtering */
#define SDL_ScaleModeBest    2   /**< anisotropic filtering */

#define SDL_TEXTUREACCESS_STATIC    0   /**< Changes rarely, not lockable */
#define SDL_TEXTUREACCESS_STREAMING 1   /**< Changes frequently, lockable */
#define SDL_TEXTUREACCESS_TARGET    2   /**< Texture can be used as a render target */

#define SDL_TEXTUREMODULATE_NONE  0x00000000   /**< No modulation */
#define SDL_TEXTUREMODULATE_COLOR 0x00000001   /**< srcC = srcC * color */
#define SDL_TEXTUREMODULATE_ALPHA 0x00000002   /**< srcA = srcA * alpha */

#define SDL_FLIP_NONE       0x00000000   /**< Do not flip */
#define SDL_FLIP_HORIZONTAL 0x00000001   /**< flip horizontally */
#define SDL_FLIP_VERTICAL   0x00000002   /**< flip vertically */
/* End SDL_render.h */

/* SDL_rwops.h */
#define SDL_RWOPS_UNKNOWN   0  /**< Unknown stream type */
#define SDL_RWOPS_WINFILE   1  /**< Win32 file */
#define SDL_RWOPS_STDFILE   2  /**< Stdio file */
#define SDL_RWOPS_JNIFILE   3  /**< Android asset */
#define SDL_RWOPS_MEMORY    4  /**< Memory stream */
#define SDL_RWOPS_MEMORY_RO 5  /**< Read-Only memory stream */
#if defined(__VITA__)
#define SDL_RWOPS_VITAFILE  6  /**< Vita file */
#endif

#define RW_SEEK_SET 0       /**< Seek from the beginning of data */
#define RW_SEEK_CUR 1       /**< Seek relative to current read point */
#define RW_SEEK_END 2       /**< Seek relative to the end of data */
/* End SDL_rwops.h */

/* SDL_surface.h */
#define SDL_SWSURFACE    0            /**< Just here for compatibility */
#define SDL_PREALLOC     0x00000001   /**< Surface uses preallocated memory */
#define SDL_RLEACCEL     0x00000002   /**< Surface is RLE encoded */
#define SDL_DONTFREE     0x00000004   /**< Surface is referenced internally */
#define SDL_SIMD_ALIGNED 0x00000008   /**< Surface uses aligned memory */

// #define SDL_MUSTLOCK(S) (((S)->flags & SDL_RLEACCEL) != 0)

#define SDL_YUV_CONVERSION_JPEG      0   /**< Full range JPEG */
#define SDL_YUV_CONVERSION_BT601     1   /**< BT.601 (the default) */
#define SDL_YUV_CONVERSION_BT709     2   /**< BT.709 */
#define SDL_YUV_CONVERSION_AUTOMATIC 3   /**< BT.601 for SD content, BT.709 for HD content */

#define SDL_BlitSurface SDL_UpperBlit
#define SDL_BlitScaled SDL_UpperBlitScaled

#define SDL_LoadBMP(file)   SDL_LoadBMP_RW(SDL_RWFromFile(file, "rb"), 1)
#define SDL_SaveBMP(surface, file) SDL_SaveBMP_RW(surface, SDL_RWFromFile(file, "wb"), 1)
/* End SDL_surface.h */

/* SDL_scancode.h */
#define SDL_SCANCODE_UNKNOWN 0

#define SDL_SCANCODE_A 4
#define SDL_SCANCODE_B 5
#define SDL_SCANCODE_C 6
#define SDL_SCANCODE_D 7
#define SDL_SCANCODE_E 8
#define SDL_SCANCODE_F 9
#define SDL_SCANCODE_G 10
#define SDL_SCANCODE_H 11
#define SDL_SCANCODE_I 12
#define SDL_SCANCODE_J 13
#define SDL_SCANCODE_K 14
#define SDL_SCANCODE_L 15
#define SDL_SCANCODE_M 16
#define SDL_SCANCODE_N 17
#define SDL_SCANCODE_O 18
#define SDL_SCANCODE_P 19
#define SDL_SCANCODE_Q 20
#define SDL_SCANCODE_R 21
#define SDL_SCANCODE_S 22
#define SDL_SCANCODE_T 23
#define SDL_SCANCODE_U 24
#define SDL_SCANCODE_V 25
#define SDL_SCANCODE_W 26
#define SDL_SCANCODE_X 27
#define SDL_SCANCODE_Y 28
#define SDL_SCANCODE_Z 29

#define SDL_SCANCODE_1 30
#define SDL_SCANCODE_2 31
#define SDL_SCANCODE_3 32
#define SDL_SCANCODE_4 33
#define SDL_SCANCODE_5 34
#define SDL_SCANCODE_6 35
#define SDL_SCANCODE_7 36
#define SDL_SCANCODE_8 37
#define SDL_SCANCODE_9 38
#define SDL_SCANCODE_0 39

#define SDL_SCANCODE_RETURN    40
#define SDL_SCANCODE_ESCAPE    41
#define SDL_SCANCODE_BACKSPACE 42
#define SDL_SCANCODE_TAB       43
#define SDL_SCANCODE_SPACE     44

#define SDL_SCANCODE_MINUS        45
#define SDL_SCANCODE_EQUALS       46
#define SDL_SCANCODE_LEFTBRACKET  47
#define SDL_SCANCODE_RIGHTBRACKET 48
#define SDL_SCANCODE_BACKSLASH    49  /**< Located at the lower left of the return
                                       *   key on ISO keyboards and at the right end
                                       *   of the QWERTY row on ANSI keyboards.
                                       *   Produces REVERSE SOLIDUS (backslash) and
                                       *   VERTICAL LINE in a US layout, REVERSE
                                       *   SOLIDUS and VERTICAL LINE in a UK Mac
                                       *   layout, NUMBER SIGN and TILDE in a UK
                                       *   Windows layout, DOLLAR SIGN and POUND SIGN
                                       *   in a Swiss German layout, NUMBER SIGN and
                                       *   APOSTROPHE in a German layout, GRAVE
                                       *   ACCENT and POUND SIGN in a French Mac
                                       *   layout, and ASTERISK and MICRO SIGN in a
                                       *   French Windows layout.
                                       */
#define SDL_SCANCODE_NONUSHASH 50  /**< ISO USB keyboards actually use this code
                                    *   instead of 49 for the same key, but all
                                    *   OSes I've seen treat the two codes
                                    *   identically. So, as an implementor, unless
                                    *   your keyboard generates both of those
                                    *   codes and your OS treats them differently,
                                    *   you should generate SDL_SCANCODE_BACKSLASH
                                    *   instead of this code. As a user, you
                                    *   should not rely on this code because SDL
                                    *   will never generate it with most (all?)
                                    *   keyboards.
                                    */
#define SDL_SCANCODE_SEMICOLON  51
#define SDL_SCANCODE_APOSTROPHE 52
#define SDL_SCANCODE_GRAVE      53  /**< Located in the top left corner (on both ANSI
                                     *   and ISO keyboards). Produces GRAVE ACCENT and
                                     *   TILDE in a US Windows layout and in US and UK
                                     *   Mac layouts on ANSI keyboards, GRAVE ACCENT
                                     *   and NOT SIGN in a UK Windows layout, SECTION
                                     *   SIGN and PLUS-MINUS SIGN in US and UK Mac
                                     *   layouts on ISO keyboards, SECTION SIGN and
                                     *   DEGREE SIGN in a Swiss German layout (Mac:
                                     *   only on ISO keyboards), CIRCUMFLEX ACCENT and
                                     *   DEGREE SIGN in a German layout (Mac: only on
                                     *   ISO keyboards), SUPERSCRIPT TWO and TILDE in a
                                     *   French Windows layout, COMMERCIAL AT and
                                     *   NUMBER SIGN in a French Mac layout on ISO
                                     *   keyboards, and LESS-THAN SIGN and GREATER-THAN
                                     *   SIGN in a Swiss German, German, or French Mac
                                     *   layout on ANSI keyboards.
                                     */
#define SDL_SCANCODE_COMMA  54
#define SDL_SCANCODE_PERIOD 55
#define SDL_SCANCODE_SLASH  56

#define SDL_SCANCODE_CAPSLOCK 57

#define SDL_SCANCODE_F1  58
#define SDL_SCANCODE_F2  59
#define SDL_SCANCODE_F3  60
#define SDL_SCANCODE_F4  61
#define SDL_SCANCODE_F5  62
#define SDL_SCANCODE_F6  63
#define SDL_SCANCODE_F7  64
#define SDL_SCANCODE_F8  65
#define SDL_SCANCODE_F9  66
#define SDL_SCANCODE_F10 67
#define SDL_SCANCODE_F11 68
#define SDL_SCANCODE_F12 69

#define SDL_SCANCODE_PRINTSCREEN 70
#define SDL_SCANCODE_SCROLLLOCK  71
#define SDL_SCANCODE_PAUSE       72
#define SDL_SCANCODE_INSERT      73 /**< insert on PC, help on some Mac keyboards (but does send code 73, not 117) */
#define SDL_SCANCODE_HOME        74
#define SDL_SCANCODE_PAGEUP      75
#define SDL_SCANCODE_DELETE      76
#define SDL_SCANCODE_END         77
#define SDL_SCANCODE_PAGEDOWN    78
#define SDL_SCANCODE_RIGHT       79
#define SDL_SCANCODE_LEFT        80
#define SDL_SCANCODE_DOWN        81
#define SDL_SCANCODE_UP          82

#define SDL_SCANCODE_NUMLOCKCLEAR 83 /**< num lock on PC, clear on Mac keyboards */
#define SDL_SCANCODE_KP_DIVIDE    84
#define SDL_SCANCODE_KP_MULTIPLY  85
#define SDL_SCANCODE_KP_MINUS     86
#define SDL_SCANCODE_KP_PLUS      87
#define SDL_SCANCODE_KP_ENTER     88
#define SDL_SCANCODE_KP_1         89
#define SDL_SCANCODE_KP_2         90
#define SDL_SCANCODE_KP_3         91
#define SDL_SCANCODE_KP_4         92
#define SDL_SCANCODE_KP_5         93
#define SDL_SCANCODE_KP_6         94
#define SDL_SCANCODE_KP_7         95
#define SDL_SCANCODE_KP_8         96
#define SDL_SCANCODE_KP_9         97
#define SDL_SCANCODE_KP_0         98
#define SDL_SCANCODE_KP_PERIOD    99

#define SDL_SCANCODE_NONUSBACKSLASH 100 /**< This is the additional key that ISO
                                         *   keyboards have over ANSI ones,
                                         *   located between left shift and Y.
                                         *   Produces GRAVE ACCENT and TILDE in a
                                         *   US or UK Mac layout, REVERSE SOLIDUS
                                         *   (backslash) and VERTICAL LINE in a
                                         *   US or UK Windows layout, and
                                         *   LESS-THAN SIGN and GREATER-THAN SIGN
                                         *   in a Swiss German, German, or French
                                         *   layout. */
#define SDL_SCANCODE_APPLICATION 101 /**< windows contextual menu, compose */
#define SDL_SCANCODE_POWER       102 /**< The USB document says this is a status flag,
                                      *   not a physical key - but some Mac keyboards
                                      *   do have a power key. */
#define SDL_SCANCODE_KP_EQUALS  103
#define SDL_SCANCODE_F13        104
#define SDL_SCANCODE_F14        105
#define SDL_SCANCODE_F15        106
#define SDL_SCANCODE_F16        107
#define SDL_SCANCODE_F17        108
#define SDL_SCANCODE_F18        109
#define SDL_SCANCODE_F19        110
#define SDL_SCANCODE_F20        111
#define SDL_SCANCODE_F21        112
#define SDL_SCANCODE_F22        113
#define SDL_SCANCODE_F23        114
#define SDL_SCANCODE_F24        115
#define SDL_SCANCODE_EXECUTE    116
#define SDL_SCANCODE_HELP       117
#define SDL_SCANCODE_MENU       118
#define SDL_SCANCODE_SELECT     119
#define SDL_SCANCODE_STOP       120
#define SDL_SCANCODE_AGAIN      121   /**< redo */
#define SDL_SCANCODE_UNDO       122
#define SDL_SCANCODE_CUT        123
#define SDL_SCANCODE_COPY       124
#define SDL_SCANCODE_PASTE      125
#define SDL_SCANCODE_FIND       126
#define SDL_SCANCODE_MUTE       127
#define SDL_SCANCODE_VOLUMEUP   128
#define SDL_SCANCODE_VOLUMEDOWN 129
/* not sure whether there's a reason to enable these */
/* #define SDL_SCANCODE_LOCKINGCAPSLOCK   130 */
/* #define SDL_SCANCODE_LOCKINGNUMLOCK    131 */
/* #define SDL_SCANCODE_LOCKINGSCROLLLOCK 132 */
#define SDL_SCANCODE_KP_COMMA       133
#define SDL_SCANCODE_KP_EQUALSAS400 134

#define SDL_SCANCODE_INTERNATIONAL1 135 /**< used on Asian keyboards, see footnotes in USB doc */
#define SDL_SCANCODE_INTERNATIONAL2 136
#define SDL_SCANCODE_INTERNATIONAL3 137 /**< Yen */
#define SDL_SCANCODE_INTERNATIONAL4 138
#define SDL_SCANCODE_INTERNATIONAL5 139
#define SDL_SCANCODE_INTERNATIONAL6 140
#define SDL_SCANCODE_INTERNATIONAL7 141
#define SDL_SCANCODE_INTERNATIONAL8 142
#define SDL_SCANCODE_INTERNATIONAL9 143
#define SDL_SCANCODE_LANG1          144 /**< Hangul/English toggle */
#define SDL_SCANCODE_LANG2          145 /**< Hanja conversion */
#define SDL_SCANCODE_LANG3          146 /**< Katakana */
#define SDL_SCANCODE_LANG4          147 /**< Hiragana */
#define SDL_SCANCODE_LANG5          148 /**< Zenkaku/Hankaku */
#define SDL_SCANCODE_LANG6          149 /**< reserved */
#define SDL_SCANCODE_LANG7          150 /**< reserved */
#define SDL_SCANCODE_LANG8          151 /**< reserved */
#define SDL_SCANCODE_LANG9          152 /**< reserved */

#define SDL_SCANCODE_ALTERASE   153 /**< Erase-Eaze */
#define SDL_SCANCODE_SYSREQ     154
#define SDL_SCANCODE_CANCEL     155
#define SDL_SCANCODE_CLEAR      156
#define SDL_SCANCODE_PRIOR      157
#define SDL_SCANCODE_RETURN2    158
#define SDL_SCANCODE_SEPARATOR  159
#define SDL_SCANCODE_OUT        160
#define SDL_SCANCODE_OPER       161
#define SDL_SCANCODE_CLEARAGAIN 162
#define SDL_SCANCODE_CRSEL      163
#define SDL_SCANCODE_EXSEL      164

#define SDL_SCANCODE_KP_00              176
#define SDL_SCANCODE_KP_000             177
#define SDL_SCANCODE_THOUSANDSSEPARATOR 178
#define SDL_SCANCODE_DECIMALSEPARATOR   179
#define SDL_SCANCODE_CURRENCYUNIT       180
#define SDL_SCANCODE_CURRENCYSUBUNIT    181
#define SDL_SCANCODE_KP_LEFTPAREN       182
#define SDL_SCANCODE_KP_RIGHTPAREN      183
#define SDL_SCANCODE_KP_LEFTBRACE       184
#define SDL_SCANCODE_KP_RIGHTBRACE      185
#define SDL_SCANCODE_KP_TAB             186
#define SDL_SCANCODE_KP_BACKSPACE       187
#define SDL_SCANCODE_KP_A               188
#define SDL_SCANCODE_KP_B               189
#define SDL_SCANCODE_KP_C               190
#define SDL_SCANCODE_KP_D               191
#define SDL_SCANCODE_KP_E               192
#define SDL_SCANCODE_KP_F               193
#define SDL_SCANCODE_KP_XOR             194
#define SDL_SCANCODE_KP_POWER           195
#define SDL_SCANCODE_KP_PERCENT         196
#define SDL_SCANCODE_KP_LESS            197
#define SDL_SCANCODE_KP_GREATER         198
#define SDL_SCANCODE_KP_AMPERSAND       199
#define SDL_SCANCODE_KP_DBLAMPERSAND    200
#define SDL_SCANCODE_KP_VERTICALBAR     201
#define SDL_SCANCODE_KP_DBLVERTICALBAR  202
#define SDL_SCANCODE_KP_COLON           203
#define SDL_SCANCODE_KP_HASH            204
#define SDL_SCANCODE_KP_SPACE           205
#define SDL_SCANCODE_KP_AT              206
#define SDL_SCANCODE_KP_EXCLAM          207
#define SDL_SCANCODE_KP_MEMSTORE        208
#define SDL_SCANCODE_KP_MEMRECALL       209
#define SDL_SCANCODE_KP_MEMCLEAR        210
#define SDL_SCANCODE_KP_MEMADD          211
#define SDL_SCANCODE_KP_MEMSUBTRACT     212
#define SDL_SCANCODE_KP_MEMMULTIPLY     213
#define SDL_SCANCODE_KP_MEMDIVIDE       214
#define SDL_SCANCODE_KP_PLUSMINUS       215
#define SDL_SCANCODE_KP_CLEAR           216
#define SDL_SCANCODE_KP_CLEARENTRY      217
#define SDL_SCANCODE_KP_BINARY          218
#define SDL_SCANCODE_KP_OCTAL           219
#define SDL_SCANCODE_KP_DECIMAL         220
#define SDL_SCANCODE_KP_HEXADECIMAL     221

#define SDL_SCANCODE_LCTRL  224
#define SDL_SCANCODE_LSHIFT 225
#define SDL_SCANCODE_LALT   226 /**< alt, option */
#define SDL_SCANCODE_LGUI   227 /**< windows, command (apple), meta */
#define SDL_SCANCODE_RCTRL  228
#define SDL_SCANCODE_RSHIFT 229
#define SDL_SCANCODE_RALT   230 /**< alt gr, option */
#define SDL_SCANCODE_RGUI   231 /**< windows, command (apple), meta */

#define SDL_SCANCODE_MODE   257 /**< I'm not sure if this is really not covered
                                 *   by any of the above, but since there's a
                                 *   special KMOD_MODE for it I'm adding it here
                                 */

#define SDL_SCANCODE_AUDIONEXT    258
#define SDL_SCANCODE_AUDIOPREV    259
#define SDL_SCANCODE_AUDIOSTOP    260
#define SDL_SCANCODE_AUDIOPLAY    261
#define SDL_SCANCODE_AUDIOMUTE    262
#define SDL_SCANCODE_MEDIASELECT  263
#define SDL_SCANCODE_WWW          264
#define SDL_SCANCODE_MAIL         265
#define SDL_SCANCODE_CALCULATOR   266
#define SDL_SCANCODE_COMPUTER     267
#define SDL_SCANCODE_AC_SEARCH    268
#define SDL_SCANCODE_AC_HOME      269
#define SDL_SCANCODE_AC_BACK      270
#define SDL_SCANCODE_AC_FORWARD   271
#define SDL_SCANCODE_AC_STOP      272
#define SDL_SCANCODE_AC_REFRESH   273
#define SDL_SCANCODE_AC_BOOKMARKS 274

#define SDL_SCANCODE_BRIGHTNESSDOWN 275
#define SDL_SCANCODE_BRIGHTNESSUP   276
#define SDL_SCANCODE_DISPLAYSWITCH  277 /**< display mirroring/dual display switch, video mode switch */
#define SDL_SCANCODE_KBDILLUMTOGGLE 278
#define SDL_SCANCODE_KBDILLUMDOWN   279
#define SDL_SCANCODE_KBDILLUMUP     280
#define SDL_SCANCODE_EJECT          281
#define SDL_SCANCODE_SLEEP          282

#define SDL_SCANCODE_APP1 283
#define SDL_SCANCODE_APP2 284

#define SDL_SCANCODE_AUDIOREWIND      285
#define SDL_SCANCODE_AUDIOFASTFORWARD 286

#define SDL_NUM_SCANCODES             512 /**< not a key, just marks the number of scancodes for array bounds */
/* END SDL_scancode.h */

/* SDL_video.h */
#define SDL_WINDOW_FULLSCREEN         0x00000001   /**< fullscreen window */
#define SDL_WINDOW_OPENGL             0x00000002   /**< window usable with OpenGL context */
#define SDL_WINDOW_SHOWN              0x00000004   /**< window is visible */
#define SDL_WINDOW_HIDDEN             0x00000008   /**< window is not visible */
#define SDL_WINDOW_BORDERLESS         0x00000010   /**< no window decoration */
#define SDL_WINDOW_RESIZABLE          0x00000020   /**< window can be resized */
#define SDL_WINDOW_MINIMIZED          0x00000040   /**< window is minimized */
#define SDL_WINDOW_MAXIMIZED          0x00000080   /**< window is maximized */
#define SDL_WINDOW_MOUSE_GRABBED      0x00000100   /**< window has grabbed mouse input */
#define SDL_WINDOW_INPUT_FOCUS        0x00000200   /**< window has input focus */
#define SDL_WINDOW_MOUSE_FOCUS        0x00000400   /**< window has mouse focus */
#define SDL_WINDOW_FULLSCREEN_DESKTOP ( SDL_WINDOW_FULLSCREEN + 0x00001000 )
#define SDL_WINDOW_FOREIGN            0x00000800   /**< window not created by SDL */
#define SDL_WINDOW_ALLOW_HIGHDPI      0x00002000   /**< window should be created in high-DPI mode if supported. On macOS NSHighResolutionCapable must be set true in the application's Info.plist for this to have any effect. */

#define SDL_WINDOW_MOUSE_CAPTURE    0x00004000     /**< window has mouse captured (unrelated to MOUSE_GRABBED) */
#define SDL_WINDOW_ALWAYS_ON_TOP    0x00008000     /**< window should always be above others */
#define SDL_WINDOW_SKIP_TASKBAR     0x00010000     /**< window should not be added to the taskbar */
#define SDL_WINDOW_UTILITY          0x00020000     /**< window should be treated as a utility window */
#define SDL_WINDOW_TOOLTIP          0x00040000     /**< window should be treated as a tooltip */
#define SDL_WINDOW_POPUP_MENU       0x00080000     /**< window should be treated as a popup menu */
#define SDL_WINDOW_KEYBOARD_GRABBED 0x00100000     /**< window has grabbed keyboard input */
#define SDL_WINDOW_VULKAN           0x10000000     /**< window usable for Vulkan surface */
#define SDL_WINDOW_METAL            0x20000000     /**< window usable for Metal view */

#define SDL_WINDOW_INPUT_GRABBED SDL_WINDOW_MOUSE_GRABBED /**< equivalent to SDL_WINDOW_MOUSE_GRABBED for compatibility */

#define SDL_WINDOWPOS_UNDEFINED_MASK       0x1FFF0000
#define SDL_WINDOWPOS_UNDEFINED_DISPLAY(X) (hb_bitOR(SDL_WINDOWPOS_UNDEFINED_MASK,(X)))
#define SDL_WINDOWPOS_UNDEFINED            SDL_WINDOWPOS_UNDEFINED_DISPLAY(0)
#define SDL_WINDOWPOS_ISUNDEFINED(X)       (((X)0xFFFF0000) == SDL_WINDOWPOS_UNDEFINED_MASK)

#define SDL_WINDOWPOS_CENTERED_MASK       0x2FFF0000
#define SDL_WINDOWPOS_CENTERED_DISPLAY(X) (hb_bitOR(SDL_WINDOWPOS_CENTERED_MASK,(X)))
#define SDL_WINDOWPOS_CENTERED            SDL_WINDOWPOS_CENTERED_DISPLAY(0)
#define SDL_WINDOWPOS_ISCENTERED(X)       (((X)0xFFFF0000) == SDL_WINDOWPOS_CENTERED_MASK)

#define SDL_WINDOWEVENT_NONE            0    /**< Never used */
#define SDL_WINDOWEVENT_SHOWN           1    /**< Window has been shown */
#define SDL_WINDOWEVENT_HIDDEN          2    /**< Window has been hidden */
#define SDL_WINDOWEVENT_EXPOSED         3    /**< Window has been exposed and should be redrawn */
#define SDL_WINDOWEVENT_MOVED           4    /**< Window has been moved to data1, data2 */
#define SDL_WINDOWEVENT_RESIZED         5    /**< Window has been resized to data1xdata2 */
#define SDL_WINDOWEVENT_SIZE_CHANGED    6    /**< The window size has changed, either as a result of an API call or through the system or user changing the window size. */
#define SDL_WINDOWEVENT_MINIMIZED       7    /**< Window has been minimized */
#define SDL_WINDOWEVENT_MAXIMIZED       8    /**< Window has been maximized */
#define SDL_WINDOWEVENT_RESTORED        9    /**< Window has been restored to normal size and position */
#define SDL_WINDOWEVENT_ENTER           10   /**< Window has gained mouse focus */
#define SDL_WINDOWEVENT_LEAVE           11   /**< Window has lost mouse focus */
#define SDL_WINDOWEVENT_FOCUS_GAINED    12   /**< Window has gained keyboard focus */
#define SDL_WINDOWEVENT_FOCUS_LOST      13   /**< Window has lost keyboard focus */
#define SDL_WINDOWEVENT_CLOSE           14   /**< The window manager requests that the window be closed */
#define SDL_WINDOWEVENT_TAKE_FOCUS      15   /**< Window is being offered a focus (should SetWindowInputFocus() on itself or a subwindow, or ignore) */
#define SDL_WINDOWEVENT_HIT_TEST        16   /**< Window had a hit test that wasn't SDL_HITTEST_NORMAL. */
#define SDL_WINDOWEVENT_ICCPROF_CHANGED 17   /**< The ICC profile of the window's display has changed. */
#define SDL_WINDOWEVENT_DISPLAY_CHANGED 18   /**< Window has been moved to display data1. */

#define SDL_DISPLAYEVENT_NONE           0   /**< Never used */
#define SDL_DISPLAYEVENT_ORIENTATION    1   /**< Display orientation has changed to data1 */
#define SDL_DISPLAYEVENT_CONNECTED      2   /**< Display has been added to the system */
#define SDL_DISPLAYEVENT_DISCONNECTED   3   /**< Display has been removed from the system */

#define SDL_ORIENTATION_UNKNOWN           0   /**< The display orientation can't be determined */
#define SDL_ORIENTATION_LANDSCAPE         1   /**< The display is in landscape mode, with the right side up, relative to portrait mode */
#define SDL_ORIENTATION_LANDSCAPE_FLIPPED 2   /**< The display is in landscape mode, with the left side up, relative to portrait mode */
#define SDL_ORIENTATION_PORTRAIT          3   /**< The display is in portrait mode */
#define SDL_ORIENTATION_PORTRAIT_FLIPPED  4   /**< The display is in portrait mode, upside down */

#define SDL_FLASH_CANCEL        0   /**< Cancel any window flash state */
#define SDL_FLASH_BRIEFLY       1   /**< Flash the window briefly to get attention */
#define SDL_FLASH_UNTIL_FOCUSED 2   /**< Flash the window until it gets focus */

#define SDL_GL_RED_SIZE                   0
#define SDL_GL_GREEN_SIZE                 1
#define SDL_GL_BLUE_SIZE                  2
#define SDL_GL_ALPHA_SIZE                 3
#define SDL_GL_BUFFER_SIZE                4
#define SDL_GL_DOUBLEBUFFER               5
#define SDL_GL_DEPTH_SIZE                 6
#define SDL_GL_STENCIL_SIZE               7
#define SDL_GL_ACCUM_RED_SIZE             8
#define SDL_GL_ACCUM_GREEN_SIZE           9
#define SDL_GL_ACCUM_BLUE_SIZE            10
#define SDL_GL_ACCUM_ALPHA_SIZE           11
#define SDL_GL_STEREO                     12
#define SDL_GL_MULTISAMPLEBUFFERS         13
#define SDL_GL_MULTISAMPLESAMPLES         14
#define SDL_GL_ACCELERATED_VISUAL         15
#define SDL_GL_RETAINED_BACKING           16
#define SDL_GL_CONTEXT_MAJOR_VERSION      17
#define SDL_GL_CONTEXT_MINOR_VERSION      18
#define SDL_GL_CONTEXT_EGL                19
#define SDL_GL_CONTEXT_FLAGS              20
#define SDL_GL_CONTEXT_PROFILE_MASK       21
#define SDL_GL_SHARE_WITH_CURRENT_CONTEXT 22
#define SDL_GL_FRAMEBUFFER_SRGB_CAPABLE   21
#define SDL_GL_CONTEXT_RELEASE_BEHAVIOR   22
#define SDL_GL_CONTEXT_RESET_NOTIFICATION 23
#define SDL_GL_CONTEXT_NO_ERROR           24

#define SDL_GL_CONTEXT_PROFILE_CORE          0x0001
#define SDL_GL_CONTEXT_PROFILE_COMPATIBILITY 0x0002
#define SDL_GL_CONTEXT_PROFILE_ES            0x0004 /**< GLX_CONTEXT_ES2_PROFILE_BIT_EXT */

#define SDL_GL_CONTEXT_DEBUG_FLAG              0x0001
#define SDL_GL_CONTEXT_FORWARD_COMPATIBLE_FLAG 0x0002
#define SDL_GL_CONTEXT_ROBUST_ACCESS_FLAG      0x0004
#define SDL_GL_CONTEXT_RESET_ISOLATION_FLAG    0x0008

#define SDL_GL_CONTEXT_RELEASE_BEHAVIOR_NONE   0x0000
#define SDL_GL_CONTEXT_RELEASE_BEHAVIOR_FLUSH  0x0001

#define SDL_GL_CONTEXT_RESET_NO_NOTIFICATION   0x0000
#define SDL_GL_CONTEXT_RESET_LOSE_CONTEXT      0x0001
/* End SDL_video.h */

/* KeyboardEvent */
#define EVENT_KEY_TYPE              1
#define EVENT_KEY_TIMESTAMP         2
#define EVENT_KEY_WINDOWID          3
#define EVENT_KEY_STATE             4
#define EVENT_KEY_REPEAT            5
#define EVENT_KEY_PADDING2          6
#define EVENT_KEY_PADDING3          7
#define EVENT_KEY_KEYSYM_SCANCODE   8
#define EVENT_KEY_KEYSYM_SYM        9
#define EVENT_KEY_KEYSYM_MOD        10
#define EVENT_KEY_KEYSYM_UNUSED     11

#endif /* HBSDL_CH_ */
