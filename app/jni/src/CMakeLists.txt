cmake_minimum_required(VERSION 3.6)

project(ai5)

set(AI5_DIR "${CMAKE_CURRENT_SOURCE_DIR}/ai5-sdl2")
set(LIBAI5_DIR "${AI5_DIR}/subprojects/libai5")
set(NULIB_DIR "${LIBAI5_DIR}/nulib")
set(LIBPNG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/../SDL_image/external/libpng")

set(SOURCES
    font_tahoma.c
    font_dotgothic.c
    font_kosugi.c
    font_noto.c

    ${AI5_DIR}/src/aishimai.c
    ${AI5_DIR}/src/anim.c
    ${AI5_DIR}/src/asset.c
    ${AI5_DIR}/src/backlog.c
    ${AI5_DIR}/src/beyond.c
    ${AI5_DIR}/src/classics.c
    ${AI5_DIR}/src/cmdline.c
    ${AI5_DIR}/src/cursor.c
    ${AI5_DIR}/src/debug.c
    ${AI5_DIR}/src/doukyuusei.c
    ${AI5_DIR}/src/doukyuusei2.c
    ${AI5_DIR}/src/dungeon.c
    ${AI5_DIR}/src/effect.c
    ${AI5_DIR}/src/gfx.c
    ${AI5_DIR}/src/ini.c
    ${AI5_DIR}/src/input.c
    ${AI5_DIR}/src/isaku/isaku.c
    ${AI5_DIR}/src/isaku/item_window.c
    ${AI5_DIR}/src/kakyuusei.c
    ${AI5_DIR}/src/main.c
    ${AI5_DIR}/src/map.c
    ${AI5_DIR}/src/menu.c
    ${AI5_DIR}/src/popup_menu.c
    ${AI5_DIR}/src/savedata.c
    ${AI5_DIR}/src/shangrlia.c
    ${AI5_DIR}/src/shuusaku/menu.c
    ${AI5_DIR}/src/shuusaku/name.c
    ${AI5_DIR}/src/shuusaku/schedule.c
    ${AI5_DIR}/src/shuusaku/schedule_data.c
    ${AI5_DIR}/src/shuusaku/shuusaku.c
    ${AI5_DIR}/src/shuusaku/status.c
    ${AI5_DIR}/src/shuusaku/view.c
    ${AI5_DIR}/src/sys.c
    ${AI5_DIR}/src/text.c
    ${AI5_DIR}/src/texthook.c
    ${AI5_DIR}/src/vm.c
    ${AI5_DIR}/src/yuno.c
    ${AI5_DIR}/src/audio_sdl_mixer.c

    ${LIBAI5_DIR}/src/a6.c
    ${LIBAI5_DIR}/src/anim.c
    ${LIBAI5_DIR}/src/arc/open.c
    ${LIBAI5_DIR}/src/ccd.c
    ${LIBAI5_DIR}/src/cg/akb.c
    ${LIBAI5_DIR}/src/cg/cg.c
    ${LIBAI5_DIR}/src/cg/gp4.c
    ${LIBAI5_DIR}/src/cg/gp8.c
    ${LIBAI5_DIR}/src/cg/gpr.c
    ${LIBAI5_DIR}/src/cg/gpx.c
    ${LIBAI5_DIR}/src/cg/g16_24_32.c
    ${LIBAI5_DIR}/src/cg/gcc.c
    ${LIBAI5_DIR}/src/cg/png.c
    ${LIBAI5_DIR}/src/game.c
    ${LIBAI5_DIR}/src/lzss.c
    ${LIBAI5_DIR}/src/mes/codes.c
    ${LIBAI5_DIR}/src/mes/parse.c
    ${LIBAI5_DIR}/src/mes/parse_aiw.c
    ${LIBAI5_DIR}/src/mes/print.c
    ${LIBAI5_DIR}/src/mes/print_aiw.c
    ${LIBAI5_DIR}/src/mes/system.c

    ${NULIB_DIR}/src/buffer.c
    ${NULIB_DIR}/src/command.c
    ${NULIB_DIR}/src/file.c
    ${NULIB_DIR}/src/hashset.c
    ${NULIB_DIR}/src/port.c
    ${NULIB_DIR}/src/sds.c
    ${NULIB_DIR}/src/system.c
    ${NULIB_DIR}/src/utfsjis.c

    ${LIBPNG_DIR}/png.c
    ${LIBPNG_DIR}/pngerror.c
    ${LIBPNG_DIR}/pngget.c
    ${LIBPNG_DIR}/pngmem.c
    ${LIBPNG_DIR}/pngpread.c
    ${LIBPNG_DIR}/pngread.c
    ${LIBPNG_DIR}/pngrio.c
    ${LIBPNG_DIR}/pngrtran.c
    ${LIBPNG_DIR}/pngrutil.c
    ${LIBPNG_DIR}/pngset.c
    ${LIBPNG_DIR}/pngtrans.c
    ${LIBPNG_DIR}/pngwio.c
    ${LIBPNG_DIR}/pngwrite.c
    ${LIBPNG_DIR}/pngwtran.c
    ${LIBPNG_DIR}/pngwutil.c
)

add_library(main SHARED ${SOURCES})

target_compile_definitions(main PRIVATE
    _DEFAULT_SOURCE
    USE_SDL_MIXER
    EMBED_DOTGOTHIC
    EMBED_KOSUGI
    EMBED_TAHOMA
    EMBED_NOTO
    AI5_DATA_DIR="/sdcard/YuNo"
    PNG_ARM_NEON_OPT=0
)

target_include_directories(main PRIVATE
    ${AI5_DIR}/include
    ${LIBAI5_DIR}/include
    ${NULIB_DIR}/include
    ${LIBPNG_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/../SDL/include
    ${CMAKE_CURRENT_SOURCE_DIR}/../SDL_image
    ${CMAKE_CURRENT_SOURCE_DIR}/../SDL_ttf
    ${CMAKE_CURRENT_SOURCE_DIR}/../SDL_mixer
)

target_link_libraries(main
    SDL2
    SDL2_image
    SDL2_ttf
    SDL2_mixer
    m
    log
    z
)
