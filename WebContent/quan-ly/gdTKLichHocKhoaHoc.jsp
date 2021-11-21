<%@page import="model.LichDay"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.LichDayDAO"%>
<%@page import="model.MonHoc_KhoaHoc"%>
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
    <title>Danh sách lịch học</title>
</head>
	<%
		ThanhVien tv = (ThanhVien)session.getAttribute("quanli");
		System.out.println(tv);
		if(tv == null) {
			response.sendRedirect("../index.jsp");	
		}
	%>
<body>
	<%
		String idKH = request.getParameter("idKH");
		ArrayList<MonHoc_KhoaHoc>listMH_KH = new ArrayList<MonHoc_KhoaHoc>();
		listMH_KH = (ArrayList<MonHoc_KhoaHoc>) session.getAttribute("list_mh_kh");
		if(idKH == null || listMH_KH == null) {
			request.setAttribute("err", "Nhập đầy đủ ngày tháng bắt đầu và kết thúc!");
			RequestDispatcher rd = request.getRequestDispatcher("gdTKDiemHVTheoKH.jsp");
			rd.forward(request, response);
			return;
		}
		String firstTime = request.getParameter("ngaybatdau");
		String lastTime = request.getParameter("ngayketthuc");
		int id = Integer.parseInt(idKH);
		MonHoc_KhoaHoc mh_kh = new MonHoc_KhoaHoc();
		for(int i = 0; i < listMH_KH.size(); i++) {
			if(listMH_KH.get(i).getKhoaHoc().getID() == id) {
				mh_kh = listMH_KH.get(i);
				break;
			}
		}
		LichDayDAO ld = new LichDayDAO();
		ArrayList<LichDay>list = ld.getLichDayTheoKhoaHoc(id);
		session.setAttribute("list_ld", list);
		session.setAttribute("mh_kh", mh_kh);
	%>
    <div class="container pt-5">
        <div class="row mt-5">
            <div class="col-md-3"></div>
            <div class="card col-md-12 p-3 mb-5 bg-white rounded border-1">
                <div class="card-body">
                    <h2 class="text-center font-italic">Danh sách lớp học</h2>
                    <hr><br><br>
                    <p><strong>Khóa học:</strong> <%= mh_kh.getKhoaHoc().getTen()%></p>
                    <p><strong>Môn học:</strong> <%= mh_kh.getMonHoc().getTenMon()%></p>
                    <div class="row">
                        <table class="table table-bordered">
                            <thead>
                              <tr>
                                <th>STT</th>
                                <th>Mã lớp học</th>
                                <th>Tên khóa học</th>
                                <th>Giờ dạy</th>
                                <th>Thứ dạy</th>
                                <th>Phòng học</th>
                                <th></th>
                              </tr>
                            </thead>
                            <tbody>
                            	<%
                            		for(int i = 0; i < list.size(); i++) {
                            	
                            	%>
                            		<tr>
		                                <td><%= i+1%></td>
		                                <td><%= list.get(i).getId()%></td>
		                                <td><%= list.get(i).getKhoaHoc().getTen() %></td>
		                                <td><%= list.get(i).getGioDay().getTen() %></td>
		                                <td><%= list.get(i).getThuDay().getTen() %></td>
		                                <td><%= list.get(i).getPhongHoc().getTen() %></td>
		                                <td>
		                                    <form action="gdDSDiemCuaHVTheoKH.jsp" method="post">
		                                    	<input type="number" name="idLD" value="<%=list.get(i).getId()%>" hidden="">
		                                    	<input type="submit" class="btn text-primary" value="Xem">
		                                    </form>
		                                </td>
                              		</tr>
                            	<%
                            		}
                            	%>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="d-flex justify-content-end">
                	<form action="gdTKKhoaHocMonHoc.jsp" method="post">
	                   	<input type="date" name="ngaybatdau" value="<%=firstTime%>" hidden="">
	                   	<input type="date" name="ngayketthuc" value="<%=lastTime%>" hidden="">
	                   	<input type="submit" class="btn btn-primary" value="Quay Lại">
                	</form>
                </div>
            </div>
        </div>
   </div>
</body>

</html>