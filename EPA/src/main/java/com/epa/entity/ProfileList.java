package com.epa.entity;

public class ProfileList {
	private int PROFILE_NO;
	private String PROFILEIMG;
	private String PROFILEPATH;
	private String MEM_ID;
	public int getPROFILE_NO() {
		return PROFILE_NO;
	}
	public void setPROFILE_NO(int pROFILE_NO) {
		PROFILE_NO = pROFILE_NO;
	}
	public String getPROFILEIMG() {
		return PROFILEIMG;
	}
	public void setPROFILEIMG(String pROFILEIMG) {
		PROFILEIMG = pROFILEIMG;
	}
	public String getPROFILEPATH() {
		return PROFILEPATH;
	}
	public void setPROFILEPATH(String pROFILEPATH) {
		PROFILEPATH = pROFILEPATH;
	}
	public String getMEM_ID() {
		return MEM_ID;
	}
	public void setMEM_ID(String mEM_ID) {
		MEM_ID = mEM_ID;
	}
	
	public ProfileList() {
		super();
	}

	@Override
	public String toString() {
		return "ProfileList [PROFILE_NO=" + PROFILE_NO + ", PROFILEIMG=" + PROFILEIMG + ", PROFILEPATH=" + PROFILEPATH
				+ ", MEM_ID=" + MEM_ID + "]";
	}

}
