<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>

<html lang="en">

<head>
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
<body class="img js-fullheight" style="background-image: url(${pageContext.request.contextPath}/assets/img/bg.jpg);">
<div class="wrapper">
    <!--여기서부터 긁으면된다-->
    <div class="main-panel">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg">
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
                        <h1 style="font-size: 40px" class="heading-section">New here?</h1>
                        <p style="color: white">Signing up is easy. It only takes a few steps</p>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-6 col-lg-4">
                        <div class="login-wrap p-0">
                            <form action="KoreaMemberJoin.do" method="POST" class="signin-form">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Username" name="id" id="id"
                                           required>
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control"
                                           placeholder="Password" name="pwd" id="pwd" required>
                                    <span toggle="#password-field"
                                          class="fa fa-fw fa-eye field-icon toggle-password" id="spanPwd"></span>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Name" name="name" id="name"
                                           required>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Age" name="age" id="age"
                                           maxlength="3" required>
                                </div>
                                <div class="form-group" style="text-align: center">
                                    <input type="radio" name="gender" id="gender" value="여" checked>Female
                                    <input type="radio" name="gender" id="gender" value="남" style="margin-left: 35px">Male
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Email" name="email" id="email"
                                           required>
                                </div>
                                <!--                                submit-->
                                <div class="form-group">
                                    <input type="submit" class="form-control btn btn-primary submit px-3"
                                           value="Sign up">

                                </div>
                                <div class="form-group">
                                    Already have an account? <a href="KoreaMemberLoginForm.do"
                                                                style="color: #fff">Login</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <footer class="footer">
        <jsp:include page="/common/Bottom.jsp"/>
    </footer>
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
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	const email = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/)
	const id = RegExp(/^[a-zA-Z0-9]{3,16}$/)
	const pass = RegExp(/^[a-zA-Z0-9]{3,16}$/)

	function check() {
		$('#userId').keyup(function () {
			if ($('#userId').val() === "") {
				$('.tdid').html("ID를 입력해주세요");
			} else if (!id.test($('#userId').val())) {
				$('.tdid').html("3~16자리의 영문+숫자 조합으로 입력해주세요");
			} else {
				$('.tdid').html("");
			}
		});

		$('#userPass').keyup(function () {
			if ($('#userPass').val() === "") {
				$('.tdpw').html("비밀번호를 입력해주세요");
			} else if (!pass.test($('#userPass').val())) {
				$('.tdpw').html("3~16자리의 영문+숫자 조합으로 입력해주세요");
			} else {
				$('.tdpw').html("");
			}
		});

		$('#userPassCheck').keyup(function () {
			if ($('#userPassCheck').val() === "") {
				$('.tdpwch').html("비밀번호 확인을 입력해주세요");
			} else if (!($('#userPass').val() === $('#userPassCheck').val())) {
				$('.tdpwch').html("비밀번호가 일치하지 않습니다");
			} else {
				$('.tdpwch').html("");
			}
		});

		$('#userEmail').keyup(function () {
			if ($('#userEmail').val() === "") {
				$('.tdmail').html("이메일을 입력해 주세요");
			} else if (!email.test($('#userEmail').val())) {
				$('.tdmail').html("test@email.com 형식으로 입력해 주세요");
			} else {
				$('.tdmail').html("");
			}
		});

		$('#userPhone').keyup(function () {
			if ($('#userPhone').val() === "") {
				$('.tdphone').html("휴대폰 번호를 입력해 주세요");
			} else if (!phone.test($('#userPhone').val())) {
				$('.tdphone').html("010-0000-0000 형식으로 입력해 주세요");
			} else {
				$('.tdphone').html("");
			}
		});

		$('#userSsn1').keyup(function () {

		})
	}
</script>

</html>
