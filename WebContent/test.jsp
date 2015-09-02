<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="shopping.DAO.*,shopping.Class.*, java.util.*"%>
	<%
	if(session.getAttribute("LogOK")==null){
		response.sendRedirect("login.jsp");
	}
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增資料修改</title>

<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/mysite.css">
<script src="jquery/jquery.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>





</head>
<body>

	<div id="wrqpper">

		<div id="header">
			<jsp:include page="header.jsp" />
		</div>
		<div id="content">

			<div class="container">
				<form class="form-horizontal" name="product"
					action="ProDupChk.jsp" method="post"
					onSubmit="return check_data()">
					

					<!-- -------------------------------------------------------------------------------------- -->


						<div class="form-group">
							<label for="pname">商品名稱：</label> <input type="text"
								class="form-control" id="pname" name="pname" placeholder="商品名稱" onchange="getData()">
								<input type="hidden" id="dup" value="1" />
						</div>

				
					<!-- -------------------------------------------------------------------------------------- -->

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default">確認新增</button>
						</div>
					</div>

				</form>
			</div>

		</div>
		<div>
			<jsp:include page="footer.jsp" />
		</div>

	</div>
</body>
</html>