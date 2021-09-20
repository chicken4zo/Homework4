(function ($) {

	"use strict";

	var fullHeight = function () {

		$('#fullheight').css('height', $(window).height());
		$(window).resize(function () {
			$('#fullheight').css('height', $(window).height());
		});

	};
	fullHeight();

	$(".toggle-password").click(function () {

		$(this).toggleClass("fa-eye fa-eye-slash");
		const input = $('#pwd');

		if ($(this).hasClass("fa-eye-slash")) {
			input.prop("type", "text");
		} else {
			input.prop("type", "password");
		}
		console.log($(this).hasClass("fa-eye-slash"));
	});

})(jQuery);
