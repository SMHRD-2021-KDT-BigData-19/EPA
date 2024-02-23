package com.epa.entity;

public class imageList {
	
	private int file_NO;
	private String file;
	private int BD_NO;
	private String filePath;
	public int getFile_NO() {
		return file_NO;
	}
	public void setFile_NO(int file_NO) {
		this.file_NO = file_NO;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public int getBD_NO() {
		return BD_NO;
	}
	public void setBD_NO(int bD_NO) {
		BD_NO = bD_NO;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	@Override
	public String toString() {
		return "imageList [file_NO=" + file_NO + ", file=" + file + ", BD_NO=" + BD_NO + ", filePath=" + filePath + "]";
	}
	public imageList(int file_NO, String file, int bD_NO, String filePath) {
		super();
		this.file_NO = file_NO;
		this.file = file;
		BD_NO = bD_NO;
		this.filePath = filePath;
	}
	
	

}
