// Initialize your app
var myApp = new Framework7(
    {
        pushState: true,
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


//searchlist();









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






    var ptrContent = $$('.pull-to-refresh-content');
    //myApp.destroyPullToRefresh(ptrContent);
    ptrContent.on('refresh', function (e) {
        // 模拟2s的加载过程
        setTimeout(function () {
            // 随机图片
            $('#idindex').val(999999999);
            $.ajax({
                type:"get",
                url:"/sliders/jsonindex?idindex="+$('#idindex').val(),
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
                url:"/sliders/jsonindex?idindex="+$('#idindex').val(),
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



function searchlist(){



    //var t = '<li class="item-content">'+
    //    '<div ><div class="item-title">'+
    //    '<a href=/showcontents/' + 15 +' class="item-link item-content" data-no-turbolink = "true">'+
    //    'ccc' +
    //    '</a>'+
    //    '</div></div>'+
    //    '</li>';
    //var ptrContent = $$('.list-block-search');
    //ptrContent.find('ul').append(t);



    var loading = false;
    $('.page[data-page="index"] input[type="search"]').keydown(function(){


        //var itemHTML = '<li class="item-content"><div class="item-inner"><div class="item-title">ccc'+'</div></div></li>';
        if (loading) return;

        // 设置flag
        loading = true;
        setTimeout(function () {
            loading=false;
        $.ajax({
            type:"get",
            url:"/showcontents/search?searchkey="+$('.page[data-page="index"] input[type="search"]').val(),
            dataType:"json",
            success:function(data){


                $('ul').empty();


                $.each(data, function(i, item) {


                    var itemHTML = '<li class="item-content">'+
                        '<div ><div class="item-title">'+
                        '<a href=/showcontents/' + item.id +' class="item-link item-content" data-no-turbolink = "true">'+
                        item.title +
                        '</a>'+
                        '</div></div>'+
                        '</li>';



                    // 前插新列表元素
                    var ptrContent = $$('.list-block-search');
                    ptrContent.find('ul').append(itemHTML);

                    //alert(item.title);
                });
            },
            error:function(){

            }
        });
            //myApp.pullToRefreshDone();
            //mainView.router.refreshPage();
        }, 2000);




    });

    $('.page[data-page="index"] input[type="search"]').blur(function(){


        var ptrContent = $$('.list-block-search');
        var myul =ptrContent.find('ul');
        $('ul').empty();
    });
   // $('ul').empty();
}



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



    //var mySearchbar = $$('.searchbar')[0].f7Searchbar;
    //mySearchbar.disable();
    //mySearchbar.clear();
















//searchlist();












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
//////
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


//src="http://v3.jiathis.com/code/jia.js";


// Add view

$('#smt').click(function(){

    setTimeout(function () {
        // 重置加载flag
uu="/contents/"+$('#content_id').val()+"/comments/createnew?summary="+$('#summary').val()+'&user_id='+$('#user_id').val()+'&content_id='+$('#content_id').val()+'&isshow='+$('#isshow').val();

        $.ajax({
            type:"post",
            url:"/contents/"+$('#content_id').val()+"/comments/createnew?summary="+$('#summary').val()+'&user_id='+$('#user_id').val()+'&content_id='+$('#content_id').val()+'&isshow='+$('#isshow').val(),
            dataType:"json",
            success:function(data){

                //$('ul').empty();
                mainView.router.loadPage('/contents/'+$('#content_id').val()+'/comments');


                    //alert(item.title);

            },
            error:function(){
                //alert(uu);
            }
        });





    }, 1000);
return false;

});



    $$('.create-picker').on('click', function () {


        <!-- JiaThis Button BEGIN -->




        // Check first, if we already have opened picker
        if ($$('.picker-modal.modal-in').length > 0) {
            myApp.closeModal('.picker-modal.modal-in');
        }
        myApp.pickerModal(
            '<div class="picker-modal" style="background-color: #ffffff;">' +
            '<div class="toolbar">' +
            '<div class="toolbar-inner">' +
            '<div class="left"></div>' +
            '<div class="right"><a href="#" class="close-picker"><i class="fa fa-angle-down"></i></a></div>' +
            '</div>' +
            '</div>' +
            '<div class="picker-modal-inner">' +
            '<div class="content-block">' +
                <!-- JiaThis Button BEGIN -->
            '<div class="jiathis_style_32x32">'+
        '<a class="jiathis_button_qzone"></a>'+

        '<a class="jiathis_button_tqq"></a>'+
        '<a class="jiathis_button_weixin"></a>'+


        '<a class="jiathis_counter_style"></a>'+
        '</div>'+
        '<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>'+





            '</div>' +
            '</div>' +
            '</div>'
        )
    });

    <!-- JiaThis Button BEGIN -->


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



myApp.onPageInit('login',function(page){




    $('#submit').click(function(){

        setTimeout(function () {
            $.ajax({
                type: "get",
                url: "/logins/getuser?login=" + $('#login').val() + "&password=" + $('#password').val(),
                dataType: "json",
                success: function (data) {
                    var flag=true;
                    $.each(data, function(i, item) {

                      if(item) {
                          flag =false;
                          mainView.router.refreshPreviousPage();
                          //mainView.router.back('/');
                          location.href='/';
                      }
                    });
                    if (flag){
                        myApp.alert('用户名或密码错误！','');
                    }








                },
                error:function(){

                }
            });
        },2000);
    });

});


myApp.onPageInit('search',function(page){
    $('.list-block').hide();
    $('.page[data-page="search"] input[type="search"]').keyup(function() {

        if ($('.page[data-page="search"] input[type="search"]').val()=="")
        {
$('.list-block').hide();
        }else
        {
            $('.list-block').show();
        }

    });



});

myApp.onPageInit('showusers',function(page){

$(document).ready(function(){

    function isPhoneNo(phone) {
        var reg =  /^1[34578]\d{9}$/;
        return reg.test(phone);
    }

    // 判断手机号码
    var str = '';

    $('#smt').click(function(){
    if ($.trim($('#phone').val()).length == 0) {
        myApp.alert("请输入正确的手机号码",'');
        $('#phone').focus();
        return false;
    } else {
        if(isPhoneNo($.trim($('#phone').val()) == false)) {
            myApp.alert("请输入正确的手机号码",'');
            $('#phone').focus();
            return false;
        }
    }
    });


});



});
