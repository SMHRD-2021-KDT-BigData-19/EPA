package com.epa.controller;

import javax.servlet.http.Cookie;

public class AttendResponse {
    private boolean success;
    private String message;
    
    
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public void setDebugValue(String debugValue) {
		// TODO Auto-generated method stub
		
	}
	public void addCookie(Cookie attendanceCookieObj) {
		// TODO Auto-generated method stub
		
	}
    
    
}
