# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sipatry <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/11/12 17:44:06 by sipatry           #+#    #+#              #
#    Updated: 2019/03/27 13:43:38 by sipatry          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = fillit

SRC = src/check_errors.c \
	  src/create_lst.c \
	  src/fillit.c \
	  src/functions.c \
	  src/int_sorting.c \
	  src/tetri_min.c \
	  src/tools.c \
	  src/main.c

INCLUDE = include/fillit.h 

LIBFT = libft/libft.a

OBJS= $(SRC:.c=.o)

FLAGS = -Wall -Wextra -Werror

$(NAME): $(LIBFT) $(OBJS) 
	gcc $(FLAGS) -include $(INCLUDE) -o $(NAME) $(OBJS) $(LIBFT) 

$(LIBFT):
	make -C libft/

%.o: %.c fillit.h Makefile
	gcc $(FLAGS) -include $(INCLUDE) -o $@ -c $<

all: $(NAME)


.PHONY: clean

clean: 
	@make -C libft/ clean
	@rm -f $(OBJS)

fclean: clean
	@make -C libft/ fclean
	@rm -f $(NAME)

re: fclean all
