package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DAO {

	public static Connection con;

	public DAO() {
			if (con == null) {
				 String url = "jdbc:mysql://localhost:3306/quan_li_dao_tao";
				String dbClass = "com.mysql.jdbc.Driver";
				try {
					Class.forName(dbClass);
					con = DriverManager.getConnection(url, "root", "26092111");
				} catch (Exception e) {
					e.printStackTrace();
				}
			}	
		}
	
}
