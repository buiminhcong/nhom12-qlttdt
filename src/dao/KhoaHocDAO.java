package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import model.KhoaHoc;

public class KhoaHocDAO extends DAO{
	
	public KhoaHocDAO() {
		super();
	}
	
	public ArrayList<KhoaHoc> getTatCaKhoaHoc(){
		ArrayList<KhoaHoc> listKhoaHoc = new ArrayList<KhoaHoc>();
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		String sql = "select kh.ID, kh.Ten, kh.MoTa, kh.ThoiGianBatDau, kh.ThoiGianKetThuc"
					+ " from khoahoc as kh";
					
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				KhoaHoc kh = new KhoaHoc();
				kh.setID(Integer.parseInt(rs.getString("ID")));
				kh.setTen(rs.getString("Ten"));
				kh.setMoTa(rs.getString("MoTa"));
				kh.setThoiGianBatDau(formatter.format(rs.getDate("ThoiGianBatDau")));
				kh.setThoiGianKetThuc(formatter.format(rs.getDate("ThoiGianKetThuc")));
				
				System.out.println(kh.getHocPhi());
				listKhoaHoc.add(kh);
			}
			
			return listKhoaHoc;
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}
	
	//-------------------------
	public ArrayList<KhoaHoc> getTatCaKhoaHocTheoLV(String linhvucid) {
		ArrayList<KhoaHoc> listKhoaHoc = new ArrayList<KhoaHoc>();
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		String sql = "select kh.ID, kh.Ten, kh.MoTa, kh.ThoiGianBatDau, kh.ThoiGianKetThuc"
					+ " from khoahoc as kh"
					+ " where kh.LinhVucID = ?";
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(sql);
			int id = Integer.parseInt(linhvucid);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				KhoaHoc kh = new KhoaHoc();
				kh.setID(Integer.parseInt(rs.getString("ID")));
				kh.setTen(rs.getString("Ten"));
				kh.setMoTa(rs.getString("MoTa"));
				kh.setThoiGianBatDau(formatter.format(rs.getDate("ThoiGianBatDau")));
				kh.setThoiGianKetThuc(formatter.format(rs.getDate("ThoiGianKetThuc")));
				
				listKhoaHoc.add(kh);
			}
			return listKhoaHoc;
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}
	
}
