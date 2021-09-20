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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/liststyle.css?ver=1"/>
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
					<table style="width: 80%;height: 80%;margin-left: auto;margin-right: auto; margin-bottom : 100px">
						<tr>
							<th class="list" colspan="10">회원리스트</th>
						</tr>
						<c:set var="memberList" value="${requestScope.memberList}"/>
						<c:forEach var="member" items="${memberList}">

							<tr class="cell">
								<td colspan="3">
									<a href="#" id="${member.id}" class="memberId">${member.id}</a>
								</td>
								<td id="name" colspan="4">${member.name}</td>
								<td>
									<button type="button" onclick="location.href='KoreaMemberDelete.do?id=${member.id}'"
											class="buttons">삭제
									</button>
								</td>
								<td>
									<button type="button" onclick="location.href='KoreaMemberEdit.do?id=${member.id}'"
											class="buttons">수정
									</button>
								</td>
							</tr>
						</c:forEach>

					</table>
					<div class="form-group">
						<input type="text" id="search" class="form-control" placeholder="Search by name" name="search">
						<button type="button" class="btn-search" name="search" id="submit">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
								<path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path>
							</svg>
						</button>
					</div>
					<%--						회원명:<input type="text" name="search" id="search">--%>
					<%--						<input type="button" id="submit" value="검색">--%>
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
		const search = $("#search").val();
		$.ajax(
				{
					url: "SearchMember?search=" + search,
					type: "GET",
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
