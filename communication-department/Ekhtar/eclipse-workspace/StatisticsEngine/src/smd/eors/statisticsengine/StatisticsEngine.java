package smd.eors.statisticsengine;

import java.io.IOException;
import org.apache.hadoop.hbase.client.Mutation;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.io.ImmutableBytesWritable;
import org.apache.hadoop.hbase.mapreduce.TableMapper;
import org.apache.hadoop.hbase.mapreduce.TableReducer;
import org.apache.hadoop.hbase.util.Bytes;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.io.IntWritable;

import smd.eors.dataaccess.DataSchema;
import smd.eors.statisticsengine.CoordinateProcessor;


public class StatisticsEngine
{  
    public static class MapEngine extends TableMapper<Text, IntWritable>
    {
        private final IntWritable ONE=new IntWritable(1);
        private byte[] es;
        private byte[] text;
        private byte[] cellLongitudeBytes;
        private byte[] cellLatitudeBytes;
        private byte[] gpsLongitudeBytes;
        private byte[] gpsLatitudeBytes;
        private LocationType locationType;
        private City city;


        @Override
        protected void map(ImmutableBytesWritable key, Result value,
                Mapper<ImmutableBytesWritable, Result, Text, IntWritable>.Context context)
                        throws IOException, InterruptedException
        {
            text=value.getValue(Bytes.toBytes(DataSchema.REPORT_INFO), Bytes.toBytes(DataSchema.REPORT_INFO_TEXT));
 

            if(text!=null)
            {
                es=value.getValue(Bytes.toBytes(DataSchema.REPORT_INFO), Bytes.toBytes(DataSchema.REPORT_INFO_ES));
                cellLongitudeBytes=value.getValue(Bytes.toBytes(DataSchema.REPORT_INFO), Bytes.toBytes(DataSchema.REPORT_INFO_CELLLONGITUDE));
                cellLatitudeBytes=value.getValue(Bytes.toBytes(DataSchema.REPORT_INFO), Bytes.toBytes(DataSchema.REPORT_INFO_CELLLATITUDE));
                gpsLongitudeBytes=value.getValue(Bytes.toBytes(DataSchema.REPORT_INFO), Bytes.toBytes(DataSchema.REPORT_INFO_LONGITUDE));
                gpsLatitudeBytes=value.getValue(Bytes.toBytes(DataSchema.REPORT_INFO), Bytes.toBytes(DataSchema.REPORT_INFO_LATITUDE));
                city=City.none;
                locationType=LocationType.none;
                
                double longitude=0;
                double latitude=0;

                if(gpsLongitudeBytes!=null && gpsLatitudeBytes!=null)
                {
                    longitude=Bytes.toDouble(gpsLongitudeBytes);
                    latitude=Bytes.toDouble(gpsLatitudeBytes);

                    if(longitude!=0 && latitude!=0)
                    {
                        locationType=LocationType.gps;
                        city=CoordinateProcessor.getCity(latitude, longitude);
                    }
                }
                
                if(longitude==0 && latitude==0 && cellLongitudeBytes!=null && cellLatitudeBytes!=null)
                {
                    longitude=Bytes.toDouble(cellLongitudeBytes);
                    latitude=Bytes.toDouble(cellLatitudeBytes);
                    
                    if(longitude!=0 && latitude!=0)
                    {
                        locationType=LocationType.cell;
                        city=CoordinateProcessor.getCity(latitude, longitude);
                    }
                }
                
                context.write(new Text(Bytes.toBytes("ehq-reportCoverage:"+locationType.toString())), ONE);
                context.write(new Text(Bytes.toBytes(Bytes.toString(es)+"-reportCoverage:"+locationType.toString())), ONE);
                
                /*
                if(Bytes.toString(es).equals("es-smd"))
                {
                    double lng, lat, clng, clat;
                    
                    if(cellLongitudeBytes!=null)
                        clng=Bytes.toDouble(cellLongitudeBytes);
                    else
                        clng=-1;
                    
                    if(cellLatitudeBytes!=null)
                        clat=Bytes.toDouble(cellLatitudeBytes);
                    else
                        clat=-1;
                    
                    if(gpsLongitudeBytes!=null)
                        lng=Bytes.toDouble(gpsLongitudeBytes);
                    else
                        lng=-1;
                    
                    if(gpsLatitudeBytes!=null)
                        lat=Bytes.toDouble(gpsLatitudeBytes);
                    else
                        lat=-1;
                    
                        
                    System.out.println(String.format("{cell (%f, %f), gps (%f, %f)} = (%s)", clat, clng, lat, lng, city));
                }*/

                if(city!=City.none)
                {
                    context.write(new Text(Bytes.toBytes("ehq-reportDistribution:"+city.toString())), ONE);
                    context.write(new Text(Bytes.toBytes(Bytes.toString(es)+"-reportDistribution:"+city.toString())), ONE);
                }
            }
        }

    }

    public static class ReduceEngine extends TableReducer<Text, IntWritable, ImmutableBytesWritable> 
    {
        @Override
        protected void reduce(Text key, Iterable<IntWritable> values,
                Reducer<Text, IntWritable, ImmutableBytesWritable, Mutation>.Context context)
                        throws IOException, InterruptedException
        {
            int count=0;
            for(IntWritable value: values)
                count += value.get();

            String inputKey=key.toString();
            int seperatorIndex=inputKey.indexOf(':');

            if(seperatorIndex>=0)
            {
                String rowKey=inputKey.substring(0, seperatorIndex);
                String columnKey=inputKey.substring(seperatorIndex+1);

                Put put=new Put(Bytes.toBytes(rowKey));
                put.addColumn(Bytes.toBytes(DataSchema.STATISTICS_INFO), Bytes.toBytes(columnKey), Bytes.toBytes(count));

                context.write(null, put);
                System.out.println(String.format("Reducer, city: %s, locationType: %s", rowKey, count));
            }
            else
                System.out.println("Not valid key format: "+inputKey);
        }

    }

    enum LocationType
    {
        cell,
        gps,
        none,
    }
    
    enum City
    {
        damascus,
        homs,
        tartous,
        latakia,
        aleepo,
        hama,
        swidaa,
        daraa,
        qunaitera,
        raqqa,
        derzor,
        hasaka,
        idlib,  
        none
    }
}
