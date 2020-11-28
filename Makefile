FLAGS = -std=c++17 -masm=intel -fconcepts -mlong-double-128 -ggdb3 -Wpedantic -Wall -Wextra -Wconversion -Wsign-conversion -Weffc++ -Wstrict-null-sentinel -Wold-style-cast -Wnoexcept -Wctor-dtor-privacy -Woverloaded-virtual -Wsign-promo -Wzero-as-null-pointer-constant -Wsuggest-final-types -Wsuggest-final-methods -Wsuggest-override -lquadmath 

all : zigzag_asm zigzag_cpp zigzag_print

zigzag_asm : zigzag_scan.asm
	nasm -f elf32 zigzag_scan.asm -o zigzag_scan.o

zigzag_cpp : zigzag_print.cpp
	g++ $(FLAGS) zigzag_print.cpp -m32 -c -o zigzag_print.o

zigzag_print : zigzag_scan.o zigzag_print.o
	g++ $(FLAGS) -m32 zigzag_scan.o zigzag_print.o -o zigzag_print