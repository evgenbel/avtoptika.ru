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

var sendedinfo = false;
function sendinfoThanks(el){
    if (sendedinfo) {
        alert('Ваша заявка уже отправлена');
        return;
    }
    var form = $(el).closest(".form_order");

    var name=form.find('.username').val();
    var phone=form.find('.userphone').val();
    var vin=form.find('.uservin').val();

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
    sendedinfo = true;
    $.ajax({
        type:"POST",
        url:"/index.php?route=common/home/ajaxmail",
        data: "name="+name+"&vin="+vin+"&phone="+phone,
        async:true,
        success:function(html) {
            try {
                var obj = JSON.parse(html);

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
                sendedinfo = false;
                alert("Ошибка: "+e);
            } finally {
            }
        }
    });
}

function sendinfoThanks_(){
    if (sendedinfo) return;
    var name=$("div.p_model_list").find('input.name').val();
    var phone=$("div.p_model_list").find('input.phone_number').val();
    var txt=$("div.p_model_list").find('textarea.comment').val();

    setCookie("username", name, {expires:24*60*60*365});
    setCookie("userphone", phone, {expires:24*60*60*365});

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
    sendedinfo = true;
    jQuery.ajax({
        type:"POST",
        url:"/index.php?route=common/home/ajaxmail",
        data: "name="+name+"&phone="+phone+'&vin='+txt,
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