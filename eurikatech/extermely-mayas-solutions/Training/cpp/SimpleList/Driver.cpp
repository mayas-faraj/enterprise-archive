#include <iostream.h>
#include "myList.h"

void main()
{
	List lst;
	ListElementType e;
	bool cont=true;

	while(true)
	{
		cout<<"enter the value , -9999 to end ?";
		cin>>e;

		if(e==-9999||!lst.Insert(e))
			break;
	
	}

	cout<<"\nthe item of the list";

	for(bool val=lst.First(e);val;val=lst.Next(e))
		cout<<"\n"<<e;

}