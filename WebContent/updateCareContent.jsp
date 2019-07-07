<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <title>护理内容更新页面</title>
		<!--可写在html中任何地方-->
		<script>
			//验证id
			function checkcid(){
				var sn = document.getElementById("cid").value;
				var d = document.getElementById("errorMessage");
				if(sn==""){
					d.innerText = "id不能为空！";
					return false;
				}else{
					return true;
				}
			}
			//验证 编号
			function checkserialNumber(){
				var num = document.getElementById("serialNumber").value;
				if(num ==""){
					var d = document.getElementById("errorMessage");
					d.innerText = "编号不能为空！";
					return false;
				}
				else{
					return true;
				}
				
				
			}
			//验证名称非空
			function checknursingName(){
				var name = document.getElementById("nursingName").value;
				if(name ==""){
					var d = document.getElementById("errorMessage");
					d.innerText = "名称不能为空！";
					return false;
				}
				else{
					return true;
				}
				
				
			}
			function checkform(){
				if(checkcid() && checkserialNumber()&&checknursingName()){
					document.myform.submit();
				}
			}
		</script>
		</head>
        <body>
        <nav class="navbar navbar-default">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/SupportCenter/index.html">东软颐养中心</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="/SupportCenter/index.html">主页
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">护理级别 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">Separated link</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">One more separated link</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">护理内容 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="/SupportCenter/addCareContent.jsp">增加护理内容</a></li>
							<li><a href="/SupportCenter/query.jsp">查询护理内容</a></li>

						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">膳食日历 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">Separated link</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">One more separated link</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">入户登记 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="/SupportCenter/AddCustomer.jsp">添加入户登记</a></li>
							<li><a href="/SupportCenter/queryCustomer.jsp">查询入户登记</a></li>
						</ul></li>
				</ul>

				<ul class="nav navbar-nav navbar-right">

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Dropdown <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">Separated link</a></li>
						</ul></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
            <h1 class="color">护理内容添加界面</h1>
            <!--表单标签-->
			<div style="color: #FF0000; font-size: 36px; font-weight: bold;" id="errorMessage">
				${requestScope.msg}
			</div>
            <form name = "myform" action="/SupportCenter/ContentUpdateController" method="get">
				<!--表单元素-->
				id:<input type="text" name = "cid" id = "cid" value="${requestScope.CareContent[0].id}" readonly="readonly"/><br/>
				编号:<input type="text"name="serialNumber" id = "serialNumber" value="${requestScope.CareContent[0].serialNumber}"/><br />
				名称:<input type="text" name="nursingName" id="nursingName" value="${requestScope.CareContent[0].nursingName}"/><br />
				价格:<input type="text" name="servicePrice" value="${requestScope.CareContent[0].servicePrice}"/><br />
				描述:<input type="text" name="describe" value="${requestScope.CareContent[0].describe}"/><br />
				是否增值：<select name="incrementFlag">
							<option value = "1">是</option>
							<option value = "2">否</option>
						</select><br/>
				是否启用:<select name="status">
							<option value = "1"> 启用</option>
							<option value = "2">停用</option>
						</select>
				<input type="button" value="测试" onclick="checkcid()" />
				<input type="button" value="更新" onclick="checkform()" />
				<input type="reset" value="重置" />
			</form>
        </body>
</html>