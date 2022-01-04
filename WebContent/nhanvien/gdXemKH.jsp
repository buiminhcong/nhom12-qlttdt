<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,dao.*,model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Khóa học | Nhân Vien</title>

<link rel="stylesheet" href="assets/css/bootstrap.min.css">

<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/poper.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>

</head>
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
				<li class="nav-item active"><a class="nav-link" href="#">Chào,
						<%=name%>!
				</a></li>
			</ul>
		
		</div>
	</nav>

	<%
		ArrayList<KhoaHoc> listKH = new KhoaHocDAO().getTatCaKhoaHoc();
	%>

	<div class="container pt-5">
		<div class="row mt-5">
			<div class="col-md-1"></div>
			<div
				class="card col-md-10 shadow-lg p-3 mb-5 bg-white rounded border-0">
				<div class="card-body">
					<h2 class="text-center font-italic">Đăng ký học</h2>
					<hr>
					<div class="row">
						<ul>
							<li><em>Họ và tên: </em><strong><%=name%></strong></li>
						</ul>
					</div>
					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th scope="col">STT</th>
								<th scope="col">Tên khóa học</th>
								<th scope="col">Mô tả</th>
								<th scope="col">Thời gian bắt đầu</th>
								<th scope="col">Thời gian kết thúc</th>
								<th scope="col">Hoc Phí</th>
								<th scope="col"></th>
								<th scope="col"></th>
							</tr>
						</thead>
						<tbody>

							<%
								int i = 1;
								for (KhoaHoc kh : listKH) {
							%>
							<tr>
								<th scope="row"><%=i++%></th>
								<td><%=kh.getTen()%></td>
								<td><%=kh.getMoTa()%></td>
								<td><%=kh.getThoiGianBatDau()%></td>
								<td><%=kh.getThoiGianKetThuc()%></td>
								<td><%=kh.getHocPhi()%></td>
								<td>
									<form action="gdSuaKhoaHoc.jsp" method="POST">
										<input type="text" name="khoahocid"
											value="<%=kh.getID()%>" hidden>
											
										<button type="submit" class="btn btn-primary">Sửa</button>
									</form>
								</td>
								<td>
									<form action="xoaKhoaHoc.jsp" method="POST">
										<input type="text" name="khoahocid"
											value="<%=kh.getID()%>" hidden>
										<button type="submit" class="btn btn-danger">Xóa</button>
									</form>
								</td>
							</tr>

							<%
								}
							%>
						</tbody>
					</table>

					<br>
				
				</div>
			</div>
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