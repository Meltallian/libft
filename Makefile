NAME = libft.a
# Variables
CC = gcc
CFLAGS = -Wall -Wextra -Werror
SRC = \
	ft_atoi.c ft_bzero.c ft_calloc.c ft_isalnum.c ft_isalpha.c ft_isascii.c \
	ft_isdigit.c ft_isprint.c ft_memchr.c ft_memcmp.c ft_memcpy.c ft_memmove.c \
	ft_memset.c ft_strchr.c ft_strdup.c ft_strjoin.c ft_strlcat.c \
	ft_strlcpy.c ft_strlen.c ft_strncmp.c ft_strnstr.c ft_strrchr.c \
	ft_substr.c ft_tolower.c ft_toupper.c ft_strtrim.c ft_split.c \
	ft_itoa.c ft_strmapi.c ft_striteri.c ft_putchar_fd.c ft_putstr_fd.c \
	ft_putendl_fd.c ft_putnbr_fd.c ft_usitoa.c

SRC_bonus = ft_lstnew.c ft_lstadd_front.c ft_lstsize.c ft_lstlast.c \
	ft_lstadd_back.c ft_lstdelone.c ft_lstclear.c ft_lstiter.c \
	ft_lstmap.c

OBJ = $(SRC:.c=.o)
OBJ_bonus = $(SRC_bonus:.c=.o)
INCLUDES_DIR = -I./includes
TARGET = libft.a

#Default target (target is the name of the final executable)
all: $(NAME)

#Linking
$(NAME): $(OBJ)
	ar rcs $(NAME) $(OBJ)

# Compiling
%.o: %.c
	$(CC) $(CFLAGS) $(INCLUDES_DIR) -c $< -o $@

#bonus
bonus: $(OBJ_bonus)
	ar rcs $(NAME) $(OBJ_bonus)

# Cleaning up
clean:
	rm -f *.o $(TARGET)

fclean: clean
	rm -f $(NAME)

re: fclean all

# Run target (if you want to compile and then immediately run)
run: $(TARGET)
	./$(TARGET)

%_run: %.c
	$(CC) $(CFLAGS) $(INCLUDES_DIR) $< -o $*_prog
	./$*_prog
	rm -f $*_prog

# Protecting
.PHONY: all clean fclean re run