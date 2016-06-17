// Initialize your app
var myApp = new Framework7(
    {
        scrollTopOnNavbarClick:true
    }
);

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
    var ptrContent = $$('.pull-to-refresh-content');
    //myApp.destroyPullToRefresh(ptrContent);









    ptrContent.on('refresh', function (e) {



        // 模拟2s的加载过程
        setTimeout(function () {
            // 随机图片


            $.ajax({
                type:"get",
                url:"/showcontents/jsonindex?keyword=express",
                dataType:"json",
                success:function(data){

                    //$('ul').empty();


                    $.each(data, function(i, item) {


                        var itemHTML = '<li>'+
                            '<a href=/showcontents/' +item.id +'  class="item-link item-content">'+
                            '<div class="item-media">';

                        if(item.contentimedia_content_type!=null && item.contentimedia_content_type.indexOf("image") ) {
                            itemHTML +='<img src = /contentimedia/' + item.contentimedia_file_name + ' width= "70px">' ;
                        }
                        else {
                            itemHTML += '<img src= "playerlogo.png" width= "70px" >';
                        }
                        itemHTML+='</div>'+
                            '<div class="item-inner">'+
                            '<div class="item-title-row">'+
                            '<div class="item-title">'+item.title+'</div>'+
                            '</div>'+
                            '<div class="item-text">'+item.summary+'</div>'+
                            '</div>'+
                            '</a>'+
                            '</li>';



                        // 前插新列表元素
                        ptrContent.find('ul').prepend(itemHTML);


                        //alert(item.title);
                    });
                },
                error:function(){
                    alert("error");
                }
            });



            // 列表元素的HTML字符串

            // 加载完毕需要重置
            myApp.pullToRefreshDone();
        }, 2000);

    });










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






