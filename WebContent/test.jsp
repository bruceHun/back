<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="shopping.DAO.*,shopping.Class.*, java.util.*"%>
<% 
Order o = new Order(0,Integer.parseInt(request.getParameter("cid")),
							(String)request.getParameter("odate"),
							(String)request.getParameter("sdate"),
							Integer.parseInt(request.getParameter("discount")),
							(byte)Integer.parseInt(request.getParameter("cancel"))
							);

OrderDAO od = new OrderDAOimpl();
Integer id = od.add(o);

Integer pid = null;
Integer gid = null;
String spid = request.getParameter("pid");
String sgid = request.getParameter("gid");

if(spid !=""){
	pid = Integer.parseInt(spid);
}if(sgid !=""){
	gid = Integer.parseInt(sgid);
}


OrderDetail odl = new OrderDetail(null,
								  id,
								  pid,
								  gid,
								  Float.parseFloat(request.getParameter("sprice")),
								  Integer.parseInt(request.getParameter("quan")));


System.out.println(odl);
OrderDetailDAO odd = new OrderDetailDAOimpl();

odd.add(odl);

//response.sendRedirect("newOrder.html");
%>