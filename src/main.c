#include <stdio.h>
#include <stdlib.h>
#include <ncurses.h>
#include <unistd.h>

int main()
{
	initscr();

	move(3,3);
	addstr("Testing...");
	refresh();

	sleep(1);

	endwin();

	return 0;
}
