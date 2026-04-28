package com.ee.pet.utils;

import com.sun.mail.util.MailSSLSocketFactory;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.security.GeneralSecurityException;
import java.util.Properties;

@Component
@Slf4j
public class Mail_send {

    public void sendcode_email(String email, String code) throws GeneralSecurityException, MessagingException {
        Properties prop = new Properties();
        prop.setProperty("mail.host", "smtp.qq.com");
        prop.setProperty("mail.transport.protocol", "smtp");
        prop.setProperty("mail.smtp.connectiontimeout", "10000");
        prop.setProperty("mail.smtp.timeout", "10000");
        prop.setProperty("mail.smtp.writetimeout", "10000");

        MailSSLSocketFactory sf = new MailSSLSocketFactory();
        sf.setTrustAllHosts(true);
        prop.put("mail.smtp.ssl.enable", "true");
        prop.put("mail.smtp.ssl.socketFactory", sf);

        Session session = Session.getDefaultInstance(prop, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("958798069@qq.com", "kvgdbmjwjhslbbia");
            }
        });

        Transport ts = session.getTransport();
        log.info("Connecting SMTP server for sendcode: host=smtp.qq.com, port=465, to={}", email);
        ts.connect("smtp.qq.com", "958798069@qq.com", "wzytikzoxqclbdbd");

        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress("958798069@qq.com"));
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
        message.setSubject("掌灯星屿-宠物领养平台验证码");
        message.setContent("<h1>验证码：<h1>" + code, "text/html;charset=UTF-8");

        ts.sendMessage(message, message.getAllRecipients());
        log.info("Sendcode email sent successfully to {}", email);
        ts.close();
    }
}
