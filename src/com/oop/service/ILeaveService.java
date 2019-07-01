package com.oop.service;

import java.util.ArrayList;

import com.oop.model.Leave;

public interface ILeaveService {

	public void addLeave(Leave leave);
	
	public ArrayList<Leave> getLeavesList(int EmpId);
	
	public ArrayList<Leave> getLeavesList(String Action);
	
	public void manageLeave(Leave leave );
}
