#include <iostream>

#include <string>

using std::cout;
using std::string;

class Human{
public:

	string Name;
	int Age;
	int Weight;
	bool Gender;

	Human(string name,int age,int weight,bool gender){
		Name = name;
		Age = age;
		Weight = weight;
		Gender = gender;
	}

	void whoami(){
		cout << Name << '\n';
    	cout << Age << '\n';
    	cout << Weight << '\n';

    	if(Gender){
        	cout << "Gender: Man\n";
    	}
  		else{
	        cout << "Gender: Woman\n";
	    }

	}


};

int main(){

	Human h = Human(":)",17,55,0);

	h.whoami();

	return 0;
}
