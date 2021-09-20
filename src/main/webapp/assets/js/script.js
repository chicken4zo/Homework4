if (session.getAttribute("userid") == null || !session.getAttribute("userid").equals("admin")) {
	//강제로 페이지 이동
	out.print("<script>location.href='KoreaMemberLoginForm.do'</script>");
}
