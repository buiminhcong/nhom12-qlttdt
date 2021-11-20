<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,dao.*,model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Khóa học | Giảng viên</title>

<link rel="stylesheet" href="assets/css/bootstrap.min.css">

<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/poper.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>

</head>
<body>

	<%
		
		String linhvucID = request.getParameter("linhvuc");
		ArrayList<LinhVuc> listLV =  new ArrayList<LinhVuc>();
		listLV = (ArrayList<LinhVuc>) session.getAttribute("listlinhvuc");
		String tenLinhVuc = null;
		for(LinhVuc v: listLV) {
			if(linhvucID.equals(Integer.toString(v.getId())))
				tenLinhVuc = v.getTen();
		}
		ArrayList<KhoaHoc> listKhoaHoc = (new KhoaHocDAO()).getTatCaKhoaHocTheoLV(linhvucID);
	
	%>

   <div class="container pt-5">
    <div class="row mt-5">
      <div class="col-md-1"></div>
      <div class="card col-md-10 shadow-lg p-3 mb-5 bg-white rounded border-0">
        <div class="card-body">
          <h2 class="text-center font-italic">Đăng ký dạy</h2>
          <hr>
          <div class="row">
            <ul>
              <li><em>Mã giảng viên: </em><strong>MB12</strong></li>
              <li><em>Họ và tên: </em><strong>le quang An</strong></li>
              <li><em>Lĩnh vực: </em><strong><%= tenLinhVuc %></strong></li>
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
                <th scope="col"></th>
              </tr>
            </thead>
            <tbody>
            	
            	<% 
            		int i = 1;
            		for(KhoaHoc kh: listKhoaHoc) {
            	%>
              <tr>
                <th scope="row"><%= i++ %></th>
                <td><%= kh.getTen() %></td>
                <td><%= kh.getMoTa() %></td>
                <td><%= kh.getThoiGianBatDau() %></td>
                <td><%= kh.getThoiGianKetThuc() %></td>
                <td>
                  <form action="gdChiTietKhoaHoc.jsp" method="POST">
                    <input type="text" name="khoahocid" value="<%= kh.getID() %>" hidden>
                    <button type="submit" class="btn btn-primary">Chọn</button>
                  </form>
                </td>
              </tr>
              
              	<% } %>
            </tbody>
          </table>

          <br>
          <button class="btn btn-info">Quay trở lại</button>
        </div>
      </div>
    </div>
  </div>




</body>
</html>