package model;

import java.sql.Date;

public class PhieuDangKi {

	private int id;
	private String ngayDangKi;
	private int kiemTraThanhToan;
	private HocVien hocVien;
	private LichDay lichDay;
	private String tenKhoaHoc;
	private String hocPhi;
	public PhieuDangKi() {
		super();
	}
	public PhieuDangKi(int id, String ngayDangKi, int kiemTraThanhToan, HocVien hocVien, LichDay lichDay,
			String tenKhoaHoc, String hocPhi) {
		super();
		this.id = id;
		this.ngayDangKi = ngayDangKi;
		this.kiemTraThanhToan = kiemTraThanhToan;
		this.hocVien = hocVien;
		this.lichDay = lichDay;
		this.tenKhoaHoc = tenKhoaHoc;
		this.hocPhi = hocPhi;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNgayDangKi() {
		return ngayDangKi;
	}
	public void setNgayDangKi(String ngayDangKi) {
		this.ngayDangKi = ngayDangKi;
	}
	public int getKiemTraThanhToan() {
		return kiemTraThanhToan;
	}
	public void setKiemTraThanhToan(int kiemTraThanhToan) {
		this.kiemTraThanhToan = kiemTraThanhToan;
	}
	public HocVien getHocVien() {
		return hocVien;
	}
	public void setHocVien(HocVien hocVien) {
		this.hocVien = hocVien;
	}
	public LichDay getLichDay() {
		return lichDay;
	}
	public void setLichDay(LichDay lichDay) {
		this.lichDay = lichDay;
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
