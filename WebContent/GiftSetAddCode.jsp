<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="shopping.DAO.*,shopping.Class.*, java.util.*"%>
    <%
	if(session.getAttribute("LogOK")==null){
		response.sendRedirect("login.jsp");
	}
%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
String p1 = request.getParameter("product1");
Integer ip1 = -1;
String p2 = request.getParameter("product2");
Integer ip2 = -1;
String p3 = request.getParameter("product3");
Integer ip3 = -1;
String p4 = request.getParameter("product4");
Integer ip4 = -1;
String p5 = request.getParameter("product5");
Integer ip5 = -1;

if(!p1.equals("")){
	ip1 = Integer.valueOf(p1);
}
if(!p2.equals("")){
	ip2 = Integer.valueOf(p2);
}
if(!p3.equals("")){
	ip3 = Integer.valueOf(p3);
}
if(!p4.equals("")){
	ip4 = Integer.valueOf(p4);
}
if(!p5.equals("")){
	ip5 = Integer.valueOf(p5);
}
	
request.setCharacterEncoding("UTF-8");
GiftSet gs = new GiftSet(null,request.getParameter("gsname"),
		ip1,
		ip2,
		ip3,
		ip4,
		ip4,
		Float.valueOf(request.getParameter("price")),
		Byte.valueOf(request.getParameter("discon")));
GiftSetDAO dao = new GiftSetDAOimpl();
System.out.print(gs);
dao.add(gs);
response.sendRedirect("index.jsp");
%> 