package com.ee.pet.utils;

import com.sun.mail.util.MailSSLSocketFactory;
import org.springframework.stereotype.Component;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.security.GeneralSecurityException;
import java.util.Properties;
@Component
public class Mail_send {

    //        //Properties中 设置属性
//        Properties prop=new Properties();
//        prop.setProperty("mail.host","smtp.qq.com");///设置QQ邮件服务器
//        prop.setProperty("mail.transport.protocol","smtp");///邮件发送协议
//        //需要验证用户密码
//        //使用javaMail发送邮件的5个步骤
//        //1.创建定义整个应用程序所需要的环境信息的session对象
//        //QQ才有!其他邮箱就不用  ssl
//        Session session= Session.getDefaultInstance(prop, new Authenticator() {//获取默认的实例
//            @Override
//            protected PasswordAuthentication getPasswordAuthentication() {
//                //发件人邮箱、授权码（去qq邮箱里面开启协议会给出，每个人不一样）（授权码错误无法发送）
//                return new PasswordAuthentication("958798069@qq.com","twktvecobbcibcgd");
//            }
//        });
//        //2.通过session得到transport对象
//        Transport ts=session.getTransport();
//        //3.使用邮箱的用户名和授权码连上邮件服务器
//        ts.connect("smtp.qq.com","958798069@qq.com","yyyvysfiivkibdda");
//        //4.创建邮件：写邮件
//        //需要传递session
//        MimeMessage message = new MimeMessage(session);
//        //指明邮件的发件人
//        message.setFrom(new InternetAddress("958798069@qq.com"));
//
//        //指明邮件的收件人，现在发件人和收件人是一样的，那就是自己给自己发，注意setRecipient别加s
//        message.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
//
//        //邮件的标题   只包含文本的简单邮件
//        message.setSubject("验证码");
//
//        //邮件的文本内容，可以嵌套css内容
//        message.setContent("<h1>验证码：<h1>"+code,"text/html;charset=UTF-8");
//        //5.发送邮件
//        ts.sendMessage(message,message.getAllRecipients());
//        //6.关闭连接，一切网络都需要关闭
//        ts.close();
    public void sendcode_email(String email,String code) throws GeneralSecurityException, MessagingException{
        //Properties中 设置属性
        Properties prop=new Properties();
        prop.setProperty("mail.host","smtp.qq.com");///设置QQ邮件服务器
        prop.setProperty("mail.transport.protocol","smtp");///邮件发送协议
        //需要验证用户密码
        //使用javaMail发送邮件的5个步骤
        //1.创建定义整个应用程序所需要的环境信息的session对象
        //QQ才有!其他邮箱就不用  SSL
        MailSSLSocketFactory SF = new MailSSLSocketFactory();
        SF.setTrustAllHosts(true);
        prop.put("mail.smtp.ssl.enable","true");
        prop.put("mail.smtp.ssl.socketFactory",SF);
        //session对象
        Session session= Session.getDefaultInstance(prop, new Authenticator() {//获取默认的实例
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                //发件人邮箱、授权码（去qq邮箱里面开启协议会给出，每个人不一样）（授权码错误无法发送）
                return new PasswordAuthentication("958798069@qq.com","wzytikzoxqclbdbd");
            }
        });
        //2.通过session得到transport对象
        Transport ts=session.getTransport();
        //3.使用邮箱的用户名和授权码连上邮件服务器
        ts.connect("smtp.qq.com","958798069@qq.com","wzytikzoxqclbdbd");
        //4.创建邮件：写邮件
        //需要传递session
        MimeMessage message = new MimeMessage(session);
        //指明邮件的发件人
        message.setFrom(new InternetAddress("958798069@qq.com"));

        //指明邮件的收件人，现在发件人和收件人是一样的，那就是自己给自己发，注意setRecipient别加s
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(email));

        //邮件的标题   只包含文本的简单邮件
        message.setSubject("掌灯星屿-宠物领养平台验证码");

        //邮件的文本内容，可以嵌套css内容
        message.setContent("<h1>验证码：<h1>"+code,"text/html;charset=UTF-8");
        //5.发送邮件
        ts.sendMessage(message,message.getAllRecipients());
        //6.关闭连接，一切网络都需要关闭
        ts.close();
    }
}
