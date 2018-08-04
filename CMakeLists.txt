cmake_minimum_required(VERSION 3.5 FATAL_ERROR)
project(first
	VERSION 0.1
	LANGUAGES C)

LIST(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

set(CMAKE_VERBOSE_MAKEFILE ON)

include(GNUInstallDirs)

set(CURSES_NEED_NCURSES TRUE)
find_package(Curses REQUIRED)

add_executable(first src/main.c)
target_link_libraries(first PRIVATE NCurses::NCurses)

if(MSVC)
  target_compile_options(first PRIVATE /W4 /WX)
else(MSVC)
  target_compile_options(first PRIVATE -Wall -Wextra -pedantic -Werror)
endif(MSVC)
