int lsmf(int array[],int length,int target,int &count)
{
	//precondition : array is not empty
	count=0;

	for(int i=0;i<length;i++)
	{
		count++;
		//crical operation
		if(array[i]==target)
		{
			if(i>0)
			{
				/*loop invariant : i not changed in loop
				  take value from 0 to n-1 */
				int tmp=array[i];
				array[i]=array[i-1];
				array[i-1]=tmp;
			}
			//post condition : return index
			return i;
		}
	}

	//postcondition : item not found
	return -1;
}

int binarySearch(int array[],int length,int target,int &count)
{
	//precondition : array is an integer array not null
	//				 and ordered acssend order

	int first=0,last=length-1,mid;

	count=0;

	while(first<=last)
	{
		//loop invariant : the range decrase into first>last (+1 effect)
		count++;
		mid=(int)((first+last)/2);
		//critical operation
		if(array[mid]==target)
			//postcondition : return the value or else return -1
			return mid;
		else
			if(array[mid]>target)
				last=mid-1;
			else
				first=mid+1;
	}
	return -1;
}
