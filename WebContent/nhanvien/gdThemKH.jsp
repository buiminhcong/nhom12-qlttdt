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
		KhoaHocDAO khDAO = new KhoaHocDAO();
		String idHV = session.getAttribute("nhanvien").toString().trim();
		int id = Integer.parseInt(idHV);
		String name = ht.getNameStudentById(id);
		System.out.println("Thanh Cong: " + name);

		ArrayList<LinhVuc> linhvuc = (new LinhVucDAO()).getTatCaLinhVuc();
		
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

	<section style="margin-bottom: 30px" class="vh-100 gradient-custom">
		<div class="container py-5 h-100">
			<div class="row justify-content-center align-items-center h-100">
				<div class="col-12 col-lg-9 col-xl-7">
					<div class="card shadow-2-strong card-registration"
						style="border-radius: 15px;">
						<div class="card-body p-4 p-md-5">
							<h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Thêm khóa học</h3>
							<form action="gdThanhCong.jsp" method="post">
								<div class="row">
									<div class="col-md-6 mb-4">

										<div class="form-outline">
											<input name="ten" type="text" id="firstName"
												class="form-control form-control-lg" /> <label
												class="form-label" for="firstName">Tên</label>
										</div>

									</div>
									<div class="col-md-6 mb-4">

										<div class="form-outline">
											<input name="mota" type="text" id="lastName"
												class="form-control form-control-lg" /> <label
												class="form-label" for="lastName">Mô Tả</label>
										</div>

									</div>
								</div>
								<div class="row">
									<div class="col-md-6 mb-4">

										<div class="form-outline">
											<input name="hocphi" type="text" id="firstName"
												class="form-control form-control-lg" /> <label
												class="form-label" for="firstName">Học phí</label>
										</div>

									</div>
									<div class="col-md-6 mb-4">

										<div class="form-outline">
											<input name="siso" type="text" id="lastName"
												class="form-control form-control-lg" /> <label
												class="form-label" for="lastName">Sĩ số tối đa</label>
										</div>

									</div>
								</div>

								<div class="row">
									<div class="col-md-6 mb-4">

										<div class="form-outline">
											<input name="bd" placeholder="yyyy-MM-dd" type="text" id="firstName"
												class="form-control form-control-lg" /> <label
												class="form-label" for="firstName">Thời
												gian bắt đầu</label>
										</div>

									</div>
									<div class="col-md-6 mb-4">

										<div class="form-outline">
											<input name="kt" placeholder="yyyy-MM-dd" type="text" id="lastName"
												class="form-control form-control-lg" /> <label
												class="form-label" for="lastName">Thời
												gian kết thúc</label>
										</div>

									</div>
								</div>

								<div class="row">
									<div class="col-md-6 mb-4 pb-2">

										<div class="form-outline">
											<select name="hoatdong" class="select form-control-lg">
												<option value="1">Hoạt động</option>
												<option value="2">Kết thúc</option>
											</select> <label class="form-label select-label">Kiểm tra hoạt
												động</label>
										</div>

									</div>
									<div class="col-md-6 mb-4 pb-2">

										<div class="form-outline">
											<select name="idLinhVuc" class="select form-control-lg">
												<%
													for (LinhVuc v : linhvuc) {
												%>
												
												<option value="<%=v.getId()%>"><%=v.getTen()%></option>
												
												<%
													}
												%>
											</select> <label class="form-label select-label">Lĩnh vực</label>
										</div>

									</div>
								</div>										
								
								<div class="mt-4 pt-2">
									 <button type="submit" class="btn btn-primary">Tiếp</button>
								</div>

							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

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