package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.PhongHoc;

public class PhongHocDAO extends DAO {
	
	public PhongHocDAO() {
		super();
	}
	
	public ArrayList<PhongHoc> getTatCaPhongHoc() {
		ArrayList<PhongHoc> kq  = new ArrayList<PhongHoc>();
		String sql = "select * from phonghoc";
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				PhongHoc ph = new PhongHoc();
				ph.setId(rs.getInt("ID"));
				ph.setTen(rs.getString("Ten"));
				ph.setMoTa(rs.getString("Mota"));
				kq.add(ph);
			}
			return kq;
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		return null;
	}
}