package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.ThuDay;

public class ThuDayDAO extends DAO {
	
	public ThuDayDAO() {
		super();
	}
	
	public ArrayList<ThuDay> getTatCaThuDay() {
		ArrayList<ThuDay> kq  = new ArrayList<ThuDay>();
		String sql = "select * from thuday";
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				ThuDay td = new ThuDay();
				td.setId(rs.getInt("ID"));
				td.setTen(rs.getString("Ten"));
				td.setMoTa(rs.getString("Mota"));
				kq.add(td);
			}
			return kq;
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		return null;
	}
}