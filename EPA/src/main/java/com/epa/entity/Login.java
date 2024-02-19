package com.epa.entity;

import java.util.Date;

public class Login {
    private String BUNHO;
    private String MEM_ID;
    private int ATTEND_COUNT;
    private Date LAST_ATTEND_DATE;

    // Getters and Setters

    public String getBUNHO() {
        return BUNHO;
    }

    public void setBUNHO(String BUNHO) {
        this.BUNHO = BUNHO;
    }

    public String getMEM_ID() {
        return MEM_ID;
    }

    public void setMEM_ID(String MEM_ID) {
        this.MEM_ID = MEM_ID;
    }

    public int getATTEND_COUNT() {
        return ATTEND_COUNT;
    }

    public void setATTEND_COUNT(int ATTEND_COUNT) {
        this.ATTEND_COUNT = ATTEND_COUNT;
    }

    public Date getLAST_ATTEND_DATE() {
        return LAST_ATTEND_DATE;
    }

    public void setLAST_ATTEND_DATE(Date LAST_ATTEND_DATE) {
        this.LAST_ATTEND_DATE = LAST_ATTEND_DATE;
    }
}
