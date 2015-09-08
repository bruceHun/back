<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="shopping.DAO.*,shopping.Class.*, java.util.*"%>

<%

//retrieve your list from the request, with casting 
ArrayList<String[]> list = new ArrayList<String[]>();
list = (ArrayList<String[]>) session.getAttribute("addlist");
InventoryDAO id = new InventoryDAOimpl();
ProductDAO pd = new ProductDAOimpl();

for(String[] s : list) {
	Inventory i = id.searchbyProductID(Integer.valueOf(s[0]));
	i.setUnitsInStock((i.getUnitsInStock())-(Integer.valueOf(s[3])));
	out.print(i);
	id.update(i);
 out.println(s[0]+". "+s[1]+"--"+s[2]+" * "+s[3]+"<p/>");
 
}
response.sendRedirect("inventoryOut.jsp");

%>