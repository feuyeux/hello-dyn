CXX = g++
CXXFLAGS = -std=c++11 -fPIC -O2
LDFLAGS = -shared

# 目标文件
LIBRARY = libcalculator.dylib
MAIN = calculator_loader

# 源文件
LIB_SOURCES = calculator_impl.cpp
MAIN_SOURCES = main.cpp

all: $(LIBRARY) $(MAIN)

$(LIBRARY): $(LIB_SOURCES)
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $@ $^

$(MAIN): $(MAIN_SOURCES)
	$(CXX) $(CXXFLAGS) -o $@ $^

clean:
	rm -f $(LIBRARY) $(MAIN)

run: all
	./$(MAIN)

.PHONY: all clean run
