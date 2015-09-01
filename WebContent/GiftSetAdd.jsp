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
<title>產品資料修改</title>

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
					action="GiftSetAddCode.jsp" method="post">
					

					<!-- -------------------------------------------------------------------------------------- -->
					<div class="col-xs-6">
						<div class="form-group ">
							<label for="gsname">禮盒名稱：</label> <input type="text"
								class="form-control" id="gsname" name="gsname"
								placeholder="禮盒名稱">
						</div>

						<div class="form-group">
							<label for="product1">商品ㄧ：</label> <input type="text"
								class="form-control" id="product1" name="product1"
								placeholder="商品一">
						</div>

						<div class="form-group">
							<label for="product2">商品二：</label> <input type="text"
								class="form-control" id="xproduct2" name="product2" placeholder="商品二">
						</div>

						<div class="form-group">
							<label for="uproduct3">商品三：</label> <input type="text"
								class="form-control" id="product3" name="product3" placeholder="商品三">
						</div>
					</div>
					<!-- -------------------------------------------------------------------------------------- -->
					<div class="col-xs-6">
						<div class="form-group">
							<label for="product4">商品四：</label> <input type="text"
								class="form-control" id="product4" name="product4"
								placeholder="商品四">
						</div>
						<p />
						<div class="form-group">
							<label for="product5">商品五：</label> <input type="text"
								class="form-control" id="product5" name="product5" placeholder="商品五">
						</div>

						<div class="form-group">
							<label for="price">單價：</label> <input type="text"
								class="form-control" id="price" name="price"
								placeholder="單價">
						</div>

						<div class="form-group">
							<label for="discon">商品下架：</label> <input type="text"
								class="form-control" id="discon" name="discon"
								placeholder="商品下架">

						</div>
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