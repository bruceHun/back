<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="shopping.DAO.*,shopping.Class.*, java.util.*"%>
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
				ProductDAO pd = new ProductDAOimpl();
				ArrayList<Product> list = pd.gerRange(start_loc, PAGE_SIZE);
				int TotalRows = pd.getSize();
				int TotalPages = (int) Math.ceil((double) TotalRows / (double) PAGE_SIZE);
			%>

			<div class="container">
				<div>
					<table class="table table-hover">
						<tr>
							<th>ProductID</th>
							<th>Barcode</th>
							<th>CategoryID</th>
							<th>ProductName</th>
							<th>ProductUnit</th>
							<th>Capacity</th>
							<th>UnitPrice</th>
							<th>Discontinued</th>
							<th>Description</th>
							<th>Edit</th>
							<th>Del</th>
						</tr>
						<%
							for (Product p : list) {
						%>
						<tr>
							<td><%=p.getProductID()%></td>
							<td><%=p.getBarcode()%></td>
							<td><%=p.getCategoryID()%></td>
							<td><%=p.getProductName()%></td>
							<td><%=p.getProductUnit()%></td>
							<td><%=p.getCapacity()%></td>
							<td><%=p.getUnitPrice()%></td>
							<td><%=p.getDiscontinued()%></td>
							<td><%=p.getDescription()%></td>
							<td><a href="ProductEdit.jsp?id=<%=p.getProductID()%>">
									<button type="button" class="btn btn-primary btn-sm">Edit</button>
							</a></td>
							<td><a href="ProductDelCode.jsp?id=<%=p.getProductID()%>"
								onclick="return confirm('確認刪除');">
									<button type="button" class="btn btn-danger btn-sm">Del</button>
							</a></td>
						</tr>
						<%
							}
						%>
					</table>

				</div>



				<br />
				<div class="row">
					<div class="col-xs-4"></div>
					<div class="col-xs-4">
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
					</div>
					<div class="col-xs-4"></div>
				</div>
				<!-- --------------------------------------------------------------------------------- -->
				<p />
				<br /> <br /> <br />

				<div class="col-xs-2">
					<form id="page2" name="page2" action="productlist.jsp" method="get">
						<select class="form-control" name="p" onchange="page2.submit()">
							<%
								for (i = 1; i <= TotalPages; i++) {
							%>
							<option value="<%=i%>" <%if (pg == i) {%> selected="selected"
								<%}%>>第
								<%=i%> 頁
							</option>
							<%
								}
							%>

						</select>
					</form>
				</div>

				<div>
					<%
						if (pg > 1) {
					%>
					<input type="button" name="prev" value="上一頁"
						onclick="location.href='productlist.jsp?p=<%=(pg - 1)%>'">
					<a href="productlist.jsp?p=<%=(pg - 1)%>">上一頁</a>
					<%
						}
					%>
					<%
						if (pg < TotalPages) {
					%>
					<input type="button" name="next" value="下一頁"
						onclick="location.href='productlist.jsp?p=<%=(pg + 1)%>'">
					<a href="productlist.jsp?p=<%=(pg + 1)%>">下一頁</a>
					<%
						}
					%>
				</div>

				<div>
					<form name="page1" action="productlist.jsp" method="get">
						<input type="number" name="p" size="3" /> <input type="submit"
							value="GO" />
					</form>
				</div>

				<!-- --------------------------------------------------------------------------------- -->

			</div>

			<div class="panel-footer text-center">
				<p>Copyright (c) 2015 版權聲明</p>
			</div>
		</div>
	</div>
</body>
</html>