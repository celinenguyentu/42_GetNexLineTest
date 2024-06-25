NAME		=	gnl
CC			=	cc
CFLAGS		=	-Wall -Wextra -Werror -g3

GNL_DIR		=	./..

MSRCS		=	srcs/mandatory_tests.c \
				$(addprefix ${GNL_DIR}/, get_next_line.c) \
				$(addprefix ${GNL_DIR}/, get_next_line_utils.c)
BSRCS		=	srcs/bonus_tests.c \
				$(addprefix ${GNL_DIR}/, get_next_line_bonus.c) \
				$(addprefix ${GNL_DIR}/, get_next_line_utils_bonus.c)

MOFILES		=	${MSRCS:.c=.o}
BOFILES		=	${BSRCS:.c=.o}

.c.o: 
			@${CC} ${CFLAGS} ${OPTION} -c -I ${GNL_DIR} $< -o $@

all:		${NAME}

${NAME}:	${MOFILES}
			@${CC} ${CFLAGS} ${OPTION} ${MOFILES} -I ${GNL_DIR} -o ${NAME}

bonus:		${BOFILES}
			@${CC} ${CFLAGS} ${OPTION} ${BOFILES} -o ${NAME}

clean:
			@rm -rf ${MOFILES} ${BOFILES} 

fclean: clean
			@rm -rf ${NAME}

re: fclean all

.PHONY: all clean fclean re bonus 
