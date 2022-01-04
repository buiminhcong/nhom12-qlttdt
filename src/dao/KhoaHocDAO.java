package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.SimpleFormatter;

import com.mysql.cj.xdevapi.Result;

import model.KhoaHoc;

public class KhoaHocDAO extends DAO{
	
	public KhoaHocDAO() {
		super();
	}
	//
	public ArrayList<KhoaHoc> getTatCaKhoaHoc(){
		ArrayList<KhoaHoc> listKhoaHoc = new ArrayList<KhoaHoc>();
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		String sql = "select kh.ID, kh.Ten, kh.MoTa, kh.ThoiGianBatDau, kh.ThoiGianKetThuc,kh.HocPhi"
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
				kh.setHocPhi(rs.getString("HocPhi"));
				
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
		String sql = "select kh.ID, kh.Ten, kh.MoTa, kh.ThoiGianBatDau, kh.ThoiGianKetThuc, kh.HocPhi"
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
				kh.setHocPhi(rs.getString("HocPhi"));
				
				listKhoaHoc.add(kh);
			}
			return listKhoaHoc;
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}
	
	//
	public List<Integer> getIdKhoaHocByTenKhoaHoc(String tenKhoaHoc) {
		List<Integer> list = new ArrayList<Integer>();
		String sql = "select khoahoc.id from khoahoc where khoahoc.Ten like ?;";
		PreparedStatement ps = null;
		try {
			
			ps = con.prepareStatement(sql);
			ps.setString(1, "%" + tenKhoaHoc + "%" );

			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				list.add(rs.getInt(1));
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// Luu khóa học
	public boolean luuKhoaHoc(int idNV, String ten, String moTa,
			String hocPhi,int siSo, int ktht, String ngayBD, String ngayKT, int IDLinhVuc) {
		
		 
		String sql = "INSERT INTO khoahoc (NhanVienThanhVienID, Ten, MoTa, HocPhi, SiSoToiDa,KiemTraHoatDong, ThoiGianBatDau,ThoiGianKetThuc, LinhVucID)\r\n" + 
				" VALUES (?,?,?,?,?,?,?,?,?);";
		PreparedStatement ps = null;
		
		try {
			
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, idNV);
			ps.setString(2, ten);
			ps.setString(3, moTa);
			ps.setString(4, hocPhi);
			ps.setInt(5, siSo);
			ps.setInt(6, ktht);
			ps.setDate(7, Date.valueOf(ngayBD));
			ps.setDate(8, Date.valueOf(ngayKT));
			ps.setInt(9, IDLinhVuc);
			
			ps.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	// Xoa
	public boolean deleteKhoaHoc(int id) {
		String sql = "delete from khoahoc where id = ?;";
		PreparedStatement ps = null;
		try {
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			
			ps.executeUpdate();
			return true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
		
	}
	
	//
	public KhoaHoc getKhoaHocByID(int id) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String sql = "select * from khoahoc where id = ?;";
		PreparedStatement ps =null;
		KhoaHoc kh = new KhoaHoc();
		try {
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				kh.setID(id);
				kh.setTen(rs.getString("ten"));
				kh.setMoTa(rs.getString("mota"));
				kh.setHocPhi(rs.getString("hocphi"));
				kh.setSiSoToiDa(rs.getInt("SiSoToiDa"));
				kh.setKiemTraHoatDong(rs.getInt("KiemTraHoatDong"));
				kh.setThoiGianBatDau(sdf.format(rs.getDate("ThoiGianBatDau")));
				kh.setThoiGianKetThuc(sdf.format(rs.getDate("ThoiGianKetThuc")));
				kh.setLinhVucID(rs.getInt("LinhVucID"));
				kh.setNhanVienThanhToanID(rs.getInt("NhanVienThanhVienID"));
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return kh;
	}
	
	public boolean updateKH(String ten, String moTa,
							String hocPhi,int siSo, int ktht, String ngayBD, String ngayKT, int IDLinhVuc, int idKH) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String sql = "UPDATE khoahoc\r\n" + 
				" SET Ten = ?, MoTa = ?, HocPhi = ?, SiSoToiDa = ?, KiemTraHoatDong = ?,\r\n" + 
				" ThoiGianBatDau = ?, ThoiGianKetThuc = ?, LinhVucID =? WHERE (ID = ?);";
		PreparedStatement ps =null;
		
		KhoaHoc kh = new KhoaHoc();
		
		try {
			
			ps = con.prepareStatement(sql);
			
			ps.setString(1, ten);
			ps.setString(2, moTa);
			ps.setString(3, hocPhi);
			ps.setInt(4, siSo);
			ps.setInt(5, ktht);
			ps.setDate(6, Date.valueOf(ngayBD));
			ps.setDate(7, Date.valueOf(ngayKT));
			ps.setInt(8, IDLinhVuc);
			ps.setInt(9,idKH);
			
			
			ps.executeUpdate();
			return true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}



	
	
}

