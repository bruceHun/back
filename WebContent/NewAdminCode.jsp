<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="shopping.Business.*,shopping.DAO.*,shopping.Class.*, java.util.*"%>
<%
String s = request.getParameter("account");
Administrator ad = new Administrator(s, SavePWD.encode(request.getParameter("password")),"1");
AdministratorDAO dao = new AdministratorDAOimpl();
dao.add(ad);
session.setAttribute("LogOK", "yes");
session.setAttribute("acc", s);
response.sendRedirect("index.jsp");
%>    


