/**
 * 
 */
package com.oop.service;

import com.oop.model.LoginHandler;

/**
 * @author Amoda
 *
 */
public interface ILoginService {

	public LoginHandler authenticateEmployee( String Uname , String Password );
}
