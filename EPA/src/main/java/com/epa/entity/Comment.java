package com.epa.entity;

public class Comment {
	private int COM_NO;
	private int BD_NO;
 	private String MEM_ID;
 	private int COM_RE;
 	private String COM_C;
 	private String D_DATE;
	public int getCOM_NO() {
		return COM_NO;
	}
	@Override
	public String toString() {
		return "Comment [COM_NO=" + COM_NO + ", BD_NO=" + BD_NO + ", MEM_ID=" + MEM_ID + ", COM_RE=" + COM_RE
				+ ", COM_C=" + COM_C + ", D_DATE=" + D_DATE + "]";
	}
	public void setCOM_NO(int cOM_NO) {
		COM_NO = cOM_NO;
	}
	public int getBD_NO() {
		return BD_NO;
	}
	public void setBD_NO(int bD_NO) {
		BD_NO = bD_NO;
	}
	public String getMEM_ID() {
		return MEM_ID;
	}
	public void setMEM_ID(String mEM_ID) {
		MEM_ID = mEM_ID;
	}
	public int getCOM_RE() {
		return COM_RE;
	}
	public void setCOM_RE(int cOM_RE) {
		COM_RE = cOM_RE;
	}
	public String getCOM_C() {
		return COM_C;
	}
	public void setCOM_C(String cOM_C) {
		COM_C = cOM_C;
	}
	public String getD_DATE() {
		return D_DATE;
	}
	public void setD_DATE(String d_DATE) {
		D_DATE = d_DATE;
	}

}
