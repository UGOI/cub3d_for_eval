/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   colors.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: sdukic <sdukic@student.42heilbronn.de>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/01/30 19:52:22 by stefan            #+#    #+#             */
/*   Updated: 2023/02/12 18:51:39 by sdukic           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef COLORS_H
# define COLORS_H

int	get_rgba(int r, int g, int b, int a);

int	get_r(int rgba);

int	get_g(int rgba);

int	get_b(int rgba);

int	get_a(int rgba);

#endif
