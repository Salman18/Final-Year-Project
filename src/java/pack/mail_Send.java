/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package  pack;
/**
 *
 * @author JP1
 */
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class mail_Send {

    public static boolean sendMail(String msg, String userid, String to) {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
//        String from ="testjpinfotech@gmail.com";

        Session session = Session.getDefaultInstance(props,
        new javax.mail.Authenticator() {
        protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication("fdsfsd03@gmail.com","03fdsfsd");
        }
        });

        System.out.println("Message   " + msg);
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(userid));
            message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to));
            message.setSubject("Decryption key ");
            message.setText(msg);
            Transport.send(message);
            System.out.println("Done");
            System.out.println(message);
            return true;
        } 
        
        catch (MessagingException e) {
            e.printStackTrace();
             return false;
        }
       
    }

//    public static void main(String arg[]) {
//        System.out.println(mail_Send.sendMail("nothing", "fsadfasd","testjpinfotech@gmail.com"));    
//    }
}

