# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gverhelp <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/09 13:10:21 by gverhelp          #+#    #+#              #
#    Updated: 2020/09/08 18:24:47 by gverhelp         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = cub3D
LIBFT_PATH = ./libft
MINILIBX_PATH = ./miniLibX
#SRCS_LIST = main.c
#SRCS = $(addprefix ${FOLDER}/, ${SRCS_LIST})
SRCS = srcs/main.c \
	srcs/ft_init_struct.c \
	srcs/ft_raycasting.c \
	srcs/ft_raycasting2.c \
	srcs/ft_parsing.c \
	srcs/ft_parsing2.c \
	srcs/ft_parsing3.c \
	srcs/ft_checkpos.c \
	srcs/ft_keyboard.c \
	srcs/ft_keyboard2.c \
	srcs/ft_checkscreen.c \
	srcs/ft_checkskyfloor.c \
	srcs/ft_checkmap.c \
	srcs/ft_checkmap2.c \
	srcs/ft_checkmap3.c \
	srcs/ft_checktextures.c \
	srcs/ft_checktextures2.c \
	srcs/ft_parsing_sprites.c \
	srcs/ft_sprites.c \
	srcs/ft_sprites2.c \
	srcs/ft_bmp.c \
	srcs/ft_exit.c \

OBJS = ${SRCS:.c=.o}
INCLUDE = cube3d.h
LIBFT = libft
MINILIBX = miniLibX
CC = gcc -g -Wall -Wextra -Werror
RM = rm -f
MLXFLAGS = -I ./miniLibX -L ./miniLibX -lmlx -framework OpenGl -framework Appkit
LIBFLAGS = -I ./libft -L ./libft -L . ./libft/*.c 
# -I Add the directory dir to the list of directories to be searched for header files
# -L Searches the library when linking

all: libft_all minilibx_all ${NAME}
$(NAME): ${OBJS} 
		@$(CC) $(MLXFLAGS) $(LIBFLAGS) libft.a libmlx.a -I./ $(OBJS) -o $@

clean: libft_clean minilibx_clean
		@${RM} ${OBJS}

fclean: libft_fclean clean
		@${RM} ${NAME}

re: fclean all

# In this last section we make other makefiles compile with the -C flag
# The -C flag makes you go to the appropriate path and do the asked command
libft_all:
	 make -C $(LIBFT_PATH) all
	cp ./libft/libft.a libft.a

libft_clean:
	 make -C $(LIBFT_PATH) clean

libft_fclean:
	make -C $(LIBFT_PATH) fclean
	$(RM) libft.a

minilibx_all:
	make -C $(MINILIBX_PATH) all
	cp ./minilibX/libmlx.a libmlx.a

minilibx_clean:
	make -C $(MINILIBX_PATH) clean
	$(RM) libmlx.a

.PHONY: all fclean clean re

