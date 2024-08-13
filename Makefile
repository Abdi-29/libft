#creating a makefile to run all my programs

SRC_DIR = src
OBJ_DIR = obj
INCLUDE = -I includes
NAME = libft.a
FLAGS = -Wextra -Werror -Wall

SRCS_LIBFT = ft_isalpha.c ft_isdigit.c ft_isalnum.c ft_isascii.c \
	   ft_isprint.c ft_strlen.c ft_memset.c ft_bzero.c \
	   ft_memcpy.c ft_memmove.c ft_memchr.c ft_memcmp.c \
	   ft_strlcpy.c ft_strlcat.c ft_strchr.c ft_strrchr.c \
	   ft_toupper.c ft_tolower.c ft_strncmp.c ft_strnstr.c \
	   ft_atoi.c ft_calloc.c ft_strdup.c ft_substr.c ft_strjoin.c \
	   ft_strtrim.c ft_split.c ft_putstr_fd.c ft_putchar_fd.c \
	   ft_putendl_fd.c ft_putnbr_fd.c ft_striteri.c ft_itoa.c \
	   ft_strmapi.c ft_lstnew.c ft_lstadd_front.c ft_lstsize.c \
		ft_lstlast.c ft_lstadd_back.c ft_lstdelone.c \
		ft_lstiter.c

SRCS_PRINTF = ft_printf/dec_c_str.c \
				ft_printf/ft_itoa_unsigned.c \
				ft_printf/ft_printf.c \
				ft_printf/ft_hexadecimal.c

SRCS_LIBFT += $(SRCS_PRINTF)

OBJ = $(patsubst %,$(OBJ_DIR)/%,$(SRC:.c=.o))
SRC = $(addprefix $(SRC_DIR)/, $(SRCS_LIBFT))




all: $(NAME)

$(NAME): $(OBJ)
	ar rc $(NAME) $(OBJ)

$(OBJ_DIR)/%.o: %.c
	@mkdir -p $(dir $@)
	$(CC) -c $(CFLAGS) $(INCLUDE) -o $@ $<

clean:
	rm  -rf $(OBJ_DIR)

fclean:	clean
	rm -f ${NAME}
	
re: fclean all

.PHONY: all clean fclean re
