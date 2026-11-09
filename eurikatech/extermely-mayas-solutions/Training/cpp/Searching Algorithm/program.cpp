#include <iostream.h>
#include "searching.h"
#include "root.h"

void print(int array[],int n)
{
	cout<<"\nItem of array :";
	for(int i=0;i<n;i++)
	{
		cout<<"\nitem ["<<i<<"] = "<<array[i];
	}
}

void input(int array[],int n)
{
	cout<<"\nEnter elements of an array";

	for(int i=0;i<n;i++)
	{
		cout<<"\nItem ["<<i<<"] = ";
		cin>>array[i];
	}
}

int main()
{
	double n;
	int c;

	while (n!=9999)
	{
		cout<<"\nenter real number ?";

		cin>>n;
		cout<<"\npositive root of "<<n<<" is "<<root(n,0.0000001,c);
		cout<<" after "<<c<<" times .";
	}
}
