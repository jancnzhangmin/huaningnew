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

var mySearchbar = $$('.searchbar')[0].f7Searchbar;








mySearchbar.disable();





$$('.accordion-item').on('opened', function () {
    myApp.alert('Accordion item opened');
});

$$('.accordion-item').on('closed', function (e) {
    myApp.alert('Accordion item closed');
});







$(document).ready(function(){

    var t=0;



    $('#searchtext').focus(function(){
        $('#searchdiv').removeClass("myhide");
        $('#searchdiv').addClass("myshow");
    });


    $('#searchtext').blur(function(){
        $('#searchdiv').removeClass("myshow");
        $('#searchdiv').addClass("myhide");
    });









});



myApp.onPageInit('index',function(page){

    mainView.router.refreshPage();
    var mySwiper = myApp.swiper('.swiper-container', {
        pagination:'.swiper-pagination',
        spaceBetween: 100, // 100px between slides
        loop:true,
        autoplay: 6000,
        speed: 600
    });

    $$('.open-info').on('click', function () {
        myApp.pickerModal('.picker-info')
    });



    var mySearchbar = $$('.searchbar')[0].f7Searchbar;
    mySearchbar.disable();






    var mySearchbar = myApp.searchbar('.searchbar', {
        searchList: '.list-block-search',
        searchIn: '.item-title'
    });

    mySearchbar.enable('.searchbar',function(){

        var itemHTML = '<li class="item-content"><div class="item-inner"><div class="item-title">ccc'+'</div></div></li>';
        var ptrContent = $$('.list-block-search');
        ptrContent.find('ul').append(itemHTML);

    });


    $$('.accordion-item').on('opened', function () {
        myApp.alert('Accordion item opened');
    });

    $$('.accordion-item').on('closed', function (e) {
        myApp.alert('Accordion item closed');
    });









});









myApp.onPageInit('contentindex',function(page){




    var keyword = $('#kwd').val();






    mainView.router.refreshPage();
    var ptrContent = $$('.pull-to-refresh-content');
    //myApp.destroyPullToRefresh(ptrContent);









    ptrContent.on('refresh', function (e) {



        // 模拟2s的加载过程
        setTimeout(function () {
            // 随机图片
            $('#idindex').val(999999999);

            $.ajax({
                type:"get",
                url:"/showcontents/jsonindex?keyword="+keyword+"&idindex="+$('#idindex').val(),
                dataType:"json",
                success:function(data){


                    $('ul').empty();


                    $.each(data, function(i, item) {


                        var itemHTML = '<li>'+
                            '<a href=/showcontents/' +item.id +'  class="item-link item-content">'+
                            '<div class="item-media">';

                        if(item.contentimedia_content_type!=null  ) {
                            if(item.contentimedia_content_type.indexOf("video")) {
                                itemHTML += '<img src = /contentimedia/' + item.id + '/' + item.contentimedia_file_name + ' width= "70px">';
                            }else
                            {
                                itemHTML += '<img src= "playerlogo.png" width= "70px" >';
                            }
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
                        ptrContent.find('ul').append(itemHTML);
$('#idindex').val(item.id);

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










    var loading = false;



    // 注册'infinite'事件处理函数
    $$('.infinite-scroll').on('infinite', function () {


        if (loading) return;

        // 设置flag
        loading = true;
        // 模拟1s的加载过程
        setTimeout(function () {
            // 重置加载flag

            loading = false;

            $.ajax({
                type:"get",
                url:"/showcontents/jsonindex?keyword="+keyword+"&idindex="+$('#idindex').val(),
                dataType:"json",
                success:function(data){

                    //$('ul').empty();


                    $.each(data, function(i, item) {


                        var itemHTML = '<li>'+
                            '<a href=/showcontents/' +item.id +'  class="item-link item-content">'+
                            '<div class="item-media">';

                        if(item.contentimedia_content_type!=null  ) {
                            if(item.contentimedia_content_type.indexOf("video")) {
                                itemHTML += '<img src = /contentimedia/' + item.id + '/' + item.contentimedia_file_name + ' width= "70px">';
                            }
                            else
                            {
                                itemHTML += '<img src= "playerlogo.png" width= "70px" >';
                            }
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
                        ptrContent.find('ul').append(itemHTML);
                        $('#idindex').val(item.id);

                        //alert(item.title);
                    });
                },
                error:function(){
                    alert("error");
                }
            });





        }, 1000);
    });











});

// Generate dynamic page
myApp.onPageInit('showcontent',function(page){





// Add view









    mainView.router.refreshPage();

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



$$('.open-info').on('click', function () {
    myApp.pickerModal('.picker-info')
});






