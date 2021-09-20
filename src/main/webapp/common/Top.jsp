<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${sessionScope.userid}" var="id"/>
<a class="navbar-brand" href="Main.do">CHICKEN4ZO</a>
<button href="" class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
        aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-bar burger-lines"></span>
    <span class="navbar-toggler-bar burger-lines"></span>
    <span class="navbar-toggler-bar burger-lines"></span>
</button>
<div class="collapse navbar-collapse justify-content-end" id="navigation">
    <ul class="navbar-nav ml-auto" id="loginlogout">
    </ul>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$.ajax(
		{
			url: "LoginLogout",
			type: "GET",
			dataType: "html",
			success: function (responseData) {
				document.getElementById("loginlogout").innerHTML = responseData;
			},
			error: function (xhr) {
				console.log(xhr.status);
			}
		}
	);
</script>
