<%@page import="java.util.ArrayList" %>
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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/custom.css">
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
						<h2 class="heading-section">Main Page</h2>
					</div>
				</div>
				<div class="row justify-content-center">
					<table style="width: 400px;height: 100px;margin-left: auto;margin-right: auto">
						<tr>
							<th colspan="4">회원리스트</th>
						</tr>
						<c:set var="memberList" value="${requestScope.memberList}"/>
						<c:forEach var="member" items="${memberList}">
							<tr>
								<td width="100px">
									<a href="#" class="memberId">${member.id}</a>
								</td>
								<td width="100px">${member.ip}</td>
								<td>
									<a href="KoreaMemberDelete.do?id=${member.id}">[삭제]</a>
								</td>
								<td>
									<a href="KoreaMemberEdit.do?id=${member.id}">[수정]</a>
								</td>
							</tr>
						</c:forEach>

					</table>
					<form id="searchForm">
						회원명:<input type="text" name="search" id="search">
						<input type="button" id="submit" value="검색">
					</form>
					<div class="modal searchModal">
						<div class="modal-content searchModalContent">
						</div>
					</div>
					<div class="modal detailModal">
						<div class="modal-content detailModalContent">
						</div>
					</div>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
<script type="text/javascript">

	$('#submit').click(function () {
		const formData = $('#searchForm').serialize();
		$.ajax(
				{
					url: "SearchMember",
					type: "GET",
					data: formData,
					success: function (data) {
						$(".searchModalContent").html(data);
						$(".searchModal").fadeIn();
					},
					error: function (xhr) {
						console.log(xhr.status);
					}
				}
		);
	});

	$('.modal-content').click(function () {
		$('.searchModal').fadeOut(600);
	});

	$('.memberId').click(function () {
		console.log($(this).text());
		$.ajax(
				{
					url: "KoreaMemberDetail?id=" + $(this).text(),
					type: "GET",
					success: function (data) {
						$('.detailModalContent').html(data);
						$('.detailModal').fadeIn();
					},
					error: function (xhr) {
						console.log(xhr.status);
					}
				}
		)
	})


</script>
</html>
