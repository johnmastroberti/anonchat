CXX=g++
INCFLAGS=-Iinclude
CXXFLAGS=-Wall -Wextra -Wpedantic -Weffc++ -Wshadow -Og -g $(INCFLAGS)
LD=g++
LDFLAGS=-lm
SRC=a.cpp
OBJ=$(SRC:%.cpp=obj/%.o) main.o

default: app

test:
	-echo $(SRC)
	-echo $(OBJ)

app: $(OBJ)
	$(LD) $(OBJ) -o $@ $(LDFLAGS)

obj/main.o: main.cpp include/a.hpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

obj/%.o: src/%.cpp include/%.hpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

