package model;

public class KhoaHoc {
	private int ID;
	private String ten;
	private String moTa;
	private String hocPhi;
	private int siSoToiDa;
	private int kiemTraHoatDong;
	private String thoiGianBatDau;
	private String thoiGianKetThuc;
	private int LinhVucID;
	private int NhanVienThanhToanID;
	
	
	public KhoaHoc() {
		super();
	}

	public KhoaHoc(int iD, String ten, String moTa, String thoiGianBatDau, String thoiGianKetThuc) {
		super();
		ID = iD;
		this.ten = ten;
		this.moTa = moTa;
		this.thoiGianBatDau = thoiGianBatDau;
		this.thoiGianKetThuc = thoiGianKetThuc;
	}

	public KhoaHoc(int iD, String ten, String moTa, String hocPhi, int siSoToiDa, int kiemTraHoatDong,
			String thoiGianBatDau, String thoiGianKetThuc, int linhVucID, int nhanVienThanhToanID) {
		super();
		ID = iD;
		this.ten = ten;
		this.moTa = moTa;
		this.hocPhi = hocPhi;
		this.siSoToiDa = siSoToiDa;
		this.kiemTraHoatDong = kiemTraHoatDong;
		this.thoiGianBatDau = thoiGianBatDau;
		this.thoiGianKetThuc = thoiGianKetThuc;
		LinhVucID = linhVucID;
		NhanVienThanhToanID = nhanVienThanhToanID;
	}



	public int getID() {
		return ID;
	}



	public void setID(int iD) {
		ID = iD;
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



	public String getHocPhi() {
		return hocPhi;
	}



	public void setHocPhi(String hocPhi) {
		this.hocPhi = hocPhi;
	}



	public int getSiSoToiDa() {
		return siSoToiDa;
	}



	public void setSiSoToiDa(int siSoToiDa) {
		this.siSoToiDa = siSoToiDa;
	}



	public int getKiemTraHoatDong() {
		return kiemTraHoatDong;
	}



	public void setKiemTraHoatDong(int kiemTraHoatDong) {
		this.kiemTraHoatDong = kiemTraHoatDong;
	}



	public String getThoiGianBatDau() {
		return thoiGianBatDau;
	}



	public void setThoiGianBatDau(String thoiGianBatDau) {
		this.thoiGianBatDau = thoiGianBatDau;
	}



	public String getThoiGianKetThuc() {
		return thoiGianKetThuc;
	}



	public void setThoiGianKetThuc(String thoiGianKetThuc) {
		this.thoiGianKetThuc = thoiGianKetThuc;
	}



	public int getLinhVucID() {
		return LinhVucID;
	}



	public void setLinhVucID(int linhVucID) {
		LinhVucID = linhVucID;
	}



	public int getNhanVienThanhToanID() {
		return NhanVienThanhToanID;
	}



	public void setNhanVienThanhToanID(int nhanVienThanhToanID) {
		NhanVienThanhToanID = nhanVienThanhToanID;
	}

	@Override
	public String toString() {
		return "KhoaHoc [ID=" + ID + ", ten=" + ten + ", moTa=" + moTa + ", hocPhi=" + hocPhi + ", siSoToiDa="
				+ siSoToiDa + ", kiemTraHoatDong=" + kiemTraHoatDong + ", thoiGianBatDau=" + thoiGianBatDau
				+ ", thoiGianKetThuc=" + thoiGianKetThuc + ", LinhVucID=" + LinhVucID + ", NhanVienThanhToanID="
				+ NhanVienThanhToanID + "]";
	}

	

	
}
