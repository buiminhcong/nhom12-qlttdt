package model;

public class DiemDauRa {

	private int ID;
	private float diem;
	private String hoTen;
	private int phieuDangKyID;
	
	public DiemDauRa() {
		// TODO Auto-generated constructor stub
	}

	public DiemDauRa(int iD, float diem, String hoTen, int phieuDangKyID) {
		super();
		ID = iD;
		this.diem = diem;
		this.hoTen = hoTen;
		this.phieuDangKyID = phieuDangKyID;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public float getDiem() {
		return diem;
	}

	public void setDiem(float diem) {
		this.diem = diem;
	}

	public String getHoTen() {
		return hoTen;
	}

	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}

	public int getPhieuDangKyID() {
		return phieuDangKyID;
	}

	public void setPhieuDangKyID(int phieuDangKyID) {
		this.phieuDangKyID = phieuDangKyID;
	}
	
}
