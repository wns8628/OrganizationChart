package com.douzone.exception;

public class UserDaoException extends RuntimeException {

	public UserDaoException( ) {
		super("UserDao 예외");
	}
	public UserDaoException(String message) {
		super(message);
	}
	
}
