package model;

import java.io.Serializable;

public class HoTen implements Serializable{
	private int ID;
	private String ho;
	private String tenDem;
	private String ten;
	private int thanhVienID;
	
	public HoTen() {
		
	}
	
	public HoTen(int iD, String ho, String tenDem, String ten, int thanhVienID) {
		super();
		ID = iD;
		this.ho = ho;
		this.tenDem = tenDem;
		this.ten = ten;
		this.thanhVienID = thanhVienID;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public String getHo() {
		return ho;
	}

	public void setHo(String ho) {
		this.ho = ho;
	}

	public String getTenDem() {
		return tenDem;
	}

	public void setTenDem(String tenDem) {
		this.tenDem = tenDem;
	}

	public String getTen() {
		return ten;
	}

	public void setTen(String ten) {
		this.ten = ten;
	}

	public int getThanhVienID() {
		return thanhVienID;
	}

	public void setThanhVienID(int thanhVienID) {
		this.thanhVienID = thanhVienID;
	}
	
	
}
