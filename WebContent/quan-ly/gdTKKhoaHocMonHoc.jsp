<%@page import="dao.MonHoc_KhoaHocDAO"%>
<%@page import="model.ThanhVien"%>
<%@page import="model.MonHoc_KhoaHoc" %>
<%@page import="java.util.ArrayList" %>
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
    <title>Danh sách khóa học</title>
</head>
	<%
		ThanhVien tv = (ThanhVien)session.getAttribute("quanli");
		if(tv == null) {
			response.sendRedirect("../index.jsp");	
		}
	%>
<body>
	<%
		String first =  request.getParameter("ngaybatdau");
		String last =  request.getParameter("ngayketthuc");
		if(first == null || last == null) {
			request.setAttribute("err", "Nhập đầy đủ ngày tháng bắt đầu và kết thúc!");
			RequestDispatcher rd = request.getRequestDispatcher("gdTKDiemHVTheoKH.jsp");
			rd.forward(request, response);
			return;
		}
		if(first.equals("") || last.equals("")) {
			request.setAttribute("err", "Nhập đầy đủ ngày tháng bắt đầu và kết thúc!");
			RequestDispatcher rd = request.getRequestDispatcher("gdTKDiemHVTheoKH.jsp");
			rd.forward(request, response);
			return;
		}
		MonHoc_KhoaHocDAO mh_kh = new MonHoc_KhoaHocDAO();
		ArrayList<MonHoc_KhoaHoc>list = mh_kh.getDSKhoaHocMonHocByTime(first, last);
		ArrayList<MonHoc_KhoaHoc>newList = new ArrayList<MonHoc_KhoaHoc>();
		MonHoc_KhoaHoc h = new MonHoc_KhoaHoc();
		for(int i = 0; i < list.size(); i++) {
			if(i == 0) {	
				newList.add(list.get(i));
			} else {
				h = newList.get(newList.size()-1);
				if(h.getKhoaHoc().getID() == list.get(i).getKhoaHoc().getID()) {
					h.getMonHoc().setTenMon(h.getMonHoc().getTenMon() + ", "+ list.get(i).getMonHoc().getTenMon());
					newList.set(newList.size()-1, h);
				} else {
					newList.add(list.get(i));
				}
			}
		}
		session.setAttribute("list_mh_kh", newList);
	%>
    <div class="container pt-5">
        <div class="row mt-5">
            <div class="col-md-3"></div>
            <div class="card col-md-12 p-3 mb-5 bg-white rounded border-1">
                <div class="card-body">
                    <h2 class="text-center font-italic">Danh sách khóa học - môn học</h2>
                    <hr><br><br>
                    <p><strong>Ngày bắt đầu: </strong><%=first%></p>
                    <p><strong>Ngày kết thúc: </strong><%=last%></p>
                    <div class="row">
                        <table class="table table-bordered">
                            <thead>
                              <tr>
                                <th>STT</th>
                                <th>Tên khóa học</th>
                                <th>Tên môn học</th>
                                <th>Mô tả</th>
                                <th>Thời gian bắt đầu</th>
                                <th>Thời gian kết thúc</th>
                                <th></th>
                              </tr>
                            </thead>
                            <tbody>
                              <%
                              	for(int i = 0; i < newList.size(); i++) {	
                              %>
                              		<tr>
		                                <td><%= i+1%></td>
		                                <td><%= newList.get(i).getKhoaHoc().getTen() %></td>
		                                <td><%= newList.get(i).getMonHoc().getTenMon() %></td>
		                                <td><%= newList.get(i).getKhoaHoc().getMoTa() %></td>
		                                <td><%= newList.get(i).getKhoaHoc().getThoiGianBatDau() %></td>
		                                <td><%= newList.get(i).getKhoaHoc().getThoiGianKetThuc() %></td>
		                                <td>
		                                    <form action="gdTKLichHocKhoaHoc.jsp" method="post">
		                                    	<input type="number" name="idKH" value="<%=newList.get(i).getKhoaHoc().getID()%>" hidden="">
		                                    	<input type="date" name="ngaybatdau" value="<%=first%>" hidden="">
                   								<input type="date" name="ngayketthuc" value="<%=last%>" hidden="">
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
                    <div>
                        <a href="gdTKDiemHVTheoKH.jsp" class="btn btn-primary">Quay lại</a>
                    </div>
                </div>
            </div>
        </div>
      </div>
</body>

</html>