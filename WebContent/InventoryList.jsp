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
<title>商品列表</title>
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
			<div class="page-header">
				<h1 align="center">
					進出貨管理 <small>檢視庫存</small>
				</h1>
			</div>

			<%
				String Page = request.getParameter("p");
				int pg;
				if (Page == null) {
					pg = 1;
				} else {
					try {
						pg = Integer.valueOf(Page);
					} catch (Exception e) {
						pg = 1;
					}

				}

				final int PAGE_SIZE = 5;
				int start_loc = (pg - 1) * PAGE_SIZE + 1;
				InventoryDAO id = new InventoryDAOimpl();
				
				ArrayList<Inventory> list = id.getRange(start_loc, PAGE_SIZE);
				int TotalRows = id.getSize();
				int TotalPages = (int) Math.ceil((double) TotalRows / (double) PAGE_SIZE);
			%>

			<div class="container">
				<p/>
				<div class="table-responsive">
					<table class="table table-bordered table-hover">
						<tr>
							<th width="75" class="text-info">庫存編號</th>
							<th width="75" class="text-info">產品編號</th>
							<th width="75" class="text-info">成本</th>
							<th width="75" class="text-info">庫存量</th>
							<th width="75" class="text-info">已訂未出</th>
							<th width="75" class="text-info">安全存量</th>
							<th class="text-info">編輯</th>
							<th class="text-info">刪除</th>
						</tr>
						<%
							for (Inventory i : list) {
						%>
						<tr>
							<td><%=i.getStockNumber()%></td>
							<td><%=i.getProductID()%></td>
							<td><%=i.getCost()%></td>
							<td><%=i.getUnitsInStock()%></td>
							<td><%=i.getUnitsOnOrder()%></td>
							<td><%=i.getSaftyStock()%></td>
							<td><a href="ProductEdit.jsp?id=<%=i.getStockNumber()%>">
									<button type="button" class="btn btn-primary btn-sm">編輯</button>
							</a></td>
							<td><a href="ProductDelCode.jsp?id=<%=i.getStockNumber()%>"
								onclick="return confirm('確認刪除');">
									<button type="button" class="btn btn-danger btn-sm">刪除</button>
							</a></td>
						</tr>
						<%
							}
						%>
					</table>

				</div>



				<br />
				<div class="row">

					<div align="center">
						<nav>
						<ul class="pagination">
							<%
								final int PAGE_RANGE = 5;
								int loc = (pg - 1) / PAGE_RANGE;
								int start_num = loc * PAGE_RANGE + 1;
								int end_num = loc * PAGE_RANGE + PAGE_RANGE;
								int uplimit = (TotalPages > end_num) ? end_num : TotalPages;
								int i;
								for (i = start_num; i <= uplimit; i++) {
							%>
							<%
								if (end_num < start_num) {
							%>
							<li><a href="productlist.jsp?p=<%=i%>">Prev <%=PAGE_RANGE%>
									Pages <span aria-hidden="true">&laquo;</span>
							</a></li>
							<%
								}
							%>

							<li><a href="productlist.jsp?p=<%=i%>"><%=i%></a></li>
							<%
								}
								if (TotalPages > end_num) {
							%>
							<li><a href="productlist.jsp?p=<%=i%>">Next <%=PAGE_RANGE%>
									Pages <span aria-hidden="true">&raquo;</span>
							</a></li>
							<%
								}
							%>

						</ul>
						</nav>
					</div>
					<div class="col-xs-4"></div>
				</div>
				
				<!-- --------------------------------------------------------------------------------- -->

			</div>


		</div>
		
		<div id="footer">
			<jsp:include page="footer.jsp" />
		</div>
		
	</div>
</body>
</html>