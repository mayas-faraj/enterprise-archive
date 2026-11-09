using System;
using System.Windows;
using System.Collections;

namespace Maniyat.ScanningSystem
{
    public class Block
    {
        //public constructures region
        public Block(String name, Int32Rect rectangle)
        {
            this.name = name;
            this.rectangle = rectangle;
        }

        public Block(String name, Point point1, Point point2)
        {
            this.name = name;

            if (point1.X > point2.X)
            {
                Double tmp = point1.X;
                point1.X = point2.X;
                point2.X = tmp;
            }

            if (point1.Y > point2.Y)
            {
                Double tmp = point1.Y;
                point1.Y = point2.Y;
                point2.Y = tmp;
            }

            rectangle = new Int32Rect((Int32)point1.X, (Int32)point1.Y, (Int32)point2.X - (Int32)point1.X, (Int32)point2.Y - (Int32)point1.Y);
        }

        //public properties region
        public String Name
        {
            get
            {
                return name;
            }
            set
            {
                name = value;
            }
        }

        public Int32Rect Rectangle
        {
            get
            {
                return rectangle;
            }
            set
            {
                rectangle = value;
            }
        }

        //private fields region
        private String name;
        private Int32Rect rectangle;
    }

    public class BlocksCollection : CollectionBase
    {
        //public functions region
        public void Add(Block block)
        {
            List.Add(block);
        }

        public void Remove(Block block)
        {
            List.Remove(block);
        }

        public void RemoveAt(Int32 index)
        {
            List.RemoveAt(index);
        }

        public Block this[Int32 index]
        {
            get
            {
                return (Block)List[index];
            }
            set
            {
                List[index] = value;
            }
        }
    }

    public class Question
    {
        //public constructure region
        public Question(String name)
        {
            this.name = name;
            blocks = new BlocksCollection();
        }

        public Question(String name, BlocksCollection blocks)
        {
            this.name = name;
            this.blocks = blocks;
        }

        //public properties region
        public String Name
        {
            get
            {
                return name;
            }
            set
            {
                name = value;
            }
        }

        public BlocksCollection Blocks
        {
            get
            {
                return blocks;
            }
            set
            {
                blocks = value;
            }
        }

        //private fields region
        private String name;
        private BlocksCollection blocks;
    }

    public class QuestionsCollection : CollectionBase
    {
        //public functions region
        public void Add(Question question)
        {
            List.Add(question);
        }

        public void Remove(Question question)
        {
            List.Remove(question);
        }

        public void RemoveAt(Int32 index)
        {
            List.RemoveAt(index);
        }

        public Question this[Int32 index]
        {
            get
            {
                return (Question)List[index];
            }
            set
            {
                List[index] = value;
            }
        }
    }

    public class Answer
    {
        //public constructures region
        public Answer(Question question)
        {
            this.answers = new Boolean[question.Blocks.Count];
            truthMark = falseMark = 0;
        }

        public Answer(Question question, Boolean[] answers)
        {
            this.question = question;
            this.answers = answers;
        }

        public Answer(Question question, Boolean[] answers, Double truthMark, Double falseMark)
        {
            this.question = question;
            this.answers = answers;
            this.truthMark = truthMark;
            this.falseMark = falseMark;
        }

        //public properties region
        public Question Question
        {
            get
            {
                return question;
            }
            set
            {
                question = value;
            }
        }

        public Boolean[] Answers
        {
            get
            {
                return answers;
            }
            set
            {
                answers = value;
            }
        }

        public Double TruthMark
        {
            get
            {
                return truthMark;
            }
            set
            {
                truthMark = value;
            }
        }

        public Double FalseMark
        {
            get
            {
                return falseMark;
            }
            set
            {
                falseMark = value;
            }
        }

        //private fields region
        private Question question;
        private Boolean[] answers;
        private Double truthMark;
        private Double falseMark;
    }

    public class AnswersCollection : CollectionBase
    {
        //public functions region
        public void Add(Answer answer)
        {
            List.Add(answer);
        }

        public void Remove(Answer answer)
        {
            List.Remove(answer);
        }

        public void RemoveAt(Int32 index)
        {
            List.RemoveAt(index);
        }

        public Answer this[Int32 index]
        {
            get
            {
                return (Answer)List[index];
            }
            set
            {
                List[index] = value;
            }
        }
    }

    public class IdLevel
    {
        //public constructures region
        public IdLevel(Int32 level)
        {
            this.level = level;
            this.blocks = new BlocksCollection();
        }

        public IdLevel(Int32 level, BlocksCollection blocks)
        {
            this.level = level;
            this.blocks = blocks;
        }

        //public fields region
        public Int32 Level
        {
            get
            {
                return level;
            }
            set
            {
                level = value;
            }
        }

        public BlocksCollection Blocks
        {
            get
            {
                return blocks;
            }
            set
            {
                blocks = value;
            }
        }

        //private fields region
        private Int32 level;
        private BlocksCollection blocks;
    }

    public class IdLevelsCollection : CollectionBase
    {
        //public functions region
        public void Add(IdLevel idLevel)
        {
            List.Add(idLevel);
        }

        public void Remove(IdLevel idLevel)
        {
            List.Remove(idLevel);
        }

        public void RemoveAt(Int32 index)
        {
            List.RemoveAt(index);
        }

        public IdLevel this[Int32 index]
        {
            get
            {
                return (IdLevel)List[index];
            }
            set
            {
                List[index] = value;
            }
        }
    }

    public class Option
    { 
        //public constructures region
        public Option(String name)
        {
            this.name = name;
            this.blocks = new BlocksCollection();
        }

        public Option(String name, BlocksCollection blocks)
        {
            this.name = name;
            this.blocks = blocks;
        }

        //public properties region
        public String Name
        {
            get
            {
                return name;
            }
            set
            {
                name = value;
            }
        }

        public BlocksCollection Blocks
        {
            get
            {
                return blocks;
            }
            set
            {
                blocks = value;
            }
        }

        //private fields region
        private String name;
        private BlocksCollection blocks;
    }

    public class AnswersOption : Option
    {
        //public constructures region
        public AnswersOption(String name, AnswersCollection answers)
            : base(name)
        {
            this.answers = answers;
        }

        public AnswersOption(String name, BlocksCollection blocks, AnswersCollection answers)
            :base(name,blocks)
        {
            this.answers = answers;
        }

        //public properties region
        public AnswersCollection Answers
        {
            get
            {
                return answers;
            }
            set
            {
                answers = value;
            }
        }

        //private fields region
        private AnswersCollection answers;
    }

    public class PathOption : Option
    {
        //public constructures region
        public PathOption(String name, String path)
            : base(name)
        {
            this.path = path;
        }

        public PathOption(String name, BlocksCollection blocks, String path)
            : base(name, blocks)
        {
            this.path = path;
        }

        //public properties region
        public String Path
        {
            get
            {
                return path;
            }
            set
            {
                path = value;
            }
        }

        //private fields region
        private String path;
    }

    public class OptionsCollection : CollectionBase
    {
        //public functions region
        public void Add(Option option)
        {
            List.Add(option);
        }

        public void Remove(Option option)
        {
            List.Remove(option);
        }

        public void RemoveAt(Int32 index)
        {
            List.RemoveAt(index);
        }

        public Option this[Int32 index]
        {
            get
            {
                return (Option)List[index];
            }
            set
            {
                List[index] = value;
            }
        }
    }

    public class Student
    {
        //public constructures region
        public Student(String name)
        {
            this.name = name;
        }

        public Student(String name, Int32 id)
            : this(name)
        {
            this.id = id;
        }

        public Student(String name, Int32 id, String code, String college, String city)
            : this(name, id)
        {
            this.code = code;
            this.college = college;
            this.city = city;
        }

        //public properties region
        public String Name
        {
            get
            {
                return name;
            }
            set
            {
                name = value;
            }
        }

        public Int32 Id
        {
            get
            {
                return id;
            }
            set
            {
                id = value;
            }
        }

        public String Code
        {
            get
            {
                return code;
            }
            set
            {
                code = value;
            }
        }

        public String College
        {
            get
            {
                return college;
            }
            set
            {
                college = value;
            }
        }

        public String City
        {
            get
            {
                return city;
            }
            set
            {
                city = value;
            }
        }

        //private fields region
        private Int32 id;
        private String code;
        private String name;
        private String college;
        private String city;
    }

    public class Class1
    {
    }
}
