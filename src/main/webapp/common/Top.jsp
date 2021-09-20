<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="id" value="${sessionScope.userid}"/>
<a class="navbar-brand" href="Main.do"> CHICKEN 4ZO </a>
<button href="" class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
        aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-bar burger-lines"></span>
    <span class="navbar-toggler-bar burger-lines"></span>
    <span class="navbar-toggler-bar burger-lines"></span>
</button>
<div class="collapse navbar-collapse justify-content-end" id="navigation">
    <ul class="nav navbar-nav mr-auto">
        <li class="nav-item">
            <a href="#" class="nav-link">
                <i class="nc-icon nc-zoom-split"></i>
                <span class="d-lg-block">&nbsp;Search</span>
            </a>
        </li>
    </ul>
    <ul class="navbar-nav ml-auto">
        <li class="nav-item">
            <a class="nav-link" href="KoreaMemberJoinForm.do">
                <span class="no-icon">Register</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">
                <span class="no-icon" id="loginlogout"></span>
            </a>
        </li>
    </ul>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		$.ajax(
			{
				url: "LoginLogout",
				type: "GET",
				dataType: "html",
				data: "${id}",
				success: function (responseData) {
					document.getElementById("loginlogout").innerHTML = responseData;
				},
				error: function (xhr) {
					console.log(xhr.status);
				}
			}
		);
	});
</script>
