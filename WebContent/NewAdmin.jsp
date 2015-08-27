<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/mysite.css">
<script src="jquery/jquery.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>

<script language="javascript">
	function getData() {
		var request = new XMLHttpRequest();
		request.open("GET", "AdminChk.jsp", false);
		// 這行是設定 request 要去哪取資料，尚未開始取
		// 第三個參數打 true 可以想成，利用另外一個執行緒處理 Request
		// 第三個參數打 false 可以想成，利用這一個執行緒處理 Request
		request.send(null); // 發動 request 去取資料
		document.getElementById("msg").innerHTML = request.responseText;
	}
</script>

<script language="JavaScript">
function check_data()
{
   var flag = true;
   var message = '';

   // ---------- Check ----------
   var t1 = document.getElementById('t1');
   if(t1.value=='')
   {
      message = message + '帳號不能為空白\n';
      flag = false;
   }
   // ---------- Check ----------
   var t2 = document.getElementById('t2');
   if(t2.value=='')
   {
      message = message + '密碼不能為空白\n';
      flag = false;
   }
	// ---------- Check ----------
   var t3 = document.getElementById('t3');
   if(t3.value=='')
   {
      message = message + '密碼確認不能為空白\n';
      flag = false;
   }

   if(!flag) 
   {
      alert(message);
   }
   return flag;
}
</script>

</head>
<body>

	<div id="wrqpper">

		<div id="header">
			<jsp:include page="header.jsp" />
		</div>
		<div id="content">
			<div class="container">
			
			<div class="col-xs-4"></div>
			<div class="col-xs-4">
				<span id="msg">123</span> <input type="button" value="Get Value!!"
					onclick="getData()" />
					
					<br/><br/><br/>

				<form name="admin" action="NewAdminCode.jsp" method="post" onSubmit="return check_data();">
					<div class="form-group">
						<label for="account">帳號</label> <input
							type="text" class="form-control" id="t1" name="t1"
							placeholder="請輸入帳號">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">密碼</label> <input
							type="password" class="form-control" id="t2"
							placeholder="請輸入密碼">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">密碼確認</label> <input
							type="password" class="form-control" id="t3"
							placeholder="請輸入密碼">
					</div>
					

					<div class="checkbox">
						<label> <input type="checkbox"> Check me out
						</label>
					</div>
					<button type="submit" class="btn btn-default">確認送出</button>
				</form>
				</div>
				<div class="col-xs-4"></div>
				<div class="col-xs-12">
				<br/><br/><br/>
				</div>
			</div>
			
			<div class="panel-footer text-center">
				<p>Copyright (c) 2015 版權聲明</p>
			</div>
			
		</div>
	</div>
</body>
</html>