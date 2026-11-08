package smd.eors.dataaccess;

public class DataSchema
{
    //HBase commons
    public final static String REAL_TIME_PREFIX="ema-";
    
    //user table
    public final static String USER_TABLE="nav";
    
    public final static String USER_INFO="i";
    public final static String USER_INFO_NAME="name";
    public final static String USER_INFO_NODE="es";
    public final static String USER_INFO_MUTED="m";
    public final static String USER_INFO_DISABLED="d";

    public final static String USER_SIM="s";
    
    public final static String USER_DEVICE ="d";
    
    public final static String USER_LOCATION="g";
    
    public final static String USER_CELLLOCATION="c";
    
    //login table
    public final static String LOGIN_TABLE="login";
    
    public final static String LOGIN_INFO="i";
    public final static String LOGIN_INFO_ID="id";
    public final static String LOGIN_INFO_MACADDRESS="macAddress";
    public final static String LOGIN_INFO_IMEI="imei";
    public final static String LOGIN_INFO_IMSI="imsi";
    public final static String LOGIN_INFO_DEVICETYPE="deviceType";
    public final static String LOGIN_INFO_OSVERSION="osVersion";
    public final static String LOGIN_INFO_SIMSERIALNUMBER="simSerialNumber";
    public final static String LOGIN_INFO_ACCURACY="a";
    public final static String LOGIN_INFO_LONGITUDE="x";
    public final static String LOGIN_INFO_LATITUDE="y";
    public final static String LOGIN_INFO_AZIMUTH="azimuth";
    public final static String LOGIN_INFO_GPSDATE="gpsDate";
    public final static String LOGIN_INFO_CELLLONGITUDE="cellX";
    public final static String LOGIN_INFO_CELLLATITUDE="cellY";
    public final static String LOGIN_INFO_CGI="cgi";
    public final static String LOGIN_INFO_EMAVERSION="emaVersion";
    public final static String LOGIN_INFO_HEIGHT="height";
    public final static String LOGIN_INFO_PROVIDER="provider";
    public final static String LOGIN_INFO_PUBLISHER="publisher";
    public final static String LOGIN_INFO_SITENAME="siteName";
    public final static String LOGIN_INFO_GENERATION="generation";
    public final static String LOGIN_INFO_TIMESTAMP="timestamp";
    public final static String LOGIN_INFO_RECEIVEDTIMESTAMP="rcvTimestamp";
    public final static String LOGIN_INFO_ES="es";
    
    
    //command table
    //TODO command instead of command2
    public final static String COMMAND_TABLE="command2";
    public final static String COMMAND_INFO="i";
    public final static String COMMAND_INFO_ES="es";
    public final static String COMMAND_INFO_TEXT="text";
    public final static String COMMAND_INFO_SETS="sets";
    public final static String COMMAND_INFO_TIMESTAMP="date";
    
    public final static String COMMAND_READER="r";

    //report table
    public final static String REPORT_TABLE="report";
    
    public final static String REPORT_INFO="i";
    public final static String REPORT_INFO_ID="id";
    public final static String REPORT_INFO_PUBLISHER="publisher";
    public final static String REPORT_INFO_ES="es";
    public final static String REPORT_INFO_TEXT="text";
    public final static String REPORT_INFO_TIMESTAMP="timestamp";
    public final static String REPORT_INFO_RECEIVEDTIMESTAMP="rcvTimestamp";
    public final static String REPORT_INFO_COMMANDID="commandId";
    public final static String REPORT_INFO_KEYWORDS="keywords";
    public final static String REPORT_INFO_PROVIDER="provider";
    public final static String REPORT_INFO_LONGITUDE="x";
    public final static String REPORT_INFO_LATITUDE="y";
    public final static String REPORT_INFO_ACCURACY="a";
    public final static String REPORT_INFO_GPSTIME="time";
    public final static String REPORT_INFO_CGI="cgi";
    public final static String REPORT_INFO_CELLLONGITUDE="cellX";
    public final static String REPORT_INFO_CELLLATITUDE="cellY";
    public final static String REPORT_INFO_CELLAZIMUTH="azimuth";
    public final static String REPORT_INFO_CELLHEIGHT="height";
    public final static String REPORT_INFO_CELLSITENAME="siteName";
    public final static String REPORT_INFO_GENERATION="generation";
    public final static String REPORT_INFO_RELEVANCE="relevance"; 
    public final static String REPORT_INFO_IP="ip";
    public final static String REPORT_INFO_ATTACHMENTS="attachments";
    public final static String REPORT_INFO_ATTACHMENTFILES="attachmentFiles";
    
    public final static String REPORT_CATEGORY="c";
    
    public final static String REPORT_ACTION="a";
    public final static String REPORT_ACTION_CURRENTIMPORTANT="currentImportant";
    public final static String REPORT_ACTION_CURRENTSEEN="currentSeen";
  
    public final static String REPORT_COMMENT="t";
    
    public final static String REPORT_EHQ="-ehq";
    
    //statics table
    public final static String STATISTICS_TABLE="statistics";
    public final static String STATISTICS_INFO="i";
    
    //keyword table
    public final static String KEYWORD_TABLE="keyword";
    public final static String KEYWORD_INFO="i";
    public final static String KEYWORD_INFO_GROUPNAME="n";
    public final static String KEYWORD_INFO_ACTIVE="a";
    public final static String KEYWORD_WORD="w";
     
    //navigation table
    public final static String NAVIGATION_TABLE="nav";
    public final static String NAVIGATION_INFO="i";
    public final static String NAVIGATION_INFO_USER="u";
    public final static String NAVIGATION_INFO_LONGITUDE="lo";
    public final static String NAVIGATION_INFO_LATITUDE="la";
    public final static String NAVIGATION_INFO_ACCURACY="a";
    public final static String NAVIGATION_INFO_DATE="d";
    public final static String NAVIGATION_INFO_CGI="c";
    public final static String NAVIGATION_INFO_AZIMUTH="az";
    public final static String NAVIGATION_INFO_HEIGHT="h";
    
    
    //cellular table
    public final static String CELLULAR_TABLE="cellular";
    public final static String CELLULAR_INFO="i";
    public final static String CELLULAR_INFO_CID="ci";
    public final static String CELLULAR_INFO_LAC="l";
    public final static String CELLULAR_INFO_MNC="n";
    public final static String CELLULAR_INFO_CGI="cg";
    public final static String CELLULAR_INFO_CELL_NAME="cn";
    public final static String CELLULAR_INFO_SITE_CODE="sc";
    public final static String CELLULAR_INFO_SITE_NAME="sn";
    public final static String CELLULAR_INFO_AZIMUTH="az";
    public final static String CELLULAR_INFO_X="x";
    public final static String CELLULAR_INFO_Y="y";
    public final static String CELLULAR_INFO_HEIGHT="h";

    //media table
    public final static String MEDIA_TABLE="media";
    public final static String MEDIA_INFO="i";
    public final static String MEDIA_INFO_CONTENT="c";
    public final static String MEDIA_INFO_CONTENT_THUMBNAIL="t";
}