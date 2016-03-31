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
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
	
	<div id="plus">
		<ul>
			<li class="li_1">
				<span class="plus_icon"></span>
				<span class="plus_text">100% гарантия<br />качества<br />или возврат денег</span>
			</li>
			<li class="li_2">
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
			</li>
			<li class="li_3">
				<span class="plus_icon"></span>
				<span class="plus_text">Бесплатная<br />доставка</span>
			</li>
		</ul>
	</div>
	
	<div id="top_block">
		<div class="slider">
			<span class="warning"></span>
			<ul>
			    <li>
				<img src="<?php echo HTTP_IMAGE . $this->config->get('config_banner'); ?>" width="694" height="240" />
				<div class="info-banner">
				    <span class="text1"><?php echo $this->config->get('banner_name'); ?></span>
				    <span class="text2"><?php echo $this->config->get('banner_old_price'); ?></span>
				    <span class="text3"><?php echo $this->config->get('banner_new_price'); ?></span>
				    <span class="text4"><?php echo $this->config->get('banner_text1'); ?></span>
				    <span class="text5"><?php echo $this->config->get('banner_text2'); ?></span>
				</div>
			    </li>
				<!--li><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/ban_1.png" alt="" /></li>
				<li><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/ban_2.png" alt="" /></li>
				<li><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/ban_3.png" alt="" /></li>
				<li><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/ban_4.png" alt="" /></li-->
			</ul>
		</div>
		<form action="">
			<div class="form_order">
				<span class="form_text">ОТПРАВЬ ЗАЯВКУ<br/> УЗНАЙ НАЛИЧИЕ И ЦЕНУ</span>
				<span class="form_small">наши менеджеры свяжутся с вами в течении 30 мин.</span>
				<ul class="form_list">
					<li><span>Имя*</span><input class="username" type="text" placeholder="Ваше имя" default="Ваше имя"/></li>
					<li><span>Телефон*</span><input class="userphone phonemask" type="text" placeholder="+7 XXX XXX XX XX" default="+7 XXX XXX XX XX"/></li>
					<li><span>VIN</span><input type="text" class="uservin" placeholder="17 символов VIN-кода автомобиля" default="17 символов VIN-кода автомобиля"/></li>
					<li><span>Комментарии</span><textarea placeholder="Марка машины и нужная деталь" default="Марка машины и нужная деталь" class="usertxt" cols="" rows=""></textarea></li>
				</ul>
				<input type="submit" value="Отправить" onclick="sendinfo(this);return false;" />
			</div>
		</form>
	</div>