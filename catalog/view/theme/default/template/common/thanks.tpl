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
	<link rel="shortcut icon" href="<?php echo $icon; ?>" type="image/x-icon" />
	<?php }?>

	<link rel="stylesheet" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/style.css" type="text/css" media="screen, projection" />
	<link rel="stylesheet" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/jquery.fancybox.css" type="text/css" media="screen, projection" />
        <link rel="stylesheet" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/reviews.css" type="text/css" media="screen, projection" />
	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:700&subset=latin,cyrillic"  type="text/css" />
	<script src="http://code.jquery.com/jquery-1.8.0.min.js" type="text/javascript"></script>
	<script src="catalog/view/javascript/bxSlider.js" type="text/javascript"></script>
    <script type="text/javascript" src="catalog/view/javascript/inputmask.js"></script>
	<script src="catalog/view/javascript/main.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery.fancybox.js" type="text/javascript"></script>
        <script src="catalog/view/javascript/jquery.form.js" type="text/javascript"></script>

</head>

<body>
    <script>
         var hour=<?php echo $hour;?>;
        var min=<?php echo $min;?>;
        var sec=<?php echo $sec;?>;
            
        $(document).ready(function(){
            var timerId = setInterval(changeTime,1000);
        });
        
        function changeTime(){
                    sec=sec-1;
                    if (sec<0){
                        sec=59;
                        min=min-1;
                    }
                    if(min<0){
                        min=59;
                        hour=hour-1;
                    }
                    if (hour<0){
                        window.location.href=window.location.href;//время кончилось обновляем страницу
                    }
                    
                    
                        $("div.timer-site .timer-text.h1").text(hour/10 |0);
                        $("div.timer-site .timer-text.h2").text(hour % 10);
                        $("div.timer-site .timer-text.m1").text(min/10 |0);
                        $("div.timer-site .timer-text.m2").text(min % 10);
                        $("div.timer-site .timer-text.s1").text(sec /10 |0);
                        $("div.timer-site .timer-text.s2").text(sec % 10 );
        }
    </script>
<div id="wrapper">

	<div id="header">
		<a href="/" class="logo">Название сайта</a>
		<ul class="phone_list">
			<li>ООО "ZAPPARTS"</li>
			<?php 
			$phone=$this->config->get('config_telephone');
			$phone=explode(" ",$phone); 
			?>
			<li class="phonen">
                <a href="tel: +7 <?php echo isset($phone[1])?$phone[0]:499 ?> <?php echo isset($phone[1])?$phone[1]:$phone[0]; ?>">
                    8 <span>(<?php echo isset($phone[1])?$phone[0]:499 ?>)</span> <?php echo isset($phone[1])?$phone[1]:$phone[0]; ?>
                </a>
            </li>
                        <li>Пн-Пт: с 10:00 до 20:00</li>
                        <li>Сб-Вс: с 10:00 до 18:00</li>                        
		</ul>
	</div><!-- #header-->


<!--div id="konteiner"-->
    <div class="thanks">
        <div class="center">Спасибо за Вашу заявку! Наши менеджеры свяжутся с Вами в течении 15 минут!</div>
    </div>

    <div style="margin: 380px auto 0; width: 250px;">
        <h1 style='position:absolute;;margin-top:-30px;width: 100%;min-width: 1200px; text-align: center;left:0; font-size: 150%;'>Вступайте в нашу группу в социальной сети</h1>
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
                    w.yaCounter20404501 = new Ya.Metrika({id:20404501,
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
    <noscript><div><img src="//mc.yandex.ru/watch/20404501" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
    <!-- /Yandex.Metrika counter -->

    <script>
        function reachGoalSite(name){
            yaCounter20404501.reachGoal(name);
        }
    </script>
    <script>
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
            (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

        ga('create', 'UA-51302022-1', 'avto-tormoza.ru');
        ga('send', 'pageview');

    </script>

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
	<span class="phone"> ООО "ZAPPARTS" <span> <a href="tel: +7 <?php echo isset($phone[1])?$phone[0]:499 ?> <?php echo isset($phone[1])?$phone[1]:$phone[0]; ?>">8 <span>(<?php echo isset($phone[1])?$phone[0]:499 ?>)</span> <?php echo isset($phone[1])?$phone[1]:$phone[0]; ?></a></span></span>
    <span class="copy">© 2009 - <?php echo date('Y') ?> <?=$this->config->get('footer_copy');?></span>
</div><!-- #footer -->
<link rel="stylesheet" href="http://callbackhunter.com/widget/tracker.css">
<script type="text/javascript" src="http://callbackhunter.com/widget/tracker.js" charset="UTF-8"></script>
<script type="text/javascript">var hunter_code="d41db65eff12e8af452c2988cf98add1";</script>
</body>
</html>