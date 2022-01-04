package model;

public class PhongHoc {
	private int id;
	private String ten;
	private int sucChua;
	private String moTa;
	
	public PhongHoc() {
		super();
	}
	
	public PhongHoc(int id, String ten, int sucChua, String moTa) {
		super();
		this.id = id;
		this.ten = ten;
		this.sucChua = sucChua;
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

	public int getSucChua() {
		return sucChua;
	}

	public void setSucChua(int sucChua) {
		this.sucChua = sucChua;
	}

	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}
	
	
}
