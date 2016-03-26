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
	<!--meta name="viewport" content="width=device-width, initial-scale=1.0" /-->
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
    <link rel="stylesheet" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/jquery.countdown.css" />
    <script src="catalog/view/javascript/jquery.countdown.js"></script>
    <script>
        var hour=<?php echo $hour;?>;
        var min=<?php echo $min;?>;
        var sec=<?php echo $sec;?>;

        $(document).ready(function(){
            //var timerId = setInterval(changeTime,1000);

            $('#countdown').countdown({
                timestamp	:  (new Date).getTime()+<?php echo $tm*1000?>
        });
        });

    </script>
    <?=$google_analytics;?>
</head>

<body>
<!-- Google Tag Manager -->
<noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-K8BZFQ"
                  height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-K8BZFQ');</script>
<!-- End Google Tag Manager -->
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
			<li>Техцентр АМО</li>
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
	
	<div id="plus">
		<ul>
			<li class="li_1">
				<span class="plus_icon"></span>
				<span class="plus_text">Бесплатный Эвакуатор<br />Подача в течение 1 часа!</span>
			</li>
			<!--li class="li_2">
				<span class="plus_icon"></span>
				<span class="plus_text">Акция до</span>
				
                                <div class="timer-site">
                                    <?php $hour=str_split($hour);?>
                    <span><span class="timer-text h1"><?php echo isset($hour[1])?$hour[0]:0;?></span>
                    <span class="timer-text h2"><?php echo isset($hour[1])?$hour[1]:$hour[0];?></span></span>
                    <?php $min=str_split($min);?>
                    <span><span class="timer-text m1"><?php echo isset($min[1])?$min[0]:0;?></span>
                    <span class="timer-text m2"><?php echo isset($min[1])?$min[1]:$min[0];?></span></span>
                    <?php $sec=str_split($sec);?>
                    <span><span class="timer-text s1"><?php echo isset($sec[1])?$sec[0]:0;?></span>
                    <span class="timer-text s2"><?php echo isset($sec[1])?$sec[1]:$sec[0];?></span></span>
                    
                </div>
                <span class="hh">
		    <span>час </span>
		    <span style='padding-left:8px;'>мин </span>
		    <span style='padding-left:8px;'>сек</span>
		</span>
                <div class="date">
                    <span class="number"><?php echo $days[0] ?></span>
                    <span class="number"><?php echo $days[1] ?></span>
                    <span class="month"><?php echo $month ?></span>
                </div>
			</li-->
			<li class="li_3">
				<span class="plus_icon"></span>
				<span class="plus_text">Любая диагностика<br />в подарок за наш счет</span>
			</li>
		</ul>
	</div>
        <div class='title-search'>
            <?php if (!empty($search_phrase)):?>
            <?php
				echo $search_phrase;
				?>
            <?php else:?>
            Покраска, кузовной и слесарный ремонт любой сложности
            <?php endif;?>
            <input type="hidden" id="search_value" value="<?php echo !empty($search_phrase)?$search_phrase:'';?>" />
            <input type="hidden" id="referer" value="<?php echo $referer?>" />
        </div>
	<div id="top_block">
		<div class="slider">
			<span class="warning"></span>
			<ul>
			    <li>
				<img src="<?php echo HTTP_IMAGE . $this->config->get('config_banner'); ?>" width="694" height="240" />
				<div class="info-banner">
				    <span class="text1"><?php echo $this->config->get('banner_name'); ?></span>
				    <span class="text2" style="margin-left:-30px;"><?php echo $this->config->get('banner_old_price'); ?></span>
				    <span class="text3" style="margin-left:-80px;"><?php echo $this->config->get('banner_new_price'); ?></span>
				    <span class="text4"><?php echo $this->config->get('banner_text1'); ?></span>
				    <span class="text5"><?php echo $this->config->get('banner_text2'); ?></span>
				</div>
                    <div class="li_2">
                        <div class="timer_site" style="position:relative;">
                            <div style="padding-left:20px;position:absolute;top:-15px;"><b>До конца акции осталось</b></div>
                            <div id="countdown"></div>
                            <div style="margin-top: -15px;">
                                <span style="margin-left: 14px;">часы</span>
                                <span style="margin-left: 35px;">минуты</span>
                                <span style="margin-left: 19px;">секунды</span>
                            </div>
                        </div>
						<span class="hh">
						<span>час </span>
							<span style='padding-left:8px;'>мин </span>
							<span style='padding-left:8px;'>сек</span>
						</span>
                    </div>

			    </li>
				<!--li><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/img/ban_1.png" alt="" /></li>
				<li><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/img/ban_2.png" alt="" /></li>
				<li><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/img/ban_3.png" alt="" /></li>				
                                <li><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/img/ban_4.png" alt="" /></li-->				
			</ul>
		</div>
		<form action="">
			<div class="form_order">
				<span class="form_text">ОТПРАВЬ ЗАЯВКУ <br/> ПОЛУЧИ СКИДКУ</span>
				<span class="form_small">наши менеджеры свяжутся с вами в течении 15 мин.</span>
				<ul class="form_list">
					<li><span>Имя*</span><input class="username" type="text" placeholder="Ваше имя" default="Ваше имя"/></li>
					<li><span>Телефон*</span><input class="userphone phonemask" type="text" placeholder="+7 XXX XXX XX XX" default="+7 XXX XXX XX XX"/></li>
					<li><span>VIN</span><input type="text" class="uservin" placeholder="17 символов VIN-кода автомобиля" default="17 символов VIN-кода автомобиля"/></li>
					<li><span>Комментарии</span><textarea placeholder="неисправность или необходимый ремонт" default="неисправность или необходимый ремонт" class="usertxt" cols="" rows=""></textarea></li>
				</ul>
				<input type="submit" value="" onclick="sendinfo(this);return false;" />
			</div>
		</form>
	</div>
