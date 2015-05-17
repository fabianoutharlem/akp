Number.prototype.formatMoney = function(c, d, t){
var n = this,
    c = isNaN(c = Math.abs(c)) ? 2 : c,
    d = d == undefined ? "." : d,
    t = t == undefined ? "," : t,
    s = n < 0 ? "-" : "",
    i = parseInt(n = Math.abs(+n || 0).toFixed(c)) + "",
    j = (j = i.length) > 3 ? j % 3 : 0;
   final = s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "");

  	return '&euro; ' + final.replace(/,00$/g, ',-') + ' p.m.';
 };

$(function () {

	FastClick.attach(document.body);

	$('.slider-range').each(function () {
		var $this = $(this);
		var max = $this.data('max');
		var min = $this.data('min');
		var _default = $this.data('default').split('-');
		var type = $this.data('type') || 'moveable';

		$this.slider({
			range: true,
			min: min,
			max: max,
			values: _default,
			slide: function (event, ui) {

				var min = ui.values[0].formatMoney(2, ',', '.');
				var max = ui.values[1].formatMoney(2, ',', '.');

				$this.find('.ui-slider-handle:first .value').html(min);
				$this.find('.ui-slider-handle:last .value').html(max);
			}
		});

		$this
			.append('<div class="slider-value-min">' + min.formatMoney(2, ',', '.') + '</div>')
			.append('<div class="slider-value-max">' + max.formatMoney(2, ',', '.') + '</div>');

		$this.find('.ui-slider-handle:first')
			.append('<div class="value">' + Number(_default[0]).formatMoney(2, ',', '.') + '</div>');
		$this.find('.ui-slider-handle:last')
				.append('<div class="value">' + Number(_default[1]).formatMoney(2, ',', '.') + '</div>');
	});


	$('.tabs').each(function () {
		var $tabs = $(this);

		$tabs.find('.tab-header a').on('click', function (e) {
			e.preventDefault();

			var $this = $(this);
			var tab = $this.data('tab');

			$this.siblings('a').removeClass('selected');
			$this.addClass('selected');

			$tabs.find('.tab-content .tab').removeClass('visible');
			$tabs.find('.tab-content .tab.tab-' + tab).addClass('visible');
		});
	});

	$('input.text').on('change blur', function () {
		var $this = $(this);

		if ($this.val()) {
			$this.addClass('not-empty');
		} else {
			$this.removeClass('not-empty');
		}
	}).each(function () {
		var $this = $(this);

		if ($this.val()) {
			$this.addClass('not-empty');
		}
	});

	$('.go-to-top').on('click', function (e) {
		e.preventDefault();

		$('html,body').animate({ scrollTop: 0 }, 'slow');
	});

	$('a.menu').on('click', function (e) {
		e.preventDefault();

		var $menu = $('.menu-container');

		$menu.addClass('show-first');

		setTimeout(function () {
			$menu.addClass('visible');
		}, 10)
	});

	$('.menu-container .close-link').on('click', function (e) {
		e.preventDefault();

		var $menu = $(e.currentTarget).closest('.menu-container');

		$menu.removeClass('visible');

		setTimeout(function () {
			$menu.removeClass('show-first');
		}, 250);
	});

	$('header.main .top a.search').on('click', function (e) {
		e.preventDefault();

		var $search = $('.search-container');

		$search.addClass('show-first');

		setTimeout(function () {
			$search.addClass('visible');
		}, 10)
	});

	$('.search-container .close-link').on('click', function (e) {
		e.preventDefault();

		var $search = $(e.currentTarget).closest('.search-container');

		$search.removeClass('visible');

		setTimeout(function () {
			$search.removeClass('show-first');
		}, 250);
	});

	$('.language-switch h4').on('click', function (e) {
		e.preventDefault();

		$(e.currentTarget).closest('.language-switch').toggleClass('visible');
	});

	$('article.listing-car figure').each(function () {
		new MbeSlider({
			element: this,
			direction: 'horizontal',
			neverSkip: true,
			autoSlide: false
		});
	});

	$('form.search select').select2();

	$('.scroll-to').on('click', function (e) {
		e.preventDefault();

		var $this = $(e.currentTarget),
			navigateTo = $this.data('element'),
			top = $(navigateTo).offset().top;

		$('html,body').animate({
			scrollTop: top
		}, 'slow');
	});

	if ($('.car-single .top figure ul').size() > 0) {
		var singleSlider = new MbeSlider({
			element: '.car-single .top figure ul',
			direction: 'horizontal',
			neverSkip: true,
			autoSlide: false,
			afterSlide: function (index, slide) {
				var $imageList = $('.car-single .image-list ul li');
				$imageList.removeClass('selected');
				$imageList.eq(index - 1).addClass('selected');
			}
		});
	}

	$('.car-single .image-list ul li a').on('click', function (e) {
		e.preventDefault();

		var $li = $(e.currentTarget).closest('li'),
			index = $li.index();

		$li.siblings('li').removeClass('selected');
		$li.addClass('selected');

		singleSlider.gotoSlide(index + 1, 0);
	});

	$('.page-faq ul li h2 a').on('click', function (e) {
		e.preventDefault();

		var $li = $(e.currentTarget).closest('li');

		$li.siblings('li').removeClass('open');
		$li.toggleClass('open');
	});

	$('.search-cars .title a.right').on('click', function (e) {
		e.preventDefault();

		var $submenu = $(e.currentTarget).siblings('.submenu');

		$submenu.toggleClass('visible');
	});

	$('.search ul.car-types li a').on('click', function (e) {
		e.preventDefault();

		var $this = $(e.currentTarget),
			$li = $this.closest('li'),
			$form = $this.closest('form'),
			type = $this.data('type');

		$li.siblings('li').removeClass('selected');
		$li.addClass('selected');

		$form.find('.search-type').val(type);
	});
});
