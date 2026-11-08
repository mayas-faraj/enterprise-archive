package halux.cd.org;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.SequenceFile;
import org.apache.hadoop.io.Text;

public class Program 
{
    public static void main(String[] args)
    {
        UserWritable user=new UserWritable();
        user.setLoginName("Zaher");
        user.setLoginFullName("Zaher Katsha");
        user.setLoginPassword("909090");
        user.setAgentAddress("Muhajreen-Damascus");
        user.setAgentSection("MJL");
        user.getDeviceMacs().put("28-A5-74-57-45-75", "zoz;459438459439213;Nokia 930");
        user.getSettings().put("Color", "Yellow");
        user.getSettings().put("Size", "18px");
        
        UserWritable user2=new UserWritable();
        user2.setLoginName("Mayas");
        user2.setLoginFullName("Mayas Faraj");
        user2.setLoginPassword("141414");
        user2.setAgentAddress("Zahera-Damascus");
        user2.setAgentSection("SMD");
        user2.getDeviceMacs().put("28-A85-74-57-45-75", "lord kievanrus;459438459439213;Nokia 930");
        user2.getSettings().put("Color", "Red");
        user2.getSettings().put("Font", "Impact");
        user2.getSettings().put("Size", "90px");
        
        System.out.println(user.toString());
         
        try
        {
            SequenceFile.Writer writer=SequenceFile.createWriter(new Configuration(), SequenceFile.Writer.file(new Path("/storage/hadoop/tmp/output101")),SequenceFile.Writer.keyClass(Text.class),SequenceFile.Writer.valueClass(UserWritable.class),SequenceFile.Writer.compression(SequenceFile.CompressionType.BLOCK));
            
            writer.append(new Text("zh3"), user);
            writer.append(new Text("ms"), user2);
            writer.close();
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
        
        System.out.println("done...");

        try
        {
            SequenceFile.Reader reader=new SequenceFile.Reader(new Configuration(), SequenceFile.Reader.file(new Path("/storage/hadoop/tmp/output101")));
            Text key=new Text();
            UserWritable value=new UserWritable();
            
            System.out.println(reader.getPosition());
            while(reader.next(key, value))
            {
                System.out.println(key.toString());
                System.out.println(value.getLoginFullName());  
                System.out.println(value.getLoginPassword());  
                System.out.println(value.getAgentAddress());  
                System.out.println(value.getAgentSection());   
            }
            reader.close();
            System.out.println("done...");     
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
	
}