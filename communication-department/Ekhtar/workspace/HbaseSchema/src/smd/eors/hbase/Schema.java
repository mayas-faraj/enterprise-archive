package smd.eors.hbase;

public class Schema
{
    //public final static fields region
    public final static String REPORT_TABLE="report";
    public final static String REPORT_INFO="i";
    public final static String REPORT_INFO_ID="id";
    public final static String REPORT_INFO_USER="u";
    public final static String REPORT_INFO_COMMAND="cd";
    public final static String REPORT_INFO_TEXT="t";
    public final static String REPORT_INFO_PRIORITY="p";
    public final static String REPORT_INFO_TRUSTY="tr";
    public final static String REPORT_INFO_IP="ip";
    public final static String REPORT_INFO_CELL_INFO="ci";
    public final static String REPORT_INFO_MAC="m";
    public final static String REPORT_INFO_IMEI="i";
    public final static String REPORT_INFO_IMSI="im";
    public final static String REPORT_INFO_SSN="s";
    public final static String REPORT_INFO_LONGITUDE="lo";
    public final static String REPORT_INFO_LATITUDE="la";
    public final static String REPORT_INFO_CELLLONGITUDE="co";
    public final static String REPORT_INFO_CELLLATITUDE="ca";
    public final static String REPORT_INFO_DEVICE_TYPE="d";
    public final static String REPORT_INFO_OS_VERSION="o";
    public final static String REPORT_INFO_KEYWORDS="k";
    public final static String REPORT_INFO_COMMENT="ct";

    public final static String CELLULAR_TABLE="cellular";
    public final static String CELLULAR_INFO="i";
    public final static String CELLULAR_INFO_CID="ci";
    public final static String CELLULAR_INFO_LAC="l";
    public final static String CELLULAR_INFO_MNC="n";
    public final static String CELLULAR_INFO_CGI="cg";
    public final static String CELLULAR_INFO_CELL_NAME="cn";
    public final static String CELLULAR_INFO_SITE_CODE="sc";
    public final static String CELLULAR_INFO_SITE_NAME="sn";
    public final static String CELLULAR_INFO_AZIMUTH="a";
    public final static String CELLULAR_INFO_X="x";
    public final static String CELLULAR_INFO_Y="y";
    public final static String CELLULAR_INFO_HEIGHT="h";
    
    public final static String USER_TABLE="report";
    public final static String USER_GPS="g";
    public final static String USER_CELL="c";
    
    public final static String REAL_TIME_SUFFIX="_rt";
}
