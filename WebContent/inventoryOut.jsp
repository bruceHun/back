<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="shopping.DAO.*,shopping.Class.*, java.util.*, java.lang.reflect.Field"%>
<%
	if (session.getAttribute("LogOK") == null) {
		response.sendRedirect("login.jsp");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>訂單出貨</title>
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
					進出貨管理 <small>訂單出貨</small>
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
				ProductDAO pd = new ProductDAOimpl();
				GiftSetDAO gd = new GiftSetDAOimpl();
				ArrayList<String[]> detail = new ArrayList<String[]>(); 	//建立暫存清單
				ArrayList<String[]> newList = new ArrayList<String[]>();	//建立確認頁顯示清單

				//final int PAGE_SIZE = 5;
				//int start_loc = (pg - 1) * PAGE_SIZE + 1;
				OrderDetailDAO oddd = new OrderDetailDAOimpl();
				String s = request.getParameter("search");

				ArrayList<OrderDetail> list = null;
				try {
					if (s != "" && s != null) {
						list = oddd.findByOrderID(Integer.valueOf(s)); //依訂單編號搜尋				
					}
				} catch (Exception e) {
					list = null;
				}

				/*list = oddd.getRange(start_loc, PAGE_SIZE);
				int TotalRows = oddd.getSize();
				int TotalPages = (int) Math.ceil((double) TotalRows / (double) PAGE_SIZE);*/
			%>

			<div class="container">

				<div>
					<form id="searchbyid" action="inventoryOut.jsp" method="get">
						<div class="form-group col-sm-12">
							<div class="col-sm-2">
								<input type="text" class="form-control" placeholder="請輸入訂單號"
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

							<th width="75" class="text-info">取消訂貨</th>
							<th width="120" class="text-info">產品名稱及容量</th>


							<th width="50" class="text-info">數量</th>


						</tr>
						<%
							if (list != null) {
								for (OrderDetail odd : list) {
									int index = odd.getOrderID();
									o = od.searchbyID(index);
									Product p = pd.searchbyID(odd.getProductID());
									GiftSet g = gd.searchbyID(odd.getGiftSetID());
									String shipdate = o.getShipDate();
									String name = cd.searchbyID(o.getCustomerID()).getCustomerName();
									
									if(shipdate==null){
										shipdate = "尚未出貨";
									}
									if (p != null) {
										//擷取單筆資料（產品名稱、容量、數量）
										String[] info = {p.getProductID()+"",p.getProductName(),p.getCapacity(),odd.getQuantity()+""};
										//單筆資料放入確認顯示清單
										detail.add(info);
						%>

						<tr>
							<td><%=index%></td>
							<td><%=o.getCustomerID()%></td>
							<td><%=name%></td>
							<td><%=o.getOrderDate()%></td>
							<td><%=shipdate%></td>
							<td>
								<%
									if (o.getCanceled() == 0) {
													out.print("未取消");
												} else {
													out.print("取消");
												}
								%>
							</td>
							<td><%=p.getProductName()%>--<%=p.getCapacity()%></td>
							<td><%=odd.getQuantity()%></td>

							<%
								} else if (g != null) {											
											for (int i = 0; i < 5; i++) {
												int[] idl = { g.getID1(), g.getID2(), g.getID3(), g.getID4(), g.getID5() };
												if (idl[i] != 0) {
												String n = pd.searchbyID(idl[i]).getProductName();
												String c = pd.searchbyID(idl[i]).getCapacity();
												//擷取單筆資料（產品名稱、容量、數量）
												String[] info = {idl[i]+"",n,c,odd.getQuantity()+""};
												//單筆資料放入暫存清單
												detail.add(info);
							%>
						
						<tr>
							<td><%=index%></td>
							<td><%=o.getCustomerID()%></td>
							<td><%=name%></td>
							<td><%=o.getOrderDate()%></td>
							<td><%=shipdate%></td>

							<td>
								<%
									if (o.getCanceled() == 0) {
															out.print("未取消");
														} else {
															out.print("取消");
														}
								%>
							</td>

							<td>
								<%
									
									out.println(n + "--" + c);
								%>
							</td>
							<td><%=odd.getQuantity()%></td>

							<%
								}
											}
										}
									}
							%>


						</tr>
						<%
							} else {
						%>
						<tr>
							<td colspan='13' align="center">查無資料</td>
						</tr>
						<%
							}
						%>

					</table>

<!-- Small modal -->
<div class="col-sm-12" align="center">
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#confirmOut">出貨</button>
</div>

<div class="modal fade" id="confirmOut">
  <div class="modal-dialog" id="index">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">確認出貨</h4>
      </div>
      <div class="modal-body">
        <p><%
        	if (detail != null) {

        		
        		int dupindex = 0;
        		int size = detail.size();
        		for (int i = 0; i < size; i++) {
        			boolean dup = false;	//預設產品編號不相同
        			for (int k = 1; k < size; k++) {
        				//比對產品編號相同
        				if (i != k && detail.get(i)[0].equals(detail.get(k)[0])) { 
        					System.out.print("(" + detail.get(i)[1] + " " + detail.get(k)[1] + ")");
        					//數量相加
        					int newQuan = Integer.valueOf(detail.get(i)[3]) + Integer.valueOf(detail.get(k)[3]);
        					//建立顯示資料
        					String[] newInfo = { detail.get(i)[0], detail.get(i)[1], detail.get(i)[2], String.valueOf(newQuan) }; 
        					newList.add(newInfo);	//加入顯示清單
        					dupindex = k;	//重複物件的索引編號
        					dup = true;		//回傳產品名稱相同
        				}
        			}
					//回傳編號不重複，並且i不為重複名稱物件的索引編號
        			if (!dup && dupindex != i) {
        				newList.add(detail.get(i));
        			}
        		}
				if(newList.isEmpty()){
        		for (String[] de : detail) {
        			out.print(de[1] + "--" + de[2] + "*" + de[3] + "<p/>");       			
        		}
        		session.setAttribute("addlist", detail);
				}else{
				for (String[] de : newList) {
        			out.print(de[1] + "--" + de[2] + "*" + de[3] + "<p/>");
				}
				session.setAttribute("addlist", newList);
				}
        	}
        %></p>
        
      </div>
      <div class="modal-footer">
        
        <form action="inventoryOutCode.jsp" method="post">
        <button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
        <input type="hidden" name="add" value="<%=newList%>">
        <button type="submit" class="btn btn-primary">確定</button>
        </form>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


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