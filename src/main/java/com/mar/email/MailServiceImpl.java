package com.mar.email;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

//MailService Interface 구현 클래스
@Service
public class MailServiceImpl implements MailService {
 // org.springframework.mail.javamail.JavaMailSender
 private JavaMailSender javaMailSender;

 public void setJavaMailSender(JavaMailSender javaMailSender) {
     this.javaMailSender = javaMailSender;
 }

 @Override
 public boolean send(String subject, String text, String from, String to) {
     // javax.mail.internet.MimeMessage
     MimeMessage message = javaMailSender.createMimeMessage();

     try {
         // org.springframework.mail.javamail.MimeMessageHelper
         MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
         helper.setSubject(subject);
         helper.setText(text, true);
         helper.setFrom(from);
         helper.setTo(to);

         javaMailSender.send(message);
         return true;
     } catch (MessagingException e) {
         e.printStackTrace();
     }
     return false;
 }
}
