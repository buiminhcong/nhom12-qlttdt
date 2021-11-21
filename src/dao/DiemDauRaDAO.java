package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.DiemDauRa;

public class DiemDauRaDAO extends DAO{

	public DiemDauRaDAO() {
		super();
	}
	
	public ArrayList<DiemDauRa> getDSHocVienVaDiem(int lichDay) {
		ArrayList<DiemDauRa>list = new ArrayList<DiemDauRa>();
		String sql = "select hoten.ho, hoten.tendem, hoten.ten, diem\r\n"
				+ "from diemdaura\r\n"
				+ "inner join phieudangki\r\n"
				+ "on phieudangki.id = diemdaura.phieudangkiid\r\n"
				+ "inner join lichday\r\n"
				+ "on lichday.id = phieudangki.lichdayid\r\n"
				+ "inner join thanhvien\r\n"
				+ "on thanhvien.id = phieudangki.hocvienthanhvienid\r\n"
				+ "inner join hoten\r\n"
				+ "on hoten.thanhvienid = thanhvien.id\r\n"
				+ "where lichday.id= ?";
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, lichDay);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				String hoTen = rs.getString(1) + " " + rs.getString(2) + " " + rs.getString(3);
				float diem = rs.getFloat(4);
				DiemDauRa d = new DiemDauRa();
				d.setHoTen(hoTen);
				d.setDiem(diem);
				list.add(d);
 			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
