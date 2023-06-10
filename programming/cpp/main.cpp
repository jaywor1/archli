#include <iostream>
#include <string>

using std::cout;
using std::string;

int main(){

	bool delay{true};
	bool sleepy{false};
	bool notdrunk{true};
	bool songs{true};
	string mood{"PTK"};
	string endepende{"UNDERGROUND"};

	if(delay){
		cout << "bruh\n";
	}
	else{
		cout << "You are lucky :))))\n";
	}

	if(sleepy){
		cout << "GNGNGNGNNGNGNGNN\n";
	}
	else{
		cout << "You programmer shiit\n";
	}
	if(notdrunk){
		cout << "You are not drunk\n";
	}
	else{
		cout << "Jsem namrdanej jako kokot neslapej na boty ::)))))\n";
	}

	cout << "mood: " << mood << '\n';

	if(songs){
		cout << "banger af\n";
	}
	else{
		cout << "LAME SLEEPY HEAD\n";
	}

	cout << "Keyword: " << endepende << '\n';

	return 0;
}
