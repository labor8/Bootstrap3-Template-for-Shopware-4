$(document).ready(function () {

    $('.popover-cart').popover({
        html: true,
        content: function () {
            return $('#popover-cart').html();
        }
    });

	$('.ctl_detail #tabs .nav a').click(function (e) {
		e.preventDefault()
		$(this).tab('show')
	})

});