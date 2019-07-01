/**
 * 
 */
package com.oop.service;

import java.util.ArrayList;

import com.oop.model.Announcement;

/**
 * @author Amoda
 *
 */
public interface IAnnouncementService {

	public void addAnnouncement(Announcement announcement);
	
	public ArrayList<Announcement> viewAllAnnouncement();
	
	public void deleteAnnouncement(int AnnID );
	
	public Announcement selectAnnouncement(int AnnID );
	
	public void updateAnnouncement(Announcement announcement);
	
}
