package model;

import java.sql.Date;

public class PhieuDangKy {
	
	private int ID;
	private Date ngayDangKy;
	private int kiemTraThanhToan;
	private int hocVienThanhVienID;
	private int lichDayID;
	private String tenKhoaHoc;
	private String hocPhi;
	
	public PhieuDangKy() {
		// TODO Auto-generated constructor stub
	}

	public PhieuDangKy(int iD, Date ngayDangKy, int kiemTraThanhToan, int hocVienThanhVienID, int lichDayID,
			String tenKhoaHoc, String hocPhi) {
		super();
		ID = iD;
		this.ngayDangKy = ngayDangKy;
		this.kiemTraThanhToan = kiemTraThanhToan;
		this.hocVienThanhVienID = hocVienThanhVienID;
		this.lichDayID = lichDayID;
		this.tenKhoaHoc = tenKhoaHoc;
		this.hocPhi = hocPhi;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public Date getNgayDangKy() {
		return ngayDangKy;
	}

	public void setNgayDangKy(Date ngayDangKy) {
		this.ngayDangKy = ngayDangKy;
	}

	public int getKiemTraThanhToan() {
		return kiemTraThanhToan;
	}

	public void setKiemTraThanhToan(int kiemTraThanhToan) {
		this.kiemTraThanhToan = kiemTraThanhToan;
	}

	public int getHocVienThanhVienID() {
		return hocVienThanhVienID;
	}

	public void setHocVienThanhVienID(int hocVienThanhVienID) {
		this.hocVienThanhVienID = hocVienThanhVienID;
	}

	public int getLichDayID() {
		return lichDayID;
	}

	public void setLichDayID(int lichDayID) {
		this.lichDayID = lichDayID;
	}

	public String getTenKhoaHoc() {
		return tenKhoaHoc;
	}

	public void setTenKhoaHoc(String tenKhoaHoc) {
		this.tenKhoaHoc = tenKhoaHoc;
	}

	public String getHocPhi() {
		return hocPhi;
	}

	public void setHocPhi(String hocPhi) {
		this.hocPhi = hocPhi;
	}

}
