<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,dao.*,model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết khóa học | Giảng viên</title>

<link rel="stylesheet" href="assets/css/bootstrap.min.css">

<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/poper.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>

</head>
<body>

	<%
		
		String khoahocID = request.getParameter("khoahocid");
	
		ArrayList<MonHoc_KhoaHoc> listMH_KH = (new MonHoc_KhoaHocDAO()).getChiTietKhoaHocTLV(khoahocID);
		session.setAttribute("tenkhoahoc", listMH_KH.get(0).getKhoaHoc().getTen());
	%>

  <div class="container">
    <div class="row mt-5">
      <div class="col-md-1"></div>
      <div class="card col-md-10 shadow-lg p-3 mb-5 bg-white rounded border-0">
        <div class="card-body">
          <h2 class="text-center font-italic">Thông tin chi tiết về khóa học</h2>
          <hr>
          <table class="table table-striped table-bordered">
            <tbody>
              <tr>
                <td>Tên khóa học:</td>
                <td><%= listMH_KH.get(0).getKhoaHoc().getTen() %></td>
              </tr>
              <tr>
                <td>Mô tả khóa học:</td>
                <td><%= listMH_KH.get(0).getKhoaHoc().getMoTa() %></td>
              </tr>
              <tr>
                <td>Số sinh viên tối đa tham gia:</td>
                <td><%= listMH_KH.get(0).getKhoaHoc().getSiSoToiDa() %></td>
              </tr>
              <tr>
                <td>Mô tả môn học:</td>
                <td>
                  <ol>
                  
                  	<% for(MonHoc_KhoaHoc value : listMH_KH) {%>
                    <li>
                      <ul>
                        <li>Tên môn: <%= value.getMonHoc().getTenMon() %></li>
                        <li>Mô tả: <%= value.getMonHoc().getMoTa() %></li>
                      </ul>
                    </li>
                    <% } %>
                    
                  </ol>
                </td>
              </tr>
              <tr>
                <td>Thời gian bắt đầu khóa học:</td>
                <td><%= listMH_KH.get(0).getKhoaHoc().getThoiGianBatDau() %></td>
              </tr>
              <tr>
                <td>Thời gian kết thúc khóa học:</td>
                <td><%= listMH_KH.get(0).getKhoaHoc().getThoiGianKetThuc() %></td>
              </tr>              
            </tbody>
          </table>

          <br>
        
          <form action="gdChonKhungGioDay.jsp" method="POST">
              <input type="text" name="khoahocid" value="<%= listMH_KH.get(0).getKhoaHoc().getID() %>" hidden>
              <button class="btn btn-info">Quay trở lại</button>
              <button class="btn btn-info float-right">Đăng ký dạy</button>
          </form>
        
        </div>
      </div>
    </div>
  </div>




</body>
</html>