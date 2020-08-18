package dbc;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Sendmail {
    public String send(String to,String msg,String sub)
    {
                final String username = "passbyop007@gmail.com";//sender emailid
	        final String password = "passmatrix";//sender password
                String xx="";
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
 
		Session session1 = Session.getInstance(props,
		  new javax.mail.Authenticator() {
                    @Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });
 
		try 
                {
                    Message message = new MimeMessage(session1);
                    message.setFrom(new InternetAddress(username));//sender email
                    message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to));
                    message.setSubject(sub);
                    message.setText(msg);
                    Transport.send(message);
 
                    System.out.println("Done");
                    xx="ok";
                }
                catch(Exception e)
                {
                  xx=e.getMessage();
              // System.out.println(e);
                }
            return xx;
    }
    
}
