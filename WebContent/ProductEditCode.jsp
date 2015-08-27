<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="shopping.DAO.*,shopping.Class.*, java.util.*"%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
request.setCharacterEncoding("UTF-8");
Product p = new Product(Integer.valueOf(request.getParameter("productid")),
		request.getParameter("barcode"),
		Integer.valueOf(request.getParameter("categoryid")),
		request.getParameter("pname"),
		request.getParameter("unit"),
		request.getParameter("capacity"),
		Float.valueOf(request.getParameter("price")),
		Byte.valueOf(request.getParameter("discon")),
		request.getParameter("descri"));
ProductDAO dao = new ProductDAOimpl();
dao.update(p);
response.sendRedirect("productlist.jsp");
%> 