<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,dao.*,model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>xoa | Nhan Vien</title>

<link rel="stylesheet" href="assets/css/bootstrap.min.css">

<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/poper.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>

</head>
<body style="padding: 10px 24px">

	<%
		
		KhoaHocDAO khDAO = new KhoaHocDAO();

		
		
		String idkh = request.getParameter("khoahocid");
		System.out.print("ID" + idkh);
		int id = Integer.parseInt(idkh);
		System.out.print("ID" + id);
		
		System.out.print("Da Xoa: " + khDAO.deleteKhoaHoc(id));
		
		response.sendRedirect("gdXemKH.jsp");
		
		
	%>


</body>
</html>