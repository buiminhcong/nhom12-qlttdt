<%@ page language="Java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
 import="java.util.*,dao.*,model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Khóa học | Nhân Vien</title>

<link rel="stylesheet" href="assets/css/bootstrap.min.css">

<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/poper.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>

</head>
<body style="padding: 10px 24px">

	<%
		HoTenTDAO ht = new HoTenTDAO();
		KhoaHocDAO khDAO = new KhoaHocDAO();
		MonHocDAO mhDAO = new MonHocDAO();
		String idHV = session.getAttribute("nhanvien").toString().trim();
		int idNV = Integer.parseInt(idHV);
		String name = ht.getNameStudentById(idNV);
		System.out.println("Thanh Cong: " + name);

		String idKH = request.getParameter("ID_KH");
		String ten = request.getParameter("ten");
		String mota = request.getParameter("mota");
		String hocphi = request.getParameter("hocphi");
		String siso = request.getParameter("siso");
		String thoigianBD = request.getParameter("bd");
		String thoigianKT = request.getParameter("kt");
		String kthd = request.getParameter("hoatdong");
		String linhvucID = request.getParameter("idLinhVuc");
		
		int idKkkk = Integer.parseInt(idKH);
		int ss = Integer.parseInt(siso);
		int kthtInt = Integer.parseInt(kthd);
		int lvID = Integer.parseInt(linhvucID);
		
		System.out.println( khDAO.updateKH( ten, mota, hocphi, ss, kthtInt, thoigianBD, thoigianKT, lvID, idKkkk) );
		
		System.out.println(ten + " " + mota + " " + hocphi + " " +ss + " " + thoigianBD + " " + thoigianKT + " " + kthtInt  + " " + lvID + " "+  idNV);
	
		
		
	%>

	<!-- Header -->

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
			fill="currentColor" class="bi bi-house" viewBox="0 0 16 16">
  <path fill-rule="evenodd"
				d="M2 13.5V7h1v6.5a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5V7h1v6.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5zm11-11V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z" />
  <path fill-rule="evenodd"
				d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z" />
</svg>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="gdChinhNV.jsp">Trang chủ <span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item active"><a class="nav-link" href="gdXemKH.jsp">Quản lí khóa học</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="gdThemKH.jsp">Thêm Khóa Học</a></li>

				<li><form action="../index.jsp?action=logout" method="POST">
						<button type="submit" class="btn">Đăng xuất</button>
					</form></li>
				<li class="nav-item active"><a class="nav-link" href="#">Chào,
						<%=name%>!
				</a></li>
			</ul>
			
		</div>
	</nav>

	<!-- body -->

	<h1 class="text-success">Sửa Thành công</h1>

	<div style="margin-top: 250px"></div>

	<!-- body -->
	<!-- Footer -->
	<footer class="bg-info text-center text-white">
		<!-- Grid container -->
		<div class="container p-4 pb-0">
			<p>
				Liện hệ với chúng tôi <a href="https://www.facebook.com/"
					class="text-dark"> tại đây</a>
			</p>
		</div>
		<!-- Grid container -->

		<!-- Copyright -->
		<div class="text-center p-3"
			style="background-color: rgba(0, 0, 0, 0.2);">
			© 2021 Copyright: <a class="text-white"
				href="https://www.facebook.com/">bmcong2k@gmail.com</a>
		</div>
		<!-- Copyright -->
	</footer>



</body>
</html>