
<div id="bottom_block">
    <div >
	<span class="block_title_footer" >
	    <?php echo nl2br($this->config->get('footer_underzakaz')); ?>
	</span>
	<img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/img/arrow.png" width="50px" alt="" />
    </div>
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
<div class="icons_pay_and_soc">
    <table>
	<tr>
	    <td>
            <h4>Поделиться с друзьями:</h4>
            <script type="text/javascript" src="//yastatic.net/share/share.js" charset="utf-8"></script><div class="yashare-auto-init" data-yashareL10n="ru" data-yashareType="none" data-yashareQuickServices="vkontakte,facebook,twitter,odnoklassniki,moimir,lj,moikrug,gplus"></div>
            <!-- 
            <div class="addthis_toolbox addthis_default_style addthis_32x32_style">
                <a class="addthis_button_vk"></a>
                <a class="addthis_button_facebook"></a>
                <a class="addthis_button_livejournal"></a>
                <a class="addthis_button_mymailru"></a>
                <a class="addthis_button_moikrug"></a>
                <a class="addthis_button_odnoklassniki_ru"></a>
                <a class="addthis_button_twitter"></a>
                <a class="addthis_button_evernote"></a>
                <a class="addthis_button_google_plusone_share"></a>
            </div>
            <script type="text/javascript">
                var addthis_config = {
                    "data_track_addressbar":true,
                    "image":"<?php echo HTTP_IMAGE . $this->config->get('config_banner'); ?>"
                };
            </script>
            <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5231e9f458b4c327"></script>
            <!-- AddThis Button END -->
		</td>
	    <td>
            <h4>Внести предоплату:</h4>
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
	</tr>
    </table>
    
</div>
</div><!-- #wrapper -->
<!-- Yandex.Metrika informer -->
<a href="http://metrika.yandex.ru/stat/?id=22401397&amp;from=informer"
target="_blank" rel="nofollow"><img src="//bs.yandex.ru/informer/22401397/3_1_FFFFFFFF_EFEFEFFF_0_pageviews"
style="width:88px; height:31px; border:0;" alt="Яндекс.Метрика" title="Яндекс.Метрика: данные за сегодня (просмотры, визиты и уникальные посетители)" onclick="try{Ya.Metrika.informer({i:this,id:22401397,lang:'ru'});return false}catch(e){}"/></a>
<!-- /Yandex.Metrika informer -->

<!-- Yandex.Metrika counter -->
<script type="text/javascript">
(function (d, w, c) {
    (w[c] = w[c] || []).push(function() {
        try {
            w.yaCounter22401397 = new Ya.Metrika({id:22401397,
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
<noscript><div><img src="//mc.yandex.ru/watch/22401397" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->

<script>
function reachGoalSite(name){
    yaCounter22401397.reachGoal(name);
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
    <span class="phone">ZAPPARTS: <span class="phonen"> <a href="tel: +7 <?php echo isset($phone[1])?$phone[0]:499 ?> <?php echo isset($phone[1])?$phone[1]:$phone[0]; ?>">8 <span  class="ya_code">(<?php echo isset($phone[1])?$phone[0]:499 ?>)</span> <span  class="ya_phone" ><?php echo isset($phone[1])?$phone[1]:$phone[0]; ?></a></span></span></span>
	<span class="copy">© 2009 - <?php echo date('Y') ?> <?php echo $this->config->get('footer_copy');?></span>
</div><!-- #footer -->
<link rel="stylesheet" href="http://callbackhunter.com/widget/tracker.css">
<script type="text/javascript" src="http://callbackhunter.com/widget/tracker.js" charset="UTF-8"></script>
<script type="text/javascript">var hunter_code="d41db65eff12e8af452c2988cf98add1";</script>

<?php if($yandexphone): ?>
    <script src="http://cdn.k50.ru/k50/k50tracker2.js"></script>
    <script>k50Tracker.init({siteId: 377255003});</script>
<?php endif;?>
</body>
</html>