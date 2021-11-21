package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import model.GioDay;
import model.KhoaHoc;
import model.LichDay;
import model.PhongHoc;
import model.ThuDay;

public class LichDayDAO extends DAO {
	
	public LichDayDAO() {
		super();
	}
	
	public ArrayList<LichDay> getGiangVienTheoKhoaHoc(String idKhoaHoc){
		ArrayList<LichDay> listLichDay = new ArrayList<LichDay>();
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		String sql = "select * from lichday, thanhvien, hoten\r\n" + 
				" where KhoaHocID = ? \r\n" + 
				" and lichday.GiangVienThanhVienID = thanhvien.id\r\n" + 
				" and thanhvien.id = hoten.id\r\n" + 
				"";
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(sql);
			int id = Integer.parseInt(idKhoaHoc);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				KhoaHoc kh = new KhoaHoc();
				kh.setID(Integer.parseInt(rs.getString("ID")));
				kh.setTen(rs.getString("Ten"));
				kh.setMoTa(rs.getString("MoTa"));
				kh.setThoiGianBatDau(formatter.format(rs.getDate("ThoiGianBatDau")));
				kh.setThoiGianKetThuc(formatter.format(rs.getDate("ThoiGianKetThuc")));
				LichDay ld = new LichDay();
				ld.setKhoaHoc(kh);
				listLichDay.add(ld);
			}
			return listLichDay;
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}
	
	
	public boolean kiemTraVaLuuDK(String thu, String gio, String phong, String khoahoc, String giangvien) {
		String sql = "select ID from lichday"
					+ " where ThuDayID = ?"
					+ " and GioDayID = ?"
					+ " and PhongHocID = ?";
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(thu));
			ps.setInt(2, Integer.parseInt(gio));
			ps.setInt(3, Integer.parseInt(phong));
			ResultSet rs = ps.executeQuery();
			if(rs.next() == true) {
				return false;
			} else {
				String sqlThem = "INSERT INTO lichday(GiangVienThanhVienID, KhoaHocID, GioDayID, ThuDayID, PhongHocID) "
								+ " VALUES(?,?,?,?,?)";
				PreparedStatement psThem = con.prepareStatement(sqlThem);
                psThem.setInt(1, Integer.parseInt(giangvien));
                psThem.setInt(2, Integer.parseInt(khoahoc));
                psThem.setInt(3, Integer.parseInt(gio));
                psThem.setInt(4, Integer.parseInt(thu));
                psThem.setInt(5, Integer.parseInt(phong));
                psThem.executeUpdate();
			}
			return true;
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		return false;
	}
	
	public ArrayList<LichDay> getLichDayTheoKhoaHoc(int idKhoaHoc) {
		ArrayList<LichDay>list = new ArrayList<LichDay>();
		String sql = "select lichday.id, khoahoc.ten as tenkh, gioday.ten as tengd, thuday.ten as tentd, phonghoc.ten as tenphong\n"
				+ "from lichday\n"
				+ "Inner Join khoahoc\n"
				+ "on khoahoc.id = lichday.khoahocid\n"
				+ "Inner Join gioday\n"
				+ "on lichday.giodayid = gioday.id\n"
				+ "Inner Join thuday\n"
				+ "on lichday.thudayid = thuday.id\n"
				+ "Inner Join phonghoc\n"
				+ "on phonghoc.id = lichday.phonghocid\n"
				+ "where khoahocid = ?;";
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, idKhoaHoc);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				int lichDayId = rs.getInt(1);
				String tenKH = rs.getString(2);
				String tenGD = rs.getString(3);
				String tenTD = rs.getString(4);
				String tenPhong = rs.getString(5);
				
				KhoaHoc kh = new KhoaHoc();
				kh.setTen(tenKH);
			
				ThuDay td = new ThuDay();
				td.setTen(tenTD);
				
				GioDay gd = new GioDay();
				gd.setTen(tenGD);
				
				PhongHoc ph = new PhongHoc();
				ph.setTen(tenPhong);
				
				LichDay lichDay = new LichDay();
				lichDay.setId(lichDayId);
				lichDay.setKhoaHoc(kh);
				lichDay.setGioDay(gd);
				lichDay.setThuDay(td);
				lichDay.setPhongHoc(ph);
				list.add(lichDay);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}