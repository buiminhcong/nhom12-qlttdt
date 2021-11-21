<%@page import="model.LichDay"%>
<%@page import="model.MonHoc_KhoaHoc"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.DiemDauRa"%>
<%@page import="dao.DiemDauRaDAO"%>
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
    <title>Danh sách điểm</title>
</head>
	<%
		ThanhVien tv = (ThanhVien)session.getAttribute("quanli");
		if(tv == null) {
			response.sendRedirect("../index.jsp");	
		}
	%>
<body>
	<%
		String idLD = request.getParameter("idLD");
		if(idLD == null) {
			request.setAttribute("err", "Nhập đầy đủ ngày tháng bắt đầu và kết thúc!");
			RequestDispatcher rd = request.getRequestDispatcher("gdTKDiemHVTheoKH.jsp");
			rd.forward(request, response);
			return;
		}
		int id = Integer.parseInt(idLD);
		MonHoc_KhoaHoc mh_kh = (MonHoc_KhoaHoc)session.getAttribute("mh_kh");
		ArrayList<LichDay>listLichDay = (ArrayList<LichDay>)session.getAttribute("list_ld");
		LichDay ld = new LichDay();
		for(int i = 0; i < listLichDay.size(); i++) {
			if(listLichDay.get(i).getId() == id) {
				ld = listLichDay.get(i);
				break;
			}
		}
		DiemDauRaDAO d = new DiemDauRaDAO();
		ArrayList<DiemDauRa>list = d.getDSHocVienVaDiem(Integer.parseInt(idLD));
	%>
    <div class="container pt-5">
        <div class="row mt-5">
            <div class="col-md-3"></div>
            <div class="card col-md-12 p-3 mb-5 bg-white rounded border-1">
                <div class="card-body">
                    <h2 class="text-center font-italic">Dánh sách điểm</h2>
                    <hr><br><br>
                    <p><strong>Khóa học: </strong><%= mh_kh.getKhoaHoc().getTen() %></p>
                    <p><strong>Môn học: </strong><%= mh_kh.getMonHoc().getTenMon() %></p>
                    <p><strong>Mã lớp: </strong><%= ld.getId()%></p>
                    <p><strong>Giờ học: </strong><%= ld.getGioDay().getTen() %></p>
                    <p><strong>Thứ học: </strong><%= ld.getThuDay().getTen() %></p>
                    <p><strong>Phòng học: </strong><%= ld.getPhongHoc().getTen() %></p>
                    <p><strong>Thời gian bắt đầu: </strong><%= mh_kh.getKhoaHoc().getThoiGianBatDau() %></p>
                    <p><strong>Thời gian kết thúc: </strong><%= mh_kh.getKhoaHoc().getThoiGianKetThuc() %></p>
                    <div class="row">
                        <table class="table table-bordered">
                            <thead>
                              <tr>
                                <th>STT</th>
                                <th>Họ tên học viên</th>
                                <th>Điểm</th>
                              </tr>
                            </thead>
                            <tbody>
	                            <%
	                            	for(int i = 0; i < list.size(); i++) {
	                            		
	                            %>
	                            	<tr>
		                                <td><%= i+1 %></td>
		                                <td><%= list.get(i).getHoTen()%></td>
                                		<td><%= list.get(i).getDiem() %></td>
                              		</tr>
	                            <%
	                            	}
	                            %>
                            </tbody>
                          </table>
                    </div>
                </div>
                <div class="d-flex justify-content-end">
                    <div>
                        <a href="gdChinhQL.jsp" class="btn btn-primary">Kết thúc</a>
                    </div>
                </div>
            </div>
        </div>
   	</div>
</body>

</html>