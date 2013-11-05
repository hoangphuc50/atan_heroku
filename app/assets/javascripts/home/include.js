jQuery(function($){
    
    /* ================ 960GS NESTED COLUMN MARGINS ================ */

    $('*[class*="grid_"] > :last-child').not('.grid_3, .grid_2, .grid_1').each(function(){
        if($(this).hasClass('clear')){
            if($(this).prev('*[class*="grid_"]')){
                $(this).parent('*[class*="grid_"]').css('margin-bottom', 0);
            }
        }else if($(this).is('*[class*="grid_"]')){
            $(this).parent('*[class*="grid_"]').css('margin-bottom', 0);
        }
    });     
    
    
    /* ================ MAIN NAVIGATION ================ */
	
    function piMainmenu(){
        $(" #nav ul ").css({
            display: "none"
        }); // Opera Fix
        $(" #nav li").hover(function(){
            $(this).find('ul:first').css({
                visibility: "visible",
                display: "none"
            }).slideDown(250);
        },function(){
            $(this).find('ul:first').css({
                visibility: "hidden"
            });
        });
    }
    
    function piSelectMenu(){
        $('#nav-responsive').on('change', function() {
            window.location = $(this).val();
        }); 
    }
	
    /* ================ CONTENT TABS ================ */
    
    (function() {
        $('.tabs').each(function(){
            var $tabLis = $(this).find('li');            
            var $tabContent = $(this).next('.tab-content-wrap').find('.tab-content');
            
            $tabContent.hide();
            $tabLis.first().addClass('active').show();
            $tabContent.first().show();
        });
        

        $('.tabs').on('click', 'li', function(e) {
            var $this = $(this);
            var parentUL = $this.parent();
            var tabContent = parentUL.next('.tab-content-wrap');

            parentUL.children().removeClass('active');
            $this.addClass('active');
                
            tabContent.find('.tab-content').hide();
            var showById = $( $this.find('a').attr('href') );
            tabContent.find(showById).fadeIn();            

            e.preventDefault();
        });                  
    })();
    
    /* ================ ACCORDION ================ */
    (function(){
        $('.accordion').on('click', '.title', function(event) {
            event.preventDefault();
            $(this).closest('.accordion').find('.active').next().slideUp('normal');
            $(this).closest('.accordion').find('.title').removeClass("active");        
            if($(this).next().is(':hidden') == true) {
                $(this).next().slideDown('normal');
                $(this).addClass("active");
            }
        });
        $('.accordion .content').hide();
        $('.accordion .active').next().slideDown('normal');
    })(); 

        
    $(document).ready(function(){					
        piMainmenu();
        piSelectMenu();

        /* ================ INSTAGRAM FEED ================ */
        $('.instagram-feed').socialstream({
            socialnetwork: 'flickr',
            limit: 6,
            username: 'Mrky1',
            overlay: true
        })
        
        /* ================ PLACEHOLDER PLUGIN ================ */
        $('input[placeholder], textarea[placeholder]').placeholder();
        
        
        /* ================ TOP BAR ANIMATION ================ */
        (function(){
            if(readCookie('wpPocketTopBarClosed') == 'true' || PiIncludeScriptParam.topbar == '0'){
                $('.top-bar').hide();
                $('.top-bar-wrapper').css({
                    height: '3px'                
                });
            }
        
            $('.top-bar').on('click', '.close-frame', function(e){
                e.preventDefault();
                $(this).closest('.top-bar').slideUp();
                $(this).closest('.top-bar-wrapper').animate({
                    height: '3px'
                });
                // setting cookie value to 14 days
                createCookie('wpPocketTopBarClosed', 'true', 1209600);
            });
        })();
        
    });
    
    /* ================ STATIC HEADER ================ */
    
    var window_y;
    var header_height;
    var scroll_position;
    
    (function(){        
        window_y = 0;
        header_height = $("#header").height() + 0;
        scroll_position = parseInt(header_height + header_height/2);   	
        window_y = $(window).scrollTop();        
        if ( (window_y > scroll_position) && !(is_touch_device())) 
            set_static_header();
        
    })(window_y, header_height, scroll_position);
	
    function set_static_header(){
        var window_y = $(window).scrollTop();
        if (window_y > scroll_position) {
            if (!($("#header").hasClass("static"))){
                $("#header").hide();
                if($('body').hasClass('homepage')){
                    $('.rev_slider_wrapper').css("margin-top", header_height + "px");
                }else{
                    $(".page-title").eq(0).css("margin-top", header_height + "px");
                }
                if($('body').hasClass('admin-bar')){
                    var adminBar = $('#wpadminbar').height();                            
                }else{
                    adminBar = 0;
                }
                $("#header").addClass("static").css("top", adminBar);
                $("#header").fadeIn(500);
            }
				
        } else {
            if (($("#header").hasClass("static"))){
                $("#header").fadeOut(500, function(){
                    $("#header").removeClass("static");
                    if($('body').hasClass('homepage')){
                        $('.rev_slider_wrapper').css("margin-top", "");
                    }else{
                        $(".page-title").eq(0).css("margin-top", "");
                    }  
                    $("#header").css("top", 0).fadeIn(300);
                });
            }
        }
    }
	
    $(window).scroll(function(){
        if (!(is_touch_device()) && PiIncludeScriptParam.staticmenu == '1') 
            set_static_header();
    });
    
});


function createCookie(name,value,days) {
    if (days) {
        var date = new Date();
        date.setTime(date.getTime()+(days*24*60*60*1000));
        var expires = "; expires="+date.toGMTString();
    }
    else expires = "";
    document.cookie = name+"="+value+expires+"; path=/";
}

function readCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for(var i=0;i < ca.length;i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1,c.length);
        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
    }
    return null;
}

function eraseCookie(name) {
    createCookie(name,"",-1);
}

/* Check if current device is touch device */

function is_touch_device() {
    return !!('ontouchstart' in window) // works on most browsers 
    || !!(window.navigator.msMaxTouchPoints); // works on ie10
};

