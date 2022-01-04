package model;

public class GioDay {
	private int id;
	private String ten;
	private String moTa;
	
	public GioDay() {
		super();
	}

	public GioDay(int id, String ten, String moTa) {
		super();
		this.id = id;
		this.ten = ten;
		this.moTa = moTa;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTen() {
		return ten;
	}

	public void setTen(String ten) {
		this.ten = ten;
	}

	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}
	
}
