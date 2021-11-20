package dao;

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
	

	
	
	
}
