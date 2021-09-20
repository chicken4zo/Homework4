<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%--view--%>
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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/custom.css">
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
						<h2 class="heading-section">Member Edit</h2>
					</div>
				</div>
				<div class="row justify-content-center">
					<div class="col-md-6 col-lg-4">
						<form action="KoreaMemberEdit.do" method="post">
							<div>
								<c:set var="detailmember" value="${requestScope.detailmember}"/>
								<div class="form-group">
									<span class="form-name">Username</span>
									<input type="text" name="id" id="id" class="form-control" value="${detailmember.id}"
										   readonly>
								</div>

								<div class="form-group">
									<span class="form-name">Password</span>
									<input type="password" class="form-control"
										   name="pwd" id="pwd" value="${detailmember.pwd}">
									<span toggle="#password-field"
										  class="fa fa-fw fa-eye field-icon toggle-password" id="spanPwd"
										  style="top: 54px"></span>
								</div>

								<div class="form-group">
									<span class="form-name">Name</span><input type="text" name="name" id="name"
																			  class="form-control"
																			  value="${detailmember.name}">
								</div>

								<div class="form-group">
									<span class="form-name">Age</span><input type="text" name="age" id="age"
																			 class="form-control"
																			 value="${detailmember.age}">
								</div>


								<div class="form-group" style="text-align: center">
									<c:set var="gender" value="${detailmember.gender.trim()}"/>
									<input type="radio" name="gender" id="gender" value="여"
										   <c:if test="${gender eq '여'}">checked</c:if>>Female
									<input type="radio" name="gender" id="gender" value="남" style="margin-left: 35px"
										   <c:if test="${gender eq '남'}">checked</c:if>>Male
								</div>

								<div class="form-group">
									<span class="form-name">Email</span><input type="text" name="email" id="email"
																			   class="form-control"
																			   value="${detailmember.email}">
								</div>

								<div class="form-group">
									<input type="submit" class="form-control btn btn-primary submit px-3" value="Edit">
									<a href='KoreaMemberList.do'>Member List</a>
								</div>
							</div>
						</form>
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
<!--  Chartist Plugin  -->
<script src="${pageContext.request.contextPath}/assets/js/plugins/chartist.min.js"></script>
<!--  Notifications Plugin    -->
<script src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap-notify.js"></script>
<!-- Control Center for Light Bootstrap Dashboard: scripts for the example pages etc -->
<script src="${pageContext.request.contextPath}/assets/js/light-bootstrap-dashboard.js?v=2.0.0"
		type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</html>
