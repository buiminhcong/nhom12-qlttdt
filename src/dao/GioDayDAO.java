package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.GioDay;

public class GioDayDAO extends DAO {
	
	public GioDayDAO() {
		super();
	}
	
	public ArrayList<GioDay> getTatCaGioDay() {
		ArrayList<GioDay> gd  = new ArrayList<GioDay>();
		String sql = "select * from gioday";
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				GioDay g = new GioDay();
				g.setId(rs.getInt("ID"));
				g.setTen(rs.getString("Ten"));
				g.setMoTa(rs.getString("Mota"));
				gd.add(g);
			}
			return gd;
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		return null;
	}
}
