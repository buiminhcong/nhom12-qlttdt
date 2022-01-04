package dao;

import model.*;

import java.awt.List;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.mysql.cj.xdevapi.Result;


public class PhieuDangKiDAO extends DAO {

	public PhieuDangKiDAO() {
		super();
	}

	// kiem tra luu dang ki lich day ***********************************
	public boolean ktkuuDK(String ngayDangKy, int KiemTraThanhToan, int HocVienThanhVienID, int LichDayID,
			String TenKhoaHoc, String hocPhi) {
		String sql = "select * from phieudangki\r\n" + 
				"where lichdayid= ? and hocvienthanhvienid = ?";

		String sql1 = "INSERT INTO phieudangki (NgayDangKy, KiemTraThanhToan,\r\n"
				+ "				 HocVienThanhVienID, LichDayID, TenKhoaHoc, HocPhi)\r\n" + "VALUES (?, ?, ?, ?, ?, ?);";
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, LichDayID);
			ps.setInt(2, HocVienThanhVienID);
			ResultSet rs = ps.executeQuery();

			int count = 0;

			while (rs.next()) {
				count++;
			}

			if (count == 0) {
				ps = con.prepareStatement(sql1);
				ps.setDate(1, Date.valueOf(ngayDangKy));
				ps.setInt(2, KiemTraThanhToan);
				ps.setInt(3, HocVienThanhVienID);
				ps.setInt(4, LichDayID);
				ps.setString(5, TenKhoaHoc);
				ps.setString(6, hocPhi);
				ps.executeUpdate();
				return true;
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}
	
	// laays ds phieu dang ki theo hocvien id;
	public  ArrayList<Integer> getIDLichDayByIDHocVien(int idHocVien){
		
		String sql = "select * from phieudangki p \r\n" + 
				"where p.HocVienThanhVienID = ?;";
		PreparedStatement ps = null;
		ArrayList<Integer> list = new ArrayList<Integer>();
		
		try {
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, idHocVien);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				list.add(rs.getInt("lichdayid"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	
	// 
		public  int getIdKhoaHocByIdLichDay(int idLichDay){
			
			String sql = "select khoahocId from lichday where lichday.id = ?;";
			PreparedStatement ps = null;
			ArrayList<Integer> list = new ArrayList<Integer>();
			
			try {
				
				ps = con.prepareStatement(sql);
				ps.setInt(1, idLichDay);
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
					return rs.getInt("khoahocid");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}			
			return 0;
			
		}
		
	// delete
		public  boolean deletePhieuDangKy(int idHocVien, int idLichDay) {
			String sql = "delete from phieudangki where LichDayID = ? and HocVienThanhVienID = ?;";
			PreparedStatement ps = null;
			try {
				
				ps = con.prepareStatement(sql);
				ps.setInt(1, idLichDay);
				ps.setInt(2, idHocVien);
				ps.executeUpdate();
				return true;
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return false;
		}
		
		// kiem tra si so cua lop theo lichdayID
		 
		public static  int siSo(int idLichDay) {
			String sql = "select count(LichDayID) as SiSo from phieudangki where LichDayID = ?; ";
			PreparedStatement ps = null;
			int s = 0;
			try {
				
				ps = con.prepareStatement(sql);
				ps.setInt(1, idLichDay);
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
					s = rs.getInt(1);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return s;
			
		}
		public static void main(String[] args) {
			DAO d = new DAO();
			System.out.println(siSo(9));
		}

}
