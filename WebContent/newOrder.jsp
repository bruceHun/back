<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="shopping.DAO.*,shopping.Class.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Demo</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<script src="jquery/jquery.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script>
var request;
function sendInfo()
{
var v=document.vinform.t1.value;
var url="demo_test.jsp?val="+v;

if(window.XMLHttpRequest){
request=new XMLHttpRequest();
}
else if(window.ActiveXObject){
request=new ActiveXObject("Microsoft.XMLHTTP");
}

try
{
request.onreadystatechange=getInfo;
request.open("GET",url,true);
request.send();
}
catch(e)
{
alert("Unable to connect to server");
}
}

function getInfo(){
if(request.readyState==4){
var val=request.responseText;
document.getElementById('amit').innerHTML=val;
}
}
</script>
</head>

<body>
<nav class="navbar navbar-warning" role="navigation">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#"><span class="glyphicon glyphicon-th-large"></span> 三十岬梅舖</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">系統介紹</a></li>
        <li><a href="#">功能項目</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">會員管理<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">會員資格</a></li>
            <li><a href="#">會員等級</a></li>
            <li><a href="#">會員資訊</a></li>
          </ul>
        </li>
          
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">商品管理<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">新增商品</a></li>
            <li><a href="#">商品下架</a></li>
            <li><a href="#">資料更新</a></li>
          </ul>
        </li>
          
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">進出貨管理<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">進貨</a></li>
            <li><a href="#">出貨</a></li>
            <li><a href="#">退貨</a></li>
            <li class="divider"></li>
            <li><a href="#">檢視庫存</a></li>
            <li class="divider"></li>
            <li><a href="#">安全存量</a></li>
          </ul>
        </li>
          
      </ul>
      <form class="navbar-form navbar-right" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>


<div class="container">
 
  <div class="jumbotron">
    <h1>管理系統</h1>
    <p>訊息文字。</p>
  </div>
 <!-- ------------------------------------------------------------------------ -->
  <form action="test.jsp" method="post" class="form-inline" role="form">
  <div class="form-group">
    <label for="exampleInputEmail1">客戶編號</label>
    <input type="date" class="form-control" id="cid" name="cid" placeholder="輸入客戶編號">
  </div>
      
  <div class="form-group">
    <label for="exampleInputEmail1">訂購日期</label>
    <input type="date" class="form-control" id="odate" name="odate" placeholder="輸入訂購日期">
  </div>
  
  <div class="form-group">
    <label for="exampleInputEmail1">出貨日期</label>
    <input type="text" class="form-control" id="sdate" name="sdate" placeholder="輸入出貨日期">
  </div>      
      
  <div class="form-group">
    <label for="exampleInputEmail1">折扣代碼</label>
    <input type="text" class="form-control" id="discount" name="discount" placeholder="輸入折扣代碼">
  </div>      
      
  <div class="form-group">
    <label for="exampleInputEmail1">取消訂貨</label>
    <input type="text" class="form-control" id="cancel" name="cancel" placeholder="輸入取消訂貨">
  </div>      
  
  <!--  -->
  
  <div class="dropdown">
  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
    選擇類別
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
    <li><a href="#">一般產品</a></li>
    <li><a href="#">禮盒套組</a></li>
  </ul>
</div>
  
  <!--  -->
      
  <div class="form-group">
    <label for="exampleInputEmail1">產品編號</label>
    <input type="text" class="form-control" id="pid" name="pid" placeholder="輸入產品編號">
  </div>      
      
  <div class="form-group">
    <label for="exampleInputEmail1">禮盒編號</label>
    <input type="text" class="form-control" id="gid" name="gid" placeholder="輸入禮盒編號">
  </div>     
      
  <div class="form-group">
    <label for="exampleInputEmail1">訂購價格</label>
    <input type="text" class="form-control" id="sprice" name="sprice" placeholder="輸入訂購價格">
  </div>
      
  <div class="form-group">
    <label for="exampleInputEmail1">訂購數量</label>
    <input type="text" class="form-control" id="quan" name="quan" placeholder="輸入訂購數量">
  </div>
  <br/>
  <button type="submit" class="btn btn-info">新增</button>
  </form>
 <!-- ------------------------------------------------------------------------ -->   
<br/>
    
  <div class="panel panel-success">
    <div class="panel-heading">目前的電子報種類</div>
    <div class="panel-body">

      <table class="table table-hover ">
        <tr>
          <th>代號</th>
          <th>名稱</th>
          <th>發刊日期</th>
          <th>訂閱人數</th>
          <th>訂閱</th>
        </tr>
        <tr>
          <td>S001</td>
          <td>科學新知</td>
          <td>2014-10-12</td>
          <td>342</td>
          <td><a href="#" class="btn btn-xs btn-success">訂閱</a></td>
        </tr>
        <tr>
          <td>B006</td>
          <td>文化創意最前線</td>
          <td>2014-08-06</td>
          <td>63</td>
          <td><a href="#434" class="btn btn-xs btn-success">訂閱</a></td>
        </tr>
        <tr>
          <td>K005</td>
          <td>居家整理斷捨離</td>
          <td>2014-05-02</td>
          <td>12</td>
          <td><a href="#" class="btn btn-xs btn-success">訂閱</a></td>
        </tr>
        <tr>
          <td>M003</td>
          <td>電影報你知</td>
          <td>2014-04-13</td>
          <td>3346</td>
         <td><a href="#" class="btn btn-xs btn-success">訂閱</a></td>
       </tr>
      </table>

    </div>
  </div>
 
 <!-- ---------------------------------------------------------------- -->
<form name="vinform">
 <div class="input-group">
  <span class="input-group-addon">商品編號</span>
  <input type="text" id ="t1" name="t1" class="form-control" placeholder="UserID">
  <br/>
  <button type="submit" class="btn btn-info" onClick="sendinfo()">搜尋</button>
</div>
</form>

<span id="amit"> </span>

<div class="input-group">
  <span class="input-group-addon">密    碼</span>
  <input type="text" class="form-control" placeholder="Username">
</div>

<!-- ---------------------------------------------------------------- -->
 
  <div class="alert alert-warning" role="alert">
    <p>欲學習如何訂閱電子報，請閱讀 <a href="#" class="btn btn-warning">教學</a></p>
  </div>
  <p><a class="btn btn-primary btn-lg" role="button">立即試用</a></p>

</div>


<div class="panel-footer text-center">
  <p>Copyright (c) 2014 版權聲明</p>
</div>

</body>
</html>
