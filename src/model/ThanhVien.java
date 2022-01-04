package model;

import java.sql.Date;

public class ThanhVien {
	private int ID;
	private String taiKhoan;
	private String matKhau;
	private Date ngaySinh;
	private int dienThoai;
	private String email;
	private String phanQuyen;
	

	public ThanhVien() {

	}

	public ThanhVien(int iD, String taiKhoan, String matKhau, Date ngaySinh, int dienThoai, String email,
			String phanQuyen) {
		super();
		ID = iD;
		this.taiKhoan = taiKhoan;
		this.matKhau = matKhau;
		this.ngaySinh = ngaySinh;
		this.dienThoai = dienThoai;
		this.email = email;
		this.phanQuyen = phanQuyen;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public String getTaiKhoan() {
		return taiKhoan;
	}

	public void setTaiKhoan(String taiKhoan) {
		this.taiKhoan = taiKhoan;
	}

	public String getMatKhau() {
		return matKhau;
	}

	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}

	public Date getNgaySinh() {
		return ngaySinh;
	}

	public void setNgaySinh(Date ngaySinh) {
		this.ngaySinh = ngaySinh;
	}

	public int getDienThoai() {
		return dienThoai;
	}

	public void setDienThoai(int dienThoai) {
		this.dienThoai = dienThoai;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhanQuyen() {
		return phanQuyen;
	}

	public void setPhanQuyen(String phanQuyen) {
		this.phanQuyen = phanQuyen;
	}

}
