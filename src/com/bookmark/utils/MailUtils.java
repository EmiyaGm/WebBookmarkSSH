package com.bookmark.utils;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/*
 * �ʼ����ɹ�����
 */

public class MailUtils {
	
	public static void sendMail(String to,String code){
		
		
		//1.������Ӷ���
		Properties props = new Properties();
		props.setProperty("mail.host", "localhost");
		Session session = Session.getInstance(props, new Authenticator() {

			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				// TODO Auto-generated method stub
				return new PasswordAuthentication("service@gm.com", "123456");			
				}
			
		});
		//2.�����ʼ�����
		Message message = new MimeMessage(session);
		//3.���÷�����
		try {
			message.setFrom(new InternetAddress("service@gm.com"));
			//4.�����ռ���
			message.setRecipient(RecipientType.TO, new InternetAddress(to));//����CC ����BCC
			//5.���ñ���
			message.setSubject("�����̳ǵļ����ʼ�");
			//6.�����ʼ�������
			
			message.setContent("<h1>�̳Ǽ����ʼ�,�������������ɼ������</h1><h3><a href='http://localhost/SSHShop/user_active.action?code="+code+"'>http://localhost/SSHShop/user_active.action?code="+code+"</a></h3>","text/html;charset=UTF-8");
			//7.�����ʼ�
			Transport.send(message);
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
