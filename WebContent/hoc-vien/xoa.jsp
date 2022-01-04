<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,dao.*,model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>xoa | Hoc Vien</title>

<link rel="stylesheet" href="assets/css/bootstrap.min.css">

<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/poper.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>

</head>
<body style="padding: 10px 24px">

	<%
		HoTenTDAO ht = new HoTenTDAO();
		PhieuDangKiDAO phieuDangkiDAO = new PhieuDangKiDAO();

		String idHV = session.getAttribute("hocvien").toString().trim();
		int id = Integer.parseInt(idHV);
		
		String idLD = request.getParameter("idTKB");
		System.out.print("ID" + idLD);
		int idLichDay = Integer.parseInt(idLD);
		System.out.print("ID" + idLichDay);
		
		System.out.print("Da Xoa: " + phieuDangkiDAO.deletePhieuDangKy(id, idLichDay) );
		
		response.sendRedirect("gdTQB.jsp");
		
		
	%>


</body>
</html>