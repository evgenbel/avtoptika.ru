$(document).ready(function() {
    $(".phonemask").inputmask("+7(999) 999 99 99");
    $(".phonemask1").inputmask("(999) 999 99 99");
	
	$('.DarkBg').on('click', function(){
		if($('#info_block').css('display') == 'block')
			$('#info_block').hide();
	});
	
	$(window).scroll(function () {
            if ($(this).scrollTop() > $("#header").scrollTop()+$("#header").height()) {
                $(".top_line").show();
            }else {
                $(".top_line").hide();
            }
        });
        if ($(this).scrollTop() > $("#header").scrollTop()+$("#header").height()) {
            $(".top_line").show();
        }else {
            $(".top_line").hide();
        }
        // Устанавливаем дату окончания акции
    // setLastDate();
/*var not_unload=false;
$("a").click(function(){
not_unload=true;
});
window.onbeforeunload=function()
	                    {				
	                   if (!not_unload){
					$(".model_list img").click();
					return ' ';
				}
	                    }*/


    $("a.fancybox").fancybox({
        'transitionIn'	: 'none',
        'transitionOut'	: 'none',
        'type'		: 'iframe'
    });
    
    /*$('#top_block .slider ul').bxSlider({
        auto: true,
        speed: 700,
        pause: 6000,
        controls: true,
        pager: false
    });*/
    $('ul li:last-child').addClass('last');
    // Скрываем placeholder при получении фокуса ввода
    $('ul.form_list li input, ul.form_list li textarea, div.request-form input, div.request-form textarea').each(function(){
        $(this).focus(function(){
            $(this).attr('placeholder','');
        });
        $(this).blur(function(){
            $(this).attr('placeholder',$(this).attr('default'));
        });
    });
    /*
     $('input[type=text]').each(function() {
     var default_value = this.value;
     $(this).focus(function(){
     if(this.value == default_value) this.value = '';
     });
     $(this).blur(function(){
     if(this.value == '') this.value = default_value;
     });
     });*/
    $('.advantage_list li').each(function() {
        var height_el = $(this).find('span').height() + $(this).find('p').height() + 5;
        var margin_t = ($(this).height() - height_el)/2;	
        $(this).find('span').css('margin-top',margin_t);
    });
    $('#bottom_block .slider ul').bxSlider({
        auto: true,
        speed: 1000,
        minSlides: 3,
        maxSlides: 3,
        slideWidth: 147,
        slideMargin: 40,
        controls: true,
        pager: false
    });
});


/**
 * Установить дату окончания акции в пределах трех дней.
 * Для работы с DOM используется mootools.
 */
var setLastDate = function() {
    var month = [
    "января",
    "февраля",
    "марта",
    "апреля",
    "мая",
    "июня",
    "июля",
    "августа",
    "сентября",
    "октября",
    "ноября",
    "декабря"
    ];
    var date = new Date();
    date.setDate(date.getDate() + date.getDate() % 3);
    $($('#plus .li_2 .month')).html(month[date.getMonth()]);
    $($('#plus .li_2 .number')[0]).html(date.getDate()/10>>0);
    $($('#plus .li_2 .number')[1]).html(date.getDate()%10);
}
var sendedinfo = false;
function sendinfo_(){
    if (sendedinfo) return;
    var name=$("div.p_model_list").find('input.name').val();
    var phone=$("div.p_model_list").find('input.phone_number').inputmask('unmaskedvalue');
    var txt=$("div.p_model_list").find('textarea.comment').val();
	var underline = new RegExp('_');
	
    setCookie("username", name, {expires:24*60*60*365});
    setCookie("userphone", phone, {expires:24*60*60*365});

	/*if(underline.test(phone)){
		alert('Не полный номер телефона!');
		return false;
	}*/
	
    if(!name) {
        alert('Введите имя!');
        return false;
    }
    if(!phone) {
        alert('Введите телефон!');
        return false;
    }
    if(phone.length<10){
        alert('Введите сотовый телефон! Длина номера должна быть не менее 10 цифр');
        return false;
    }
    var calltouch = false;
    jQuery.ajax({
        type:"POST",
        url:"/index.php?route=common/home/callTouch",
        data: "name="+name+"&phone="+phone+"&txt="+txt+"&sessionId="+window.call_value,
        async:false,
        dataType:"json",
        success:function(html) {
            calltouch = true;
        }
    });
    if (!calltouch){
        alert('Ошибка отправки данных. Попробуйте еще раз позднее.');
        return false;
    }

    sendedinfo = true;
    jQuery.ajax({
        type:"POST",
        url:"/index.php?route=common/home/ajaxmail",
        data: "name="+name+"&phone="+phone+'&vin='+$("div.p_model_list").find('input.brend').val()+'&txt='+txt,
        async:true,
        success:function(html) {
            try {
                var obj = JSON.parse(html);
		    $("div.p_model_list").find('input.name').val('');
	    	$("div.p_model_list").find('input.phone_number').val('');
    
                if(obj.status=="ok") {
                    reachGoalSite("ORDER");                                        
                } else {
                    throw obj.descr;
                }
		if ($("div.Popup.p_model_list .successShow").length){		    
		    $("div.Popup.p_model_list .successHide").hide();
		    $("div.Popup.p_model_list .successShow").show();
		    $("div.DarkBg").show();
		    $("div.Popup.p_model_list").show();
		    $("div.Popup.p_model_list").css("top",50);
		} else {
		    alert(obj.descr);
		}
            } catch(e) {
                alert("Ошибка: "+e);
            } finally {
            }
        }
    });
}

function saveEmail(){		
		jQuery.ajax({
			url: 'index.php?route=common/home/saveEmail',
			type: 'post',
			data: 'email=' + $('#bottom_email').val(),
			async:true,
			success: function(html) {
				if(typeof(html) != 'undefined'){
					$('#save_email').remove();
					$('#bottom_email').remove();
					$('.bottom_email').append(html.success);
					$('.bottom_email').hide();
					$('#expander1').css('bottom', '1px');
					$('#expander1').html('<span style="font-size:20px;">Вы подписаны.</span>');
				}
			}
		});	
}

function toggleInfo(){		
	$('#info_block').toggle();
	$("div.DarkBg").toggle();
	$("body").scrollTop( 0 ); 
}

function sendinfo(el){
    if (sendedinfo) return;
    var name=$(el).parent().children('.form_list').children('li').children('.username').val();
    var phone=$(el).parent().children('.form_list').children('li').children('.userphone').inputmask('unmaskedvalue');
    var vin=$(el).parent().children('.form_list').children('li').children('.uservin').val();
    var txt=$(el).parent().children('.form_list').children('li').children('.usertxt').val();
	var underline = new RegExp('_');
	
    setCookie("username", name, {expires:24*60*60*365});
    setCookie("userphone", phone, {expires:24*60*60*365});
    setCookie("uservin", vin, {expires:24*60*60*365});

	/*if(underline.test(phone)){
		alert('Не полный номер телефона!');
		return false;
	}*/
	
    if(!name) {
        alert('Введите имя!');
        return false;
    }
    if(!phone) {
        alert('Введите телефон!');
        return false;
    }
    if(phone.length<10){
        alert('Введите сотовый телефон! Длина номера должна быть не менее 10 цифр');
        return false;
    }
    var calltouch = false;
    jQuery.ajax({
        type:"POST",
        url:"/index.php?route=common/home/callTouch",
        data: "name="+name+"&phone="+phone+"&txt="+txt+"&sessionId="+window.call_value,
        async:false,
        dataType:"json",
        success:function(html) {
            calltouch = true;
        }
    });
    if (!calltouch){
        alert('Ошибка отправки данных. Попробуйте еще раз позднее.');
        return false;
    }
    sendedinfo = true;
    jQuery.ajax({
        type:"POST",
        url:"/index.php?route=common/home/ajaxmail",
        data: "name="+name+"&vin="+vin+"&phone="+phone+"&txt="+txt,
        async:true,
        success:function(html) {
            try {
                var obj = JSON.parse(html);
                //$(el).parent().children('.form_list').children('li').children('.username').val('');
                //$(el).parent().children('.form_list').children('li').children('.userphone').val('');
                //$(el).parent().children('.form_list').children('li').children('.uservin').val('');
                //$(el).parent().children('.form_list').children('li').children('.usertxt').val('');

                if(obj.status=="ok") {
                    reachGoalSite("ORDER");
                    location = '/index.php?route=common/home/thanks';
                    return;
                    if ($("div.Popup.p_model_list .successShow").length){
                        $("div.Popup.p_model_list .successHide").hide();
                        $("div.Popup.p_model_list .successShow").show();
                        $("div.DarkBg").show();
                        $("div.Popup.p_model_list").show();
                        $("div.Popup.p_model_list").css("top",50);
                    } else {
                        alert(obj.descr);
                    }
                } else {
                    throw obj.description;
                }
            } catch(e) {
                alert("Ошибка: "+e);
            } finally {
            }
        }
    });
}

function sendinfoThanks(el){
    if (sendedinfo) return;
    var name=$(el).parent().children('.form_list').children('li').children('.username').val();
    var phone=$(el).parent().children('.form_list').children('li').children('.userphone').inputmask('unmaskedvalue');
    var vin=$(el).parent().children('.form_list').children('li').children('.uservin').val();
    var txt=$(el).parent().children('.form_list').children('li').children('.usertxt').val(), utm_source = $("#utm_source").val(), utm_campaign = $("#utm_campaign").val(), referer = $("#referer").val();
	var underline = new RegExp('_');
	
	/*if(underline.test(phone)){
		alert('Не полный номер телефона!');
		return false;
	}*/

    setCookie("username", name, {expires:24*60*60*365});
    setCookie("userphone", phone, {expires:24*60*60*365});
    setCookie("uservin", vin, {expires:24*60*60*365});

    if(!name) {
        alert('Введите имя!');
        return false;
    }
    if(!phone) {
        alert('Введите телефон!');
        return false;
    }
    if(phone.length<10){
        alert('Введите сотовый телефон! Длина номера должна быть не менее 10 цифр');
        return false;
    }

    var calltouch = false;
	jQuery.ajax({
        type:"POST",
        url:"/index.php?route=common/home/callTouch",
        data: "name="+name+"&vin="+vin+"&phone="+phone+"&txt="+txt+"&sessionId="+window.call_value,
        async:false,
        dataType:"json",
        success:function(html) {
            if (html.success)
                calltouch = true;
        }
    });

    if (!calltouch){
        alert('Ошибка отправки данных. Попробуйте еще раз позднее.');
        return false;
    }
    sendedinfo = true;
    jQuery.ajax({
        type:"POST",
        url:"/index.php?route=common/home/ajaxmail",
        data: "name="+name+"&vin="+vin+"&phone="+phone+"&txt="+txt+'&utm_source='+utm_source+'&utm_campaign='+utm_campaign+'&referer='+referer,
        async:true,
        success:function(html) {
            try {
                var obj = JSON.parse(html);
                //$(el).parent().children('.form_list').children('li').children('.username').val('');
                //$(el).parent().children('.form_list').children('li').children('.userphone').val('');
                //$(el).parent().children('.form_list').children('li').children('.uservin').val('');
                //$(el).parent().children('.form_list').children('li').children('.usertxt').val('');
		
                if(obj.status=="ok") {
                    reachGoalSite("ORDER");
                    location = '/index.php?route=common/home/thanks';
                    return;
                    if ($("div.Popup.p_model_list .successShow").length){
                        $("div.Popup.p_model_list .successHide").hide();
                        $("div.Popup.p_model_list .successShow").show();
                        $("div.DarkBg").show();
                        $("div.Popup.p_model_list").show();
                        $("div.Popup.p_model_list").css("top",50);
                    } else {
                        alert(obj.descr);
                    }
                } else {
                    throw obj.description;
                }
            } catch(e) {
                alert("Ошибка: "+html);
            } finally {
            }
        }
    });
}

function sendinfoThanks_(){
    if (sendedinfo) return;
    var name=$("div.p_model_list").find('input.name').val();
    var phone=$("div.p_model_list").find('input.phone_number').inputmask('unmaskedvalue');
    var txt=$("div.p_model_list").find('textarea.comment').val();
	var underline = new RegExp('_'), utm_source = $("#utm_source").val(), utm_campaign = $("#utm_campaign").val(), referer = $("#referer").val();	
	
	
    setCookie("username", name, {expires:24*60*60*365});
    setCookie("userphone", phone, {expires:24*60*60*365});

	/*if(underline.test(phone)){
		alert('Не полный номер телефона!');
		return false;
	}*/
	
    if(!name) {
        alert('Введите имя!');
        return false;
    }
    if(!phone) {
        alert('Введите телефон!');
        return false;
    }
    if(phone.length<10){
        alert('Введите сотовый телефон! Длина номера должна быть не менее 10 цифр');
        return false;
    }
    var calltouch = false;
	jQuery.ajax({
        type:"POST",
        url:"/index.php?route=common/home/callTouch",
        data: "name="+name+"&phone="+phone+"&txt="+txt+"&sessionId="+window.call_value,
        async:false,
        dataType:"json",
        success:function(html) {
            calltouch = true;
        }
    });
    if (!calltouch){
        alert('Ошибка отправки данных. Попробуйте еще раз позднее.');
        return false;
    }

    sendedinfo = true;
    jQuery.ajax({
        type:"POST",
        url:"/index.php?route=common/home/ajaxmail",
        data: "name="+name+"&phone="+phone+'&vin='+$("div.p_model_list").find('input.brend').val()+'&txt='+txt+'&utm_source='+utm_source+'&utm_campaign='+utm_campaign+'&referer='+referer,
        async:true,
        success:function(html) {
            try {
                var obj = JSON.parse(html);
                $("div.p_model_list").find('input.name').val('');
                $("div.p_model_list").find('input.phone_number').val('');

                if(obj.status=="ok") {
                    reachGoalSite("ORDER");
                    location = '/index.php?route=common/home/thanks';
                    return;
                } else {
                    throw obj.descr;
                }
                if ($("div.Popup.p_model_list .successShow").length){
                    $("div.Popup.p_model_list .successHide").hide();
                    $("div.Popup.p_model_list .successShow").show();
                    $("div.DarkBg").show();
                    $("div.Popup.p_model_list").show();
                    $("div.Popup.p_model_list").css("top",50);
                } else {
                    alert(obj.descr);
                }
            } catch(e) {
                alert("Ошибка: "+e);
            } finally {
            }
        }
    });
}


function sendinfo1(el){
    if (sendedinfo) return;
    var name=$(el).parent().parent().find('.username').val();
    var phone=$(el).parent().parent().find('.userphone').inputmask('unmaskedvalue');
    var vin=$(el).parent().parent().find('.uservin').val();
    var txt=$(el).parent().parent().find('.usertxt').val();
	var underline = new RegExp('_');
	
    setCookie("username", name, {expires:24*60*60*365});
    setCookie("userphone", phone, {expires:24*60*60*365});
    setCookie("uservin", vin, {expires:24*60*60*365});

	/*if(underline.test(phone)){
		alert('Не полный номер телефона!');
		return false;
	}*/
	
    if(!name) {
        alert('Введите имя!');
        return false;
    }
    if(!phone) {
        alert('Введите телефон!');
        return false;
    }
    if(phone.length<10){
        alert('Введите сотовый телефон! Длина номера должна быть не менее 10 цифр');
        return false;
    }

    var calltouch = false;
    jQuery.ajax({
        type:"POST",
        url:"/index.php?route=common/home/callTouch",
        data: "name="+name+"&vin="+vin+"&phone="+phone+"&txt="+txt+"&sessionId="+window.call_value,
        async:false,
        dataType:"json",
        success:function(html) {
            if (html.success)
                calltouch = true;
        }
    });

    if (!calltouch){
        alert('Ошибка отправки данных. Попробуйте еще раз позднее.');
        return false;
    }

    sendedinfo = true;
    jQuery.ajax({
        type:"POST",
        url:"/index.php?route=common/home/ajaxmail",
        data: "name="+name+"&vin="+vin+"&phone="+phone+"&txt="+txt,
        async:true,
        success:function(html) {
            try {
                var obj = JSON.parse(html);
                //$(el).parent().children('.form_list').children('li').children('.username').val('');
                //$(el).parent().children('.form_list').children('li').children('.userphone').val('');
                //$(el).parent().children('.form_list').children('li').children('.uservin').val('');
                //$(el).parent().children('.form_list').children('li').children('.usertxt').val('');

                if(obj.status=="ok") {
                    reachGoalSite("ORDER");
                    location = '/index.php?route=common/home/thanks';
                    return;
                    if ($("div.Popup.p_model_list .successShow").length){
                        $("div.Popup.p_model_list .successHide").hide();
                        $("div.Popup.p_model_list .successShow").show();
                        $("div.DarkBg").show();
                        $("div.Popup.p_model_list").show();
                        $("div.Popup.p_model_list").css("top",50);
                    } else {
                        alert(obj.descr);
                    }
                } else {
                    throw obj.description;
                }
            } catch(e) {
                alert("Ошибка: "+e);
            } finally {
            }
        }
    });
}

// возвращает cookie если есть или undefined
function getCookie(name) {
    var matches = document.cookie.match(new RegExp(
        "(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
    ))
    return matches ? decodeURIComponent(matches[1]) : undefined
}

// уcтанавливает cookie
function setCookie(name, value, props) {
    props = props || {}
    var exp = props.expires
    if (typeof exp == "number" && exp) {
        var d = new Date()
        d.setTime(d.getTime() + exp*1000)
        exp = props.expires = d
    }
    if(exp && exp.toUTCString) { props.expires = exp.toUTCString() }

    value = encodeURIComponent(value)
    var updatedCookie = name + "=" + value
    for(var propName in props){
        updatedCookie += "; " + propName
        var propValue = props[propName]
        if(propValue !== true){ updatedCookie += "=" + propValue }
    }
    document.cookie = updatedCookie

}

// удаляет cookie
function deleteCookie(name) {
    setCookie(name, null, { expires: -1 })
}



Share = {
    vkontakte: function(purl, ptitle, pimg, text) {
        url  = 'http://vkontakte.ru/share.php?';
        url += 'url='          + encodeURIComponent(purl);
        url += '&title='       + encodeURIComponent(ptitle);
        url += '&description=' + encodeURIComponent(text);
        url += '&image='       + encodeURIComponent(pimg);
        url += '&noparse=true';
        Share.popup(url);
    },
    odnoklassniki: function(purl, text) {
        url  = 'http://www.odnoklassniki.ru/dk?st.cmd=addShare&st.s=1';
        url += '&st.comments=' + encodeURIComponent(text);
        url += '&st._surl='    + encodeURIComponent(purl);
        Share.popup(url);
    },
    facebook: function(purl, ptitle, pimg, text) {
        url  = 'http://www.facebook.com/sharer.php?s=100';
        url += '&p[title]='     + encodeURIComponent(ptitle);
        url += '&p[summary]='   + encodeURIComponent(text);
        url += '&p[url]='       + encodeURIComponent(purl);
        url += '&p[images][0]=' + encodeURIComponent(pimg);
        Share.popup(url);
    },
    twitter: function(purl, ptitle) {
        url  = 'http://twitter.com/share?';
        url += 'text='      + encodeURIComponent(ptitle);
        url += '&url='      + encodeURIComponent(purl);
        url += '&counturl=' + encodeURIComponent(purl);
        Share.popup(url);
    },
    mailru: function(purl, ptitle, pimg, text) {
        url  = 'http://connect.mail.ru/share?';
        url += 'url='          + encodeURIComponent(purl);
        url += '&title='       + encodeURIComponent(ptitle);
        url += '&description=' + encodeURIComponent(text);
        url += '&imageurl='    + encodeURIComponent(pimg);
        Share.popup(url)
    },
    
            me : function(el){
console.log(el.href);                
                Share.popup(el.href);
                return false;                
            },

    popup: function(url) {
        window.open(url,'','toolbar=0,status=0,width=626,height=436');
    }
};
