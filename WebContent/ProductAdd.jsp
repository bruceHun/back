<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="shopping.DAO.*,shopping.Class.*, java.util.*"%>
	<%
	if(session.getAttribute("LogOK")==null){
		response.sendRedirect("login.jsp");
	}
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增資料修改</title>

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
		//var img1 = document.getElementById("img1");
		//img1.src = "images/loading.gif";

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
			/*if (dup.value == "1") {
				var img1 = document.getElementById("img1");
				img1.src = "images/wrong.gif";
			} else {
				var img1 = document.getElementById("img1");
				img1.src = "images/check.gif";
			}*/

		}
	}
	
	/*function check_pwd() {
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
	}*/

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

			<div class="container">
				<form class="form-horizontal" name="product"
					action="ProductAddCode.jsp" method="post">
					

					<!-- -------------------------------------------------------------------------------------- -->
					<div class="col-xs-6">
						<div class="form-group ">
							<label for="barcode">國碼：</label> <input type="text"
								class="form-control" id="barcode" name="barcode"
								placeholder="國碼">
						</div>

						<div class="form-group">
							<label for="categoryid">類別編號：</label> <input type="text"
								class="form-control" id="categoryid" name="categoryid"
								placeholder="類別編號">
						</div>

						<div class="form-group">
							<label for="pname">商品名稱：</label> <input type="text"
								class="form-control" id="pname" name="pname" placeholder="商品名稱">
								<input type="hidden" id="dup" value="1" />
						</div>

						<div class="form-group">
							<label for="unit">商品單位：</label> <input type="text"
								class="form-control" id="unit" name="unit" placeholder="商品單位">
						</div>
					</div>
					<!-- -------------------------------------------------------------------------------------- -->
					<div class="col-xs-6">
						<div class="form-group">
							<label for="capacity">商品容量：</label> <input type="text"
								class="form-control" id="capacity" name="capacity"
								placeholder="商品容量">
						</div>
						<p />
						<div class="form-group">
							<label for="price">商品單價：</label> <input type="text"
								class="form-control" id="price" name="price" placeholder="商品單價">
						</div>

						<div class="form-group">
							<label for="discon">商品下架：</label> <input type="text"
								class="form-control" id="discon" name="discon"
								placeholder="商品下架">
						</div>

						<div class="form-group">
							<label for="descri">商品資訊：</label> <input type="text"
								class="form-control" id="descri" name="descri"
								placeholder="商品資訊">

						</div>
					</div>
					<!-- -------------------------------------------------------------------------------------- -->

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default">確認新增</button>
						</div>
					</div>

				</form>
			</div>

		</div>
		<div>
			<jsp:include page="footer.jsp" />
		</div>

	</div>
</body>
</html>