double root(double n,double e,int &count)
{//precondition : n >=0
	count=0;

	if(n<0)
	{
		count++;
		return -1;
	}
	else
	{
		double first(0),last(n),mid;

		if(n==0 || n==1)
		{
			count++;
			return n;
		}
		else
		{
			while((last-first)>=e)
			{
				//loop invariant : e const , first and last changes
				count++;
				mid=(first+last)/2;
				
				//critical operation
				if(mid*mid>n)
					last=mid;
				else
					first=mid;
			}
			//post condition : the root must found
			return mid;
		}
	}
}