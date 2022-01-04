package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import model.ThanhVien;

public class ThanhVienDAO extends DAO {

	public ThanhVienDAO() {
		super();
	}

	//ktra dang nhap
	public boolean kiemTraDangNhap(ThanhVien tv) {

		String sql = "select * from thanhvien where TaiKhoan = ? and MatKhau = ?";
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, tv.getTaiKhoan());
			ps.setString(2, tv.getMatKhau());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				tv.setPhanQuyen(rs.getString("PhanQuyen"));
				tv.setID(rs.getInt(1));
				return true;
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return false;

	}

	// Kiem Tra tai Khoan
	public  boolean kiemTraTaiKhoan(String taiKhoan) {

		String sql2 = "SELECT TaiKhoan FROM thanhvien;";
		PreparedStatement ps2 = null;
		
		List<String> list = new ArrayList<String>();

		try {
			ps2 = con.prepareStatement(sql2);
			ResultSet rs = ps2.executeQuery();
			while (rs.next()) {
				list.add(rs.getString(1));
			}
			
			for(String s : list) {
				s = s.trim();
				taiKhoan = taiKhoan.trim();
				if(s.equals(taiKhoan)) {
					return true;
				}
			}		

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// Luu Tai Khoan
	public  boolean dangKyTaiKhoan(String taiKhoan, String matKhau) {

		String sql = "INSERT INTO thanhvien (TaiKhoan, MatKhau, PhanQuyen)\r\n" + " VALUES (?, ?, ?);";

		
		PreparedStatement ps = null;

		try {
			ps = con.prepareStatement(sql);

			ps.setString(1, taiKhoan);
			ps.setString(2, matKhau);
			ps.setString(3, "HV");

			ps.executeUpdate();

			return true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	//Luu Ho ten
	public  boolean luuHoTen(String ho, String ten, int idTV) {
		String sql = "INSERT INTO hoten (Ho, Ten, ThanhVienID)\r\n" + 
				" VALUES (?, ?, ?);";
		PreparedStatement ps = null;
		try {
			
			ps = con.prepareStatement(sql);
			ps.setString(1, ho);
			ps.setString(2, ten);
			ps.setInt(3, idTV);
			ps.executeUpdate();
			return true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
				
		return false;		
	}

	// getID ThanhVien
	public int getIdTheoTaiKhoan(String tk) {
		String sql = "SELECT id FROM thanhvien where TaiKhoan = ?;";
		PreparedStatement ps = null;
		int id = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, tk);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				id = rs.getInt(1);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return id;
	}
	
	public  boolean luuHocVien(int id) {
		String sql = "INSERT INTO hocvien (ThanhVienID, MaHV)\r\n" + 
				" VALUES (?, ?);";
		PreparedStatement ps = null;
		try {
			String s = "HV";
			 Random rand = new Random();
	         int ranNum = rand.nextInt(1000)+1;
	         String a = String.valueOf(ranNum);
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ps.setString(2, s+a);
		
			ps.executeUpdate();
			return true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
				
		return false;
	}

}
