CC= clang
CFLAGS= -Wall -Wextra -Werror -Wpedantic -std=c17 -g

SRC_DIR= src
BIN_DIR= bin

SRC= $(wildcard $(SRC_DIR)/*.c)

TARGET= $(BIN_DIR)/vanken

all: $(TARGET)

$(TARGET): $(SRC)
	-@mkdir -p $(BIN_DIR)
	$(CC) $(CFLAGS) -o $(TARGET) $(SRC)

clean:
	rm -f $(TARGET)

run: $(TARGET)
	./$(TARGET)

.PHONY: all clean run