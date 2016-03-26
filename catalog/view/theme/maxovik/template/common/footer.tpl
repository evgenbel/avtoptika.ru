<div id="bottom_block">
		<div class="slider">
			<ul>
				<li><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/01.jpg" alt="" /></li>
				<li><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/02.jpg" alt="" /></li>
				<li><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/03.jpg" alt="" /></li>
				<li><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/04.jpg" alt="" /></li>
				<li><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/05.jpg" alt="" /></li>
				<li><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/06.jpg" alt="" /></li>
			</ul>
		</div>
		<form action="">
			<div class="form_order">
				<span class="form_text">УЗНАТЬ НАЛИЧИЕ И ЦЕНУ</span>
				<span class="form_small">наши менеджеры свяжутся с вами в течении 15 мин.</span>
				<ul class="form_list">
					<?php 				
					function switcher2($text,$arrow=0){
						$str[0] = array('й' => 'q', 'ц' => 'w', 'у' => 'e', 'к' => 'r', 'е' => 't', 'н' => 'y', 'г' => 'u', 'ш' => 'i', 'щ' => 'o', 'з' => 'p', 'х' => '[', 'ъ' => ']', 'ф' => 'a', 'ы' => 's', 'в' => 'd', 'а' => 'f', 'п' => 'g', 'р' => 'h', 'о' => 'j', 'л' => 'k', 'д' => 'l', 'ж' => ';', 'э' => '\'', 'я' => 'z', 'ч' => 'x', 'с' => 'c', 'м' => 'v', 'и' => 'b', 'т' => 'n', 'ь' => 'm', 'б' => ',', 'ю' => '.','Й' => 'Q', 'Ц' => 'W', 'У' => 'E', 'К' => 'R', 'Е' => 'T', 'Н' => 'Y', 'Г' => 'U', 'Ш' => 'I', 'Щ' => 'O', 'З' => 'P', 'Х' => '[', 'Ъ' => ']', 'Ф' => 'A', 'Ы' => 'S', 'В' => 'D', 'А' => 'F', 'П' => 'G', 'Р' => 'H', 'О' => 'J', 'Л' => 'K', 'Д' => 'L', 'Ж' => ';', 'Э' => '\'', '?' => 'Z', 'ч' => 'X', 'С' => 'C', 'М' => 'V', 'И' => 'B', 'Т' => 'N', 'Ь' => 'M', 'Б' => ',', 'Ю' => '.',);
						$str[1] = array (  'q' => 'й', 'w' => 'ц', 'e' => 'у', 'r' => 'к', 't' => 'е', 'y' => 'н', 'u' => 'г', 'i' => 'ш', 'o' => 'щ', 'p' => 'з', '[' => 'х', ']' => 'ъ', 'a' => 'ф', 's' => 'ы', 'd' => 'в', 'f' => 'а', 'g' => 'п', 'h' => 'р', 'j' => 'о', 'k' => 'л', 'l' => 'д', ';' => 'ж', '\'' => 'э', 'z' => 'я', 'x' => 'ч', 'c' => 'с', 'v' => 'м', 'b' => 'и', 'n' => 'т', 'm' => 'ь', ',' => 'б', '.' => 'ю','Q' => 'Й', 'W' => 'Ц', 'E' => 'У', 'R' => 'К', 'T' => 'Е', 'Y' => 'Н', 'U' => 'Г', 'I' => 'Ш', 'O' => 'Щ', 'P' => 'З', '[' => 'Х', ']' => 'Ъ', 'A' => 'Ф', 'S' => 'Ы', 'D' => 'В', 'F' => 'А', 'G' => 'П', 'H' => 'Р', 'J' => 'О', 'K' => 'Л', 'L' => 'Д', ';' => 'Ж', '\'' => 'Э', 'Z' => '?', 'X' => 'ч', 'C' => 'С', 'V' => 'М', 'B' => 'И', 'N' => 'Т', 'M' => 'Ь', ',' => 'Б', '.' => 'Ю', );
						$return = strtr($text,isset( $str[$arrow] )? $str[$arrow] :array_merge($str[0],$str[1]));
						$return = mb_strtolower($return, 'UTF-8');
						return $return;
					}
					?>
                    <li style="margin:0;"><span>Имя*</span><input class="username" type="text" placeholder="Ваше имя" default="Ваше имя" value="<?php echo $username?>"/></li>
                    <li style="margin:0;"><span>Телефон*</span><input class="userphone phonemask" type="text" placeholder="+7 XXX XXX XX XX" default="+7 XXX XXX XX XX" value="<?php echo $userphone?>"/></li>                    
					<li style="margin-top: 24px;"><span>Комментарии</span><textarea placeholder="Марка машины и нужная деталь" default="Марка машины и нужная деталь" class="usertxt <?php if (!empty($search_phrase)):?>fr_s<?endif;?>" cols="" rows=""><?php echo empty($search_phrase)?"":$search_phrase?></textarea></li>
					<li style="margin:0;"><div style="font-size:8px;font-weight: bold;text-align: center;position:relative;">
								<img src='http://autot.invbl.ru/catalog/view/theme/tormoza/img/login.png' style="width: 15px;height:20px;float:left;margin-left:10px;" />
								<div style="position:absolute;top:0;left:40px;font-size:8.5px;">Ваши данные необходимы только для связи с Вами,<br /> и не передаются третьим лицам</div>
				</ul>
				<input style="margin-top:30px;" type="submit" value="" onclick="sendinfoThanks(this);return false;" />
			</div>
		</form>
	</div>

<div style='margin-bottom: 60px;margin-top: -60px;margin-left: 150px;'>
    <table style='width:100%'>
        <tr>            
            <td class="payments">
                <h4>Принимаем к оплате:</h4>
                <a target="_blank" href="https://w.qiwi.ru/payments.action"><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/qiwi.png" height="25" alt="" /></a>
                <a target="_blank" href="https://money.yandex.ru/"><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/yandex.png" height="25" alt="" /></a>
                <a target="_blank" href="http://www.webmoney.ru/"><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/webmoney_small.png" height="25" alt="" /></a>
                <a target="_blank" href="https://click.alfabank.ru"><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/alfa.png" height="25" alt="" /></a>
                <a href="#"><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/visa.png" height="25" alt="" /></a>
                <a href="#"><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/mastercard.png" height="25" alt="" /></a>
                <a target="_blank" href="https://oplata.kykyryza.ru"><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/evroset.png" height="25" alt="" /></a>
                <a target="_blank" href="https://iqbank.ru"><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/svyaz.png" height="25" alt="" /></a>
                <a target="_blank" href="https://online.sberbank.ru/CSAFront/index.do"><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/sber.png" height="25" alt="" /></a>



                <!--script type="text/javascript" src="//yandex.st/share/share.js"
                charset="utf-8"></script>
                <div class="yashare-auto-init" data-yashareL10n="ru"
                 data-yashareType="none" data-yashareQuickServices="vkontakte,facebook,lj,moimir,yaru,twitter,odnoklassniki,moikrug,gplus" data-yashareImage="<?php echo HTTP_IMAGE . $this->config->get('config_banner'); ?>"

                ></div-->




            </td>
			<td style="padding-left:100px;">
                <h4>Поделиться с друзьями:</h4>
                <script type="text/javascript" src="//yastatic.net/share/share.js" charset="utf-8"></script><div class="yashare-auto-init" data-yashareL10n="ru" data-yashareType="none" data-yashareQuickServices="vkontakte,facebook,twitter,odnoklassniki,moimir,lj,moikrug,gplus"></div>
                <!--
                <div class="addthis_toolbox addthis_default_style addthis_32x32_style">
                    <a href="http://vk.com/zapparts_ru" target="_blank" style="float:left;">
						<img src="http://autot.invbl.ru/catalog/view/theme/tormoza/img/vk_new.png" width="36" height="34" border="0" alt="Share">
					</a>
                    <a class="addthis_button_facebook"></a>
                    <a class="addthis_button_livejournal"></a>
                    <a class="addthis_button_mymailru"></a>
                    <a class="addthis_button_moikrug"></a>
                    <a class="addthis_button_odnoklassniki_ru"></a>
                    <a class="addthis_button_twitter"></a>
                    <a class="addthis_button_evernote"></a>
                    <a class="addthis_button_google_plusone_share"></a>
                </div>
                <!--script type="text/javascript">
                    var addthis_config = {
                        "data_track_addressbar":true,
                        "image":"<?php echo HTTP_IMAGE . $this->config->get('config_banner'); ?>"
                    };
                </script>
                <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5231e9f458b4c327"></script>
                <!-- AddThis Button END -->
            </td>
        </tr>
    </table>
</div>
</div><!-- #wrapper -->

<!-- Yandex.Metrika counter -->
<script type="text/javascript">
	(function (d, w, c) {
		(w[c] = w[c] || []).push(function() {
			try {
				w.yaCounter33314500 = new Ya.Metrika({id:33314500,
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
<noscript><div><img src="//mc.yandex.ru/watch/33314500" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->

<script>
function reachGoalSite(name){
	yaCounter33314500.reachGoal(name);
}
</script>
<?php if($yandexphone): ?>
<script type="text/javascript">
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){

        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),

            m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)

    })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

    ga('create', 'UA-51302022-12', 'auto');

    ga('send', 'pageview');

    ga(function(tracker) {

        (function(w, d, c){

            var a = 'all', b = 'tou'; var src = b + 'c' +'h'; src = 'm' + 'o' + 'd.c' + a + src;

            $.getScript(('https:' == d.location.protocol ? 'https://' : 'http://')+src+"."+"r"+"u/d_client.js?param;client_id"+c+";ref" + escape(d.referrer) + ";url" + escape(d.URL) + ";cook" + escape(d.cookie)+";");

        })(window, document, tracker.get('clientId'));

    });
</script>
<?php endif;?>



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
	
	<?php //if($subscribed){ ?>
		$('.bottom_email').hide();
		$('.bottom_email_expander').show();
	<?php //}else{?>
		function getCookie(cname) {
		var name = cname + "=";
		var ca = document.cookie.split(';');
		for(var i=0; i<ca.length; i++) {
			var c = ca[i];
			while (c.charAt(0)==' ') c = c.substring(1);
			if (c.indexOf(name) != -1) return c.substring(name.length,c.length);
		}
		return "";
	}

	var expanded = getCookie('email_expanded');

	if(expanded == 'yes'){
		/*$('.bottom_email').hide();
		 $('.bottom_email_expander').show();
		 $('.bottom_email_expander').css('bottom', '1px');
		 $('.bottom_email_expander').find('span').html('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Читать');
		 $('.bottom_email_expander').find('img').attr('src', 'catalog/view/theme/tormoza/image/show.png');
		 $('.bottom_email_expander').css('opacity', '1');*/
		$("#expander1").hide();
		$(".bottom_email").show();
	}else {
		$("#expander1").show();
		$(".bottom_email").hide();
	}
	<?php //} ?>

			$("#expander1 .button-hide").on('click', function() {
				$("#expander1").hide();
				$(".bottom_email").show();
				document.cookie="email_expanded=yes";
			});
	$(".bottom_email .button-hide").on('click', function() {
		$("#expander1").show();
		$(".bottom_email").hide();
		document.cookie="email_expanded=no";
	});
	
	$('.bottom_email, .bottom_email_expander').hover(function(){
		$('.bottom_email_expander').css('background', '#696969');
		$('.bottom_email p').first().css('background', '#696969');
	}, function(){
		$('.bottom_email_expander').css('background', '#848482');
		$('.bottom_email p').first().css('background', '#848482');
	});
	
	if($('.bottom_email').css('display') == 'none;')
		$('#expander').css('opacity', '1');
</script>
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
    <div style="display:inline;">
        <img height="1" width="1" style="border-style:none;" alt="" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/963065490/?value=0&guid=ON&script=0"/>
    </div>
</noscript>
<div id="footer">	
    <?php 
			$phone=$this->config->get('config_telephone');
			$phone=explode(" ",$phone); 
			?>
	<span class="phone">ООО "ZAPPARTS" <span class="phonen <?php if($yandexphone): ?>call_phone_3<?php endif;?>" > <a href="tel: +7 <?php echo isset($phone[1])?$phone[0]:499 ?> <?php echo isset($phone[1])?$phone[1]:$phone[0]; ?>">8 <span  <?php if($yandexphone): ?>class="ya_code" <?php else: ?> class="ya_code1"<?php endif;?>>(<?php echo isset($phone[1])?$phone[0]:499 ?>)</span> <span  <?php if($yandexphone): ?>class="ya_phone"<?php else:?>class="ya_phone1"<?php endif;?> ><?php echo isset($phone[1])?$phone[1]:$phone[0]; ?></a></span></span></span>
    <span class="copy">© 2009 - <?php echo date('Y') ?> <?=$this->config->get('footer_copy');?></span>
</div><!-- #footer -->

<script src="http://cdn.k50.ru/k50/k50tracker2.js"></script>
<script>k50Tracker.init({siteId: 377255003});</script>
</body>
</html>