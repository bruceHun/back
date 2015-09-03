<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function add() {
	 var obj ={
			  name:'buyer',
			  tel:'0200',
			  childs:[{product:'berry'}]
	  			}
	  var json = JSON.stringify(obj); 
	 //ducument.getElementById('t1') = json;
	 
	 //var request = xhr(); // xhr() 會建立非同步物件
	 //request.onreadystatechange = handleStateChange; // handleStateChange 參考至函式
	 //request.open('POST', 'NewFile1.jsp');
	 //request.setRequestHeader('Content-Type', 'application/json');
	 //request.send(json);
	

	}
</script>
</head>
<body>
<input type='text' id='t1' name='t1'>
<input type="submit" id="btn" value="add" onclick="add()" />

</body>
</html>