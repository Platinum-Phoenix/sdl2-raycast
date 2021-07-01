SOURCES=$(wildcard src/*.cpp)
OBJECTS=$(SOURCES:.cpp=.o)
LDFLAGS=-lsdl2 -lsdl2_mixer
BIN=bin/sdl-raycast
CXXFLAGS = -Wall -pedantic -O3 -fno-tree-vectorize
CXXFLAGS += $(shell sdl2-config --cflags)

.PHONY: all
all: $(BIN)

$(BIN): $(OBJECTS)
	$(CXX) $(LDFLAGS) -o $@ $^

%.o: %.cpp
	$(CXX) -o $@ -c $< $(CXXFLAGS)
clean:
	rm -rf $(BIN) $(OBJECTS)

