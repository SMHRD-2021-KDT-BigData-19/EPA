package com.epa.entity;

public class Member {
	private String MEM_ID;
	private String MEM_PW;
	private String MEM_NM;
	private String MEM_AGE;
	private int MEM_H;
	private int MEM_W;
	private String MEM_G;
	private String MEM_IMG;
	private String MEM_EMAIL;
	private String JOIN_DATE;
	private String TEAR;
	private String MEM_M;
	
	
	public String getMEM_ID() {
		return MEM_ID;
	}
	public void setMEM_ID(String mEM_ID) {
		MEM_ID = mEM_ID;
	}
	public String getMEM_PW() {
		return MEM_PW;
	}
	public void setMEM_PW(String mEM_PW) {
		MEM_PW = mEM_PW;
	}
	public String getMEM_NM() {
		return MEM_NM;
	}
	public void setMEM_NM(String mEM_NM) {
		MEM_NM = mEM_NM;
	}
	public String getMEM_AGE() {
		return MEM_AGE;
	}
	public void setMEM_AGE(String mEM_AGE) {
		MEM_AGE = mEM_AGE;
	}
	public int getMEM_H() {
		return MEM_H;
	}
	public void setMEM_H(int mEM_H) {
		MEM_H = mEM_H;
	}
	public int getMEM_W() {
		return MEM_W;
	}
	public void setMEM_W(int mEM_W) {
		MEM_W = mEM_W;
	}
	public String getMEM_G() {
		return MEM_G;
	}
	public void setMEM_G(String mEM_G) {
		MEM_G = mEM_G;
	}
	public String getMEM_IMG() {
		return MEM_IMG;
	}
	public void setMEM_IMG(String mEM_IMG) {
		MEM_IMG = mEM_IMG;
	}
	public String getMEM_EMAIL() {
		return MEM_EMAIL;
	}
	public void setMEM_EMAIL(String mEM_EMAIL) {
		MEM_EMAIL = mEM_EMAIL;
	}
	public String getJOIN_DATE() {
		return JOIN_DATE;
	}
	public void setJOIN_DATE(String jOIN_DATE) {
		JOIN_DATE = jOIN_DATE;
	}
	public String getTEAR() {
		return TEAR;
	}
	public void setTEAR(String tEAR) {
		TEAR = tEAR;
	}
	public String getMEM_M() {
		return MEM_M;
	}
	public void setMEM_M(String mEM_M) {
		MEM_M = mEM_M;
	}
	@Override
	public String toString() {
		return "Member [MEM_ID=" + MEM_ID + ", MEM_PW=" + MEM_PW + ", MEM_NM=" + MEM_NM + ", MEM_AGE=" + MEM_AGE
				+ ", MEM_H=" + MEM_H + ", MEM_W=" + MEM_W + ", MEM_G=" + MEM_G + ", MEM_IMG=" + MEM_IMG + ", MEM_EMAIL="
				+ MEM_EMAIL + ", JOIN_DATE=" + JOIN_DATE + ", TEAR=" + TEAR + ", MEM_M=" + MEM_M + "]";
	}
	
	

}
