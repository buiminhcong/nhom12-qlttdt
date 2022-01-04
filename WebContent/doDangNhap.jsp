<%@page import="dao.*"%>
<%@page import="model.*"%>
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
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		ThanhVienDAO dao = new ThanhVienDAO();
		GiangVienDAO d = new GiangVienDAO();

		ThanhVien tv = new ThanhVien();
		tv.setTaiKhoan(username);
		tv.setMatKhau(password);

		boolean kq = dao.kiemTraDangNhap(tv);

		System.out.println(kq);

		if (kq == true && tv.getPhanQuyen().equals("QTV")) {
			session.setAttribute("admin", tv);
			response.sendRedirect("admin.jsp");
		} else if (kq == true && tv.getPhanQuyen().equals("HV")) {
			session.setAttribute("hocvien", tv.getID());
			response.sendRedirect("hoc-vien/gdChinhHV.jsp");

		} else if (kq == true && tv.getPhanQuyen().equals("GV")) {
			GiangVien gv = (new GiangVienDAO()).getLayMaGiangVien(tv.getID());
			String hoten = null;
			if(tv != null) {
				HoTen ht = (new HoTenDAO()).getLayHoTen(tv.getID());
				hoten = ht.getHo() + " " + ht.getTenDem() + " " + ht.getTen();
			}
			session.setAttribute("giangvienID", tv.getID());
			
			System.out.print(tv.getID());
			session.setAttribute("giangvien", "giangvien");
			session.setAttribute("magv", gv.getMaGiangVien());
			session.setAttribute("hoten", hoten);
			response.sendRedirect("giang-vien/gdChinhGV.jsp");
		} else if (kq == true && tv.getPhanQuyen().equals("NV")) {
			session.setAttribute("nhanvien", tv.getID());
			response.sendRedirect("nhanvien/gdChinhNV.jsp");
		} else if (kq == true && tv.getPhanQuyen().equals("QL")) {
			session.setAttribute("quanli", tv);
			response.sendRedirect("quan-ly/gdChinhQL.jsp");
		} else {
			session.setAttribute("sai", "Vui lòng xem lại tài khoản và mật khẩu!");
			session.setAttribute("username", username);
			session.setAttribute("password", password);
			response.sendRedirect("index.jsp");
		}
	%>
</body>
</html>