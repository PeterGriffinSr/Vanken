CC = clang
CFLAGS = `pkg-config --cflags gtk+-3.0`
LIBS = `pkg-config --libs gtk+-3.0`
SRC_DIR = src
BIN_DIR = bin

SRC = $(wildcard $(SRC_DIR)/*.c)
TARGET = $(BIN_DIR)/gtk-app

ifeq ($(OS),Windows_NT)
	TARGET := $(TARGET).exe
	CFLAGS += -mwindows
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Linux)
		CFLAGS += -D_LINUX
	endif
endif

all: $(BIN_DIR) $(TARGET)

$(BIN_DIR):
	mkdir -p $(BIN_DIR)

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) -o $@ $^ $(LIBS)

clean:
	rm -f $(TARGET)