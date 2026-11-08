package smd.eors.restprovider;

public class GeoRect
{
  //public methods region
    public boolean valueOf(String longitude1,String latitude1,String longitude2,String latitude2)
    {
        try
        {
            double lng1,lat1,lng2,lat2;

            lng1=Double.parseDouble(longitude1);
            lng2=Double.parseDouble(longitude2);
            lat1=Double.parseDouble(latitude1);
            lat2=Double.parseDouble(latitude2);

            if(lng1!=0||lng2!=0||lat1!=0||lat2!=0)
            {
                if(lng1<lng2)
                {
                    startLongitude=lng1;
                    endLongitude=lng2;
                }
                else
                {
                    startLongitude=lng2;
                    endLongitude=lng1;
                }

                if(lat1<lat2)
                {
                    startLatitude=lat1;
                    endLatitude=lat2;
                }
                else
                {
                    startLatitude=lat2;
                    endLatitude=lat1;
                }
            }

            return true;
        }
        catch(NumberFormatException ex)
        {
            Utility.logger.error(ex);
            return false;
        }
        
    }

    //private fields region
    public double startLongitude;
    public double endLongitude;
    public double startLatitude;
    public double endLatitude;
}
