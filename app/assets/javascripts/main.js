$(document).ready(function() {

    var main_slider = $("#slider_action_banners").lightSlider({
        auto: true,
        pause: 8000,
        loop: true,
        item: 1
    });

    var sub_slider = $(".article_slider").owlCarousel({
        items: 3,
        loop: true,
        autoplay: true,
        autoPlaySpeed: 500,
        autoPlayTimeout: 300,
        autoplayHoverPause: true,
        responsive: {
            0: {
                items: 1,
                slideBy: 1
            },
            640: {
                items: 2,
                slideBy: 2,
                autoPlay: true
            },
            1024: {
                items: 3,
                slideBy: 3
            }
        }
        //item: 3,
        //pager: false,
        //auto: false,
        //pause: 1500,
        ////loop: true,
        //responsive : [
        //    {
        //        breakpoint: 1024,
        //        settings: {
        //            item: 2,
        //            auto: true
        //        }
        //    },
        //    {
        //        breakpoint: 640,
        //        settings: {
        //            item: 1
        //        }
        //    }
        //]
    });

    main_slider.onSliderLoad(function() {
        sub_slider.afterInit();
    });

    $('.owl_carousel_zekerheden').owlCarousel({
        nav: true,
        dots: true,
        navText: [' ', ' '],
        slideBy: 4,
        items: 2,
        responsive: {
            0: {
                items: 1,
                slideBy: 1
            },
            700: {
                items: 2,
                slideBy: 2
            },
            1040: {
                items: 3,
                slideBy: 3
            },
            1281: {
                items: 4
            }
        }
    });
});

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
        if (element.style) {
            FastClick.attach(element);
        }

        $('nav.pagination a').on('click', function () {
            $('nav.pagination').fadeTo('slow', 0.3);
        });

        //init the stuff
        this.initRangeSliders(element);
        this.initSelect2(element);
        this.initTextbox(element);
        this.initTabs(element);
        this.initCarSliders(element);
        this.initCarListing(element);
        this.initSearchTypes(element);
        this.initSearchMoreLess(element);
        this.initSearchFormAction(element);
        this.initSearchSubmenu(element);
        this.initWizardFormValidation(element);
        this.initSectionScroll(element);
        this.initScrollTo(element);
        this.initLazyLoading(element);
        this.initMenu(element);
    },

    initLazyLoading: function (element) {
        $("img.car_listing", element).lazyload({
            effect: "fadeIn",
            failure_limit: 500
        });
    },

    initMenu: function (element) {
        $('.left_menu a.arrow', element).click(function (e) {
            e.preventDefault();

            $('.menu').toggleClass('visible');
            $('.left_menu .arrow').toggleClass('twisted');
        });
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
                spacing = parseInt($this.data('spacing')),
                _default = $this.data('default').split('-'),
                type = $this.data('type') || 'moveable',
                sufix = $this.data('sufix');

            $this.slider({
                range: true,
                min: min,
                max: max,
                values: _default,
                slide: function (event, ui) {

                    if ((ui.values[0] + spacing) > ui.values[1]) {
                        return false;
                    }

                    var min = ui.values[0].formatMoney(2, ',', '.', sufix);
                    var max = ui.values[1].formatMoney(2, ',', '.', sufix);

                    $this.find('.ui-slider-handle:first .value').html(min);
                    $this.find('.ui-slider-handle:last .value').html(max);

                    $this.siblings('.slider-value').val(ui.values.join('-'));

                },

                change: function (event, ui) {

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
        $('form.search select, .model_brand_container select', element).select2();
        $('form.search select, .model_brand_container select', element).on('select2:select', function(e) {
            if ($(this).val()) {
                $(this).next('span.select2').addClass('select2-selected');
            } else {
                $(this).next('span.select2').removeClass('select2-selected');
            }

        });
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
            var $tabs = $(this),
                $article = $tabs.closest('article.listing-car');

            $tabs.find('.tab-header a').on('click', function (e) {
                e.preventDefault();

                var $this = $(this),
                    tab = $this.data('tab');

                $this.siblings('a').removeClass('selected');
                $this.addClass('selected');

                $tabs.find('.tab-content .tab').removeClass('visible');
                $tabs.find('.tab-content .tab.tab-' + tab).addClass('visible');

                if ($article.size() > 0) {
                    var href = $article.find('.goto a').data('href-' + tab);
                    $article.find('.goto a').attr('href', href);
                }
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
     * Init the car listing in the element
     *
     * @param DOMElement element
     *
     * @return void
     */
    initCarListing: function (element) {
        app.carListing.sameHeight(element);
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

        $('select[name="q[brand]"]', element).on('change', function (e) {
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

                    $models.append('<option value="">Selecteer model</option>');

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
        $('section .footer > .icon, .scroll_down', element).on('click', function (e) {
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
    },

    fullscreen: {

        /**
         * Attach the events to the body
         *
         * @return void
         */
        attachEvents: function () {
            $(document).on('fullscreenchange webkitfullscreenchange mozfullscreenchange MSFullscreenChange', function () {

                var $html = $('html');

                if ($html.hasClass('fullscreen')) {
                    $html.removeClass('fullscreen');
                } else {
                    $html.addClass('fullscreen');
                }

                if (window.singleSlider) {
                    window.singleSlider.resize();
                }

            }.bind(this));
        },

        /**
         * Open the fullscreen window
         *
         * @return void
         */
        open: function () {
            var element = document.documentElement;

            if ('ontouchstart' in window) {
                var $html = $('html');
                $html.addClass('fullscreen');

                if (window.singleSlider) {
                    window.singleSlider.resize();
                }
                return;
            }

            if (element.requestFullscreen) {
                element.requestFullscreen();
            } else if (element.mozRequestFullScreen) {
                element.mozRequestFullScreen();
            } else if (element.webkitRequestFullscreen) {
                element.webkitRequestFullscreen();
            } else if (element.msRequestFullscreen) {
                element.msRequestFullscreen();
            }
        },

        /**
         * Return wether or not it is fullscreen
         *
         * @return void
         */
        is: function () {
            return $('html').hasClass('fullscreen');
        },

        /**
         * Close the fullscreen window (back to normal)
         *
         * @return void
         */
        close: function () {

            if ('ontouchstart' in window) {
                var $html = $('html');
                $html.removeClass('fullscreen');

                if (window.singleSlider) {
                    window.singleSlider.resize();
                }
                return;
            }

            if (document.exitFullscreen) {
                document.exitFullscreen();
            } else if (document.mozCancelFullScreen) {
                document.mozCancelFullScreen();
            } else if (document.webkitExitFullscreen) {
                document.webkitExitFullscreen();
            }
        }
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

        //reviews page
        this.reviews.ready();

        //resize
        this.resize();
    },

    /**
     * Called when everything is loaded
     *
     * @return void
     */
    load: function () {

        this.resize();
    },

    /**
     * Called when the user scrolls
     *
     * @return void
     */
    scroll: function () {

        var $body = $('body'),
            $html = $('html'),
            scrollTop = $body.scrollTop() || $html.scrollTop();

        if (scrollTop > 300) {
            $body.find('.go-to-top').fadeIn();
        } else {
            $body.find('.go-to-top').fadeOut();
        }
    },

    /**
     * Called on startup, resize and load
     *
     * @return void
     */
    resize: function () {

        //set the car as the same height
        this.carListing.sameHeight(document.body);
    },

    carListing: {

        /**
         * Set the cars as the same height (per row)
         *
         * @param DOMElement element
         *
         * @return void
         */
        sameHeight: function (element) {
            var windowWidth = $(window).width(),
                perRow = (windowWidth > 1280 ? 4 : (windowWidth > 768 ? 3 : (windowWidth > 640 ? 2 : 1)));
            filter = (perRow > 1 ? ':nth-child(' + perRow + 'n+1)' : '');

            $('ul.cars li' + filter, element).each(function (index, element) {
                var $this = $(element),
                    $elements = $this.find('h1'),
                    maxHeight = 0;

                //first we set the elements array;
                switch (perRow) {
                    case 4:
                        $elements = $elements.add($this.next().next().next().find('h1'));
                    case 3:
                        $elements = $elements.add($this.next().next().find('h1'));
                    case 2:
                        $elements = $elements.add($this.next().find('h1'));
                        break;
                }

                //first we set the height auto to the row
                $elements.css('height', 'auto');

                //if there is only one per row then return
                if (perRow == 1) return;

                //get the max height
                $elements.each(function (index, element) {
                    var $this = $(element);

                    if ($this.height() > maxHeight) {
                        maxHeight = $this.height();
                    }
                });

                //set the max height
                $elements.height(maxHeight);
            });
        }
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
                    $('html').addClass('noscroll');
                }, 10)
            });

            //close the menu
            $('.menu-container .close-link').on('click', function (e) {
                e.preventDefault();

                var $menu = $(e.currentTarget).closest('.menu-container');

                $menu.removeClass('visible');
                $('html').removeClass('noscroll');

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
            $('header.main .bottom li.search a').on('click', function (e) {
                e.preventDefault();

                var $search = $('.search-container');

                $search.addClass('show-first');

                setTimeout(function () {
                    $search.addClass('visible');
                    $('html').addClass('noscroll');
                }, 10)
            });

            //close the search
            $('.search-container .close-link').on('click', function (e) {
                e.preventDefault();

                var $search = $(e.currentTarget).closest('.search-container');

                $search.removeClass('visible');
                $('html').removeClass('noscroll');

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

            $('.language-switch ul li a').on('click', function (e) {
                e.preventDefault();

                var $this = $(e.currentTarget),
                    $switch = $this.closest('.language-switch'),

                    lang = $this.data('lang'),
                    $select = $('.goog-te-combo:first');

                if (!$select.size()) {
                    console.error("Could not find Google select.");
                    return;
                }

                $switch.find('h4').text($this.text());
                $switch.find('h4').attr('data-lang', lang);
                $switch.find('ul li a').removeClass('selected');
                $this.addClass('selected');

                $select.val(lang);

                if (document.createEventObject) {
                    var evt = document.createEventObject();
                    $select.get(0).fireEvent('onchange', evt);
                } else {
                    var evt = document.createEvent("HTMLEvents");
                    evt.initEvent('change', false, true);
                    !$select.get(0).dispatchEvent(evt);
                }

                $(e.currentTarget).closest('.language-switch').removeClass('visible');
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

            this.printButton();

            this.share();
        },

        /**
         * Attach the share click thing
         *
         * @return void
         */
        share: function () {
            $('.car-single .links .share .dots > a').on('click', function (e) {
                e.preventDefault();

                $(this).siblings('.share-networks').toggleClass('visible');
            });
        },

        /**
         * Attach the print event to the button
         *
         * @return void
         */
        printButton: function () {
            $('.car-single .links .share a.print').on('click', function (e) {
                e.preventDefault();

                window.print();
            });
        },

        /**
         * Init the car single page slider and the gallery
         *
         * @return void
         */
        slider: function () {

            if ($('.car-single .top figure ul').size() > 0) {
                //slider
                var currentSlide = 1;


                window.singleSlider = new MbeSlider({
                    element: '.car-single .top figure ul',
                    direction: 'horizontal',
                    neverSkip: true,
                    autoSlide: false,
                    afterSlide: function (index, slide) {
                        var $wrapper = $('.car-single .image-list .wrapper'),
                            $ul = $wrapper.find('ul'),
                            $imageList = $ul.find('li'),
                            left = 0;

                        $imageList.removeClass('selected');
                        $imageList.eq(index - 1).addClass('selected');

                        if (currentSlide != index) {
                            //scroll to element
                            left = $imageList.eq(index - 1).position().left + $ul.scrollLeft() - $wrapper.width() / 2;

                            $ul.animate({
                                scrollLeft: left
                            }, 'slow');
                        }

                        $('.car-single .top figure .bar .photos strong').text(index);

                        currentSlide = index;
                    },
                    navigation: {
                        drag: true,
                        type: false,
                        className: 'mbe-slider-navigation',
                        arrows: false,
                        clickable: true,
                        keys: true
                    }
                });

                //small gallery
                $('.car-single .image-list ul li a').on('click', function (e) {
                    e.preventDefault();

                    var $li = $(e.currentTarget).closest('li'),
                        index = $li.index();

                    $li.siblings('li').removeClass('selected');
                    $li.addClass('selected');

                    window.singleSlider.gotoSlide(index + 1, 0);
                });

                //arrows
                $('.car-single .top figure .bar .arrows a.arrow-left').on('click', function (e) {
                    e.preventDefault();

                    window.singleSlider.gotoPreviousSlide();
                });
                $('.car-single .top figure .bar .arrows a.arrow-right').on('click', function (e) {
                    e.preventDefault();

                    window.singleSlider.gotoNextSlide();
                });

                //fullscreen
                $('.car-single .top figure .bar a.fullscreen').on('click', function (e) {
                    e.preventDefault();

                    if (helpers.fullscreen.is()) {
                        helpers.fullscreen.close();
                    } else {
                        helpers.fullscreen.open();
                    }
                });

                //attach fullscreen events
                helpers.fullscreen.attachEvents();
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

    reviews: {

        /**
         * Init the reviews page
         *
         * @return void
         */
        ready: function () {
            this.formStarsInput();
        },

        /**
         * Init the reviews stars input
         *
         * @return void
         */
        formStarsInput: function () {
            //mouse enter
            $('.stars-input .icon').on('mouseenter', function (e) {
                var $element = $(e.currentTarget),
                    $this = $element.parent(),
                    stars = $element.index() + 1;

                $this.children().each(function (index, element) {
                    var $element = $(element);
                    $element.removeClass('star-empty-big star-full-big')

                    if (index < stars) {
                        $element.addClass('star-full-big');
                    } else {
                        $element.addClass('star-empty-big');
                    }
                });
            });

            //click
            $('.stars-input .icon').on('click', function (e) {
                var $element = $(e.currentTarget),
                    $this = $element.parent(),
                    stars = $element.index() + 1;

                $this.data('stars', stars);
                $this.siblings('input#reference-stars-input').val(stars);
            });

            //touch
            $('.stars-input').on('touchstart', function (e) {
                e.preventDefault();

                var $this = $(e.currentTarget),
                    $element = $(e.target),
                    stars = $element.index() + 1;

                $this.children().each(function (index, element) {
                    var $element = $(element);
                    $element.removeClass('star-empty-big star-full-big')

                    if (index < stars) {
                        $element.addClass('star-full-big');
                    } else {
                        $element.addClass('star-empty-big');
                    }
                });
            });

            //mouse leave
            $('.stars-input').on('mouseleave', function (e) {
                var $this = $(e.currentTarget),
                    stars = $this.data('stars');

                $this.children().each(function (index, element) {
                    var $element = $(element);
                    $element.removeClass('star-empty-big star-full-big')

                    if (index < stars) {
                        $element.addClass('star-full-big');
                    } else {
                        $element.addClass('star-empty-big');
                    }
                });
            });
        } //question
    }, //reviews

    wizard: {

        /**
         * Initialize the wizard
         *
         * @return void
         */
        ready: function () {

            this.homepage();
            this.firstStep();
            this.prefill();
        },

        /**
         * Prefill the form with the values coming from the url
         *
         * @return void
         */
        prefill: function () {
            if ($('.wizard').size() <= 0) {
                return;
            }

            var hash = window.location.hash.substring(1);

            //values
            if (/^values\/+/i.test(hash)) {
                var sliderValues = hash.split('values/')[1].split('-');

                if (sliderValues.length == 2) {
                    $('.wizard .slider-range').slider('option', 'values', sliderValues);

                    $('.wizard .first-step').click();
                }
            }

            //car
            if (/^car\/+/i.test(hash)) {
                var carId = Number(hash.split('car/')[1]),
                    nextStepUrl = $('.wizard .private-financing').data('car-url');

                this.getCarForm(false, carId, nextStepUrl);
            }
        },

        /**
         * What to do when on the homepage
         *
         * @return void
         */
        homepage: function () {

            $('.private-financing.on-homepage .first-step').on('click', function (e) {

                var $this = $(e.currentTarget),
                    $sliderContainer = $this.closest('.slider-container'),
                    $slider = $sliderContainer.find('.slider-range'),
                    $brand = $('.on-homepage #q_brand'),
                    $model = $('.on-homepage #q_model'),
                    href = $this.attr('href') + '?brand=' + $brand.val() + '&model=' + $model.val();

                //fade the button
                $this.addClass('inactive');

                //add the hashtag
                $this.attr('href', href + '#values/' + $slider.slider('values', 0) + '-' + $slider.slider('values', 1));
            }.bind(this));

        },

        /**
         * Fetch the car form
         *
         * @param Object $button
         * @param Number carId
         * @param string nextStepUrl
         *
         * @return void
         */
        getCarForm: function ($button, carId, nextStepUrl) {

            var wizardType = $('.wizard .slider-container input[name="wizard_type"]').val();

            //remove next steps
            $('.wizard .wizard-form').remove();
            $('.wizard .wizard-final').remove();

            //fade the button
            if ($button) {
                $button.addClass('inactive');
            }

            $.ajax({
                type: 'post',
                url: nextStepUrl,
                data: {
                    'id': carId,
                    'wizard_type': wizardType
                },
                success: function (response) {

                    //done
                    if ($button) {
                        $button.removeClass('inactive');
                    }

                    //append next step
                    $('.wizard').append(response);

                    //init the stuff
                    init.element($('.wizard .wizard-form'));
                    helpers.scrollTo('.wizard .wizard-form');

                    //run the next step init
                    this.fourthStep();
                }.bind(this)
            });
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

                window.ga('send', 'event', 'Wizard', 'Started', $('input[name="wizard_type"]').val());

                $.ajax({
                    type: 'post',
                    url: nextStepUrl,
                    data: {
                        'min': $slider.slider('values', 0),
                        'max': $slider.slider('values', 1),
                        'total_value_slider': !!$('#price_slider_indicator').length,
                        'wizard_type': $('input[name="wizard_type"]').val(),
                        'brand': $('input[name="brand"]').val(),
                        'model': $('input[name="model"]').val()
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

                this.getCarForm($this, carId, nextStepUrl);
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

                if (navigator.userAgent.indexOf("Safari") > -1) {
                    if (!e.target.checkValidity()) {
                        alert('The form you submitted is not valid. Please check all the fields and try again.');
                        return;
                    }
                }

                var $this = $(e.currentTarget);

                window.ga('send', 'event', 'Wizard', 'Completed', $('select[name="request_type"]', $this).val());

                //remove next steps
                $('.wizard .wizard-final').remove();

                //fade the button
                $this.find('.btn').addClass('inactive');

                $.ajax({
                    type: $this.attr('method'),
                    url: $this.attr('action'),
                    data: $('*:visible, input[type="hidden"]', $this).serialize(),
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

$(document).on('ready', app.ready.bind(app));
$(window).on('resize', app.resize.bind(app));
$(window).on('load', app.load.bind(app));
$(window).on('scroll', app.scroll);

