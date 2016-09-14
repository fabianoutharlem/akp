$(document).ready(function () {

    var main_slider = $('#slider_action_banners').bxSlider({
        controls: false,
        infiniteLoop: true,
        auto: true,
        pager: true,
        pause: 6000,
        autoHover: true
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