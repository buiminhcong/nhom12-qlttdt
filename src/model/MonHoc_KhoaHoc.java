package model;

public class MonHoc_KhoaHoc {
	private MonHoc monHoc;
	private KhoaHoc khoaHoc;
	
	public MonHoc_KhoaHoc() {
		super();
	}

	public MonHoc_KhoaHoc(MonHoc monHoc, KhoaHoc khoaHoc) {
		super();
		this.monHoc = monHoc;
		this.khoaHoc = khoaHoc;
	}

	public MonHoc getMonHoc() {
		return monHoc;
	}

	public void setMonHoc(MonHoc monHoc) {
		this.monHoc = monHoc;
	}

	public KhoaHoc getKhoaHoc() {
		return khoaHoc;
	}

	public void setKhoaHoc(KhoaHoc khoaHoc) {
		this.khoaHoc = khoaHoc;
	}
}
