package com.epa.entity;

import java.sql.Timestamp;

public class login {
   private String MEM_ID;
   private String MEM_PW;
   private String MEM_NM;
   private String MEM_EMAIL;
   private Timestamp regdate;
   private Timestamp updatedate;

   
public login(){}


public login(String MEM_ID, String MEM_PW, String MEM_NM, String MEM_EMAIL, Timestamp regdate,
		Timestamp updatedate) {
	super();
	this.MEM_ID = MEM_ID;
	this.MEM_PW = MEM_PW;
	this.MEM_NM = MEM_NM;
	this.MEM_EMAIL = MEM_EMAIL;
	this.regdate = regdate;
	this.updatedate = updatedate;
}


public String getMEM_ID() {
	return MEM_ID;
}


public void setMEM_ID(String MEM_ID) {
	MEM_ID = MEM_ID;
}


public String getMEM_PW() {
	return MEM_PW;
}


public void setMEM_PW(String MEM_PW) {
	MEM_PW = MEM_PW;
}


public String getMEM_NM() {
	return MEM_NM;
}


public void setMEM_NM(String MEM_NM) {
	MEM_NM = MEM_NM;
}


public String getMEM_EMAIL() {
	return MEM_EMAIL;
}


public void setMEM_EMAIL(String MEM_EMAIL) {
	MEM_EMAIL = MEM_EMAIL;
}

   
}
