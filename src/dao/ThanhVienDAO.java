package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.ThanhVien;

public class ThanhVienDAO extends DAO{
	
	public ThanhVienDAO() {
		super();
	}
	
	public boolean kiemTraDangNhap(ThanhVien tv) {
		
		String sql = "select * from thanhvien where TaiKhoan = ? and MatKhau = ?";
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, tv.getTaiKhoan());
			ps.setString(2, tv.getMatKhau());
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				tv.setPhanQuyen(rs.getString("PhanQuyen"));	
				return true;
			}
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		return false;
		
	}

	


}
