package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.*;
public class MonHocDAO extends DAO{
	public MonHocDAO() {
		super();
	}
	
	//lay ds mon hoc
	public  List<MonHoc> getDSMonHoc(){
		
		String sql = "select * from monHoc";
		PreparedStatement ps =null;
		List<MonHoc> list = new ArrayList<MonHoc>();
		
		try {
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				MonHoc mh = new MonHoc();
				mh.setId(rs.getInt(1));
				mh.setTenMon(rs.getString(2));
				mh.setMoTa(rs.getString(3));
				
				list.add(mh);
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	
	
}
