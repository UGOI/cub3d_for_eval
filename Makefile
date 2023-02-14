# Define compiler
CC = cc

BREW = $(shell which brew | rev | cut -c 9- | rev)
BREW_VERSION = $(shell ls $(BREW)/Cellar/glfw/)
GLFW = $(BREW)Cellar/glfw/$(BREW_VERSION)
LIBS = -L$(GLFW)/lib -lglfw -L./lib/MLX42 -lmlx42 -L./lib/libft -lft ./lib/gnl/get_next_line.c ./lib/gnl/get_next_line_utils.c

# Define source directories
SRCDIR = src

# Define object directories
OBJDIR = obj

# Define include directories
INCLUDES = -I./src/include
GLFW_INCLUDES = -I$(GLFW)/include/GLFW
MLX42_INCLUDES = -I./lib/MLX42/include

# Define compiler flags
CFLAGS = -Wall -Wextra -Werror

# Define main source file
MAIN = main.c

# Define source files
MAIN_SRC = $(SRCDIR)/$(MAIN)
# SRC := $(filter-out $(MAIN_SRC), $(shell find $(SRCDIR) -name '*.c'))
SRC := src/colors.c src/draw.c src/graphics_draw.c src/graphics_module.c src/map.c src/map_free.c src/map_remove_new_lines.c src/map_textures.c src/my_error.c src/my_math.c src/parser/parser_bottom_wall.c src/parser/parser_bottom_wall_utils.c src/parser/parser_cub3d.c src/parser/parser_cub3d_utils.c src/parser/parser_error_messg.c src/parser/parser_left_wall.c src/parser/parser_map_elements.c src/parser/parser_map_lines.c src/parser/parser_map_lines_utils.c src/parser/parser_map_textures.c src/parser/parser_right_wall.c src/parser/parser_surfaces.c src/parser/parser_surfaces_utils.c src/parser/parser_top_wall.c src/parser/parser_top_wall_end.c src/parser/parser_top_wall_start.c src/parser/parser_top_wall_utils.c src/parser/parser_utils.c src/parser/parser_wall_utils.c src/player.c src/player_movements.c src/raycasting.c src/raycasting_utils.c src/raycasting_utils2.c
# $(info VAR="$(SRC)")

# Define object files
OBJ = $(SRC:$(SRCDIR)/%.c=$(OBJDIR)/%.o)
MAIN_OBJ = obj/main.o

# Define executables
EXE = cub3d

# Define default target
all: libft $(EXE)
# Comment out the line above and uncomment the line below to compile without tests
# all: $(EXE)

# Define build target for production executable
$(EXE): $(OBJ) $(MAIN_OBJ)
	$(CC) $(CFLAGS) $(OBJ) $(MAIN_OBJ) $(LIBS) -o $(EXE)

# Define build target for production object files
$(OBJDIR)/%.o: $(SRCDIR)/%.c
	mkdir -p $(OBJDIR)
	mkdir -p $(OBJDIR)/parser
	$(CC) $(CFLAGS) $(INCLUDES) $(GLFW_INCLUDES) $(MLX42_INCLUDES) -c $< -o $@

run: all
	./$(EXE)

# Define target to clean up build files
clean:
	rm -rf $(OBJDIR)
	make -C lib/libft clean

fclean : clean
	rm -f $(EXE)
	make -C lib/libft fclean

re : fclean all

debug: CFLAGS += -g -fsanitize=address
debug: re

libft:
	make -C lib/libft

.PHONY: all clean fclean re
