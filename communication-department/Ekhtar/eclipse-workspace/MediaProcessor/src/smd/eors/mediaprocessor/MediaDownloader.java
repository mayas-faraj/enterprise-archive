package smd.eors.mediaprocessor;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.Authenticator;
import java.net.PasswordAuthentication;
import java.net.URL;
import java.net.URLConnection;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.X509Certificate;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

public class MediaDownloader
{
    public static byte[] getContent(String mediaUrl) 
            throws IOException, NoSuchAlgorithmException, KeyManagementException 
    {
        // Create a trust manager that does not validate certificate chains
        final TrustManager[] trustAllCerts = new TrustManager[] { 
                new X509TrustManager() 
                {
                    @Override
                    public void checkClientTrusted(final X509Certificate[] chain, final String authType) 
                    {
                    }

                    @Override
                    public void checkServerTrusted(final X509Certificate[] chain, final String authType) 
                    {
                    }

                    @Override
                    public X509Certificate[] getAcceptedIssuers()
                    {
                        return null;
                    }
                } 
        };

        // Install the all-trusting trust manager
        final SSLContext sslContext = SSLContext.getInstance("SSL");
        sslContext.init(null, trustAllCerts, null);
        // Create an SSL socket factory with our all-trusting manager
        
        HttpsURLConnection.setDefaultSSLSocketFactory(sslContext.getSocketFactory());
        HttpsURLConnection.setDefaultHostnameVerifier(new HostnameVerifier() 
        {
            public boolean verify(String urlHostName, SSLSession session) 
            {
                return true;
            }
        });
        
        // be authentic
        Authenticator.setDefault(new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication()
            {
                return new PasswordAuthentication(mediaUrl, mediaUrl.toCharArray());
            }
        });

        // All set up, we can get a resource through https now:
        final URL url = new URL(mediaUrl);

        URLConnection connection = url.openConnection();

        InputStream inputStream = connection.getInputStream();
        
        byte[] buffer=new byte[BUFFER_LENGTH];
        ByteArrayOutputStream result=new ByteArrayOutputStream();
        int length;
        
        while((length=inputStream.read(buffer, 0, buffer.length))>0)
        {
           result.write(buffer, 0, length);
        }
        inputStream.close();
        
        System.out.println("available: "+ result.toByteArray().length);
        
        return result.toByteArray();
    }
    
    private static final int BUFFER_LENGTH=10000;
}
