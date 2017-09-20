<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>OA管理系统</title>
<link rel="stylesheet" type="text/css" href="../css/style.css">
<!--[if lt IE 9]>
<script src="js/html5.js"></script>
<![endif]-->
<script src="../js/jquery-3.2.1.js"></script>
<script src="../js/jquery.mCustomScrollbar.concat.min.js"></script>
<script>
	(function($) {
		$(window).load(
				function() {

					$("a[rel='load-content']").click(
							function(e) {
								e.preventDefault();
								var url = $(this).attr("href");
								$.get(url, function(data) {
									$(".content .mCSB_container").append(data); //load new content inside .mCSB_container
									//scroll-to appended content 
									$(".content").mCustomScrollbar("scrollTo",
											"h2:last");
								});
							});

					$(".content").delegate(
							"a[href='top']",
							"click",
							function(e) {
								e.preventDefault();
								$(".content").mCustomScrollbar("scrollTo",
										$(this).attr("href"));
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
						<a href="getUserList">&nbsp;&nbsp;&nbsp;&nbsp;用户管理</a>
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

</body>
</html>
