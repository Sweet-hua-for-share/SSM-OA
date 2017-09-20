<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>OA管理系统</title>
<link rel="stylesheet" type="text/css" href="../css/style.css">
<!--[if lt IE 9]>
<script src="js/html5.js"></script>
<![endif]
-->
<script src="../js/jquery-3.2.1.js"></script>
<script src="../js/jquery.mCustomScrollbar.concat.min.js"></script>

<script>

	(function($){
		$(window).load(function(){
			
			$("a[rel='load-content']").click(function(e){
				e.preventDefault();
				var url=$(this).attr("href");
				$.get(url,function(data){
					$(".content .mCSB_container").append(data); //load new content inside .mCSB_container
					//scroll-to appended content 
					$(".content").mCustomScrollbar("scrollTo","h2:last");
				});
			});
			
			$(".content").delegate("a[href='top']","click",function(e){
				e.preventDefault();
				$(".content").mCustomScrollbar("scrollTo",$(this).attr("href"));
			});
			
		});
	})(jQuery);
</script>
</head>
<body>
	<!--header-->
	<header>
		<h1 style="height: 70px"></h1>
		<ul class="rt_nav">
			<li><a href="#" class="clear_icon">清除缓存</a></li>
			<li><a href="#" class="admin_icon">${user.login_name}</a></li>
			<li><a href="#" class="set_icon">账号设置</a></li>
			<li><a href="../login.jsp" class="quit_icon">安全退出</a></li>
		</ul>
	</header>
	<!--aside nav-->
	<!--aside nav-->
	<aside class="lt_aside_nav content mCustomScrollbar">
		<h2>起始页</h2>
		<ul>
			<li>
				<dl>
					<dt>系统设置</dt>
					<dd>
						<a href="../user/getUserList">&nbsp;&nbsp;&nbsp;&nbsp;用户管理</a>
					</dd>
					<dd>
						<a href="">&nbsp;&nbsp;&nbsp;&nbsp;机构管理</a>
					</dd>
					<dd>
						<a href="../area/getAreaList">&nbsp;&nbsp;&nbsp;&nbsp;区域管理</a>
					</dd>
				</dl>
			</li>
		</ul>
	</aside>


	<section class="rt_wrap content mCustomScrollbar">
		<div class="rt_content">
			<div class="page_title">
				<h2 class="fl">区域信息列表</h2>
				<button id="showPopTxt" class="fr top_rt_btn add_icon">
					<a>区域添加</a>
				</button>
			</div>
			<div id="test">
				<table class="table" id="test">
					<tr>
						<th>区域名称</th>
						<th>区域编码</th>
						<th>区域类型</th>
						<th>备注</th>
						<th>操作</th>
					</tr>

					<c:forEach items="${list}" var="list">
						<tr>
							<td align="center">${list.name}</td>
							<td align="center">${list.code}</td>
							<td align="center">${list.type}</td>
							<td align="center">${list.remarks}</td>
							<td class="center">
								<a title="查看详细信息" class="link_icon" id="test" onclick="update('${list.id},${list.name},${list.code},${list.type},${list.remarks}')">&#118;</a>
							 	<a onclick="del('${list.id}')" title="删除" class="link_icon">&#100;</a>
							</td>
						</tr>
					</c:forEach>

				</table>
			</div>
		</div>
	</section>

	
		<section class="pop_bg">
			<div class="pop_cont">
				<!--title-->
				<h3>新增区域</h3>
				<!--content-->
				<form id="addArea" action="addArea" method="post">
				<div class="pop_cont_input">
					<ul>
						<li><span>上级区域:</span>
						 <input type="text" id="parentId" name="parentId" placeholder="请输上级区域..." class="textbox"/></li>
						<li><span class="ttl">区域名称:</span> 
						<input type="text" id="name"  name="name" placeholder=" 请输入区域名称..." class="textbox" />
						<span class="errorTips" style=display:none id="errorMessage" name="errorMessage">必填字段。。。</span></li>
						<li><span class="ttl">区域编码:</span> <input type="text" id="code" name="code" placeholder="请输区域编码..." class="textbox" /></li>
						<li><span class="ttl">区域类型:</span> <select id="type" name="type" class="select">
								<option value="1">国家</option>
								<option value="2">省份，直辖市</option>
								<option value="3">地市</option>
								<option value="4">区县</option>
						</select></li>
						<li><span class="ttl">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注:</span>
							<textarea id="remarks" name="remarks" placeholder="备注" class="textarea" style="width:500px;height:100px;"></textarea>
						</li>
					</ul>
				</div>
				</form>
				<!--以pop_cont_text分界-->
				<div class="pop_cont_text"></div>
				<!--bottom:operate->button-->
				<div class="btm_btn">
					<input type="button" value="确认" class="input_btn trueBtn"/>
					<input type="button" value="关闭" class="input_btn falseBtn"/>
				</div>
			</div>
		</section>
	

	<style>
.dataStatistic {
	width: 400px;
	height: 200px;
	border: 1px solid #ccc;
	margin: 0 auto;
	margin: 10px;
	overflow: hidden
}

#cylindrical {
	width: 400px;
	height: 200px;
	margin-top: -15px
}

#line {
	width: 400px;
	height: 200px;
	margin-top: -15px
}

#pie {
	width: 400px;
	height: 200px;
	margin-top: -15px
}
</style>

<script>
		
		//弹出文本性提示框
		 $("#showPopTxt").click(function(){
			 $(".pop_bg").fadeIn();
	     });
		 //弹出：确认按钮
		 $(".trueBtn").click(function(){
				if($("#name").val()==""){
					$("#errorMessage").show()
					return false;
				}
				 $.ajax({
			          url:"addArea",
			          type:"post",
			          data:$('#addArea').serialize(),
			          success:function(result){
			        	  $(".pop_bg").fadeOut();
			        	  window.location.href= "../area/getAreaList";
			          },
			          error:function(){
			              alert("发生异常，请重试！");
			          }
			       });
		  });
		 //弹出：取消或关闭按钮
		 $(".falseBtn").click(function(){
			 $(".pop_bg").fadeOut();
		 });
	
	
	function del(id){
	    if(confirm("确定删除当前数据？")){
	        window.location = "../area/deleteArea?id="+id;//跳转
	    }else{
	        return;
	    }
	}
	
	function update(value){
		alert(id);
		
		
	}
	
	
</script>
</body>
</html>
