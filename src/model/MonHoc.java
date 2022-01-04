package model;

public class MonHoc {
	private int id;
	private String tenMon;
	private String moTa;
	
	public MonHoc() {
		super();
	}

	public MonHoc(int id, String tenMon, String moTa) {
		super();
		this.id = id;
		this.tenMon = tenMon;
		this.moTa = moTa;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTenMon() {
		return tenMon;
	}

	public void setTenMon(String tenMon) {
		this.tenMon = tenMon;
	}

	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}
	
	
}
