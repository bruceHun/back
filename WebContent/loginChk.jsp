<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="shopping.Business.*,shopping.DAO.*,shopping.Class.*, java.util.*"%>
    
<%
String acc = request.getParameter("account");
String pwd = SavePWD.encode(request.getParameter("password"));
    Administrator adm = null;
    int flag = 0;
    if (acc != null && pwd != null)
    {
    	try
    	{    		
    		AdministratorDAO dao = new AdministratorDAOimpl();
    		adm = dao.searchbyID(acc);
    		
    	    if (adm != null)
    	    {
    	    	if(adm.getPassword().equals(pwd)){
    	    		flag = 1;
    	    	}
    	    }
    	    else
    	    {
    	    	flag = 0;	// 0 代表密碼不符
    	    }
    		
    	}
    	catch(Exception e)
    	{
    		flag = 0;
    	}
    		
    }
    else
    {
    	flag = 0;
    }

    
    if (flag == 1){
    	session.setAttribute("LogOK","yes");	//屬性名，屬性值
    	session.setAttribute("acc",acc);
    	//String t = session.getAttribute("LogOK").toString();
    	//System.out.print(t);
    	//System.out.print(session.getId());
    	response.sendRedirect("index.jsp");
    }else{
    	response.sendRedirect("login.jsp");
    }
    
    
    
    
    %>