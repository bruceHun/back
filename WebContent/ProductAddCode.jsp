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



String pname = new String(request.getParameter("pname").getBytes("ISO-8859-1"),"utf-8");
String unit = new String(request.getParameter("unit").getBytes("ISO-8859-1"),"utf-8");
String capacity = new String(request.getParameter("capacity").getBytes("ISO-8859-1"),"utf-8");
String descri = new String(request.getParameter("descri").getBytes("ISO-8859-1"),"utf-8");

Product p = new Product(null,
		request.getParameter("barcode"),
		Integer.valueOf(request.getParameter("categoryid")),
		pname,
		unit,
		capacity,
		Float.valueOf(request.getParameter("price")),
		Byte.valueOf(request.getParameter("discon")),
		descri);
ProductDAO dao = new ProductDAOimpl();
dao.add(p);
response.sendRedirect("productlist.jsp");
%> 