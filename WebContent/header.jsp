<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-inverse" role="navigation">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp"><span
				class="glyphicon glyphicon-briefcase"><img atl="Brand" src=""></span>
				三十岬梅舖</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">登入系統<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">登入系統</a></li>
						<li><a href="NewAdmin.jsp">註冊帳號</a></li>
					</ul></li>
				<li><a href="#">功能項目</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">會員管理<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">會員資格</a></li>
						<li><a href="#">會員等級</a></li>
						<li><a href="#">會員資訊</a></li>
					</ul></li>

				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">商品管理<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">新增商品</a></li>
						<li><a href="#">商品下架</a></li>
						<li><a href="productlist.jsp">資料維護</a></li>
					</ul></li>

				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">進出貨管理<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">進貨</a></li>
						<li><a href="#">出貨</a></li>
						<li><a href="#">退貨</a></li>
						<li class="divider"></li>
						<li><a href="#">檢視庫存</a></li>
						<li class="divider"></li>
						<li><a href="#">安全存量</a></li>
					</ul></li>

			</ul>
			<form class="navbar-form navbar-right" role="search">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="搜尋">
				</div>
				<button type="submit" class="btn btn-default">送出</button>
			</form>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	</nav>
	<!-- /.container-fluid -->
</body>
</html>