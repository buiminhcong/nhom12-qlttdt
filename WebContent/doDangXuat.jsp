<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng Xuất</title>
</head>
<body>

<%
	String logout = request.getParameter("action");
	if(logout.equalsIgnoreCase("logout")) {
		session.removeAttribute("giangvienID");
		session.removeAttribute("giangvien");
		session.removeAttribute("magv");
		session.removeAttribute("hoten");
		session.removeAttribute("dangkyday");
		response.sendRedirect("index.jsp");
	} 

%>

</body>
</html>