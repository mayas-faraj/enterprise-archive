void SelectionSort(double arr[],int n)
{
	int idx=0;

	for(int phase=n-1;n>0;n--)
	{
		for(int i=0;i<=phase;i++)
			if(arr[i]>arr[idx])
				idx=i;

		double tmp=arr[i];
		arr[i]=arr[phase];
		arr[phase]=tmp;
	}
}