<%@page import="dao.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.Date"%>
<%@page import="model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="assets/css/bootstrap.min.css">

<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/poper.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>

</head>
<body style="padding: 10px 24px">

	<%
		HoTenTDAO ht = new HoTenTDAO();
		String idHVV = session.getAttribute("hocvien").toString().trim();
		int idd = Integer.parseInt(idHVV);
		String name = ht.getNameStudentById(idd);
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
					href="gdChinhHV.jsp">Trang chủ <span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="gdTQB.jsp">Thời khóa biểu</a></li>

				<li><form action="../index.jsp?action=logout" method="POST">
						<button type="submit" class="btn">Đăng xuất</button>
					</form></li>
				<li class="nav-item active"><a class="nav-link" href="#">Chào,
						<%=name%>!
				</a></li>
			</ul>
			<form class="form-inline my-2 my-lg-0" action="timkiem.jsp"
				method="POST">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Tìm kiếm khóa học" aria-label="Search"
					name="tenkhoahoc">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Tìm
					kiếm</button>
			</form>
		</div>
	</nav>

	<br>

	<%
		String idLD = request.getParameter("lichdayid");
		String idHV = session.getAttribute("hocvien").toString();
		int HocVienThanhVienID = Integer.parseInt(idHV);
		boolean kt = true;
		int id = Integer.parseInt(idLD);
		String err = "";
		String siSoDay ="";

		ArrayList<LichDay> lichdays = (ArrayList<LichDay>) session.getAttribute("lich-day");

		LichDay ld = new LichDay();

		for (int i = 0; i < lichdays.size(); i++) {
			if (lichdays.get(i).getId() == id) {
				ld = lichdays.get(i);
				break;
			}
		}

		PhieuDangKiDAO dao = new PhieuDangKiDAO();
		// ******************************//
		int siSoKhoaHoc = ld.getKhoaHoc().getSiSoToiDa();
		int siSoHienTai = dao.siSo(ld.getId());
		System.out.println( "Sĩ số hiện tại" + siSoHienTai);
		if (siSoHienTai <= 2) {
			kt = dao.ktkuuDK(java.time.LocalDate.now().toString(), 1, HocVienThanhVienID, ld.getId(),
					ld.getKhoaHoc().getTen(), ld.getKhoaHoc().getHocPhi());

			if (kt == true) {
				session.setAttribute("thanhcong", "Bạn đã đăng ký học thành công!");
			} else {
				kt = false;
				err = "Bạn đã đăng kí khóa này rồi!";
			}
		}else{
			siSoDay = "Sĩ số lớp đã đầy, bạn vui lòng chọn khóa phù hợp khác!";
		}

		// ********************************//

		//
		//kt = dao.ktkuuDK(java.time.LocalDate.now().toString(), 1, HocVienThanhVienID, ld.getId(),
		//		ld.getKhoaHoc().getTen(), ld.getKhoaHoc().getHocPhi());

		//if (kt == true) {
		//	session.setAttribute("thanhcong", "Bạn đã đăng ký học thành công!");
		//} else {
		//	kt = false;
		//	err = "Bạn đã đăng kí khóa này rồi!";
		//	}
		//
	%>


	<div style="padding: 60px"
		class="row no-gutters bg-light position-relative">

		<div style="margin: 0px 36px"
			class="col-md-6 position-static p-4 pl-md-0 ">

			<h1 class="text-danger">

				<%=err%>
				<%=siSoDay %>
			</h1>

			<h1>
				Bạn đang đăng kí khóa học:
				<%=ld.getKhoaHoc().getTen()%></h1>
			<h5 class="mt-0 text-primary">Hãy nộp học phí theo thông tin
				dưới đây!</h5>
			<h5 class="mt-0 text-primary">
				Học phí:
				<%=ld.getKhoaHoc().getHocPhi()%></h5>
			<p>STT : 13214141421412</p>
			<p>Tên người hưởng thụ : Bùi Minh Công</p>
			<p>Ngân Hàng : Agribank</p>
			<p>
				Nhập mã khi gửi: NOP_HOC_PHI-<%=HocVienThanhVienID%></p>
			<p>Các thông tin sẽ sớm được thông báo sau khi hệ thông kiểm tra






			
			<p>
			<form action="gdChinhHV.jsp" method="POST">

				<button type="submit" class="btn btn-primary">Quay về trang
					chủ</button>
			</form>
		</div>
	</div>

	<br>
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