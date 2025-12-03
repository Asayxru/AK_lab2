CXX := g++
AR := ar
CXXFLAGS := -Iinclude -std=c++17 -O2 -Wall -Wextra -fPIC
SRCDIR := src
OBJDIR := build
BINDIR := bin

LIBNAME := calc
LIB := lib$(LIBNAME).a

SRCS := $(wildcard $(SRCDIR)/*.cpp)
OBJS := $(patsubst $(SRCDIR)/%.cpp, $(OBJDIR)/%.o, $(SRCS))

.PHONY: all clean dirs

all: dirs $(BINDIR)/calc_app

dirs:
	@mkdir -p $(OBJDIR) $(BINDIR)

$(OBJDIR)/add.o: $(SRCDIR)/add.cpp include/calc.h
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(OBJDIR)/main.o: $(SRCDIR)/main.cpp include/calc.h
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(LIB): $(OBJDIR)/add.o
	$(AR) rcs $@ $^

$(BINDIR)/calc_app: $(OBJDIR)/main.o $(LIB)
	$(CXX) $(CXXFLAGS) $^ -o $@

clean:
	rm -rf $(OBJDIR) $(BINDIR) $(LIB)

rebuild: clean all

