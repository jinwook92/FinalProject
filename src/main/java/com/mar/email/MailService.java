package com.mar.email;

//Interface

public interface MailService {



 /** ���� ����

  *  @param subject ����

  *  @param text ����

  *  @param from ������ ���� �ּ�

  *  @param to �޴� ���� �ּ� **/

 public boolean send(String subject, String text, String from, String to);



}

