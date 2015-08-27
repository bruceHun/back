<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="shopping.DAO.*,shopping.Class.*, java.util.*"%>

<%
Product p = new Product(
		Integer.valueOf(request.getParameter("id")),null,null,null,null,null,null,null,null);
ProductDAO dao = new ProductDAOimpl();
dao.delete(p);
response.sendRedirect("productlist.jsp");
%>

<!-- LightBox -->