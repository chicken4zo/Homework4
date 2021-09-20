const register = document.getElementById("register");
const welcome = document.querySelector(".welcome");
console.log(welcome.getAttribute("id"));
const type = ['primary', 'info', 'success', 'warning', 'danger'];

if (!(welcome.getAttribute("id") === "admin")) {
	//강제로 페이지 이동
	location.href = 'KoreaMemberLoginForm.do';
}

function showNotification(from, align) {
	const color = Math.floor((Math.random() * 4) + 1);

	$.notify({
		icon: "nc-icon nc-app",
		message: "Welcome to <b>Light Bootstrap Dashboard</b> - a beautiful freebie for every web developer."

	}, {
		type: type[color],
		timer: 8000,
		placement: {
			from: from,
			align: align
		}
	});
}

