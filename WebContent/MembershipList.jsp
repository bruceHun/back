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
<title>會員列表</title>
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
					會員管理 <small>客戶資訊</small>
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
				MembershipDAO md = new MembershipDAOimpl();
				CustomerDAO cd = new CustomerDAOimpl();
				
				
				ArrayList<Membership> list = md.getRange(start_loc, PAGE_SIZE);
				int TotalRows = md.getSize();
				int TotalPages = (int) Math.ceil((double) TotalRows / (double) PAGE_SIZE);
				Membership m = null;
				Customer c = null;
			%>

			<div class="container">
				<p/>
				<div class="table-responsive">
					<table class="table table-bordered">
						<tr>
							<th width="75" class="text-info">客戶編號</th>
							<th width="75" class="text-info">客戶姓名</th>
							<th width="75" class="text-info">帳號</th>
							<th width="75" class="text-info">密碼</th>
							<th width="100" class="text-info">會員狀態</th>
							<th class="text-info">編輯</th>
							<th class="text-info">刪除</th>
						</tr>
						<%
							//for (Membership m : list) {
							for (int i = 0; i<TotalRows; i++) {
								int index = list.get(i).getCustomerID();
								c = cd.searchbyID(index);
						%>
						<tr>
							<td><%=index%></td>
							<td><%=c.getCustomerName() %></td>
							<td><%=list.get(i).getAccount()%></td>
							<td><%=list.get(i).getPassword()%></td>
							<td>
							<select
								class="form-control" id="categoryid" name="categoryid">
								<% int state = list.get(i).getMembership(); %>
								<option value=<%=state %> Selected>--<% if(state ==1){out.print("正常");}else{out.print("停權");}%></option>
								
								<option value="1">正常</option>
								<option value="0">停權</option>
								
							</select>
							</td>
							
							<td><a href="ProductEdit.jsp?id=<%=index%>">
									<button type="button" class="btn btn-primary btn-sm">編輯</button>
							</a></td>
							<td><a href="ProductDelCode.jsp?id=<%=index%>"
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