<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增管理帳號</title>

<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/mysite.css">
<script src="jquery/jquery.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>

<script language="javascript">
	function getData() {
		var t1 = document.getElementById("t1");
		request = new XMLHttpRequest();
		request.open("GET", "AdDupChk.jsp?account=" + t1.value, true);
		// 這行是設定 request 要去哪取資料，尚未開始取
		// 第三個參數打 true 可以想成，利用另外一個執行緒處理 Request
		// 第三個參數打 false 可以想成，利用這一個執行緒處理 Request
		var img1 = document.getElementById("img1");
		img1.src = "images/loading.gif";

		request.onreadystatechange = updateData;
		// 當記憶體中的瀏覽器狀態改變時，呼叫 updateData 這個 function
		request.send(null); // 發動 request 去取資料
	}

	function updateData() {
		if (request.readyState == 4) {
			//alert(request.responseText);
			var dup = document.getElementById("dup");
			dup.value = request.responseText.trim();
			//alert(dup.value);
			if (dup.value == "1") {
				var img1 = document.getElementById("img1");
				img1.src = "images/wrong.gif";
			} else {
				var img1 = document.getElementById("img1");
				img1.src = "images/check.gif";
			}

		}
	}
	
	function check_pwd() {
		var t2 = document.getElementById("t2");	
		var pattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{4,8}$/;
		var ret = pattern.test(t2.value);
		if(ret){
			img2.src = "images/check.gif";
		}else{
			img2.src = "images/wrong.gif"
		}

	}
	
	function check_pwd2() {
		var t2 = document.getElementById("t2");
		var t3 = document.getElementById("t3");
		var img2 = document.getElementById("img2");
		var img3 = document.getElementById("img3");
		if(t2.value == t3.value){
			img3.src = "images/check.gif";
		}else{
			img3.src = "images/wrong.gif";
		}
	}

	function check_data() {
		var flag = true;
		var message = '';

		// ---------- Check ----------
		var t1 = document.getElementById('t1');
		if (t1.value == '') {
			message = message + '帳號不能為空白\n';
			flag = false;
		}
		// ---------- Check ----------
		var t2 = document.getElementById('t2');
		if (t2.value == '') {
			message = message + '密碼不能為空白\n';
			flag = false;
		}
		
		var t2 = document.getElementById('t2');
		var pattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{4,8}$/;
		var ret = pattern.test(t2.value);
		if(!ret){
			message = message + '密碼格式不符\n';
			flag = false;
		}
		
		// ---------- Check ----------
		var t3 = document.getElementById('t3');
		if (t3.value == '') {
			message = message + '密碼確認不能為空白\n';
			flag = false;
		}

		var dup = document.getElementById('dup');
		if (dup.value == '1') {
			message = message + '帳號不得重複\n';
			flag = false;
		}
				
		if (!document.getElementById('read').checked){
			message = message + '須先閱讀使用條款';
			flag = false;
		}

		if (!flag) {
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
			<div class="page-header">
				<h1 align="center">
					登入系統 <small>新增管理帳號</small>
				</h1>
			</div>
		
			<div class="container">


				<div class="col-sm-offset-3 col-sm-6 col-md-offset-4 col-md-4">
					<br /> <br /> <br />

					<form class="form-horizontal" name="admin"
						action="NewAdminCode.jsp" method="post"
						onSubmit="return check_data()">
						<div class="form-group">
							<div class="col-sm-3">
								<label for="t1">帳號</label>
							</div>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="t1" name="account"
									placeholder="請輸入帳號" onchange="getData()">
							</div>
							<div class="col-sm-2">
								<img src="images/trans.gif" id="img1" width="30px" height="30px" />
								<input type="hidden" id="dup" value="1" />
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-3">
								<label for="t2">密碼</label>
							</div>
							<div class="col-sm-7">
								<input type="password" class="form-control" id="t2" name="password"
									placeholder="請輸入密碼"  onchange="check_pwd()">
							</div>
							<div class="col-sm-2">
								<img src="images/trans.gif" id="img2" width="30px" height="30px" />
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-3">
								<label for="t3">密碼確認</label>
							</div>
							<div class="col-sm-7">
								<input type="password" class="form-control" id="t3" name="pwd2"
									placeholder="請輸入密碼" onchange="check_pwd2()">
							</div>
							<div class="col-sm-2">
								<img src="images/trans.gif" id="img3" width="30px" height="30px" />
							</div>
						</div>
						
						

						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-7">
								<div class="checkbox">
									<label> <input type="checkbox" id="read"> 我已閱讀使用條款
									</label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-7">
								<button type="submit" class="btn btn-default">確認送出</button>
							</div>
						</div>
					</form>


					<div class="col-xs-12">
						<br /> <br /> <br />
					</div>
				</div>
			</div>
			<div id="footer">
				<jsp:include page="footer.jsp" />
			</div>

		</div>

	</div>
</body>
</html>