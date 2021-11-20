<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common/header.html"%>

<body >

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

	<h1 style="padding: 50px" class="text-primary">Trang Chu</h1>
	<form style="padding: 20px 50px"  action="doDangNhap.jsp" method="post">
		<div class="form-group">
			<p class="text-danger">
				${err}
			</p>
			<label for="email">Tài Khoản:</label> <input value="${username}" type="text"
				class="form-control" placeholder="Enter Username" id="email"
				name="username">
		</div>
		<div class="form-group">
			<label for="pwd">Mật khẩu:</label> <input value="${password}"
				type="password" class="form-control" placeholder="Enter password"
				id="pwd" name="password">
		</div>
		<div class="form-group form-check">
			<label class="form-check-label"> <input
				class="form-check-input"  type="checkbox">
				Remember me
			</label>
		</div>
		<button type="submit" class="btn btn-primary">Submit</button>
	</form>
</body>
</html>