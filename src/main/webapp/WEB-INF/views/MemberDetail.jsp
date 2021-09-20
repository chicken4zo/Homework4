<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@ page import="kr.or.bit.utils.ConnectionHelper" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
		  integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
	<title>Light Bootstrap Dashboard - Free Bootstrap 4 Admin Dashboard by Creative Tim</title>
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
		  name='viewport'/>
	<!--     Fonts and icons     -->

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"/>
	<!-- CSS Files -->
	<link href="${pageContext.request.contextPath}/assets/css/light-bootstrap-dashboard.css?v=2.0.0 " rel="stylesheet"/>
	<!-- CSS Just for demo purpose, don't include it in your project -->

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
<div class="wrapper">
	<!--여기서부터 긁으면된다-->
	<div class="main-panel">
		<!-- Navbar -->
		<nav class="navbar navbar-expand-lg " color-on-scroll="500">
			<div class="container-fluid">
				<jsp:include page="/common/Top.jsp"/>
			</div>
		</nav>
		<!-- End Navbar -->
		<!-- 로그인 폼 채우기 -->
		<section class="ftco-section" id="form">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-6 text-center mb-5">
						<h2 class="heading-section">Member Detail</h2>
					</div>
				</div>
				<div class="row justify-content-center">
					<table style="width: 400px;height: 100px;margin-left: auto;margin-right: auto;">
						<c:set var="member" value="${requestScope.koreaMemberDto}"/>
						<%--								 view--%>
						<tr>
							<td style="width:100px">아이디</td>
							<td style="width:100px">${member.id}</td>
						</tr>
						<tr>
							<td style="width:100px">비번</td>
							<td style="width:100px">${member.pwd}</td>
						</tr>
						<tr>
							<td style="width:100px">이름</td>
							<td style="width:100px">${member.name}</td>
						</tr>
						<tr>
							<td style="width:100px">나이</td>
							<td style="width:100px">${member.age}</td>
						</tr>
						<tr>
							<td style="width:100px">성별</td>
							<td style="width:100px">${member.gender}</td>
						</tr>
						<tr>
							<td style="width:100px">이메일</td>
							<td style="width:100px">${member.email}</td>
						</tr>
						<tr>
							<td colspan="2">
								<a href="KoreaMemberList.do">목록가기</a>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</section>
		<footer class="footer">
			<jsp:include page="/common/Bottom.jsp"/>
		</footer>
	</div>
</div>
</body>
<!--   Core JS Files   -->
<script src="${pageContext.request.contextPath}/assets/js/core/jquery.3.2.1.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/js/core/popper.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/js/core/bootstrap.min.js" type="text/javascript"></script>
<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap-switch.js"></script>
<!--  Google Maps Plugin    -->

<!--  Chartist Plugin  -->
<script src="${pageContext.request.contextPath}/assets/js/plugins/chartist.min.js"></script>
<!--  Notifications Plugin    -->
<script src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap-notify.js"></script>
<!-- Control Center for Light Bootstrap Dashboard: scripts for the example pages etc -->
<script src="${pageContext.request.contextPath}/assets/js/light-bootstrap-dashboard.js?v=2.0.0 "
		type="text/javascript"></script>
<!-- Light Bootstrap Dashboard DEMO methods, don't include it in your project! -->
<script src="${pageContext.request.contextPath}/assets/js/demo.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
</html>
