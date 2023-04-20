#include <iostream>
std::string Argf;
std::string Argv;

char Out[255];

int main(int argc, char *argv[]){

if(argc == 1){

system("dir");

}

else if(argc == 2){
	Argv = argv[1];
	Argf = "dir " + Argv;

	for(int i = 0; Argf[i] != NULL; i++){

		Out[i] = Argf[i];	

	}

	system(Out);

}
else{
	std::cout << "Wrong Syntax" << std::endl;
}

}
