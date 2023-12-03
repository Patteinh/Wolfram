##
## EPITECH PROJECT, 2023
## MAKEFILE
## File description:
## MAKEFILE
##

NAME := wolfram

BIN_PATH := $(shell stack path --local-install-root)

all: $(NAME)

$(NAME):
	stack build
	cp $(BIN_PATH)/bin/$(NAME)-exe ./$(NAME)

clean:
	stack clean

fclean: clean
		rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
