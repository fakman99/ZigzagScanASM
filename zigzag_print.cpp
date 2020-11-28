#include<iostream>
#include<string>
#include<cstdint>
#include <iostream>

//Signature des fonctions
extern "C" std::int8_t* zigzag_scan(std::int8_t* table_source,std::int8_t* array_dest);
extern "C" void print_array(std::int8_t* array, std::uint32_t length);

void print_array(std::int8_t* array, std::uint32_t length){
	//Imprime les élèments du tableau dest
	for (uint32_t i=0; i<length; i++)
    {
        std::cout <<  std::to_string(array[i]) << " ";
    }
	std::cout << std::endl;
}

int main()
{
	int8_t source[] = {
		 1,  2,  6,  7, 15, 16, 28, 29,
		 3,  5,  8, 14, 17, 27, 30, 43,
		 4,  9, 13, 18, 26, 31, 42, 44,
		10, 12, 19, 25, 32, 41, 45, 54,
		11, 20, 24, 33, 40, 46, 53, 55,
		21, 23, 34, 39, 47, 52, 56, 61,
		22, 35, 38, 48, 51, 57, 60, 62,
		36, 37, 49, 50, 58, 59, 63, 64
	}; 
	
	int8_t dest[64] = {};
	
	//déclaration du pointeur contenant l'adresse du début de la table source
	int8_t *pointeur_source = source; 
 	//déclaration du pointeur contenant l'adresse du vecteur de destination
	int8_t *pointeur_dest = dest;  

	zigzag_scan(pointeur_source, pointeur_dest);
	return 0;
}