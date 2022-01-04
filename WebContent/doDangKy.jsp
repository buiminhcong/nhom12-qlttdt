<%@page import="dao.*"%>
<%@page import="model.ThanhVien"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	
		ThanhVienDAO tvDAO = new ThanhVienDAO();	
	
		String ho = request.getParameter("dkho");
		String ten = request.getParameter("dkten");
		String taiKhoan = request.getParameter("dktaikhoan");
		String matKhau = request.getParameter("dkmatkhau");
		String xacNhanMk = request.getParameter("dknhaplaimatkhau");
		
		if(ho.equals("") || ten.equals("") || taiKhoan.equals("")|| matKhau.equals("") || xacNhanMk.equals("")
				|| taiKhoan.length() <=2 || matKhau.length() <=2){
			System.out.println("1");
			response.sendRedirect("dangky.jsp");
			session.setAttribute("nhapThieu", "Vui lòng điền đầy đủ thôn tin!");
		}else if(matKhau.equals(xacNhanMk) == false ){
			System.out.println("2");
			response.sendRedirect("dangky.jsp");
			session.setAttribute("saiMK", "Mật khẩu chưa khớp, vui lòng thử lại!");
		}else if(tvDAO.kiemTraTaiKhoan(taiKhoan) == true){
			System.out.println("3");
			response.sendRedirect("dangky.jsp");
			session.setAttribute("taiKhoanDaCo", "Tài khoản đã có vui lòng nhập tài khoản khác!");
		}else{
			System.out.println("4");
			System.out.println(tvDAO.dangKyTaiKhoan(taiKhoan, matKhau));
			System.out.println(tvDAO.getIdTheoTaiKhoan(taiKhoan));
			System.out.println(tvDAO.luuHoTen(ho, ten, tvDAO.getIdTheoTaiKhoan(taiKhoan)));
			tvDAO.luuHocVien(tvDAO.getIdTheoTaiKhoan(taiKhoan));
			response.sendRedirect("index.jsp");
			session.setAttribute("dkThanhCong", "Đăng ký thành công!");
		}
				
		
	%>
</body>
</html>