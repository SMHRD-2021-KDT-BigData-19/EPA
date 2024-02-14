	package com.epa.entity;
	
	import java.util.Date;
	
	
	public class epa {
		
		public epa() {
			
		}
		private String MEMID;
		private String MEMPW;
		private String MEMNM;
		private Date MEMAGE;
		private int MEMH;
		private int MEMW;
		private String MEMG;
		private String MEMEMAIL;
	
		
		
		public String getMEMID() {
			return MEMID;
		}
		public void setMEMID(String mEMID) {
			MEMID = mEMID;
		}
		public String getMEMPW() {
			return MEMPW;
		}
		public void setMEMPW(String mEMPW) {
			MEMPW = mEMPW;
		}
		public String getMEMNM() {
			return MEMNM;
		}
		public void setMEMNM(String mEMNM) {
			MEMNM = mEMNM;
		}
		public Date getMEMAGE() {
			return MEMAGE;
		}
		public void setMEMAGE(Date mEMAGE) {
			MEMAGE = mEMAGE;
		}
		public int getMEMH() {
			return MEMH;
		}
		public void setMEMH(int mEMH) {
			MEMH = mEMH;
		}
		public int getMEMW() {
			return MEMW;
		}
		public void setMEMW(int mEMW) {
			MEMW = mEMW;
		}
		public String getMEMG() {
			return MEMG;
		}
		public void setMEMG(String mEMG) {
			MEMG = mEMG;
		}
		public String getMEMEMAIL() {
			return MEMEMAIL;
		}
		public void setMEMEMAIL(String mEMEMAIL) {
			MEMEMAIL = mEMEMAIL;
		}
	
		
		
	    public epa(String MEMID, String MEMPW, String MEMNM, Date MEMAGE, int MEMH, int MEMW, String MEMG, String MEMEMAIL) {
	        this.MEMID = MEMID;
	        this.MEMPW = MEMPW;
	        this.MEMNM = MEMNM;
	        this.MEMAGE = MEMAGE;
	        this.MEMH = MEMH;
	        this.MEMW = MEMW;
	        this.MEMG = MEMG;
	        this.MEMEMAIL = MEMEMAIL;
	    }
		
		
	
		
	
	
		
	}
