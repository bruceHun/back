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
<title>顧客列表</title>
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
				CustomerDAO cd = new CustomerDAOimpl();
				
				ArrayList<Customer> list = cd.getRange(start_loc, PAGE_SIZE);
				int TotalRows = cd.getSize();
				int TotalPages = (int) Math.ceil((double) TotalRows / (double) PAGE_SIZE);
			%>

			<div class="container">
				<p/>
				<div class="table-responsive">
					<table class="table table-bordered table-hover">
						<tr>
							<th width="50" class="text-info">客戶編號</th>
							<th width="75" class="text-info">客戶姓名</th>
							<th width="90" class="text-info">身分證字號</th>
							<th width="50" class="text-info">性別</th>
							<th width="100" class="text-info">生日</th>
							<th width="90" class="text-info">室內電話</th>
							<th width="90" class="text-info">行動電話</th>
							<th width="200" class="text-info">地址</th>
							<th width="150" class="text-info">E-mail</th>
							<th width="50" class="text-info">會員等級</th>
							<th width="50" class="text-info">折扣編號</th>
							<th class="text-info">編輯</th>
							<th class="text-info">刪除</th>
						</tr>
						<%
							for (Customer c : list) {
						%>
						<tr>
							<td><%=c.getCustomerID()%></td>
							<td><%=c.getCustomerName()%></td>
							<td><%=c.getPersonalID()%></td>
							<td><%=c.getGender() %></td>
							<td><%=c.getBirthDate() %></td>
							<td><%=c.getPhone() %></td>
							<td><%=c.getCelPhone() %></td>
							<td><%=c.getAddress() %></td>
							<td><%=c.getEmail() %></td>
							<td><%=c.getCustomerType() %></td>
							<td><%=c.getDiscountID() %></td>
							
							<td><a href="ProductEdit.jsp?id=<%=c.getCustomerID()%>">
									<button type="button" class="btn btn-primary btn-sm">編輯</button>
							</a></td>
							<td><a href="ProductDelCode.jsp?id=<%=c.getCustomerID()%>"
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