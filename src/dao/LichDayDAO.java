package dao;

import java.sql.PreparedStatement;
import java.util.*;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import model.GiangVien;
import model.GioDay;
import model.KhoaHoc;
import model.LichDay;
import model.MonHoc;
import model.MonHoc_KhoaHoc;
import model.PhongHoc;
import model.ThuDay;

public class LichDayDAO extends DAO {

	public LichDayDAO() {
		super();
	}

	// 1
	public ArrayList<LichDay> getKhungGioHoc(String idKhoaHoc) {

		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");

		ArrayList<LichDay> listLD = new ArrayList<LichDay>();
		String sql = "select * from lichday, khoahoc, gioday, thuday, phonghoc, giangvien\r\n"
				+ "where lichday.KhoaHocID = khoahoc.ID\r\n" + "and lichday.GioDayID = gioday.ID\r\n"
				+ "and lichday.PhongHocID = phonghoc.ID\r\n" + "and lichday.ThuDayID = thuday.ID\r\n"
				+ "and lichday.GiangVienThanhVienID = giangvien.ThanhVienID\r\n" + "and khoahoc.ID = ?";
		PreparedStatement ps = null;

		try {

			ps = con.prepareStatement(sql);
			int id = Integer.parseInt(idKhoaHoc);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				// new Khoa Hoc
				KhoaHoc kh = new KhoaHoc();
				kh.setID(rs.getInt("khoahoc.ID"));
				kh.setTen(rs.getString("khoahoc.Ten"));
				kh.setMoTa(rs.getString("khoahoc.MoTa"));
				kh.setSiSoToiDa(rs.getInt("SiSoToiDa"));
				kh.setThoiGianBatDau(formatter.format(rs.getDate("ThoiGianBatDau")));
				kh.setThoiGianKetThuc(formatter.format(rs.getDate("ThoiGianKetThuc")));
				kh.setHocPhi(rs.getString("HocPhi"));
				// new giang vien

				GiangVien gv = new GiangVien();
				gv.setMaGiangVien(rs.getString("MaGV"));

				// Thu day

				ThuDay td = new ThuDay();
				td.setId(rs.getInt("thuday.ID"));
				td.setTen(rs.getString("thuday.Ten"));
				td.setMoTa(rs.getNString("thuday.MoTa"));

				// Gio Day
				GioDay gd = new GioDay();
				gd.setId(rs.getInt("gioday.ID"));
				gd.setTen(rs.getString("gioday.Ten"));
				gd.setMoTa(rs.getString("gioday.MoTa"));

				// Phong hoc
				PhongHoc ph = new PhongHoc();
				ph.setId(rs.getInt("phonghoc.ID"));
				ph.setTen(rs.getString("phonghoc.Ten"));
				ph.setMoTa(rs.getString("phonghoc.MoTa"));
				ph.setSucChua(rs.getInt("phonghoc.SucChua"));

				LichDay lichDay = new LichDay();
				lichDay.setGiangVien(gv);
				lichDay.setGioDay(gd);
				lichDay.setId(rs.getInt("lichday.ID"));
				lichDay.setKhoaHoc(kh);
				lichDay.setPhongHoc(ph);
				lichDay.setThuDay(td);

				listLD.add(lichDay);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return listLD;

	}

	// 2 kiem tra luu dang ki lich day
	public boolean kiemTraVaLuuDK(String thu, String gio, String phong, String khoahoc, int giangvien) {
		String sql = "select ID from lichday" + " where ThuDayID = ?" + " and GioDayID = ?" + " and PhongHocID = ?"
				+ " and KhoaHocID = ?";
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(thu));
			ps.setInt(2, Integer.parseInt(gio));
			ps.setInt(3, Integer.parseInt(phong));
			ps.setInt(4, Integer.parseInt(khoahoc));
			ResultSet rs = ps.executeQuery();
			if (rs.next() == true) {
				return false;
			} else {
				String sqlThem = "INSERT INTO lichday(GiangVienThanhVienID, KhoaHocID, GioDayID, ThuDayID, PhongHocID) "
						+ " VALUES(?,?,?,?,?)";
				PreparedStatement psThem = con.prepareStatement(sqlThem);
				psThem.setInt(1, giangvien);
				psThem.setInt(2, Integer.parseInt(khoahoc));
				psThem.setInt(3, Integer.parseInt(gio));
				psThem.setInt(4, Integer.parseInt(thu));
				psThem.setInt(5, Integer.parseInt(phong));
				psThem.executeUpdate();
			}
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return false;
	}

	// 3
	public static ArrayList<LichDay> getLichDayTheoKhoaHoc(int idKhoaHoc) {
		ArrayList<LichDay> list = new ArrayList<LichDay>();
		String sql = "select lichday.id, khoahoc.ten as tenkh, gioday.ten as tengd, thuday.ten as tentd, phonghoc.ten as tenphong\n"
				+ "from lichday\n" + "Inner Join khoahoc\n" + "on khoahoc.id = lichday.khoahocid\n"
				+ "Inner Join gioday\n" + "on lichday.giodayid = gioday.id\n" + "Inner Join thuday\n"
				+ "on lichday.thudayid = thuday.id\n" + "Inner Join phonghoc\n"
				+ "on phonghoc.id = lichday.phonghocid\n" + "where khoahocid = ?;";
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, idKhoaHoc);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
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
	
	// 4 get 1 TKB theo id lich day
	public LichDay getTKB(int idLichDay) {
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
	
		String sql = "select lichday.id as idLichDay, khoahoc.ten as tenkh,\r\n" + 
				" gioday.ten as tengd, thuday.ten as tentd, phonghoc.ten as tenphong,\r\n" + 
				" khoahoc.ThoiGianBatDau\r\n" + 
				"	from lichday Inner Join khoahoc on khoahoc.id = lichday.khoahocid\r\n" + 
				"	Inner Join gioday on lichday.giodayid = gioday.id\r\n" + 
				"    Inner Join thuday on lichday.thudayid = thuday.id\r\n" + 
				"    Inner Join phonghoc on phonghoc.id = lichday.phonghocid\r\n" + 
				"    where lichday.id = ?;";
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, idLichDay);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int lichDayId = rs.getInt(1);
				String tenKH = rs.getString(2);
				String tenGD = rs.getString(3);
				String tenTD = rs.getString(4);
				String tenPhong = rs.getString(5);
				String thoiGianBatDau = formatter.format(rs.getDate(6));
				

				KhoaHoc kh = new KhoaHoc();
				kh.setTen(tenKH);
				kh.setThoiGianBatDau(thoiGianBatDau);

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
				return lichDay;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
}