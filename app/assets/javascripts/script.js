$(document).ready(function(){
	// $("ul").hide();
	$(".about_menu ul").hide();
	$(".about_menu_box_main").click(function(e){
		e.preventDefault();
		$('.about_menu_box_inside').slideUp();
		$(this).next('.about_menu_box_inside').slideDown();
	});
	$('.menu_open').click(function(e){
		e.preventDefault();
		$('.head').addClass('meunu_open_small');
	});
	$('.menu_close').click(function(e){
		e.preventDefault();
		$('.head').removeClass('meunu_open_small');
	});
});