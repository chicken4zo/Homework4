const register = document.getElementById("register");
const welcome = document.querySelector(".welcome");
console.log(welcome.getAttribute("id"));

if (!(welcome.getAttribute("id") === "admin")) {
	//강제로 페이지 이동
	location.href = 'KoreaMemberLoginForm.do';
}


