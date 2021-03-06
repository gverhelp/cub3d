/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gverhelp <marvin@42.ff>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/11/11 19:18:29 by gverhelp          #+#    #+#             */
/*   Updated: 2020/11/11 20:57:38 by gverhelp         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../include/cub3d.h"

int	ft_checkerror(int argc, char **argv, t_list *list)
{
	if (argc <= 1 || argc > 3)
	{
		write(1, "Error\nError In The Arguments\n", 29);
		return (-1);
	}
	if (argc == 2 || argc == 3)
	{
		if ((!(ft_strrchr(argv[1], '.'))) ||
			(ft_strncmp(ft_strrchr(argv[1], '.'), ".cub\0", 5)))
		{
			write(1, "Error\nError not .cub\n", 21);
			return (-1);
		}
	}
	if ((argc == 3) && (ft_strncmp(argv[2], "--save\0", 7)))
	{
		write(1, "Error\nError In The Arguments\n", 29);
		return (-1);
	}
	if (ft_parsing(argv[1], list) == -1)
	{
		write(1, "Error\nError in the parsing\n", 27);
		return (-1);
	}
	return (0);
}

int	ft_start(t_list *list)
{
	if (!(list->mlx_win = mlx_new_window(list->mlx,
		list->screenwidth, list->screenheight, "Cub3d")))
		return (-1);
	if (!(list->img = mlx_new_image(list->mlx,
		list->screenwidth, list->screenheight)))
		return (-1);
	if (!(list->addr = (int*)mlx_get_data_addr(list->img,
		&list->bits_per_pixel, &list->line_length, &list->endian)))
		return (-1);
	if (ft_raycasting(list) == -1)
		return (-1);
	return (0);
}

int	main(int argc, char **argv)
{
	t_list	list;

	ft_init_list(&list);
	if (ft_checkerror(argc, argv, &list) == -1)
		return (ft_exit(&list));
	if (argc == 2)
	{
		if (ft_start(&list) == -1)
			return (ft_exit(&list));
		ft_readkeys(&list);
		mlx_loop(list.mlx);
	}
	if ((argc == 3) && (!ft_strncmp(argv[2], "--save\0", 7)))
	{
		if (ft_start(&list) == -1)
			return (ft_exit(&list));
		if (ft_bmp(&list) == -1)
			return (ft_exit(&list));
	}
	ft_exit(&list);
	return (0);
}
