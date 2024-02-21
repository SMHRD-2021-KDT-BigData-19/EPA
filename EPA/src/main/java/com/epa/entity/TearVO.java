package com.epa.entity;

import java.util.Date;

public class TearVO {
    private String MEM_ID;
    private String TEAR;
    private int ATTEND_COUNT;
    private int EX_RCOUNT;
    private String LASTDATE;
    
    
    
    public String getLASTDATE() {
		return LASTDATE;
	}

	public void setLASTDATE(String LASTDATE) {
		this.LASTDATE = LASTDATE;
	}

	
	@Override
	public String toString() {
		return "TearVO [MEM_ID=" + MEM_ID + ", TEAR=" + TEAR + ", ATTEND_COUNT=" + ATTEND_COUNT + ", EX_RCOUNT="
				+ EX_RCOUNT + ", LASTDATE=" + LASTDATE + "]";
	}

	// Getters and Setters
    public String getMEM_ID() {
        return MEM_ID;
    }

    public void setMEM_ID(String MEM_ID) {
        this.MEM_ID = MEM_ID;
    }

    public String getTEAR() {
        return TEAR;
    }

    public void setTEAR(String TEAR) {
        this.TEAR = TEAR;
    }

    public int getATTEND_COUNT() {
        return ATTEND_COUNT;
    }

    public void setATTEND_COUNT(int ATTEND_COUNT) {
        this.ATTEND_COUNT = ATTEND_COUNT;
    }

    public int getEX_RCOUNT() {
        return EX_RCOUNT;
    }

    public void setEX_RCOUNT(int EX_RCOUNT) {
        this.EX_RCOUNT = EX_RCOUNT;
    }
}
