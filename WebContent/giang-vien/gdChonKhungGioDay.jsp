<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,dao.*,model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Khung giờ dạy | Giảng viên</title>

<link rel="stylesheet" href="assets/css/bootstrap.min.css">

<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/poper.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>

</head>
<body>

	<%
		String giangvien = (String) session.getAttribute("giangvien");
		if (giangvien != null) {

			String action = request.getParameter("action");
			String khoahocID = null;
			ArrayList<ThuDay> listThuDay = (new ThuDayDAO()).getTatCaThuDay();
			;
			ArrayList<GioDay> listGioDay = (new GioDayDAO()).getTatCaGioDay();
			ArrayList<PhongHoc> listPhongHoc = (new PhongHocDAO()).getTatCaPhongHoc();
			boolean kiemTra = true;

			if ((action == null) || (action.trim().length() == 0)) {
				khoahocID = request.getParameter("khoahocid");

			} else {
				String thu = request.getParameter("thuday");
				String gio = request.getParameter("gioday");
				String phong = request.getParameter("phonghoc");
				khoahocID = request.getParameter("khoahocid");
				//String s = (String)
				String idGV = session.getAttribute("giangvienID").toString().trim();
				int giangvienID = Integer.parseInt(idGV);
				boolean lichday = (new LichDayDAO()).kiemTraVaLuuDK(thu, gio, phong, khoahocID, giangvienID);
				if (lichday == true) {
					session.setAttribute("dangkyday", "Bạn đã đăng ký dạy thành công");
					response.sendRedirect("gdChinhGV.jsp");
				} else {
					kiemTra = false;
				}
			}
	%>

	<div class="container">
		<div class="row mt-5">
			<div class="col-md-2"></div>
			<div
				class="card col-md-8 shadow-lg p-3 mb-5 bg-white rounded border-0">
				<div class="card-body">
					<h2 class="text-center font-italic">
						Chọn khung giờ dạy cho khóa học
						<%=session.getAttribute("tenkhoahoc")%></h2>

					<%
						if (kiemTra == false) {
					%>
					<div class="alert alert-danger text-center" role="alert">
						<strong>Hiện tại khung giờ dạy và phòng học bạn chọn đã
							có người đăng ký rồi.</strong>
						<p>Bạn vui lòng chọn khung giờ và phòng học khác.</p>
					</div>
					<%
						}
					%>

					<hr>
					<form action="gdChonKhungGioDay.jsp?action=kiemtra" method="POST">
						<div class="row">
							<div class="col-2"></div>
							<h4 class="col-3 text-right">Thứ dạy:</h4>
							<div class="col-6">
								<select class="custom-select" id="thuday" name="thuday">

									<%
										for (ThuDay td : listThuDay) {
									%>
									<option value="<%=td.getId()%>"><%=td.getTen()%></option>
									<%
										}
									%>

								</select>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-2"></div>
							<h4 class="col-3 text-right">Giờ dạy:</h4>
							<div class="col-6">
								<select class="custom-select" id="gioday" name="gioday">

									<%
										for (GioDay gd : listGioDay) {
									%>
									<option value="<%=gd.getId()%>"><%=gd.getTen()%></option>
									<%
										}
									%>

								</select>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-2"></div>
							<h4 class="col-3 text-right">Phòng hoc:</h4>
							<div class="col-6">
								<select class="custom-select" id="phonghoc" name="phonghoc">

									<%
										for (PhongHoc ph : listPhongHoc) {
									%>
									<option value="<%=ph.getId()%>"><%=ph.getTen()%></option>
									<%
										}
									%>

								</select>
							</div>
						</div>
						<br> <br> <input name="khoahocid" value="<%=khoahocID%>"
							hidden>
						<button type="submit" class="btn btn-info float-right mr-5">Đăng
							ký</button>
					</form>
				</div>
			</div>
		</div>
	</div>



	<%
		} else {
			response.sendRedirect("404.jsp");
		}
	%>
</body>
</html>