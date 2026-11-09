namespace GenericClass
{
	internal class Program
	{
		private static void Main()
		{
			House h1=new House(5,6,3);
			House h2=new House(8,2,2);

            Merge<House> m = new Merge<House>(h1, h2);

            System.Console.WriteLine(m.Bigger);
            
		}
	}

	internal class House:System.IComparable<House>,System.IComparable
	{
		public House()
		{
			Width=Height=1;
			RoomsCount=1;

            
		}

		public House(System.Double width,System.Double height,System.Int32 roomsCount)
		{
			Width=width;Height=height;RoomsCount=roomsCount;
		}

		public System.Double Width
		{get{return width;}
		 set{width=value;}}

		public System.Double Height
		{get{return height;}
		 set{height=value;}}

		public 	System.Int32 RoomsCount
		{get{return roomsCount;}
		 set{roomsCount=value;}}

		public virtual System.Double Area()
		{
			return width*height;
		}

		public System.Int32 CompareTo(House house)
		{
			System.Console.WriteLine("Generic Compare.");

			if(this.Area()>house.Area())
				return 1;
			else
				if(this.Area()<house.Area())
					return -1;
				else
					return 0;
		}

		public System.Int32 CompareTo(System.Object obj)
		{
			System.Console.WriteLine("Generalized Compare.");
			return this.CompareTo((House)obj);
		}

        public override System.String ToString()
        {
            return System.String.Format("House:{0}*{1},Area:{1},Rooms Count:{2}.", width, height, Area(), roomsCount);
        }

		private System.Double width,height;
		private System.Int32 roomsCount;
	}

    internal class Merge<T> where T : System.IComparable
    {
        public Merge(params T[] ts)
        {
            System.Type t = typeof(T);

            if (ts.Length > 0)
                Bigger = ts[0];

            for (System.Int32 i = 0; i < ts.Length; i++)
                if (ts[i].CompareTo(Bigger) > 0)
                    Bigger = ts[i];
        }

        public T Bigger;
    }
}