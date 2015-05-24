(function ($, FastClick) {

    var init = {

        /**
         * Init all the JS in the block of html `element`
         *
         * @param DOMElement element
         *
         * @return void
         */
        element: function (element) {
            //init fast click
            FastClick.attach(element);

            //init the stuff
            this.initRangeSliders(element);
            this.initSelect2(element);
            this.initTextbox(element);
            this.initTabs(element);
            this.initCarSliders(element);
            this.initSearchTypes(element);
            this.initSearchMoreLess(element);
            this.initSearchFormAction(element);
            this.initSearchSubmenu(element);
            this.initWizardFormValidation(element);
            this.initSectionScroll(element);
            this.initScrollTo(element);
        },

        /**
         * Init all the range sliders in the element
         *
         * @param DOMElement element
         *
         * @return void
         */
        initRangeSliders: function (element) {

            $('.slider-range', element).each(function () {
                var $this = $(this),
                    max = $this.data('max'),
                    min = $this.data('min'),
                    _default = $this.data('default').split('-'),
                    type = $this.data('type') || 'moveable',
                    sufix = $this.data('sufix');

                $this.slider({
                    range: true,
                    min: min,
                    max: max,
                    values: _default,
                    slide: function (event, ui) {

                        var min = ui.values[0].formatMoney(2, ',', '.', sufix);
                        var max = ui.values[1].formatMoney(2, ',', '.', sufix);

                        $this.find('.ui-slider-handle:first .value').html(min);
                        $this.find('.ui-slider-handle:last .value').html(max);

                        $this.siblings('.slider-value').val(ui.values.join('-'));
                    }
                });

                $this
                    .append('<div class="slider-value-min">' + min.formatMoney(2, ',', '.', sufix) + '</div>')
                    .append('<div class="slider-value-max">' + max.formatMoney(2, ',', '.', sufix) + '</div>');

                $this.find('.ui-slider-handle:first')
                    .append('<div class="value">' + Number(_default[0]).formatMoney(2, ',', '.') + '</div>');
                $this.find('.ui-slider-handle:last')
                        .append('<div class="value">' + Number(_default[1]).formatMoney(2, ',', '.', sufix) + '</div>');
            });
        },

        /**
         * Init all the select2 in the element
         *
         * @param DOMElement element
         *
         * @return void
         */
        initSelect2: function (element) {
            $('form.search select', element).select2();
        },

        /**
         * Init all the text boxes in the element
         *
         * @param DOMElement element
         *
         * @return void
         */
        initTextbox: function (element) {
            $('input.text', element).on('change blur', function () {
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
        },

        /**
         * Init all the tabs in the element
         *
         * @param DOMElement element
         *
         * @return void
         */
        initTabs: function (element) {
            $('.tabs', element).each(function () {
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
        },

        /**
         * Init all the car photo sliders in the element
         *
         * @param DOMElement element
         *
         * @return void
         */
        initCarSliders: function (element) {
            $('article.listing-car figure', element).each(function () {
                new MbeSlider({
                    element: this,
                    direction: 'horizontal',
                    neverSkip: true,
                    autoSlide: false
                });
            });
        },

        /**
         * Init all the search more/less link
         *
         * @param DOMElement element
         *
         * @return void
         */
        initSearchMoreLess: function (element) {
            $('.search .more, .search .less', element).on('click', function (e) {
                e.preventDefault();

                var $this = $(e.currentTarget),
                    $form = $this.closest('form');

                $this.parent().children().toggle();
                $form.toggleClass('advanced-open');
            });
        },

        /**
         * Init all the search types (clickable icons) in the element
         *
         * @param DOMElement element
         *
         * @return void
         */
        initSearchTypes: function (element) {
            $('.search ul.car-types li a', element).on('click', function (e) {
                e.preventDefault();

                var $this = $(e.currentTarget),
                    $li = $this.closest('li'),
                    $form = $this.closest('form'),
                    type = $this.data('type');

                $li.siblings('li').removeClass('selected');

                if ($li.hasClass('selected')) {
                    $li.removeClass('selected');
                    $form.find('.search-type').val('');
                } else {
                    $li.addClass('selected');
                    $form.find('.search-type').val(type);
                }
            });
        },

        /**
         * Init all the search forms submits in the element
         *
         * @param DOMElement element
         *
         * @return void
         */
        initSearchFormAction: function (element) {

            $('form.search select[name="q[brand]"]', element).on('change', function (e) {
                var $this = $(e.currentTarget),
                    $form = $this.closest('form'),
                    $models = $form.find('select[name="q[model]"]');

                $.ajax({
                    dataType: 'json',
                    type: 'post',
                    url: $this.data('models-url'),
                    data: {
                        'brand': $this.val()
                    },
                    success: function (response) {
                        $models.select2('destroy');
                        $models.empty();

                        $models.append('<option value="">Selecteer Model</option>');

                        if (response.length) {
                            $.each(response, function (index, element) {
                                $models.append('<option value="' + element.name + '">' + element.name + '</option>');
                            });
                        }

                        $models.select2();
                    }
                });
            });
        },

        /**
         * Init all the search submenus (filter click) in the element
         *
         * @param DOMElement element
         *
         * @return void
         */
        initSearchSubmenu: function (element) {

            $('.title a.right', element).on('click', function (e) {
                e.preventDefault();

                var $submenu = $(e.currentTarget).siblings('.submenu');

                $submenu.toggleClass('visible');
            });
        },

        /**
         * Init the validation in the form
         *
         * @param DOMElement element
         *
         * @return void
         */
        initWizardFormValidation: function (element) {

            $('.payment-form input[type="text"], .payment-form input[type="email"]', element).on('change keyup keydown', function (e) {

                var $this = $(e.currentTarget),
                    value = $this.val(),
                    $p = $this.closest('p'),
                    rules = $p.data('rules') ? $p.data('rules').split('|') : [],
                    ok = true;

                $.each(rules, function (index, element) {
                    if (!helpers.validate(element, value)) {
                        ok = false;
                    }
                });

                $p
                    .removeClass('ok error')
                    .addClass(ok ? 'ok' : 'error')
            });
        },

        /**
         * Init the click on the arrow in the section
         *
         * @param DOMElement element
         *
         * @return void
         */
        initSectionScroll: function (element) {

            //scroll to element
            $('section .footer > .icon', element).on('click', function (e) {
                e.preventDefault();

                var $this = $(e.currentTarget),
                    $section = $this.closest('body > *');

                helpers.scrollTo($section.next());
            });
        },

        /**
         * Init all the scroll to and scroll to top elements in the element
         *
         * @param DOMElement element
         *
         * @return void
         */
        initScrollTo: function (element) {

            //scroll to element
            $('.scroll-to', element).on('click', function (e) {
                e.preventDefault();

                var $this = $(e.currentTarget);

                helpers.scrollTo($this.data('element'));
            });

            //scroll to top
            $('.go-to-top', element).on('click', function (e) {
                e.preventDefault();

                helpers.scrollTo(0);
            });
        }

    };

    var helpers = {

        /**
         * Scroll the page to an element
         *
         * @param string element
         *
         * @return void
         */
        scrollTo: function (element) {
            var top;

            if (element === 0) {
                //scroll to  top
                top = 0;
            } else {
                //navigate
                top = $(element).offset().top;
            }

            $('html,body').animate({
                scrollTop: top
            }, 'slow');

        },

        /**
         * Validate the value with the rule
         *
         * @param string rule
         * @param string value
         *
         * @return boolean
         */
        validate: function (rule, value) {

            switch (rule) {
                case 'required':
                    return (value.trim().length > 0);
                    break;

                case 'email':
                    return /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i.test(value);
                    break;

                case 'numeric':
                    return /^[0-9 \.,]+$/i.test(value);
                    break;

                case 'phone':
                    return /^[0-9 \(\)\+]+$/i.test(value);
                    break;

                case 'alphanumeric':
                    return /^[a-z0-9\- \.,]+$/i.test(value);
                    break;
            }

            return true;
        }
    };


    var app = {

        /**
         * Called when everything is ready
         *
         * @return void
         */
        ready: function () {

            //init header
            this.header.menu();
            this.header.search();
            this.header.languageSwitch();

            //init the javascript for the body
            init.element(document.body);

            //wizard
            this.wizard.ready();

            //car single
            this.carSingle.ready();

            //faq page
            this.faq.ready();
        },

        header: {

            /**
             * Init the header menu
             *
             * @return void
             */
            menu: function () {
                //show the menu
                $('a.menu').on('click', function (e) {
                    e.preventDefault();

                    var $menu = $('.menu-container');

                    $menu.addClass('show-first');

                    setTimeout(function () {
                        $menu.addClass('visible');
                    }, 10)
                });

                //close the menu
                $('.menu-container .close-link').on('click', function (e) {
                    e.preventDefault();

                    var $menu = $(e.currentTarget).closest('.menu-container');

                    $menu.removeClass('visible');

                    setTimeout(function () {
                        $menu.removeClass('show-first');
                    }, 250);
                });
            },

            /**
             * Init the header searh
             *
             * @return void
             */
            search: function () {
                //show the search
                $('header.main .top a.search').on('click', function (e) {
                    e.preventDefault();

                    var $search = $('.search-container');

                    $search.addClass('show-first');

                    setTimeout(function () {
                        $search.addClass('visible');
                    }, 10)
                });

                //close the search
                $('.search-container .close-link').on('click', function (e) {
                    e.preventDefault();

                    var $search = $(e.currentTarget).closest('.search-container');

                    $search.removeClass('visible');

                    setTimeout(function () {
                        $search.removeClass('show-first');
                    }, 250);
                });
            },

            /**
             * Init the language switch
             *
             * @return void
             */
            languageSwitch: function () {
                $('.language-switch h4').on('click', function (e) {
                    e.preventDefault();

                    $(e.currentTarget).closest('.language-switch').toggleClass('visible');
                });
            }
        }, //header

        carSingle: {

            /**
             * Init the car single page
             *
             * @return void
             */
            ready: function () {
                this.slider();
            },

            /**
             * Init the car single page slider and the gallery
             *
             * @return void
             */
            slider: function () {

                if ($('.car-single .top figure ul').size() > 0) {
                    //slider
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

                    //small gallery
                    $('.car-single .image-list ul li a').on('click', function (e) {
                        e.preventDefault();

                        var $li = $(e.currentTarget).closest('li'),
                            index = $li.index();

                        $li.siblings('li').removeClass('selected');
                        $li.addClass('selected');

                        singleSlider.gotoSlide(index + 1, 0);
                    });
                }
            } //slider
        }, //carSingle

        faq: {

            /**
             * Init the faq page
             *
             * @return void
             */
            ready: function () {
                this.questions();
            },

            /**
             * Init the faq questions click
             *
             * @return void
             */
            questions: function () {
                $('.page-faq ul li h2 a').on('click', function (e) {
                    e.preventDefault();

                    var $li = $(e.currentTarget).closest('li');

                    $li.siblings('li').removeClass('open');
                    $li.toggleClass('open');
                });
            } //question
        }, //faq

        wizard: {

            /**
             * Initialize the wizard
             *
             * @return void
             */
            ready: function () {

                this.firstStep();
            },

            /**
             * Initialize the first step
             *
             * @return void
             */
            firstStep: function () {
                //click
                $('.wizard .first-step').on('click', function (e) {
                    e.preventDefault();

                    var $this = $(e.currentTarget),
                        $sliderContainer = $this.closest('.slider-container'),
                        $slider = $sliderContainer.find('.slider-range'),
                        nextStepUrl = $this.data('next-step');

                    //remove next steps
                    $('.wizard .wizard-cars').remove();
                    $('.wizard .wizard-form').remove();
                    $('.wizard .wizard-final').remove();

                    //fade the button
                    $this.addClass('inactive');

                    $.ajax({
                        type: 'post',
                        url: nextStepUrl,
                        data: {
                            'min': $slider.slider('values', 0),
                            'max': $slider.slider('values', 1),
                            'total_value_slider': !!$('#price_slider_indicator').length
                        },
                        success: function (response) {

                            //done
                            $this.removeClass('inactive');

                            //append next step
                            $('.wizard').append(response);

                            //init the stuff
                            init.element($('.wizard .wizard-cars'));
                            helpers.scrollTo('.wizard .wizard-cars');

                            //run the next steps init
                            this.secondStep();
                            this.thirdStep();
                        }.bind(this)
                    });
                }.bind(this));
            },

            /**
             * Initialize the second step search form shown and attach submit
             * event
             *
             * @return void
             */
            secondStep: function () {

                //submit
                $('.wizard .wizard-cars form.search').on('submit', function (e) {
                    e.preventDefault();

                    var $this = $(e.currentTarget);

                    //remove next steps
                    $('.wizard .wizard-cars .search-results').empty();
                    $('.wizard .wizard-form').remove();
                    $('.wizard .wizard-final').remove();

                    //fade the button
                    $this.find('.btn').addClass('inactive');

                    $.ajax({
                        type: $this.attr('method'),
                        url: $this.attr('action'),
                        data: $this.serialize(),
                        success: function (response) {

                            //done
                            $this.find('.btn').removeClass('inactive');

                            //append next step
                            $('.wizard .wizard-cars .search-results').append(response);

                            //init the stuff
                            init.element($('.wizard .wizard-cars .search-results'));

                            helpers.scrollTo('.wizard .wizard-cars .search-results');

                            //run the next step init
                            this.thirdStep();
                        }.bind(this),
                        error: function (response) {

                            //done
                            $this.find('.btn').removeClass('inactive');

                            //nothing happenned
                            alert('An error occurred');
                        }.bind(this)
                    });
                }.bind(this));
            },

            /**
             * Initialize the third step, attach click to selected car
             *
             * @return void
             */
            thirdStep: function () {

                //click
                $('.wizard .wizard-cars .search-results article.listing-car .goto a').on('click', function (e) {
                    e.preventDefault();

                    var $this = $(e.currentTarget),
                        carId = $this.data('id'),
                        nextStepUrl = $this.data('select-url');

                    //remove next steps
                    $('.wizard .wizard-form').remove();
                    $('.wizard .wizard-final').remove();

                    //fade the button
                    $this.addClass('inactive');

                    $.ajax({
                        type: 'post',
                        url: nextStepUrl,
                        data: {
                            'id': carId
                        },
                        success: function (response) {

                            //done
                            $this.removeClass('inactive');

                            //append next step
                            $('.wizard').append(response);

                            //init the stuff
                            init.element($('.wizard .wizard-form'));
                            helpers.scrollTo('.wizard .wizard-form');

                            //run the next step init
                            this.fourthStep();
                        }.bind(this)
                    });
                }.bind(this));

                //click on filter
                $('.wizard .wizard-cars .search-results .title .submenu a').on('click', function (e) {
                    e.preventDefault();

                    var $this = $(e.currentTarget),
                        $wizard = $this.closest('.wizard-cars'),
                        $cars = $wizard.find('ul.cars li'),
                        field = $this.data('field'),
                        order = $this.data('order');

                    $cars.detach().sort(function (a, b) {
                        var $a = $(order == 'asc' ? a : b),
                            $b = $(order == 'asc' ? b : a);

                        if ($a.data(field) < $b.data(field)) {
                            return -1;
                        }

                        if ($a.data(field) > $b.data(field)) {
                            return 1;
                        }

                        return 0;

                    });

                    $this.closest('.submenu').removeClass('visible');
                    $wizard.find('ul.cars').append($cars);

                }.bind(this));
            },

            /**
             * Initialize the fourth step, attach submit to the last form
             *
             * @return void
             */
            fourthStep: function () {

                //submit
                $('.wizard .wizard-form form').on('submit', function (e) {
                    e.preventDefault();

                    var $this = $(e.currentTarget);

                    //remove next steps
                    $('.wizard .wizard-final').remove();

                    //fade the button
                    $this.find('.btn').addClass('inactive');

                    $.ajax({
                        type: $this.attr('method'),
                        url: $this.attr('action'),
                        data: $this.serialize(),
                        success: function (response) {

                            //done
                            $this.find('.btn').removeClass('inactive');

                            //append next step
                            $('.wizard').append(response);

                            //init the stuff
                            init.element($('.wizard .wizard-final'));
                            helpers.scrollTo('.wizard .wizard-final');

                            //this.thirdStep();
                        }.bind(this)
                    });
                }.bind(this));
            }
        }

    };

    $(app.ready.bind(app));

}(jQuery, FastClick));
