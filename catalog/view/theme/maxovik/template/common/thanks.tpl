<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title><?php echo $title; ?></title>
    <?php if ($keywords) { ?>
    <meta name="keywords" content="<?php echo $keywords; ?>" />
    <?php } ?>
    <?php if ($description) { ?>
    <meta name="description" content="<?php echo $description; ?>" />
    <?php } ?>
    <?php if ($icon) { ?>
    <link href="<?php echo $icon; ?>" rel="shortcut icon" type="image/x-icon" />
    <?php } ?>
    
    <link rel="stylesheet" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/style.css" type="text/css" media="screen, projection" />
    <link rel="stylesheet" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/jquery.fancybox.css" type="text/css" media="screen, projection" />
    <link rel="stylesheet" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/reviews.css" type="text/css" media="screen, projection" />
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:700&subset=latin,cyrillic"  type="text/css" />
    <script src="http://code.jquery.com/jquery-1.8.0.min.js" type="text/javascript"></script>
    <script src="catalog/view/javascript/bxSlider.js" type="text/javascript"></script>
    <script src="catalog/view/javascript/main.js" type="text/javascript"></script>
    <script src="catalog/view/javascript/jquery.fancybox.js" type="text/javascript"></script>
    <script src="catalog/view/javascript/jquery.form.js" type="text/javascript"></script>

</head>

<body>
<!-- Rating@Mail.ru counter -->
<script type="text/javascript">
    var _tmr = _tmr || [];
    _tmr.push({id: "2625209", type: "pageView", start: (new Date()).getTime()});
    (function (d, w) {
        var ts = d.createElement("script"); ts.type = "text/javascript"; ts.async = true;
        ts.src = (d.location.protocol == "https:" ? "https:" : "http:") + "//top-fwz1.mail.ru/js/code.js";
        var f = function () {var s = d.getElementsByTagName("script")[0]; s.parentNode.insertBefore(ts, s);};
        if (w.opera == "[object Opera]") { d.addEventListener("DOMContentLoaded", f, false); } else { f(); }
    })(document, window);
</script><noscript><div style="position:absolute;left:-10000px;">
        <img src="//top-fwz1.mail.ru/counter?id=2625209;js=na" style="border:0;" height="1" width="1" alt="Рейтинг@Mail.ru" />
    </div></noscript>
<!-- //Rating@Mail.ru counter -->

<script>
    $(document).ready(function(){
        var b_h = $("body").height()-265;
        $(".thanks").css("height", b_h);
        $(".thanks .center").css("height", b_h);

        $(window).resize(function(){
            var b_h = $("body").height()-265;
            $(".thanks").css("height", b_h);
            $(".thanks .center").css("height", b_h);
        });
    });
</script>
<div id="wrapper" >

    <div id="header">
        <!--a href="/" class="logo">Название сайта</a-->
        <a href="/" class="logo"><img src="/catalog/view/theme/tormoza/img/logo.png"></img></a>
        <ul class="phone_list">
            <li>Горячая линия</li>
            <?php
			$phone=$this->config->get('config_telephone');
            $phone=explode(" ",$phone);
            ?>
            <li class="phonen"><span class="ya_code">(<?php echo isset($phone[1])?$phone[0]:499 ?>)</span> <span  class="ya_phone" ><?php echo isset($phone[1])?$phone[1]:$phone[0]; ?></span></li>
            <li>Пн-Пт: с 10:00 до 20:00</li>
            <li>Сб-Вс: с 10:00 до 18:00</li>
        </ul>
    </div><!-- #header-->


    <!--div id="konteiner"-->
    <?php if ($not_work):?>
    <div class="thanks">
        <div class="center">Спасибо за Вашу заявку! Наши менеджеры свяжутся с Вами в ближайшее рабочее время!</div>
    </div>
    <?php else:?>
    <div class="thanks">
        <div class="center">Спасибо за Вашу заявку! Наши менеджеры свяжутся с Вами в течении 15 минут!</div>
    </div>
    <?php endif;?>

    <div style="margin: 380px auto 0; width: 250px;">
        <h1 style='position:absolute;;margin-top:-30px;width: 100%; min-width: 1200px; text-align: center;left:0; font-size: 150%;'>Вступайте в нашу группу в социальной сети</h1>
        <script type="text/javascript" src="//vk.com/js/api/openapi.js?117"></script>

        <!-- VK Widget -->
        <div id="vk_groups"></div>
        <script type="text/javascript">
            VK.Widgets.Group("vk_groups", {mode: 0, width: "220", height: "300", color1: 'FFFFFF', color2: '2B587A', color3: '5B7FA6'}, 80195786);
        </script>
    </div>
    <!--/div-->
</div>
<!-- Yandex.Metrika counter -->
<script type="text/javascript">
    (function (d, w, c) {
        (w[c] = w[c] || []).push(function() {
            try {
                w.yaCounter28595456 = new Ya.Metrika({id:28595456,
                    webvisor:true,
                    clickmap:true,
                    trackLinks:true,
                    accurateTrackBounce:true});
            } catch(e) { }
        });

        var n = d.getElementsByTagName("script")[0],
                s = d.createElement("script"),
                f = function () { n.parentNode.insertBefore(s, n); };
        s.type = "text/javascript";
        s.async = true;
        s.src = (d.location.protocol == "https:" ? "https:" : "http:") + "//mc.yandex.ru/metrika/watch.js";

        if (w.opera == "[object Opera]") {
            d.addEventListener("DOMContentLoaded", f, false);
        } else { f(); }
    })(document, window, "yandex_metrika_callbacks");
</script>
<noscript><div><img src="//mc.yandex.ru/watch/28595456" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->

<script>
    function reachGoalSite(name){
        yaCounter20404501.reachGoal(name);
    }
</script>
<script type="text/javascript">
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
            m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
    ga('create', 'UA-51302022-12', 'auto');
    ga('require', 'displayfeatures');
    ga('send', 'pageview');
    ga(function(tracker) {
        (function(w, d, c){
            $(document).ready(function(){
                var a = 'all', b = 'tou'; var src = b + 'c' +'h'; src = 'm' + 'o' + 'd.c' + a + src;
                $.getScript(('https:' == d.location.protocol ? 'https://' : 'http://')+src+"."+"r"+"u/d_client.js?param;client_id"+c+";ref" + escape(d.referrer) + ";url" + escape(d.URL) + ";cook" + escape(d.cookie)+";");
            });
        })(window, document, tracker.get('clientId'));
    });
</script>

<script type="text/javascript">(window.Image ? (new Image()) : document.createElement('img')).src = location.protocol + '//vk.com/rtrg?r=fKilq9LL/LQXPKkl2sPd/8gkMwmG2P6XnaDbRPlc7vh/7LR/Nz4IP8Dbcl3JXUDhlQBwnWf1cGFOLy8HG3kNdUXH13Y7NAzlJSsTwGn1BKSfUYBnMypolqixIzwgjQKGWWkzjzIn38xBSLK4Wd/NWRCypoZ7lmhXB4JCZ0icCZw-';</script>

<!-- Код тега ремаркетинга Google -->
<!--------------------------------------------------
С помощью тега ремаркетинга запрещается собирать информацию, по которой можно идентифицировать личность пользователя. Также запрещается размещать тег на страницах с контентом деликатного характера. Подробнее об этих требованиях и о настройке тега читайте на странице http://google.com/ads/remarketingsetup.
--------------------------------------------------->
<script type="text/javascript">
    /* <![CDATA[ */
    var google_conversion_id = 963065490;
    var google_custom_params = window.google_tag_params;
    var google_remarketing_only = true;
    /* ]]> */
</script>
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
    <div style="display:inline;">
        <img height="1" width="1" style="border-style:none;" alt="" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/963065490/?value=0&guid=ON&script=0"/>
    </div>
</noscript>

<!-- Google Code for Спасибо
за заявку Conversion Page
-->
<script type="text/javascript">
    /* <![CDATA[ */
    var google_conversion_id = 963065490;
    var google_conversion_language = "ru";
    var google_conversion_format = "3";
    var google_conversion_color = "ffffff";
    var google_conversion_label = "VfZCCI7n6AgQku2cywM";
    var google_remarketing_only = false;
    /* ]]> */
</script>
<script type="text/javascript"
        src="//www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
    <div style="display:inline;">
        <img height="1" width="1" style="border-style:none;" alt=""
             src="//www.googleadservices.com/pagead/conversion/963065490/?label=VfZCCI7n6AgQku2cywM&guid=ON&script=0"/>
    </div>
</noscript>

<div id="footer">
    <?php
			$phone=$this->config->get('config_telephone');
    $phone=explode(" ",$phone);
    ?>
    <span class="phone">Горячая линия: <span class="phonen"><span  class="ya_code">(<?php echo isset($phone[1])?$phone[0]:499 ?>)</span> <span  class="ya_phone" ><?php echo isset($phone[1])?$phone[1]:$phone[0]; ?></span></span></span>
    <span class="copy">© 2009 - <?php echo date('Y') ?> <?=$this->config->get('footer_copy');?></span>
</div><!-- #footer -->

</body>
</html>