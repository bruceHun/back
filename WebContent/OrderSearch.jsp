<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="shopping.DAO.*,shopping.Class.*, java.util.*"%>
<%
	if (session.getAttribute("LogOK") == null) {
		response.sendRedirect("login.jsp");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>訂單查詢</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/mysite.css">
<script src="jquery/jquery.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>

<script language="javascript">
	function alert() {
		alert('查無資料');
	}
</script>

</head>
<body>

	<div id="wrqpper">

		<div id="header">
			<jsp:include page="header.jsp" />
		</div>
		<div id="content">
			<div class="page-header">
				<h1 align="center">
					訂單管理 <small>訂單查詢</small>
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

				OrderDAO od = new OrderDAOimpl();
				Order o = new Order();
				CustomerDAO cd = new CustomerDAOimpl();

				final int PAGE_SIZE = 5;
				int start_loc = (pg - 1) * PAGE_SIZE + 1;
				OrderDetailDAO oddd = new OrderDetailDAOimpl();
				String s = request.getParameter("search");
				System.out.print(request.getParameter("searchby"));
				String sb = request.getParameter("searchby");

				ArrayList<OrderDetail> list = new ArrayList<>();
				try {
					if (s != "" && s != null) {
						//System.out.print(s);
						if (sb != null && sb.equals("1")) {
							list = oddd.findByOrderID(Integer.valueOf(s));	//依訂單編號搜尋
						} else if (sb != null && sb.equals("2")) {			//依客戶名稱搜尋
							ArrayList<Customer> clist = cd.findByName(s);
							//System.out.print(clist);
							for(Customer c : clist){				//取得所有名稱符合的客戶
								int cid = c.getCustomerID();		
								ArrayList<Order> olist = od.findByCustomerID(cid);
								//System.out.print(olist);
								for(Order order : olist){			//取得各個客戶的訂單資料
									int oid = order.getOrderID();
									list.addAll(oddd.findByOrderID(oid));
								}
							}

						}
					} else {
						list = oddd.showAll();
					}
				} catch (Exception e) {
					list = null;
				}

				/*ArrayList<OrderDetail> list = oddd.getRange(start_loc, PAGE_SIZE);
				int TotalRows = oddd.getSize();
				int TotalPages = (int) Math.ceil((double) TotalRows / (double) PAGE_SIZE);*/
			%>

			<div class="container">

				<div>
					<form id="searchbyid" action="OrderSearch.jsp" method="get">
						<div class="form-group col-sm-12">
							<div class="col-sm-3">
								<input type="radio" name="searchby" id="searchbyid" value="1"
									checked> 　搜尋訂單編號　 <input type="radio" name="searchby"
									id="searchbyid" value="2"> 　搜尋客戶訂單
							</div>
							<div class="col-sm-2">
								<input type="text" class="form-control" placeholder="請在此輸入"
									id="search" name="search">
							</div>
							<button type="submit" class="btn btn-default">查詢</button>
						</div>

					</form>
				</div>

				<br />
				<div class="table-responsive col-sm-12">
					<table class="table table-bordered">
						<tr>
							<th width="50" class="text-info">訂單編號</th>
							<th width="50" class="text-info">客戶編號</th>
							<th width="75" class="text-info">客戶姓名</th>
							<th width="100" class="text-info">訂購日期</th>
							<th width="100" class="text-info">出貨日期</th>
							<th width="75" class="text-info">折扣編號</th>
							<th width="75" class="text-info">取消訂貨</th>
							<th width="75" class="text-info">產品編號</th>
							<th width="75" class="text-info">禮盒編號</th>
							<th width="75" class="text-info">成交金額</th>
							<th width="50" class="text-info">數量</th>
							<th width="50" class="text-info">修改</th>
							<th width="50" class="text-info">刪除</th>

						</tr>
						<%
							if (list != null) {
								for (OrderDetail odd : list) {
									int index = odd.getOrderID();
									o = od.searchbyID(index);
						%>
						<tr>
							<td><%=index%></td>
							<td><%=o.getCustomerID()%></td>
							<td><%=cd.searchbyID(o.getCustomerID()).getCustomerName() %></td>
							<td><%=o.getOrderDate()%></td>
							<td><%=o.getShipDate()%></td>
							<td><%=o.getDiscountID()%></td>
							<td><%=o.getCanceled()%></td>
							<td><%=odd.getProductID()%></td>
							<td><%=odd.getGiftSetID()%></td>
							<td><%=odd.getSalesPrice()%></td>
							<td><%=odd.getQuantity()%></td>

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
							} else {
						%>
						<tr>
							<td colspan='13' align="center">查無資料</td>
						</tr>
						<%
							}
						%>

					</table>



				</div>



				<br />


				<!-- --------------------------------------------------------------------------------- -->

			</div>


		</div>

		<div id="footer">
			<jsp:include page="footer.jsp" />
		</div>

	</div>
</body>
</html>