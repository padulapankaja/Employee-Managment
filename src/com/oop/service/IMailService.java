package com.oop.service;

import java.util.ArrayList;

import com.oop.model.Mail;

public interface IMailService {

	public void composeMail(Mail mail);
	
	public ArrayList<Mail> viewMails(int EmpId , String SendOrReceive);
	
	public Mail viewMail(int mailId);
	
	public void read(int mailID);
	
	public void deleteMail( int mailID );
	
	public int mailCount(int EmpID);
}
