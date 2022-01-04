<%@page import="model.ThanhVien"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/poper.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<title>Trang chủ | Quản ly</title>
<%
	ThanhVien tv = (ThanhVien) session.getAttribute("quanli");
	if (tv == null) {
		response.sendRedirect("../index.jsp");
	}
%>
</head>
<body>

	<div class="container pt-5">
		<div class="row mt-5">
			<div class="col-md-3"></div>
			<div
				class="card col-md-6 shadow-lg p-3 mb-5 bg-white rounded border-0">
				<div class="card-body">
					<h2 class="text-center font-italic">Trang chủ quản lý</h2>
					<div class="row">
						<div class="col text-center">
							<form action="../doDangXuat.jsp?action=logout" method="POST">
								<button type="submit" class="btn btn-primary">Đăng xuất</button>
							</form>
						</div>
					</div>
					<hr>
					<br> <br>
					<div class="row">
						<div class="col text-center">
							<a href="gdChonLoaiTK.jsp" class="btn btn-primary">Xem Thống
								Kê</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>