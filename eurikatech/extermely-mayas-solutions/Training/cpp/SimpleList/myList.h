

typedef int ListElementType;
const int maxSize=50;

class List
{
private:
	int count;
	int pos;
	ListElementType listArray[maxSize];
	
public:
	List();
	bool Insert(const ListElementType &e);
	bool First(ListElementType &e);
	bool Next(ListElementType &e);
	
};

List::List()
{
	pos=-1;
	count=0;
}

bool List::Insert(const ListElementType &e)
{
	//precondition : nothing
	//postcondition : list post=list pre + new item
	if(count<maxSize)
	{
		listArray[count++]=e;
		return true;
	}
	else
		return false;
}

bool List::First(ListElementType &e)
{
	//precondition : nothing
	//postcondition : if count == 0 nothing else e<-listArray[0]
	if(count>0)
	{
		pos=0;
		e=listArray[0];
		//return value : if count=0 return true and else return false
		return true;
	}
	else
		return false;
}

bool List::Next(ListElementType &e)
{
	//precondition : pos>=0
	//postcondition : if pos<count-1 then e=listArray[++pos]
	//return value : if precondition is true and postcondition is true then return true
	if(pos>-1&&pos<count-1)
	{
		e=listArray[++pos];
		return true;
	}
	else
		return false;

}
