package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.LinhVuc;

public class LinhVucDAO extends DAO {
	
	public LinhVucDAO() {
		super();
	}
	
	public ArrayList<LinhVuc> getTatCaLinhVuc() {
		ArrayList<LinhVuc> lv  = new ArrayList<LinhVuc>();
		String sql = "select * from linhvuc";
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				LinhVuc l = new LinhVuc();
				l.setId(Integer.parseInt(rs.getString("ID")));
				l.setTen(rs.getString("Ten"));
				l.setMoTa(rs.getString("Mota"));
				lv.add(l);
			}
			return lv;
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		return null;
	}
}
