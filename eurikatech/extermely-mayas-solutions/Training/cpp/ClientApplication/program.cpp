#include <iostream.h>



void PrintArray(double arr[],int n)
{
	cout<<"The Item of Array :\n";
	for(int i=0;i<n;i++)
		cout<<"item ["<<i<<"] = "<<arr[i]<<endl;
}

void SelectionSort(double arr[],int n)
{
	int idx=0;

	for(int phase=n-1;phase>0;phase--)
	{
		for(int i=0;i<=phase;i++)
			if(arr[i]>arr[idx])
				idx=i;

		double tmp=arr[i];
		arr[i]=arr[phase];
		arr[phase]=tmp;
	}
}

void main()
{
	double typeInp[]={34,65,23,76,45,34,87,45,65};

	PrintArray(typeInp,9);
	SelectionSort(typeInp,8);
	PrintArray(typeInp,9);

}