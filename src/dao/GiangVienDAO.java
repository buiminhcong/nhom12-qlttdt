package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.GiangVien;


public class GiangVienDAO  extends DAO{
	
	public GiangVienDAO() {
		super();
	}
	
	public GiangVien getLayMaGiangVien(int idThanhVien) {
		GiangVien gv = new GiangVien();
		String sql = "select * from giangvien where ThanhVienID = ?";
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, idThanhVien);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				gv.setMaGiangVien(rs.getString("MaGV"));
				
			}
			
			return gv;
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		return null;
		
	}

	


}

