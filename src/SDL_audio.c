/*
 * SDL library: SDL_audio.c
 * version 2.0.16
 *
 * Copyright 2021 Rafał Jopek ( rafaljopek at hotmail com )
 *
 */

#include "hbsdl.h"

/* =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= */

// extern DECLSPEC int SDLCALL SDL_GetNumAudioDrivers(void);
// extern DECLSPEC const char *SDLCALL SDL_GetAudioDriver(int index);
// extern DECLSPEC int SDLCALL SDL_AudioInit(const char *driver_name);
// extern DECLSPEC void SDLCALL SDL_AudioQuit(void);
// extern DECLSPEC const char *SDLCALL SDL_GetCurrentAudioDriver(void);
// extern DECLSPEC int SDLCALL SDL_OpenAudio(SDL_AudioSpec * desired, SDL_AudioSpec * obtained);
// extern DECLSPEC int SDLCALL SDL_GetNumAudioDevices(int iscapture);
// extern DECLSPEC const char *SDLCALL SDL_GetAudioDeviceName(int index, int iscapture);
// extern DECLSPEC int SDLCALL SDL_GetAudioDeviceSpec(int index, int iscapture, SDL_AudioSpec *spec);
// extern DECLSPEC SDL_AudioDeviceID SDLCALL SDL_OpenAudioDevice(const char *device, int iscapture, const SDL_AudioSpec *desired, SDL_AudioSpec *obtained, int allowed_changes);
// extern DECLSPEC SDL_AudioStatus SDLCALL SDL_GetAudioStatus(void);
// extern DECLSPEC SDL_AudioStatus SDLCALL SDL_GetAudioDeviceStatus(SDL_AudioDeviceID dev);
// extern DECLSPEC void SDLCALL SDL_PauseAudio(int pause_on);
// extern DECLSPEC void SDLCALL SDL_PauseAudioDevice(SDL_AudioDeviceID dev, int pause_on);
// extern DECLSPEC SDL_AudioSpec *SDLCALL SDL_LoadWAV_RW(SDL_RWops * src, int freesrc, SDL_AudioSpec * spec, Uint8 ** audio_buf, Uint32 * audio_len);
// extern DECLSPEC void SDLCALL SDL_FreeWAV(Uint8 * audio_buf);
// extern DECLSPEC int SDLCALL SDL_BuildAudioCVT(SDL_AudioCVT * cvt, SDL_AudioFormat src_format, Uint8 src_channels, int src_rate, SDL_AudioFormat dst_format, Uint8 dst_channels, int dst_rate);
// extern DECLSPEC int SDLCALL SDL_ConvertAudio(SDL_AudioCVT * cvt);
// extern DECLSPEC SDL_AudioStream * SDLCALL SDL_NewAudioStream(const SDL_AudioFormat src_format, const Uint8 src_channels, const int src_rate, const SDL_AudioFormat dst_format, const Uint8 dst_channels, const int dst_rate);
// extern DECLSPEC int SDLCALL SDL_AudioStreamPut(SDL_AudioStream *stream, const void *buf, int len);
// extern DECLSPEC int SDLCALL SDL_AudioStreamGet(SDL_AudioStream *stream, void *buf, int len);
// extern DECLSPEC int SDLCALL SDL_AudioStreamAvailable(SDL_AudioStream *stream);
// extern DECLSPEC int SDLCALL SDL_AudioStreamFlush(SDL_AudioStream *stream);
// extern DECLSPEC void SDLCALL SDL_AudioStreamClear(SDL_AudioStream *stream);
// extern DECLSPEC void SDLCALL SDL_FreeAudioStream(SDL_AudioStream *stream);
// extern DECLSPEC void SDLCALL SDL_MixAudio(Uint8 * dst, const Uint8 * src, Uint32 len, int volume);
// extern DECLSPEC void SDLCALL SDL_MixAudioFormat(Uint8 * dst, const Uint8 * src, SDL_AudioFormat format, Uint32 len, int volume);
// extern DECLSPEC int SDLCALL SDL_QueueAudio(SDL_AudioDeviceID dev, const void *data, Uint32 len);
// extern DECLSPEC Uint32 SDLCALL SDL_DequeueAudio(SDL_AudioDeviceID dev, void *data, Uint32 len);
// extern DECLSPEC Uint32 SDLCALL SDL_GetQueuedAudioSize(SDL_AudioDeviceID dev);
// extern DECLSPEC void SDLCALL SDL_ClearQueuedAudio(SDL_AudioDeviceID dev);
// extern DECLSPEC void SDLCALL SDL_LockAudio(void);
// extern DECLSPEC void SDLCALL SDL_LockAudioDevice(SDL_AudioDeviceID dev);
// extern DECLSPEC void SDLCALL SDL_UnlockAudio(void);
// extern DECLSPEC void SDLCALL SDL_UnlockAudioDevice(SDL_AudioDeviceID dev);
// extern DECLSPEC void SDLCALL SDL_CloseAudio(void);
// extern DECLSPEC void SDLCALL SDL_CloseAudioDevice(SDL_AudioDeviceID dev);
