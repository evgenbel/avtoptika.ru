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
				<span class="form_text">ОТПРАВЬ ЗАЯВКУ<br/> УЗНАЙ НАЛИЧИЕ И ЦЕНУ</span>
				<span class="form_small">наши менеджеры свяжутся с вами в течении 15 мин.</span>
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

</div><!-- #wrapper -->
<!-- Yandex.Metrika counter -->
<script type="text/javascript">
(function (d, w, c) {
    (w[c] = w[c] || []).push(function() {
        try {
            w.yaCounter20404390 = new Ya.Metrika({id:20404390,
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
<noscript><div><img src="//mc.yandex.ru/watch/20404390" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->

<script>
function reachGoalSite(name){
    yaCounter20404390.reachGoal(name);
}
</script>

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