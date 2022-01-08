# Getting started

- [Harbour programming language](https://en.wikipedia.org/wiki/Harbour_(programming_language))
- [Homepage](https://harbour.github.io)
- Select your Harbour:
   - https://sourceforge.net/projects/harbour-project/files/
   - https://github.com/harbour/core
   - https://github.com/vszakats/harbour-core

## SDL HTML Manual

- [SDL 2.0 API by Name](http://wiki.libsdl.org/CategoryAPI)
- [SDL 2.0 API by Category](http://wiki.libsdl.org/APIByCategory)

## Installing on Windows

Downloading SDL Distributions for Windows.

- https://github.com/libsdl-org/SDL/releases/tag/release-2.0.18

Unpack in the directory:

```
c:\SDL\bin *.dll
c:\SDL\include *.h
c:\SDL\lib *.a
```

## Installing on Linux

```
sudo apt-get update
sudo apt-get install libsdl2-dev
```

or

```
git clone https://github.com/libsdl-org/SDL
cd SDL
mkdir build
cd build
../configure
make
sudo make install
```

## Installing on Mac OSX

Downloading SDL Distributions (Mac OSX)

- [Mac OSX 10.x, Intel](https://libsdl.org/release/SDL2-2.0.16.dmg)

## Install hb-sdl

- [Downloading hb-sdl](https://github.com/rjopek/hb-sdl/archive/refs/heads/master.zip)

Environment Variables

- Windows

   ```
   set HB_WITH_SDL=c:\SDL\include
   set PATH=c:\SDL\bin;%path%
   ```

- Linux

   ```
   export HB_WITH_SDL=/usr/include
   ```

- Build static library:

   ```
   hbmk2 hbsdl.hbp
   ```

- Build and run sample and test code:

   ```
   cd cd examples/harbour
   hbmk2 example_00.prg
   ./example_00
   ```

[Edit me](https://github.com/rjopek/hb-sdl/edit/main/examples/README.md)
