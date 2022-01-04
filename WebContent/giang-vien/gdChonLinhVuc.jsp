<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,dao.*,model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lĩnh vực | Giảng viên</title>

<link rel="stylesheet" href="assets/css/bootstrap.min.css">

<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/poper.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>

</head>
<body>

	<%
	String giangvien = (String) session.getAttribute("giangvien");
	if(giangvien != null) {
		

		ArrayList<LinhVuc> linhvuc = (new LinhVucDAO()).getTatCaLinhVuc();
		session.setAttribute("listlinhvuc", linhvuc);
	
	%>

 <div class="container pt-5">
    <div class="row mt-5">
      <div class="col-md-3"></div>
      <div class="card col-md-6 shadow-lg p-3 mb-5 bg-white rounded border-0">
        <div class="card-body">
          <h2 class="text-center font-italic">Chọn lĩnh vực</h2>
          <hr>
          <form action="gdKhoaHoc.jsp" method="POST">
            <div class="row">
              <div class="col-2"></div>
              <h4 class="col-3 text-right">Lĩnh vực:</h4>
              <div class="col-6">      
                <select class="custom-select" id="linhvuc" name="linhvuc">
              	<% for(LinhVuc v: linhvuc) { %>
                <option value="<%= v.getId() %>"><%= v.getTen() %></option>
                <% } %>
              </select>  
              </div>
            </div>
            <br>
            <div class="row">
              <div class="col text-center">
                <button type="submit" class="btn btn-primary">Lọc</button>
              </div>
            </div>
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