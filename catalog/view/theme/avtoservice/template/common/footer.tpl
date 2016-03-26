
        
	<div id="bottom_block">
		<div class="slider">
			<ul>
				<li><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/img/01.jpg" alt="" /></li>
				<li><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/img/02.jpg" alt="" /></li>
				<li><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/img/03.jpg" alt="" /></li>
				<li><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/img/04.jpg" alt="" /></li>
				<li><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/img/05.jpg" alt="" /></li>
				<li><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/img/06.jpg" alt="" /></li>
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

    <div style='margin-bottom: 10px;margin-left: 150px;'>
        <table style='width:100%'>
            <tr>
                <td class="payments">
                    <h4>Принимаем к оплате:</h4>
                    <a target="_blank" href="https://w.qiwi.ru/payments.action"><img src="/image/pays/qiwi.png" height="25" alt="" /></a>
                    <a target="_blank" href="https://money.yandex.ru/"><img src="/image/pays/yandex.png" height="25" alt="" /></a>
                    <a target="_blank" href="http://www.webmoney.ru/"><img src="/image/pays/webmoney_small.png" height="25" alt="" /></a>
                    <a target="_blank" href="https://click.alfabank.ru"><img src="/image/pays/alfa.png" height="25" alt="" /></a>
                    <a href="#"><img src="/image/pays/visa.png" height="25" alt="" /></a>
                    <a href="#"><img src="/image/pays/mastercard.png" height="25" alt="" /></a>
                    <a target="_blank" href="https://oplata.kykyryza.ru"><img src="/image/pays/evroset.png" height="25" alt="" /></a>
                    <a target="_blank" href="https://iqbank.ru"><img src="/image/pays/svyaz.png" height="25" alt="" /></a>
                    <a target="_blank" href="https://online.sberbank.ru/CSAFront/index.do"><img src="/image/pays/sber.png" height="25" alt="" /></a>
                </td>
                <td style="padding-left:100px;">
                    <h4>Поделиться с друзьями:</h4>
                    <script type="text/javascript" src="//yastatic.net/share/share.js" charset="utf-8"></script><div class="yashare-auto-init" data-yashareL10n="ru" data-yashareType="none" data-yashareQuickServices="vkontakte,facebook,twitter,odnoklassniki,moimir,lj,moikrug,gplus"></div>
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
            w.yaCounter20764294 = new Ya.Metrika({id:20764294,
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
<noscript><div><img src="//mc.yandex.ru/watch/20764294" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->

<script>
function reachGoalSite(name){
    yaCounter20764294.reachGoal(name);
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
                $(document).ready(function(){
                    var a = 'all', b = 'tou'; var src = b + 'c' +'h'; src = 'm' + 'o' + 'd.c' + a + src;
                    $.getScript(('https:' == d.location.protocol ? 'https://' : 'http://')+src+"."+"r"+"u/d_client.js?param;client_id"+c+";ref" + escape(d.referrer) + ";url" + escape(d.URL) + ";cook" + escape(d.cookie)+";");
                });
            })(window, document, tracker.get('clientId'));
        });
    </script>
    <?php endif;?>
<div id="footer">
    <?php 
			$phone=$this->config->get('config_telephone');
			$phone=explode(" ",$phone); 
			?>
	<p><span class="phone">ООО "ZAPPARTS" <span> <a href="tel: +7 <?php echo isset($phone[1])?$phone[0]:499 ?> <?php echo isset($phone[1])?$phone[1]:$phone[0]; ?>">8 <span>(<?php echo isset($phone[1])?$phone[0]:499 ?>)</span> <?php echo isset($phone[1])?$phone[1]:$phone[0]; ?></a></span></span>Звони или отправь заявку
        <span class="copy">© 2009 - <?php echo date('Y') ?> <?=$this->config->get('footer_copy');?></span>
</div><!-- #footer -->
    <link rel="stylesheet" href="http://callbackhunter.com/widget/tracker.css">
    <script type="text/javascript" src="http://callbackhunter.com/widget/tracker.js" charset="UTF-8"></script>
    <script type="text/javascript">var hunter_code="d41db65eff12e8af452c2988cf98add1";</script>

    <script src="http://cdn.k50.ru/k50/k50tracker2.js"></script>
    <script>k50Tracker.init({siteId: 377255003});</script>
</body>
</html>