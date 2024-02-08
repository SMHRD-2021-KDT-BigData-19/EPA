package com.epa.entity;

import java.util.Date;

public class epa {
    private String email;
    private String login_id;
    private String login_pw;
    private String nick;
    private int height;
    private int weight;
    private Date birth;
    private String gender;
    
    
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getLogin_id() {
		return login_id;
	}
	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}
	public String getLogin_pw() {
		return login_pw;
	}
	public void setLogin_pw(String login_pw) {
		this.login_pw = login_pw;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	@Override
	public String toString() {
		return "epa [email=" + email + ", login_id=" + login_id + ", login_pw=" + login_pw + ", nick=" + nick
				+ ", height=" + height + ", weight=" + weight + ", birth=" + birth + ", gender=" + gender + "]";
	}
    
    
    
}
