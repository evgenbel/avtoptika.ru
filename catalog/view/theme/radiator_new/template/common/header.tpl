<?php require_once DIR_TEMPLATE.'default/template/common/head.tpl';?>

<body>
<!-- Google Tag Manager -->
<noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-KGBCQJ"
				  height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-KGBCQJ');</script>
<!-- End Google Tag Manager -->
	<!-- Rating@Mail.ru counter -->
<script type="text/javascript">
var _tmr = _tmr || [];
_tmr.push({id: "2625208", type: "pageView", start: (new Date()).getTime()});
(function (d, w) {
   var ts = d.createElement("script"); ts.type = "text/javascript"; ts.async = true;
   ts.src = (d.location.protocol == "https:" ? "https:" : "http:") + "//top-fwz1.mail.ru/js/code.js";
   var f = function () {var s = d.getElementsByTagName("script")[0]; s.parentNode.insertBefore(ts, s);};
   if (w.opera == "[object Opera]") { d.addEventListener("DOMContentLoaded", f, false); } else { f(); }
})(document, window);
</script><noscript><div style="position:absolute;left:-10000px;">
<img src="//top-fwz1.mail.ru/counter?id=2625208;js=na" style="border:0;" height="1" width="1" alt="Рейтинг@Mail.ru" />
</div></noscript>
<!-- //Rating@Mail.ru counter -->

<script type="text/javascript">(window.Image ? (new Image()) : document.createElement('img')).src = location.protocol + '//vk.com/rtrg?r=PQ1sOeO9SXyYKWEM1NZtaRzB0CHCdVlxTTaf/BWszGKw8YsfQd9dRbWD0W4Fd3TOZDUS6e91CvTXYRgVpMCPM*pposiON2O4gJvCXMyMNN5IttILvk9PzrTcgXBx8WFakYUypRU5DFtP8tjeFUgmxDpoJu4ZHwOBUTM74xT8KDQ-';</script>

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
					
                    //if (hour<0){
                        //window.location.href=window.location.href;//время кончилось обновляем страницу
                   // }
                    
                    
                        $("div.timer-site .timer-text.h1").text(hour/10 |0);
                        $("div.timer-site .timer-text.h2").text(hour % 10);
                        $("div.timer-site .timer-text.m1").text(min/10 |0);
                        $("div.timer-site .timer-text.m2").text(min % 10);
                        $("div.timer-site .timer-text.s1").text(sec /10 |0);
                        $("div.timer-site .timer-text.s2").text(sec % 10 );
        }		
    </script>
	<?php 
			$phone=$this->config->get('config_telephone');
			$phone=explode(" ",$phone); 
			?>
	<!--div id="info_block" style="width:1000px;position:absolute;;left:10%;top:20%;display:none;background:white;z-index:5001;padding:0 20px;border: 2px solid #AAAAAA;margin-bottom:90px;">
		<span class="block_title" style="text-align:center;"><?php echo $tormoza_info['title'];?></span>
		<?php echo html_entity_decode($tormoza_info['description']);?>
		<div class="CloseButton" onclick="toggleInfo();">X</div>
		<div class="CloseButton" onclick="toggleInfo();" style="top:99%;">X</div>
	</div-->
    <div id="wrapper">
		<?php //if(!$subscribed){ ?>
			<!--div id="expander" class="bottom_email_expander" style="bottom:78px;z-index:10;"><span style="font-size:20px;">Скрыть</span><img style="height:20px;" src="catalog/view/theme/tormoza/image/hide.png" /></div-->
		<?php //} else { ?>
			<div id="expander1" class="bottom_email_expander" style="display:none;z-index:5003;bottom:0px;width:1200px;"><p style="margin-bottom:15px;font-size:25px;text-align:center;color:#ffffff;font-weight:bold;text-shadow:#008bc8 2px 0px, #008bc8 -2px 0px, #008bc8 0px -2px, #008bc8 0px 2px;"><a onclick="//toggleInfo();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Полезные статьи [Тех. часть]</a> >>> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:20px;color:black;text-shadow:none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Читать</span><img style="height:20px;" src="catalog/view/theme/tormoza/image/show.png" /></p></div>
		<?php //} ?>
		<div class="bottom_email"><p style="margin-bottom:15px;font-size:25px;font-size:25px;text-align:center;color:#ffffff;font-weight:bold;text-shadow:#008bc8 2px 0px, #008bc8 -2px 0px, #008bc8 0px -2px, #008bc8 0px 2px;background:#696969;"><a onclick="//toggleInfo();">Полезные статьи [Тех. часть]</a></p>
			<div style="position: fixed;
			left: 102px; bottom: 28px;	
			height:22px;	
			text-align:center;font-size:29.33px;
			color:#696969;
			font-weight:bold;
			text-shadow:white 1.5px 0px, white -1.5px 0px, white 0px -1.5px, white 0px 1.5px;">Полезные статьи</div>
			<div style="position: fixed;
			/*left: 62px;*/ bottom: 28px;
			margin-left:850px;
			height:22px;
			text-align:center;font-size:29.33px;
			color:#696969;
			font-weight:bold;
			text-shadow:white 1.5px 0px, white -1.5px 0px, white 0px -1.5px, white 0px 1.5px;">Будьте в курсе</div>
			<?php //if(!$subscribed){ ?>
				<span style="font-size:20px;">Получайте самые последние материалы блога</span><br />
				<input type="text" id="bottom_email" value="" placeholder="Введите почту" />
				<button id="save_email" onclick="saveEmail();">Подписаться сейчас!</button>
			<?php //} else { ?>
				
			<?php //} ?>
		</div>
		<div class="top_line">
			<div class="title_site"><a href="/">ZAPPARTS</a></div>
				<div class="phone_line">
					<p class="phone_2 <?php if($yandexphone): ?>call_phone_5<?php endif;?>" style="color:red;font-size: 30px;font-weight: bold;font-family: Arial;">
						<a href="tel: +7 <?php echo isset($phone[1])?$phone[0]:499 ?> <?php echo isset($phone[1])?$phone[1]:$phone[0]; ?>">
                    8 <span <?php if($yandexphone): ?>class="ya_code" <?php else: ?> class="ya_code1"<?php endif;?>>(<?php echo isset($phone[1])?$phone[0]:499 ?>)</span> <span  <?php if($yandexphone): ?>class="ya_phone"<?php else:?>class="ya_phone1"<?php endif;?> ><?php echo isset($phone[1])?$phone[1]:$phone[0]; ?></span>
                </a>
					</p>
				</div>
			<div class="button_line" style="cursor:pointer;"><a id="show_form">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></div>
		</div>
	<div id="header">
		<a href="/" class="logo">
            <!--div>
                <div style="color: rgb(239, 165, 0); font-size: 52px; line-height: 52px; font-family: Tahoma; font-weight: bold; letter-spacing: 1.5px; text-shadow: 1px 0px rgb(255, 255, 255), 0px 1px rgb(255, 255, 255), -1px 0px rgb(255, 255, 255), 0px -1px rgb(255, 255, 255); text-decoration: none;">РАДИАТОРЫ</div>
                <div style="color:#f6db00; font-size: 20px; line-height: 34px; font-family:Tahoma; ">ОХЛАЖДЕНИЯ ДВИГАТЕЛЕЙ</div>
                <div style="color:#f8f400; font-size: 20px; line-height: 24px; font-family:Tahoma; letter-spacing: 1px;">КОНДИЦИОНЕРОВ ДЛЯ ИНОМАРОК</div>
            </div-->
        </a>
		<ul class="phone_list">
			<li style="color: #f1c800;">ООО "ZAPPARTS"</li>
			<?php 
			$phone=$this->config->get('config_telephone');
			$phone=explode(" ",$phone); 
			?>
			<li class="phonen <?php if($yandexphone){ ?>call_phone_3<?php } ?>">
                <a href="tel: +7 <?php echo isset($phone[1])?$phone[0]:499 ?> <?php echo isset($phone[1])?$phone[1]:$phone[0]; ?>">
                    8 <span <?php if($yandexphone): ?>class="ya_code" <?php else: ?> class="ya_code1"<?php endif;?>>(<?php echo isset($phone[1])?$phone[0]:499 ?>)</span> <span  <?php if($yandexphone): ?>class="ya_phone"<?php else:?>class="ya_phone1"<?php endif;?> ><?php echo isset($phone[1])?$phone[1]:$phone[0]; ?></span>
                </a>
            </li>
                        <li>Пн-Пт: с 9:00 до 21:00</li>
                        <li>Сб-Вс: с 10:00 до 18:00</li>
		</ul>
	</div><!-- #header-->
	
	<div id="plus">
		<ul>
			<li class="li_1">
				<span class="plus_icon"></span>
				<span class="plus_text">Быстрый и точный подбор запчастей<br />на ваш автомобиль</span>
			</li>
			<li class="li_3" id="fast_order" alt="Срочная доставка" style="margin-left:32px;">
				<span class="plus_icon"></span>
				<span class="plus_text">Бесплатная доставка до дверей<br />в течении 3-х часов</span>
			</li>
		</ul>
	</div>
	<div class="clear"></div>
        <div class='title-search'>
            <?php //$search_phrase='http://avtoradiator5.ru/'?>
            <?php if (!empty($search_phrase)):?>
                <?php 				
				function switcher($text,$arrow=0){
					$str[0] = array('й' => 'q', 'ц' => 'w', 'у' => 'e', 'к' => 'r', 'е' => 't', 'н' => 'y', 'г' => 'u', 'ш' => 'i', 'щ' => 'o', 'з' => 'p', 'х' => '[', 'ъ' => ']', 'ф' => 'a', 'ы' => 's', 'в' => 'd', 'а' => 'f', 'п' => 'g', 'р' => 'h', 'о' => 'j', 'л' => 'k', 'д' => 'l', 'ж' => ';', 'э' => '\'', 'я' => 'z', 'ч' => 'x', 'с' => 'c', 'м' => 'v', 'и' => 'b', 'т' => 'n', 'ь' => 'm', 'б' => ',', 'ю' => '.','Й' => 'Q', 'Ц' => 'W', 'У' => 'E', 'К' => 'R', 'Е' => 'T', 'Н' => 'Y', 'Г' => 'U', 'Ш' => 'I', 'Щ' => 'O', 'З' => 'P', 'Х' => '[', 'Ъ' => ']', 'Ф' => 'A', 'Ы' => 'S', 'В' => 'D', 'А' => 'F', 'П' => 'G', 'Р' => 'H', 'О' => 'J', 'Л' => 'K', 'Д' => 'L', 'Ж' => ';', 'Э' => '\'', '?' => 'Z', 'ч' => 'X', 'С' => 'C', 'М' => 'V', 'И' => 'B', 'Т' => 'N', 'Ь' => 'M', 'Б' => ',', 'Ю' => '.',);
					$str[1] = array (  'q' => 'й', 'w' => 'ц', 'e' => 'у', 'r' => 'к', 't' => 'е', 'y' => 'н', 'u' => 'г', 'i' => 'ш', 'o' => 'щ', 'p' => 'з', '[' => 'х', ']' => 'ъ', 'a' => 'ф', 's' => 'ы', 'd' => 'в', 'f' => 'а', 'g' => 'п', 'h' => 'р', 'j' => 'о', 'k' => 'л', 'l' => 'д', ';' => 'ж', '\'' => 'э', 'z' => 'я', 'x' => 'ч', 'c' => 'с', 'v' => 'м', 'b' => 'и', 'n' => 'т', 'm' => 'ь', ',' => 'б', '.' => 'ю','Q' => 'Й', 'W' => 'Ц', 'E' => 'У', 'R' => 'К', 'T' => 'Е', 'Y' => 'Н', 'U' => 'Г', 'I' => 'Ш', 'O' => 'Щ', 'P' => 'З', '[' => 'Х', ']' => 'Ъ', 'A' => 'Ф', 'S' => 'Ы', 'D' => 'В', 'F' => 'А', 'G' => 'П', 'H' => 'Р', 'J' => 'О', 'K' => 'Л', 'L' => 'Д', ';' => 'Ж', '\'' => 'Э', 'Z' => '?', 'X' => 'ч', 'C' => 'С', 'V' => 'М', 'B' => 'И', 'N' => 'Т', 'M' => 'Ь', ',' => 'Б', '.' => 'Ю', );
					$return = strtr($text,isset( $str[$arrow] )? $str[$arrow] :array_merge($str[0],$str[1]));
					$return = mb_strtolower($return, 'UTF-8');
					return $return;
				}
				
				echo $search_phrase;//switcher($search_phrase, 1);
				?>
            <?php else:?>
                Радиаторы охлаждения, и кондиционера для иномарок
            <?php endif;?>
			<input type="hidden" id="search_value" value="<?php echo !empty($search_phrase)?$search_phrase:'';?>" />
			<input type="hidden" id="referer" value="<?php echo $referer?>" />
        </div>

	<div id="top_block">
        <?php if (!empty($banner_a)):?>
            <a name="<?php echo $banner_a ?>"></a>
        <?php endif;?>
		<div class="slider">
			<span class="warning"></span>
			<ul>
			    <li style="position:relative;">
				<img class="spec" src="/image/<?php echo $banner_banner; ?>" width="694" height="240" />
				<div class="info-banner">				
				    <span class="text1"><?php echo $banner_name; ?></span>
				    <span class="text2"><?php echo $banner_old_price; ?></span>			
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
				<span class="form_text">Получить скидку</span>
				<ul class="form_list">
					<li><span>Имя*</span><input class="username" id="zakaz_firstname" type="text" placeholder="Ваше имя" value="<?php echo $username?>"/></li>
					<li><span>Телефон*</span><input class="userphone phonemask" type="text" placeholder="+7 XXX XXX XX XX" value="<?php echo $userphone?>"/></li>
					<li><span>VIN</span><input type="text" class="uservin" placeholder="17 символов VIN-кода автомобиля" default="17 символов VIN-кода автомобиля" value="<?php echo $uservin?>"/></li>
					<li><span>Комментарии</span><textarea placeholder="Марка машины и нужная деталь" default="Марка машины и нужная деталь" class="usertxt <?php if (!empty($search_phrase)):?>fr_s<?endif;?>" cols="" rows=""><?php echo empty($search_phrase)?"":$search_phrase;?></textarea></li>
					<li><div style="font-size:8px;font-weight: bold;text-align: center;position:relative;">
								<img src='http://autot.invbl.ru/catalog/view/theme/tormoza/img/login.png' style="width: 15px;height:20px;float:left;margin-left:10px;" />
								<div style="position:absolute;top:0;left:40px;font-size:8.5px;">Ваши данные необходимы только для связи с Вами,<br /> и не передаются третьим лицам</div>
							</div></li>
				</ul>
				<input style="margin-top:30px;" type="submit" value="" onclick="sendinfoThanks(this);return false;" />
			</div>
		</form>
	</div>