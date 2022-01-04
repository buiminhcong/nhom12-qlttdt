package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.HoTen;

public class HoTenDAO extends DAO{
	
	public HoTenDAO() {
		super();
	}
	
	public HoTen getLayHoTen(int idThanhVien) {
		HoTen ht = new HoTen();
		String sql = "select * from hoten where ThanhVienID = ?";
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, idThanhVien);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				ht.setHo(rs.getString("Ho"));
				ht.setTenDem(rs.getString("TenDem"));
				ht.setTen(rs.getString("Ten"));
				
			}
			
			return ht;
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		return null;
		
	}

}

