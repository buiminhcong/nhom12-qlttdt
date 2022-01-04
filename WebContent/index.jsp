<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common/header.html"%>

<body>

	<%
		String err = (String) session.getValue("sai");

		String username = (String) session.getValue("username");
		String password = (String) session.getValue("password");

		if (err == null || err == "") {
			err = "";
			username = "";
			password = "";
		} else {
			username = (String) session.getValue("username");
			password = (String) session.getValue("password");
			err = (String) session.getValue("sai");
		}
	%>

	<h1 style="margin-top: 50px; margin-bottom: 50px"  class="text-primary text-center">Đăng
		Nhập</h1>


	<section class="vh-100">
		<div class="container-fluid h-custom">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-md-9 col-lg-6 col-xl-5">
					<img
						src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
						class="img-fluid" alt="Sample image">
				</div>
				<div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
					<form action="doDangNhap.jsp" method="post">
						<!-- Email input -->
						<p class = "text-danger"><%=err %></p>
						<div class="form-outline mb-4">
							<input name="username" value="${username}" type="text"
								id="form3Example3" class="form-control form-control-lg"
								placeholder="Nhập tài khoản" /> <label class="form-label"
								for="form3Example3">Tài Khoản</label>
						</div>

						<!-- Password input -->
						<div class="form-outline mb-3">
							<input name="password" value="${password}" type="password"
								id="form3Example4" class="form-control form-control-lg"
								placeholder="Nhập mật khẩu" /> <label class="form-label"
								for="form3Example4">mật khẩu</label>
						</div>

						<div class="text-center text-lg-start mt-4 pt-2">
							<button type="submit" class="btn btn-primary btn-lg"
								style="padding-left: 2.5rem; padding-right: 2.5rem;">Đăng Nhập</button>

							<p class="small fw-bold mt-2 pt-1 mb-0">
								Bạn có tài khoản chưa? <a href="dangky.jsp" class="link-danger">Đăng ký</a>
							</p>
						</div>

					</form>
				</div>
			</div>
		</div>
		<div style="margin-bottom: 0px"
			class="d-flex flex-column flex-md-row text-center text-md-start justify-content-between py-4 px-4 px-xl-5 bg-primary">
			<!-- Copyright -->
			<div class="text-white mb-3 mb-md-0">Copyright © 2021. Bui Minh Cong.</div>
			<!-- Copyright -->

			
		</div>
	</section>

</body>
</html>