<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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

				<div class="jumbotron">
					<h1>管理系統</h1>
					<p>訊息文字。</p>
					<p>
						<a class="btn btn-success btn-lg" role="button">登入</a>
					</p>
				</div>
				<br />

				<div class="panel panel-primary">
					<div class="panel-heading">資訊看板</div>
					<div class="panel-body">

						<table class="table table-hover ">
							<tr>
								<th>日期</th>
								<th>發文者</th>
								<th>訊息</th>
								<th>檢視</th>
							</tr>
							<tr>
								<td>2015-08-26</td>
								<td>系統管理員</td>
								<td>系統建構中...</td>
								<td><a href="#" class="btn btn-xs btn-success">檢視</a></td>
							</tr>
						</table>

					</div>
				</div>


				<div class="alert alert-warning" role="success">
					<p>
						欲學習如何使用管理系統，請閱讀 <a href="#" class="btn btn-primary">教學</a>
					</p>
				</div>


			</div>


			<div class="panel-footer text-center">
				<p>Copyright (c) 2015 版權聲明</p>
			</div>
		</div>

	</div>

</body>
</html>