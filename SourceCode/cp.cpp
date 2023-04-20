#include <iostream>
std::string Argf;
std::string Arg1;
std::string Arg2;

char Out[255];

int main(int argc, char *argv[]){

if(argc == 3){
	Arg1 = argv[1];
	Arg2 = argv[2];
	Argf = "copy " + Arg1 + " " + Arg2;

	for(int i = 0; Argf[i] != NULL; i++){

		Out[i] = Argf[i];	

	}

	system(Out);

}
else{
	std::cout << "Wrong Syntax" << std::endl;
}

}
