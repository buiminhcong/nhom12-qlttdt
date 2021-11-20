package model;

public class LichDay {
	private int id;
	private GiangVien giangVien;
	private ThuDay thuDay;
	private PhongHoc phongHoc;
	private GioDay gioDay;
	private KhoaHoc khoaHoc;
	public LichDay(int id, GiangVien giangVien, ThuDay thuDay, PhongHoc phongHoc, GioDay gioDay, KhoaHoc khoaHoc) {
		super();
		this.id = id;
		this.giangVien = giangVien;
		this.thuDay = thuDay;
		this.phongHoc = phongHoc;
		this.gioDay = gioDay;
		this.khoaHoc = khoaHoc;
	}
	public LichDay() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public GiangVien getGiangVien() {
		return giangVien;
	}
	public void setGiangVien(GiangVien giangVien) {
		this.giangVien = giangVien;
	}
	public ThuDay getThuDay() {
		return thuDay;
	}
	public void setThuDay(ThuDay thuDay) {
		this.thuDay = thuDay;
	}
	public PhongHoc getPhongHoc() {
		return phongHoc;
	}
	public void setPhongHoc(PhongHoc phongHoc) {
		this.phongHoc = phongHoc;
	}
	public GioDay getGioDay() {
		return gioDay;
	}
	public void setGioDay(GioDay gioDay) {
		this.gioDay = gioDay;
	}
	public KhoaHoc getKhoaHoc() {
		return khoaHoc;
	}
	public void setKhoaHoc(KhoaHoc khoaHoc) {
		this.khoaHoc = khoaHoc;
	}
	
	
	
}
