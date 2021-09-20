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
						<h2 class="heading-section">Main Page</h2>
					</div>
				</div>
				<div class="row justify-content-center">

					<form action="KoreaMemberEdit.do" method="post">

						<h3 style="text-align: center;">회원가입</h3>
						<div class="inputBox">
							<table
									style="width: 400px; height: 200px; margin-left: auto; margin-right: auto;">
								<c:set var="detailmember" value="${requestScope.detailmember}"/>

								<tr>
									<td>아이디</td>
									<td>
										<input type="text" name="id" value="${detailmember.id}" readonly>
									</td>
								</tr>
								<tr>
									<td>비번</td>
									<td>${detailmember.pwd}</td>
								</tr>
								<tr>
									<td>이름</td>
									<td>
										<input type="text" name="name" value="${detailmember.name}"
											   style="background-color: yellow">
									</td>
								</tr>
								<tr>
									<td>나이</td>
									<td>
										<input type="text" name="age" value="${detailmember.age}"
											   style="background-color: yellow">
									</td>
								</tr>
								<tr>
									<td>성별</td>
									<td>
										[${detailmember.gender}]
										<c:set var="gender" value="${detailmember.gender.trim()}"/>
										<input type="radio" name="gender" id="gender" value="여"
										<c:if test="${gender eq '여'}">
											<c:out value="checked"/>
										</c:if>>여자
										<input type="radio" name="gender" id="gender" value="남"
										<c:if test="${gender eq '남'}">
											<c:out value="checked"/>
										</c:if>>남자
									</td>
								</tr>
								<tr>
									<td>이메일</td>
									<td>
										<input type="text" name="email" value="${detailmember.email}"
											   style="background-color: yellow">
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<input type="submit" value="수정하기">
										<a href='KoreaMemberList.do'>리스트이동</a></td>
							</table>

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
</html>
