package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class HoTenTDAO extends DAO{
	
	public HoTenTDAO() {
		super();
	}

	public  String getNameStudentById(int id) {
		
		PreparedStatement ps = null;
		String sql = "select h.Ten from hoten h where  h.ThanhVienID = ?;";
		String name = "";
		
		try {
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				name = rs.getString(1);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return name;
	}
	
}
