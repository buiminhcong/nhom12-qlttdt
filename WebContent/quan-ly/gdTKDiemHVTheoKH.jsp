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
    <title>Ngày tháng thống kê</title>
</head>
	<%
		ThanhVien tv = (ThanhVien)session.getAttribute("quanli");
		if(tv == null) {
			response.sendRedirect("../index.jsp");	
		}
	%>
<body>
	<%
		String err = (String)request.getAttribute("err");
	%>
    <div class="container pt-5">
        <div class="row mt-5">
            <div class="col-md-3"></div>
            <div class="card col-md-6 shadow-lg p-3 mb-5 bg-white rounded border-0">
                <div class="card-body">
                    <h2 class="text-center font-italic">Chọn ngày tháng thống kê</h2>
                    <h2 class="text-center font-italic">khóa học</h2>
                    <hr><br><br>
                    <%
                    if(err != null) {
                    	
                    %> 
                    	<h5 class="text-danger"> <%=err%> </h5>
                    <%
                    }
                    %>
                    <div class="row">
                        <div class="col-12">
                            <form action="gdTKKhoaHocMonHoc.jsp">
                                <div class="form-group">
                                  <label for="exampleInputEmail1">Ngày bắt đầu</label>
                                  <input type="date" class="form-control" name="ngaybatdau">
                                </div>
                                <div class="form-group">
                                  <label for="exampleInputPassword1">Ngày kết thúc</label>
                                  <input type="date" class="form-control" name="ngayketthuc">
                                </div>
                                <div class="form-group">
                                    <input type="submit" class="form-control" value="Xem">
                                  </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="d-flex justify-content-end">
                    <div>
                        <a href="gdChonLoaiTK.jsp" class="btn btn-primary">Quay lại</a>
                    </div>
                </div>
            </div>
        </div>
     </div>
</body>

</html>