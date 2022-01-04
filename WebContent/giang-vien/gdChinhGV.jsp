<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ | Giảng viên</title>

<link rel="stylesheet" href="assets/css/bootstrap.min.css">

<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/poper.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>

</head>
<body>

	<% 
	String giangvien = (String) session.getAttribute("giangvien");
	if(giangvien != null) {
		String dangkyday = (String) session.getAttribute("dangkyday");
		String hoten = (String) session.getAttribute("hoten");
	%>

  <div class="container pt-5">
    <div class="row mt-5">
      <div class="col-md-3"></div>
      <div class="card col-md-6 shadow-lg p-3 mb-5 bg-white rounded border-0">
        <div class="card-body">
          <h2 class="text-center font-italic">Trang chủ giảng viên</h2>
          <h6 class="text-center"><em>Xin chào, <%= session.getAttribute("hoten") %></em></h6>
          	<% if(dangkyday != null)  { %>
	          <div class="alert alert-success text-center" role="alert">
	            <strong>Bạn đã đăng ký dạy thành công.</strong>
	          </div>
       		<%  session.getAttribute("dangkyday"); } %>
          <hr><br><br>
          
          <div class="row">
            <div class="col text-center">
              <a href="gdChonLinhVuc.jsp" class="btn btn-primary">Đăng ký dạy</a>
            </div>
          </div>
          <br>
          <div class="row">
            <div class="col text-center">
              <form action="../doDangXuat.jsp?action=logout" method="POST">
              	<button type="submit" class="btn btn-warning">Đăng xuất</button>
              </form>
            </div>
          </div>
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