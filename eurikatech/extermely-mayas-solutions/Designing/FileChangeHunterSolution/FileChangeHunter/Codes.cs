using System;
using System.Collections.Generic;
using System.Text;

namespace FileChangeHunter
{
    public class ChangeLog
    {
        public ChangeLog(String name, ChangeState state)
        {
            Name = name;
            State = state;
        }

        public ChangeLog(String name, ChangeState state, Int64 oldSize, Int64 newSize, Int32 oldHash, Int32 newHash, DateTime orginalModifiedDate, DateTime modifiedDate)
            : this(name, state)
        {
            OldSize = oldSize;
            NewSize = newSize;
            OldHash = oldHash;
            NewHash = newHash;
            OrginalModifiedDate = orginalModifiedDate;
            ModifiedDate = modifiedDate;
        }

        public String Name
        {
            get;
            set;
        }

        public ChangeState State
        {
            get;
            set;
        }

        public Int64 OldSize
        {
            get;
            set;
        }

        public Int64 NewSize
        {
            get;
            set;
        }

        public Int32 OldHash
        {
            get;
            set;
        }

        public Int32 NewHash
        {
            get;
            set;
        }

        public DateTime OrginalModifiedDate
        {
            get;
            set;
        }

        public DateTime ModifiedDate
        {
            get;
            set;
        }

        public override String ToString()
        {
            String result = Name + ' ' + State.ToString();

            if (OldSize != NewSize)
                result += " Size from " + OldSize + " To " + NewSize;

            if (OldHash != NewHash)
                result += " Hash from " + OldHash + " To " + NewHash;

            if (OrginalModifiedDate != ModifiedDate)
                result += " Orginal Date " + OrginalModifiedDate.ToString() + " To " + ModifiedDate.ToString();

            return result;
        }
    }

    public class FileState
    {
        public FileState()
        {
        }

        public FileState(String name)
        {
            this.Name = name;
        }

        public String Name
        {
            get;
            set;
        }

        public Int64 Size
        {
            get;
            set;
        }

        public Int32 Hash
        {
            get;
            set;
        }

        public DateTime Modified
        {
            get;
            set;
        }
    }

    public class FileStateCollection : System.Collections.CollectionBase
    {
        public Int32 Add(FileState fileState)
        {
            return List.Add(fileState);
        }

        public void Remove(FileState fileState)
        {
            List.Remove(fileState);
        }

        public FileState this[Int32 index]
        {
            get
            {
                return (FileState)List[index];
            }
            set
            {
                List[index] = value;
            }
        }
    }

    public class Hunter
    {
        public event EventHandler ProgressChanged;

        public FileStateCollection FirstStates
        {
            get;
            set;
        }

        public FileStateCollection SecondeStates
        {
            get;
            set;
        }

        public Boolean CheckSize
        {
            get;
            set;
        }

        public Boolean CheckHashCode
        {
            get;
            set;
        }

        public Boolean CheckModifiedDate
        {
            get;
            set;
        }

        public System.Collections.Generic.List<ChangeLog> Hunt()
        {
            if (FirstStates != null && SecondeStates != null)
            {
                System.Collections.Generic.List<ChangeLog> result = new System.Collections.Generic.List<ChangeLog>();
                Int32 totalFiles = SecondeStates.Count;

                for (Int32 i = SecondeStates.Count - 1; i >= 0; i--)
                {
                    for (Int32 j = FirstStates.Count - 1; j >= 0; j--)
                    {
                        if (SecondeStates[i].Name == FirstStates[j].Name)
                        {
                            if (SecondeStates[i].Size != FirstStates[j].Size ||
                                SecondeStates[i].Modified != FirstStates[j].Modified ||
                                SecondeStates[i].Hash != FirstStates[j].Hash)
                            {
                                FileState f = FirstStates[j];
                                FileState s = SecondeStates[i];

                                result.Add(new ChangeLog(f.Name, ChangeState.Modified, f.Size, s.Size, f.Hash, s.Hash, f.Modified, s.Modified));
                            }

                            SecondeStates.RemoveAt(i);
                            FirstStates.RemoveAt(j);
                            break;
                        }
                    }

                    if (ProgressChanged != null)
                        ProgressChanged(this, new ProgressEventArgs((i * 100 / totalFiles)));
                }

                foreach (FileState created in SecondeStates)
                    result.Add(new ChangeLog(created.Name, ChangeState.Created, 0, created.Size, 0, created.Hash, new DateTime(), created.Modified));

                foreach (FileState deleted in FirstStates)
                    result.Add(new ChangeLog(deleted.Name, ChangeState.Deleted, deleted.Size, 0, deleted.Hash, 0, deleted.Modified, new DateTime()));

                if (ProgressChanged != null)
                    ProgressChanged(this, new ProgressEventArgs(0));

                return result;
            }
            else
                return null;
        }

        public void SaveStates(String fileName, FileStateCollection fileStates)
        {
            //save memory object
            System.Xml.Serialization.XmlSerializer serializer = new System.Xml.Serialization.XmlSerializer(typeof(FileStateCollection), "Configures");
            System.IO.StreamWriter sw = new System.IO.StreamWriter(fileName, false);

            serializer.Serialize(sw, fileStates);
            sw.Close();
        }

        public void LoadStates(String fileName, out FileStateCollection fileStates)
        {
            System.Xml.Serialization.XmlSerializer serializer = new System.Xml.Serialization.XmlSerializer(typeof(FileStateCollection), "Configures");
            System.IO.StreamReader sr = new System.IO.StreamReader(fileName);

            fileStates = (FileStateCollection)serializer.Deserialize(sr);
            sr.Close();
        }

        public void GetFiles(String directory, ref FileStateCollection fileStates, Boolean recycleBinContent, Boolean internetFileContent, Boolean emptyFolder)
        {
            //precondition: result is not null
            try
            {
                if (!recycleBinContent)
                    if (directory.ToLower().EndsWith("$recycle.bin") || directory.EndsWith("recycled") || directory.ToLower().EndsWith("recycler") || directory.ToLower().EndsWith("system volume information"))
                        return;

                if (!internetFileContent)
                    if (directory.ToLower().EndsWith("_files"))
                        return;

                String[] files = System.IO.Directory.GetFiles(directory);

                if (emptyFolder && files.Length == 0)
                    return;

                foreach (String file in files)
                {
                    System.IO.FileInfo fi = new System.IO.FileInfo(file);
                    FileState fs = new FileState(fi.Name);

                    if (CheckSize)
                        fs.Size = fi.Length;

                    if (CheckModifiedDate)
                        fs.Modified = fi.LastWriteTime;

                    if (CheckHashCode)
                    {
                        System.IO.StreamReader f = fi.OpenText();
                        fs.Hash = f.ReadToEnd().GetHashCode();
                        f.Close();
                    }

                    fileStates.Add(fs);
                }

                if (System.IO.Directory.GetDirectories(directory).Length == 0)
                    return;
                else
                {
                    foreach (String subDirectory in System.IO.Directory.GetDirectories(directory))
                        GetFiles(subDirectory, ref fileStates, recycleBinContent, internetFileContent, emptyFolder);
                }
            }
            catch
            {
            }
        }
    }

    public class ProgressEventArgs : EventArgs
    {
        public ProgressEventArgs(Double value)
        {
            this.Value = value;
        }

        public Double Value
        {
            get;
            set;
        }
    }

    public enum ChangeState
    {
        None,
        Created,
        Modified,
        Deleted
    }
}
