/**
 * 
 */
package com.oop.model;

/**
 * @author Amoda
 *
 */
public class Mail {
	private int MailId;
	private int SenderId;
	private int ReceiverId;
	private String Title;
	private String Message;
	private String SentDate;
	private String SentTime;
	private int Read;
	private String ReadTime;
	private String ReadDate;
	/**
	 * @return the senderId
	 */
	public int getSenderId() {
		return SenderId;
	}
	/**
	 * @param senderId the senderId to set
	 */
	public void setSenderId(int senderId) {
		SenderId = senderId;
	}
	/**
	 * @return the receiverId
	 */
	public int getReceiverId() {
		return ReceiverId;
	}
	/**
	 * @param receiverId the receiverId to set
	 */
	public void setReceiverId(int receiverId) {
		ReceiverId = receiverId;
	}
	/**
	 * @return the title
	 */
	public String getTitle() {
		return Title;
	}
	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		Title = title;
	}
	/**
	 * @return the message
	 */
	public String getMessage() {
		return Message;
	}
	/**
	 * @param message the message to set
	 */
	public void setMessage(String message) {
		Message = message;
	}
	/**
	 * @return the sentDate
	 */
	public String getSentDate() {
		return SentDate;
	}
	/**
	 * @param sentDate the sentDate to set
	 */
	public void setSentDate(String sentDate) {
		SentDate = sentDate;
	}
	/**
	 * @return the sentTime
	 */
	public String getSentTime() {
		return SentTime;
	}
	/**
	 * @param sentTime the sentTime to set
	 */
	public void setSentTime(String sentTime) {
		SentTime = sentTime;
	}
	/**
	 * @return the read
	 */
	public int getRead() {
		return Read;
	}
	/**
	 * @param read the read to set
	 */
	public void setRead(int read) {
		Read = read;
	}
	/**
	 * @return the readTime
	 */
	public String getReadTime() {
		return ReadTime;
	}
	/**
	 * @param readTime the readTime to set
	 */
	public void setReadTime(String readTime) {
		ReadTime = readTime;
	}
	/**
	 * @return the readDate
	 */
	public String getReadDate() {
		return ReadDate;
	}
	/**
	 * @param readDate the readDate to set
	 */
	public void setReadDate(String readDate) {
		ReadDate = readDate;
	}
	/**
	 * @return the mailId
	 */
	public int getMailId() {
		return MailId;
	}
	/**
	 * @param mailId the mailId to set
	 */
	public void setMailId(int mailId) {
		MailId = mailId;
	}
	
	
	
	
}
