package com.epa.entity;

public class calendar {
	private int PL_BUNHO;
	
	private String EX_ID; //운동코드
	private String EXPL_ID; //일정이름 
 	private String MEM_ID;
 	private String EX_SDATE; //시작시간
 	private String EX_FDATE;  //종료시간
 	private String EX_R;
 	private String RT_D;
 	private String PN_COLOR;
 	

	public int getPL_BUNHO() {
		return PL_BUNHO;
	}
	public void setPL_BUNHO(int pL_BUNHO) {
		PL_BUNHO = pL_BUNHO;
	}
	public String getEX_ID() {
		return EX_ID;
	}
	public void setEX_ID(String eX_ID) {
		EX_ID = eX_ID;
	}
	public String getMEM_ID() {
		return MEM_ID;
	}
	public void setMEM_ID(String mEM_ID) {
		MEM_ID = mEM_ID;
	}
	public String getEXPL_ID() {
		return EXPL_ID;
	}
	public void setEXPL_ID(String eXPL_ID) {
		EXPL_ID = eXPL_ID;
	}
	
	
	public String getPN_COLOR() {
		return PN_COLOR;
	}
	public void setPN_COLOR(String pN_COLOR) {
		PN_COLOR = pN_COLOR;
	}
	public String getEX_SDATE() {
		return EX_SDATE;
	}
	public void setEX_SDATE(String eX_SDATE) {
		EX_SDATE = eX_SDATE;
	}
	public String getEX_FDATE() {
		return EX_FDATE;
	}
	public void setEX_FDATE(String eX_FDATE) {
		EX_FDATE = eX_FDATE;
	}
	public String getEX_R() {
		return EX_R;
	}
	public void setEX_R(String eX_R) {
		EX_R = eX_R;
	}
	public String getRT_D() {
		return RT_D;
	}
	public void setRT_D(String rT_D) {
		RT_D = rT_D;
	}
	@Override
	public String toString() {
		return "calendar [PL_BUNHO=" + PL_BUNHO + ", EX_ID=" + EX_ID + ", EXPL_ID=" + EXPL_ID + ", MEM_ID=" + MEM_ID
				+ ", EX_SDATE=" + EX_SDATE + ", EX_FDATE=" + EX_FDATE + ", EX_R=" + EX_R + ", RT_D=" + RT_D
				+ ", PN_COLOR=" + PN_COLOR + "]";
	}
	

	
	
 	
 	
}
