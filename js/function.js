$(document).ready(function() {

	const SLIDER_MAX = $('#max-slider-val').val();

	$(".sa-select-box").chosen({
		disable_search:true
	});

	$( "#slider-range" ).slider({
    range: true,
    min: 0,
    max: SLIDER_MAX,
	values:[0,SLIDER_MAX],
	slide: function( event, ui ) {
        $( "#amount" ).val(ui.values[ 0 ] + " - " + ui.values[ 1 ] );
      }
    });

    $( "#amount" ).val($( "#slider-range" ).slider( "values", 0 ) +
      " - " + $( "#slider-range" ).slider( "values", 1 ) );

	$('body').on("mouseenter","#catalog-products .item a.img-cont", function() {
		$(this).children().stop().animate({
			opacity:0.1
		},600);
		$(this).prev().stop().fadeIn();
	});

	$('body').on("mouseleave","#catalog-products .item a.img-cont", function() {
		$(this).children().stop().animate({
			opacity:1
		},600);
		$(this).prev().stop().fadeOut();
	});

	/* filter */

	$( "#slider-range" ).on( "slidechange", function( event, ui ) {
		filter();
	});

	$(".sort-select, .category-select").change(function(){
		filter();
	});

	$('#main-contact-form #add-comment').click(function(){
		var name = $('#main-contact-form input[type=text]').val();
		var text = $('#main-contact-form textarea').val();
		var product_id = $('#main-contact-form .hidden-id').val();

		if (name == "") {
			$('#main-contact-form input[type=text]').css("border","1px solid red");
			setTimeout(function(){
			$('#main-contact-form input[type=text]').css("border","1px solid #f2f2f2");
			 }, 2000)
		}
		else
		if (text == "") {
			$('#main-contact-form textarea').css("border","1px solid red");
			setTimeout(function(){
			$('#main-contact-form textarea').css("border","1px solid #f2f2f2");
			 }, 2000)
		}
		else {
			$.post("../basket/other_func.php",{name:name, text:text, product_id:product_id, view:'new_comment'}, on_success);

			function on_success(data) {
				$('#main-contact-form textarea').val("");
				$('#main-contact-form input[type=text]').val("");
				$('#product-comment .comment').html(data);
			}

		}
	});

	$('.recent-work-inner button.preview').click(function() {
		var id = $(this).next().val();
		$.post("../basket/other_func.php",{id:id, view:'news_modal'},on_success);
		function on_success(data) {
			$('#NewsModal .modal-content').html(data);
			$('#NewsModal').modal('show');
		}
	});

	$('#contact-page #contact-button').click(function(){
		var name = $('.contact-name').val();
		var mail = $('.contact-mail').val();
		var phone = $('.contact-phone').val();
		var theme = $('.contact-theme').val();
		var message = $('.contact-message').val();
		var pattern = /^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z]{2,4}\.)?[a-z]{2,4}$/i;

		if (name =="") {
			$('.contact-name').css("border","1px solid red");
			setTimeout(function(){
			$('.contact-name').css("border","1px solid #f2f2f2");
			 }, 2000);
			return false;
		}
		if (mail =="") {
			$('.contact-mail').css("border","1px solid red");
			setTimeout(function(){
			$('.contact-mail').css("border","1px solid #f2f2f2");
			 }, 2000);
			return false;
		}
		if (!pattern.test(mail)) {
			$('.contact-mail').css("border","1px solid red");
			setTimeout(function(){
			$('.contact-mail').css("border","1px solid #f2f2f2");
			 }, 2000);
			return false;
		}
		if (theme =="") {
			$('.contact-theme').css("border","1px solid red");
			setTimeout(function(){
			$('.contact-theme').css("border","1px solid #f2f2f2");
			 }, 2000);
			return false;
		}
		if (message =="") {
			$('.contact-message').css("border","1px solid red");
			setTimeout(function(){
			$('.contact-message').css("border","1px solid #f2f2f2");
			 }, 2000);
			return false;
		}
			$.post("../basket/other_func.php",{
				name:name, mail:mail, phone:phone, theme:theme, message:message, view:'contact_message'
			}, on_success);

			function on_success() {
				$('.contact-name').val("");
				$('.contact-mail').val("");
				$('.contact-phone').val("");
				$('.contact-theme').val("");
				$('.contact-message').val("");
				$('#MessageModal .modal-body').html("Повідомлення успішно відправлено! Ми звяжимося з Вами і відповімо на Ваше запитання! ");
				$('#MessageModal').modal('show');
			}
	});

	/* dinamic cart */
	$('button.dinamic-cart').click(function(){
		if(($(this).parent().hasClass('closed')) == true) {
			$(this).parent().toggleClass("closed");
			$(this).parent().stop().animate({
				left:0
			},500);
		}
		else {
			$(this).parent().toggleClass("closed");
			$(this).parent().stop().animate({
				left:-300
			},500);
		}
	});

	$('body').on('click','.add-to-cart',function(){
		var id = $(this).next().val();

		$.post("../basket/other_func.php",{id:id, view:'add_to_cart'},on_success);

		function on_success(data) {
			$('.block-mini-cart .cart-ajax').html(data);
			$('#MessageModal .modal-body').html("Товар успішно додано в корзину!");
			$('#MessageModal').modal('show');
		}
	});
	/* Сart counter */
		$('body').on('click','.add_one_count', function(){
	  	var inp_count = $(this).prev().val();
	  		if(inp_count<50) {
	  			inp_count++;
	  			var id = $(this).parent().children('input[type=hidden]').val();
	  			update_cart_product_count(id,inp_count);
	  		}
	  });
	  $('body').on('click','.min_one_count', function(){
	  	var inp_count = $(this).next().val();
	  		if(inp_count>1) {
	  			inp_count--;
	  			var id = $(this).parent().children('input[type=hidden]').val();
	  			update_cart_product_count(id,inp_count);
	  		}
	  });

});

function filter(count) {
	var min_price = $( "#slider-range" ).slider( "values", 0 );
	var max_price = $( "#slider-range" ).slider( "values", 1 );
	var category = $('.category-select').val();
	var sort = $('.sort-select').val();
	if (count == undefined) {
		count = $(".limit-product-count").val();
	}

	$.post("../basket/filter.php",
	{ min_price:min_price, max_price:max_price, category:category, sort:sort, count:count},
	on_success);

	function on_success(data) {
		$('#catalog-products').html(data);
	}
}

function del_from_cart(id) {
	$.post("../basket/other_func.php",{id:id, view:'del_from_cart'},on_success);

	function on_success(data) {
		$('#cart-page-content').html(data);
	}
}

function update_cart_product_count(id, count) {
		$.post('../basket/other_func.php',{id:id,count:count,view:'update_cart_product_count'},on_success);
		function on_success(data) {
			$('#cart-page-content').html(data);
		}
}

function orderValidate() {
	var name = $('.name').val();
	var sname = $('.sname').val();
	var mail = $('.mail').val();
	var phone = $('.phone').val();
	var address = $('.address').val();
	var pattern = /^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z]{2,4}\.)?[a-z]{2,4}$/i;
	if (name == "") {
		$('.name').css("border","1px solid red");
		setTimeout(function(){
			$('.name').css("border","1px solid #f2f2f2");
		}, 2000);
	return false;
	}
	if (sname == "") {
		$('.sname').css("border","1px solid red");
		setTimeout(function(){
			$('.sname').css("border","1px solid #f2f2f2");
		}, 2000);
	return false;
	}
	if (mail == "") {
		$('.mail').css("border","1px solid red");
		setTimeout(function(){
			$('.mail').css("border","1px solid #f2f2f2");
		}, 2000);
	return false;
	}
	if (!pattern.test(mail)) {
			$('.mail').css("border","1px solid red");
			setTimeout(function(){
			$('.mail').css("border","1px solid #f2f2f2");
			 }, 2000);
			return false;
		}
	if (phone == "") {
		$('.phone').css("border","1px solid red");
		setTimeout(function(){
			$('.phone').css("border","1px solid #f2f2f2");
		}, 2000);
	return false;
	}
	if (address == "") {
		$('.address').css("border","1px solid red");
		setTimeout(function(){
			$('.address').css("border","1px solid #f2f2f2");
		}, 2000);
	return false;
	}

}
