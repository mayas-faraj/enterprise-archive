using System;

namespace DomainsManager
{
    public enum DataState
    {
        unchanged,
        added,
        modified,
        deleted
    }

    public class PeriodTime
    {
        public DateTime Start;
        public DateTime End;

        private String description;

        public String Description
        {
            get
            {
                return description;
            }
            set
            {
                description = CommonOperator.CheckStringLength("PeriodTime.Description", value, 0, 150);
            }
        }
    }

    public struct CommonOperator
    {
        public static String CheckStringLength(String ParamName, String stringValue, Int32 minLength, Int32 maxLength)
        {
            if (stringValue.Length <= maxLength && stringValue.Length >= minLength)
                return stringValue;
            else
            {
                throw (new System.ArgumentOutOfRangeException(ParamName, "string lenght must " + ((minLength != 0) ? "between " + minLength.ToString() + " and " : "less than ") + maxLength.ToString() + " characters , error value " + stringValue));
            }
        }
    }

    public class User
    {
        private Int32 identify;
        private String name;
        private String password;
        private String settings;
        private String iconPath;
        private DataState dataState;

        public User(String UserName, String UserPassword)
        {
            dataState = DataState.added;

            identify = -1;

            name = password = settings = iconPath = "";

            name = CommonOperator.CheckStringLength("User.Name", UserName, 1, 50);
            password = CommonOperator.CheckStringLength("User.Password", UserPassword, 0, 50);
        }

        public User(String UserName, String UserPassword, String UserIcon, String UserSetting)
        {
            dataState = DataState.added;

            identify = -1;

            name = password = settings = iconPath = "";

            name = CommonOperator.CheckStringLength("User.Name", UserName, 1, 50);
            password = CommonOperator.CheckStringLength("User.Password", UserPassword, 0, 50);
            iconPath = CommonOperator.CheckStringLength("User.UserSettings", UserIcon, 0, 100);
            settings = CommonOperator.CheckStringLength("User.UserSettings", UserSetting, 0, 500);
        }

        public Int32 Identify
        {
            get
            {
                return identify;
            }
        }

        public String Name
        {
            get
            {
                return name;
            }
            set
            {
                name = CommonOperator.CheckStringLength("User.Name", value, 1, 50);
                dataState = DataState.modified;
            }
        }

        public String Password
        {
            get
            {
                return password;
            }
            set
            {
                password = CommonOperator.CheckStringLength("User.Password", value, 0, 50);
                dataState = DataState.modified;
            }
        }

        public String IconPath
        {
            get
            {
                return iconPath;
            }
            set
            {
                iconPath = CommonOperator.CheckStringLength("User.IconPath", value, 0, 100);
                dataState = DataState.modified;
            }
        }

        public String Setting
        {
            get
            {
                return settings;
            }
            set
            {
                settings = CommonOperator.CheckStringLength("User.Settings", value, 0, 500);
                dataState = DataState.modified;
            }
        }

        public void Update()
        {
            if (dataState == DataState.modified)
                DatabaseInterface.UpdateUserInfo(this);

            dataState = DataState.unchanged;
        }

        public void Save()
        {
            if (dataState == DataState.added)
            {
                DatabaseInterface.SaveUserInfo(this);
            }
        }

        public void Delete()
        {
            DatabaseInterface.DeleteUserInfo(identify);
            dataState = DataState.deleted;
        }

        public void Fill(Int32 userId,User userInformation)
        {
            identify = userId;
            name = userInformation.name;
            password = userInformation.password;
            iconPath = userInformation.iconPath;
            settings = userInformation.settings;

            dataState = DataState.unchanged;
        }
    }

    public class Item
    {
        private Int32 identify;
        private String name;
        private String description, iconPath, filePath;
        private DataState dataState;

        public Item(String ItemName, String ItemFilePath)
        {

            dataState = DataState.added;

            identify = -1;

            name = filePath = "";
            description = "";
            iconPath = "";

            name = CommonOperator.CheckStringLength("Item.Name", ItemName, 1, 50);
            filePath = CommonOperator.CheckStringLength("Item.FilePath", ItemFilePath, 0, 500);
        }

        public Item(String ItemName, String ItemFilePath, String ItemIconPath, String ItemDescrption)
        {
            dataState = DataState.added;

            identify = -1;

            name = description = iconPath = filePath = "";

            name = CommonOperator.CheckStringLength("Item.Name", ItemName, 1, 50);
            filePath = CommonOperator.CheckStringLength("Item.FilePath", ItemFilePath, 0, 500);
            iconPath = CommonOperator.CheckStringLength("Item.IconPath", ItemIconPath, 0, 100);
            description = CommonOperator.CheckStringLength("Item.Description", ItemDescrption, 0, 500);
        }

        public Int32 Identify
        {
            get
            {
                return identify;
            }
        }

        public String Name
        {
            get
            {
                return name;
            }
            set
            {
                name = CommonOperator.CheckStringLength("Item.Name", value, 1, 50);
                dataState = DataState.modified;
            }
        }

        public String FilePath
        {
            get
            {
                return filePath;
            }
            set
            {

                filePath = CommonOperator.CheckStringLength("Item.FilePath", value, 0, 500);
                dataState = DataState.modified;
            }
        }

        public String IconPath
        {
            get
            {
                return iconPath;
            }
            set
            {

                iconPath = CommonOperator.CheckStringLength("Item.IconPath", value, 0, 100);
                dataState = DataState.modified;
            }
        }

        public String Description
        {
            get
            {
                return description;
            }
            set
            {
                description = CommonOperator.CheckStringLength("Item.Description", value, 0, 500);
                dataState = DataState.modified;
            }
        }

        public void Save()
        {
            dataState = DataState.unchanged;
        }

        public void Delete()
        {
            dataState = DataState.deleted;
        }

        public void Fill()
        {
            dataState = DataState.unchanged;
        }
    }

    public class Project
    {
        private Int32 identify;
        private String name, projectState, description, iconPath;
        private DateTime startDate, endDate;
        private Item[] items;
        private DataState dataState;
        private User projectUser;
        private PeriodTime[] periodTimes;
        private DateTime currentTime;
        private Boolean inUse, visibleToAll;

        public Project(String projectName, DateTime projectStartDate, DateTime projectEndDate, Item[] projectItems, String stateOfProject, User userName)
        {
            identify = -1;
            dataState = DataState.added;
            visibleToAll = false;
            inUse = false;

            name = projectState = description = iconPath = "";

            name = CommonOperator.CheckStringLength("Project.Name", projectName, 1, 50);
            projectState = CommonOperator.CheckStringLength("Project.ProjectState", stateOfProject, 1, 50);

            periodTimes = null;
            currentTime = System.DateTime.Now;
            startDate = projectStartDate;

            if (projectEndDate < projectStartDate)
                endDate = projectStartDate;
            else
                endDate = projectEndDate;

            items = projectItems;
            projectUser = userName;
        }

        public Project(String projectName, DateTime projectStartDate, DateTime projectEndDate, Item[] projectItems, String stateOfProject, User userName, String projectDescription, String projectIconPath, Boolean projectVisible)
        {
            identify = -1;
            dataState = DataState.added;
            visibleToAll = projectVisible;
            inUse = false;

            name = projectState = description = iconPath = "";

            name = CommonOperator.CheckStringLength("Project.Name", projectName, 1, 50);
            description = CommonOperator.CheckStringLength("Project.Description", projectDescription, 0, 500);
            iconPath = CommonOperator.CheckStringLength("Project.IconPath", projectIconPath, 0, 100);
            projectState = CommonOperator.CheckStringLength("Project.ProjectState", stateOfProject, 1, 50);

            inUse = false;
            periodTimes = null;
            currentTime = System.DateTime.Now;
            startDate = projectStartDate;

            if (projectEndDate < projectStartDate)
                endDate = projectStartDate;
            else
                endDate = projectEndDate;

            items = projectItems;
            projectUser = userName;
        }

        public Int32 Identify
        {
            get
            {
                return identify;
            }
        }

        public String Name
        {
            get
            {
                return name;
            }
            set
            {
                name = CommonOperator.CheckStringLength("Project.Name", value, 1, 50);
                dataState = DataState.modified;
            }
        }

        public String ProjectState
        {
            get
            {
                return projectState;
            }
            set
            {
                projectState = CommonOperator.CheckStringLength("Project.ProjectState", value, 1, 50);
                dataState = DataState.modified;
            }
        }

        public String Description
        {
            get
            {
                return description;
            }
            set
            {
                description = CommonOperator.CheckStringLength("Project.Description", value, 0, 500);
                dataState = DataState.modified;
            }
        }

        public String IconPath
        {
            get
            {
                return iconPath;
            }
            set
            {
                iconPath = CommonOperator.CheckStringLength("Project.IconPath", value, 0, 100);
                dataState = DataState.modified;
            }
        }

        public DateTime StartDate
        {
            get
            {
                return startDate;
            }
            set
            {
                startDate = value;
                dataState = DataState.modified;
            }
        }

        public DateTime EndDate
        {
            get
            {
                return endDate;
            }
            set
            {
                endDate = value;
                dataState = DataState.modified;
            }
        }

        public User ProjectUser
        {
            get
            {
                return projectUser;
            }
        }

        public Item[] Items
        {
            get
            {
                return items;
            }
            set
            {
                items = value;
                dataState = DataState.modified;
            }
        }

        public PeriodTime[] PeriodTimes
        {
            get
            {
                return periodTimes;
            }
            set
            {
                periodTimes = value;
                dataState = DataState.modified;
            }
        }

        public Boolean InUse
        {
            get
            {
                return inUse;
            }
            set
            {
                inUse = value;
                dataState = DataState.modified;
            }
        }

        public Boolean VisibleToAll
        {
            get
            {
                return visibleToAll;
            }
            set
            {
                visibleToAll = value;
                dataState = DataState.modified;
            }
        }

        public void Save()
        {
            dataState = DataState.unchanged;
        }

        public void Delete()
        {
            dataState = DataState.deleted;
        }

        public void Fill()
        {
            dataState = DataState.unchanged;
        }
    }

    public class Domain
    {
        private Int32 identify;
        private String name, description, iconPath;
        private Project[] projects;
        private DataState dataState;

        private User domainUser;
        private Boolean visibleToAll;

        private DateTime startDate;
        private DateTime endDate;

        public Domain(String domainName, Project[] domainProjects, User userData)
        {
            identify = -1;
            dataState = DataState.added;
            visibleToAll = false;

            name = "";
            projects = domainProjects;
            description = "";
            iconPath = "";

            domainUser = userData;
            name = CommonOperator.CheckStringLength("Domain.Name", domainName, 1, 50);

            startDate = projects[0].StartDate;
            endDate = projects[0].EndDate;

            for (Int32 p = 0; p < projects.Length; p++)
            {
                if (startDate > projects[p].StartDate)
                    startDate = projects[p].StartDate;

                if (endDate < projects[p].EndDate)
                    endDate = projects[p].EndDate;
            }
        }

        public Domain(String domainName, Project[] domainProjects, User userData, String domianDescription, String domainIconPath)
        {
            identify = -1;
            dataState = DataState.added;
            visibleToAll = false;
            domainUser = userData;

            name = "";
            description = "";
            iconPath = "";

            name = CommonOperator.CheckStringLength("Domain.Name", domainName, 1, 50);
            description = CommonOperator.CheckStringLength("Domain.Description", domianDescription, 0, 500);
            iconPath = CommonOperator.CheckStringLength("Domain.IconPath", domainIconPath, 0, 100);

            projects = domainProjects;
            startDate = projects[0].StartDate;
            endDate = projects[0].EndDate;

            for (Int32 p = 0; p < projects.Length; p++)
            {
                if (startDate > projects[p].StartDate)
                    startDate = projects[p].StartDate;

                if (endDate < projects[p].EndDate)
                    endDate = projects[p].EndDate;
            }
        }

        public Int32 Identify
        {
            get
            {
                return identify;
            }
        }

        public String Name
        {
            get
            {
                return name;
            }
            set
            {
                name = CommonOperator.CheckStringLength("Domain.Name", value, 1, 50);
                dataState = DataState.modified;
            }
        }

        public String Description
        {
            get
            {
                return description;
            }
            set
            {
                description = CommonOperator.CheckStringLength("Domain.Description", value, 0, 500);
                dataState = DataState.modified;
            }
        }

        public String IconPath
        {
            get
            {
                return iconPath;
            }
            set
            {
                iconPath = CommonOperator.CheckStringLength("Domain.IconPath", value, 0, 100);
                dataState = DataState.modified;
            }
        }

        public User DomianUser
        {
            get
            {
                return domainUser;
            }
        }

        public Project[] Projects
        {
            get
            {
                return projects;
            }
            set
            {
                projects = value;

                startDate = projects[0].StartDate;
                endDate = projects[0].EndDate;

                for (Int32 p = 0; p < projects.Length; p++)
                {
                    if (startDate > projects[p].StartDate)
                        startDate = projects[p].StartDate;

                    if (endDate < projects[p].EndDate)
                        endDate = projects[p].EndDate;
                }
            }
        }

        public DateTime StartDate
        {
            get
            {
                return startDate;
            }
        }

        public DateTime EndDate
        {
            get
            {
                return endDate;
            }
        }

        public Boolean VisibleToAll
        {
            get
            {
                return visibleToAll;
            }
            set
            {
                visibleToAll = value;
                dataState = DataState.modified;
            }
        }

        public void Save()
        {
            dataState = DataState.unchanged;
        }

        public void Delete()
        {
            dataState = DataState.deleted;
        }

        public void Fill()
        {
            dataState = DataState.unchanged;
        }

    }

    public class DomainsCollection : System.Collections.CollectionBase
    {
        public void Add(Domain domain)
        {
            List.Add(domain);
        }

        public void Remove(Domain domain)
        {
            List.Remove(domain);
        }

        public Domain this[Int32 index]
        {
            get
            {
                return (Domain)List[index];
            }
            set
            {
                List[index] = value;
            }
        }

        public Int32 IndexOf(Domain domain)
        {
            return List.IndexOf(domain);
        }

        public Int32 Count()
        {
            return List.Count;
        }
    }

    public class ProjectCollection : System.Collections.CollectionBase
    {
        public void Add(Project project)
        {
            List.Add(project);
        }

        public void Remove(Project project)
        {
            List.Remove(project);
        }

        public Project this[Int32 index]
        {
            get
            {
                return (Project)List[index];
            }
            set
            {
                List[index] = value;
            }
        }

        public Int32 IndexOf(Project project)
        {
            return List.IndexOf(project);
        }

        public Int32 Count()
        {
            return List.Count;
        }
    }

    public class ItemCollection : System.Collections.CollectionBase
    {
        public void Add(Item item)
        {
            List.Add(item);
        }

        public void Remove(Item item)
        {
            List.Remove(item);
        }

        public Item this[Int32 index]
        {
            get
            {
                return (Item)List[index];
            }
            set
            {
                List[index] = value;
            }
        }

        public Int32 IndexOf(Item item)
        {
            return List.IndexOf(item);
        }

        public Int32 Count()
        {
            return List.Count;
        }
    }

    public class UserCollection : System.Collections.CollectionBase
    {
        public void Add(User user)
        {
            List.Add(user);
        }

        public void Remove(User user)
        {
            List.Remove(user);
        }

        public User this[Int32 index]
        {
            get
            {
                return (User)List[index];
            }
            set
            {
                List[index] = value;
            }
        }

        public Int32 IndexOf(User user)
        {
            return List.IndexOf(user);
        }

        public Int32 Count()
        {
            return List.Count;
        }

        public void Fill()
        {
            User tmp;
            Int32 id;

            for (Int32 i = 0; i < Count(); i++)
            {
                DatabaseInterface.GetUserInfo(out id,out tmp);

                ((User)List[i]).Fill(id, tmp);
            }
        }
    }

}
