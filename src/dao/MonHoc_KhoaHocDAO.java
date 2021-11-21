package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import model.KhoaHoc;
import model.MonHoc;
import model.MonHoc_KhoaHoc;

public class MonHoc_KhoaHocDAO extends DAO{
	
	public MonHoc_KhoaHocDAO() {
		super();
	}
	
	public ArrayList<MonHoc_KhoaHoc> getChiTietKhoaHocTLV(String khoahocid) {
		ArrayList<MonHoc_KhoaHoc> listMH_KH = new ArrayList<MonHoc_KhoaHoc>();
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		String sql = "select * from khoahoc, monhoc, monhoc_khoahoc"
					+ " where  khoahoc.ID = monhoc_khoahoc.KhoaHocID"
					+ " and monhoc_khoahoc.MonHocID = monhoc.ID"
					+ " and khoahoc.ID = ?";
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(sql);
			int id = Integer.parseInt(khoahocid);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				KhoaHoc kh = new KhoaHoc();
				kh.setID(rs.getInt("khoahoc.ID"));
				kh.setTen(rs.getString("Ten"));
				kh.setMoTa(rs.getString("khoahoc.MoTa"));
				kh.setSiSoToiDa(rs.getInt("SiSoToiDa"));
				kh.setThoiGianBatDau(formatter.format(rs.getDate("ThoiGianBatDau")));
				kh.setThoiGianKetThuc(formatter.format(rs.getDate("ThoiGianKetThuc")));
					
				
				MonHoc mh = new MonHoc();
				mh.setTenMon(rs.getString("TenMon"));
				mh.setMoTa(rs.getString("monhoc.MoTa"));
				
				MonHoc_KhoaHoc mh_kh = new MonHoc_KhoaHoc();
				mh_kh.setKhoaHoc(kh);
				mh_kh.setMonHoc(mh);
				listMH_KH.add(mh_kh);
			}
			return listMH_KH;
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}
	
	public ArrayList<MonHoc_KhoaHoc> getDSKhoaHocMonHocByTime(String t1, String t2) {
		ArrayList<MonHoc_KhoaHoc>list = new ArrayList<MonHoc_KhoaHoc>();
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		String sql = "SELECT khoahocid, khoahoc.ten, khoahoc.mota, khoahoc.thoigianbatdau, khoahoc.thoigianketthuc, khoahoc.hocphi, monhoc.tenmon\n"
				+ "FROM monhoc_khoahoc\n"
				+ "INNER JOIN khoahoc\n"
				+ "ON khoahoc.id = monhoc_khoahoc.khoahocid\n"
				+ "INNER JOIN monhoc\n"
				+ "ON monhoc.id = monhoc_khoahoc.monhocid\n"
				+ "WHERE khoahoc.thoigianbatdau >= ? and khoahoc.thoigianketthuc <= ?";
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, t1);
			ps.setString(2, t2);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				int khoaHocId = rs.getInt("khoahocid");
				String tenKhoaHoc = rs.getString("ten");
				String moTa = rs.getString("mota");
				Date ngayBatDau = rs.getDate("thoigianbatdau");
				Date ngayKetThuc = rs.getDate("thoigianketthuc");
				String hocPhi = rs.getString("hocphi");
				String tenMon = rs.getString("tenmon");
				
				KhoaHoc kh = new KhoaHoc();
				kh.setID(khoaHocId);
				kh.setMoTa(moTa);
				kh.setTen(tenKhoaHoc);
				kh.setThoiGianBatDau(sdf.format(ngayBatDau));
				kh.setThoiGianKetThuc(sdf.format(ngayKetThuc));
				kh.setHocPhi(hocPhi);
				
				MonHoc mh = new MonHoc();
				mh.setTenMon(tenMon);
				
				MonHoc_KhoaHoc mh_kh_new = new MonHoc_KhoaHoc(mh, kh);
				list.add(mh_kh_new);
			}
			ps.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
