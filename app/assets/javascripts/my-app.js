// Initialize your app
var myApp = new Framework7();

// Export selectors engine
var $$ = Dom7;

// Add view
var mainView = myApp.addView('.view-main', {
    // Because we use fixed-through navbar we can enable dynamic navbar
    dynamicNavbar: true
});

// Callbacks to run specific code for specific pages, for example for About page:



myApp.onPageInit('index',function(page){

    mainView.router.refreshPage();
    var mySwiper = myApp.swiper('.swiper-container', {
        pagination:'.swiper-pagination',
        spaceBetween: 100, // 100px between slides
        loop:true,
        autoplay: 6000,
        speed: 600
    });
});

myApp.onPageInit('contentindex',function(page){

    mainView.router.refreshPage();
});

// Generate dynamic page
myApp.onPageInit('showcontent',function(page){

    $(document).ready(function(){
    $("#jquery_jplayer_1").jPlayer({
        ready: function () {
            $(this).jPlayer("setMedia", {
                title: "Big Buck Bunny",
                m4v:$('#mp4url').val()


            });
        },
        swfPath: "jplayer",
        supplied: "ogv, m4v",
        size: {
            width: "100%",
            height: "200px"
        },
        useStateClassSkin: true,
        autoBlur: false,
        smoothPlayBar: true,
        keyEnabled: true,
        remainingDuration: true,
        toggleDuration: true
    });

    });
});



var mySwiper = myApp.swiper('.swiper-container', {
    pagination:'.swiper-pagination',
    spaceBetween: 100, // 100px between slides
    loop:true,
    autoplay: 6000,
    speed: 600
});






