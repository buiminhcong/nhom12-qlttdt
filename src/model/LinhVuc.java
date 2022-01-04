package model;

public class LinhVuc {
	private int id;
	private String ten;
	private String moTa;
	
	public LinhVuc() {
		super();
		// TODO Auto-generated constructor stub
	}

	public LinhVuc(int id, String ten, String moTa) {
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
