find_package(PkgConfig)
pkg_check_modules(PC_NCurses QUIET ncurses)

find_path(NCurses_INCLUDE_DIR
	NAMES ncurses.h
	PATHS ${PC_NCurses_INCLUDE_DIRS}
	PATH_SUFFIXES ncurses
)

set(NCurses_LIBRARIES ${PC_NCurses_LIBRARIES})
set(NCurses_VERSION ${PC_NCurses_VERSION})

mark_as_advanced(NCurses_FOUND NCurses_INCLUDE_DIR NCurses_LIBRARIES NCurses_VERSION)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(NCurses
	REQUIRED_VARS NCurses_INCLUDE_DIR
	VERSION_VAR NCurses_VERSION
)

if (NCurses_FOUND)
	set(NCurses_INCLUDE_DIRS ${NCurses_INCLUDE_DIR})
endif()

if (NCurses_FOUND AND NOT TARGET NCurses::NCurses)
	add_library(NCurses::NCurses INTERFACE IMPORTED)
	set_target_properties(NCurses::NCurses PROPERTIES
		INTERFACE_INCLUDE_DIRECTORIES "${NCurses_INCLUDE_DIR}"
		INTERFACE_LINK_LIBRARIES "${NCurses_LIBRARIES}"
	)
endif()
