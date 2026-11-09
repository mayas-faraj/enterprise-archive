using System;

namespace Collections
{
    public struct Element
    {
        public Object Value;
        public Boolean IsUsed;

        public Element(Object value, Boolean used)
        {
            Value = value;
            IsUsed = used;
        }
    }

    public struct Collections
    {
        //private members
        private const Int32 COUNT_INITIAL = 4;
        private const Int32 GROWTH_MINIMUM = 2;
        private const Int32 GROWTH_PERCENT = 10;
        private const Int32 GARBAGE_PERCENT = 20;

        public Element[] list;
        public Int32 count;
        public Int32 garbageNum;

        private void redim(ref Element[] arrayList, Int32 elementCount)
        {
            if (arrayList != null)
            {
                if (elementCount <= 0)
                {
                    arrayList = null;
                }
                else
                {
                    Element[] newList = new Element[elementCount];

                    for (Int32 x = 0; x < arrayList.Length; x++)
                    {
                        newList[x] = arrayList[x];
                    }

                    arrayList = newList;
                }
            }
        }

        private void grabege(Element[] arrayList)
        {
            Int32 lstIdx = 0;
            Int32 usedLstIdx = 0;
            Element[] newList;

            for (Int32 i = 0; i < arrayList.Length; i++)
                if (arrayList[i].IsUsed)
                    usedLstIdx++;

            newList = new Element[usedLstIdx];

            for (Int32 i = 0; i < arrayList.Length; i++)
                if (arrayList[i].IsUsed)
                    newList[lstIdx++] = arrayList[i];
        }

        //public members
        

        public Collections(Int32 InitialCapacity)
        {
            list = new Element[InitialCapacity];
            count = 0;
            garbageNum = 0;
        }

        public void Add(Object item)
        {
            Element inpItem = new Element(item, true);
            
            if (count >= list.Length)
            {
                Int32 growth = Convert.ToInt32((list.Length * GROWTH_PERCENT) / 100);

                if (growth < GROWTH_MINIMUM)
                    growth = GROWTH_MINIMUM;

                redim(ref list, list.Length + growth);
            }

            list[count] = inpItem;
            count++;
        }

        public Int32 Remove(Object item)
        {
            Int32 removedCount = 0;

            for(Int32 i=0;i<list.Length;i++)
                if (list[i].Value == item)
                {
                    list[i].IsUsed = false;
                    count--;
                    garbageNum++;
                    removedCount++;

                    if (garbageNum >= Convert.ToInt32(GARBAGE_PERCENT * list.Length)/100)
                        grabege(list);
               }

            return removedCount;
        }
    }
}










