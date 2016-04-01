<?php require_once DIR_TEMPLATE.'default/template/common/head.tpl';?>

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

	<div id="header" <?php if ($logo): ?>style='background: url(<?php echo $logo?>) 340px 0 no-repeat;'<?php endif;?>>
		<a href="/" class="logo_txt"><?php echo html_entity_decode($this->config->get('logo_title'), ENT_QUOTES, 'UTF-8');?></a>
		<ul class="phone_list">
			<li>ООО "ZAPPARTS"</li>
			<?php 
			$phone=$this->config->get('config_telephone');
			$phone=explode(" ",$phone); 
			?>
            <li class="phonen">
                <a href="tel: +7 <?php echo isset($phone[1])?$phone[0]:499 ?> <?php echo isset($phone[1])?$phone[1]:$phone[0]; ?>">
                    8 <span class="ya_code">(<?php echo isset($phone[1])?$phone[0]:499 ?>)</span> <span  class="ya_phone" ><?php echo isset($phone[1])?$phone[1]:$phone[0]; ?></span>
                </a>

            </li>
                        <li>Пн-Пт: с 10:00 до 20:00</li>
                        <li>Сб-Вс: с 10:00 до 18:00</li>
		</ul>
	</div><!-- #header-->
	
	<div id="plus">
		<ul>
			<li class="li_1">
				<span class="plus_icon" style="background-image: url('<?php echo $triger_left_img; ?>')"></span>
				<span class="plus_text"><?php echo nl2br(html_entity_decode($this->config->get('triger_left_text')))?></span>
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
		    <span style='padding-left:7px;'>мин </span>
		    <span style='padding-left:7px;'>сек</span>
		</span>
		
                <div class="date">
                    <span class="number"><?php echo $days[0] ?></span>
                    <span class="number"><?php echo $days[1] ?></span>
                    <span class="month"><?php echo $month ?></span>
                </div>
			</li-->
			<li class="li_3">
				<span class="plus_icon" style="background-image: url('<?php echo $triger_right_img; ?>')"></span>
				<span class="plus_text"><?php echo nl2br(html_entity_decode($this->config->get('triger_right_text')))?></span>
			</li>
		</ul>
	</div>
	
	<div id="top_block">
		<div class="slider">
			<span class="warning"></span>
			<ul>
			    <li>
				<img src="<?php echo '/image/' . $this->config->get('config_banner'); ?>" width="694" height="240" />
				<!--div class="info-banner">
				    <span class="text1"><?php echo $this->config->get('banner_name'); ?></span>
				    <span class="text2"><?php echo $this->config->get('banner_old_price'); ?></span>
				    <span class="text3"><?php echo $this->config->get('banner_new_price'); ?></span>
				    <span class="text4"><?php echo $this->config->get('banner_text1'); ?></span>
				    <span class="text5"><?php echo $this->config->get('banner_text2'); ?></span>
				</div-->

					<div class="li_2">
						<div class="timer_site" style="position:relative;">
							<div style="padding-left:20px;position:absolute;top:-15px;color:white;"><b>До конца акции осталось</b></div>
							<div id="countdown"></div>
							<div style="color:white;margin-top: -15px;">
								<span style="margin-left: 14px;">часы</span>
								<span style="margin-left: 35px;">минуты</span>
								<span style="margin-left: 19px;">секунды</span>
							</div>
						</div>
						<span class="hh">
						<span></span>
							<span style='padding-left:8px;'></span>
							<span style='padding-left:8px;'></span>
						</span>
					</div>
					<div id="triangle-right"></div>
			    </li>
				<!--li><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/ban_1.png" alt="" /></li>
				<li><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/ban_2.png" alt="" /></li>
				<li><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/ban_3.png" alt="" /></li-->				
			</ul>
		</div>
		<form action="">
			<div class="form_order">
				<span class="form_text"><?php echo nl2br($this->config->get('zakaz_form_title')); ?></span>
				<span class="form_small">наши менеджеры свяжутся с вами в течении 15 мин.</span>
				<ul class="form_list">
					<li><span>Имя*</span><input class="username" type="text" placeholder="Ваше имя" default="Ваше имя"/></li>
					<li><span>Телефон*</span><input class="userphone phonemask" type="text" placeholder="+7 XXX XXX XX XX" default="+7 XXX XXX XX XX"/></li>
					<li><span><?php echo $this->config->get('zakaz_field_3'); ?></span><input type="text" class="uservin" placeholder="<?php echo $this->config->get('zakaz_infield_3'); ?>" default="<?php echo $this->config->get('zakaz_infield_3'); ?>"/></li>
					<li><span><?php echo $this->config->get('zakaz_field_4'); ?></span><textarea placeholder="<?php echo $this->config->get('zakaz_infield_4'); ?>" default="<?php echo $this->config->get('zakaz_infield_4'); ?>" class="usertxt" cols="" rows=""></textarea></li>
				</ul>
				<input type="submit" value="Отправить" onclick="sendinfo(this);return false;" />
			</div>
		</form>
	</div>