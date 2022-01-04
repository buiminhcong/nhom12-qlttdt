<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.Date"%>
<%@page import="model.*"%>
<%@include file="common/header.html"%>

<body style="padding: 10px 24px">


	<%
		HoTenTDAO ht = new HoTenTDAO();
		String idHV = session.getAttribute("nhanvien").toString().trim();
		int id = Integer.parseInt(idHV);
		String name = ht.getNameStudentById(id);
		System.out.println("Thanh Cong: " + name);
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



				<li class="nav-item active"><a
					class="nav-link glyphicon glyphicon-user" href="#">Chào, <%=name %>! </a></li>

			</ul>

			
		</div>
	</nav>



	<h1 style="padding-top: 16px" class="text-primary text-center">Trang
		Chủ</h1>


	<div style="padding-top: 24px"
		class="row no-gutters bg-light position-relative">
		<div class="col-md-6 mb-md-0 p-md-4">
			<img src="static/images/KhoaHoc.jpg" class="w-100" alt="...">
		</div>
		<div class="col-md-6 position-static p-4 pl-md-0">
			<h5 class="mt-0">Danh Sách các khóa học</h5>
			<p>Nhân viên có thể thêm, sửa, xóa các khóa học tại đây!</p>
			<a href="gdXemKH.jsp" class="stretched-link">Quản lý các khóa học</a>
		</div>
	</div>

	<br></br>

	<div style="padding-top: 24px"
		class="row no-gutters bg-light position-relative">
		<div class="col-md-6 mb-md-0 p-md-4">
			<img src="static/images/VeChungToi.jpg" class="w-100" alt="...">
		</div>
		<div class="col-md-6 position-static p-4 pl-md-0">
			<h5 class="mt-0">Liên hệ để phát triển</h5>
			<p>TechGroup12 là Nhóm PTTK thầy Phong .</p>
			<a href="" class="stretched-link">Về Chúng tôi</a>
		</div>
	</div>

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