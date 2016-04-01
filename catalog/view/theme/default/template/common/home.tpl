<?php echo $header; ?>	
	<div id="content">
		<div class="text_box1">
			<span class="block_title">Пять ключевых преимуществ, работы с нами</span>
			<ul class="advantage_list">
				<li class="li_1">
					<span>Гарантия качества</span>
					<p>Мы работаем непосредственно с производителями запчастей и с уверенностью можем  гарантировать вам полное отсутствие подделок и контрафакта.</p>
				</li>
				<li class="li_2">
					<span>Конкурентная цена</span>
					<p>Мы являемся официальными дилерами заводов производителей и отсутствие посредников между производителем и покупателем позволяет нам предлагать не завышенные цены.</p>
				</li>
				<li class="li_3">
					<span>Сроки поставки от 0 дней</span>
					<p>Если вдруг не нашлось нужного товара у нас на складе, то благодаря налаженной логистике мы сможем поставить вам товар от 0 до 2 дней с наших центральных складов.</p>
				</li>
				<li class="li_4">
					<span>Не нравится - верните</span>
					<p>Если вам по какой-либо причине не понравился наш товар, то мы вернём вам деньги или заменим на аналогичный товар, который полностью удовлетворит ваши запросы.</p>
				</li>
				<li class="li_5">
					<span>С нами удобно</span>
					<p>Мы всегда пойдём вам на встречу, ведь лучшая благодарность для нас – это довольный клиент, который получит удовольствие от работы с нами и будет советовать нас своим друзьям!</p>
				</li>
			</ul>
		</div>
	    <div class="text_box2">
        <span class="block_title2">ОТЗЫВЫ наших клиентов</span>
        <ul class="advantage_list2">
            <?php if(is_array($reviews)): ?>
            <?php foreach($reviews as $key=>$review): ?>
            <?php if($key>0) echo '<div class="bord"></div>';?>
            <li class="list2 wimg ">
                <?php if($review['foto']): ?>
                    <img src="<?php echo '/image/' . $review['foto']?>" width="91" alt="" />
                <?php else: ?>    
                    <img src="/image/no_image.jpg"  height="121" alt="" /> <br/>
                <?php endif; ?>    
                <?php if(mb_strlen($review['text'],'utf-8')>$review_piece_length): ?>
                    <p class="list2 peace"><?php echo mb_substr(nl2br($review['text']),0,$review_piece_length,'utf-8') ?>...</p>
                    <p class="list2 all" style='display:none'><?php echo nl2br($review['text']) ?></p>
                    <!--a href="" class="all_text"  >[Читать далее]»</a-->
                <?php else: ?>                        
                    <p class="list2 all" ><?php echo nl2br($review['text']) ?></p>                    
                <?php endif; ?>    
                <p class="name"><?php echo $review['author'] ?></p>
                <p class="name"><?php echo $review['city'] ?></p>
            </li>                                
            <?php endforeach; ?>    
            <?php endif; ?>    
        </ul>
        <ul class="advantage_list3">
            <li class="list3">
                <a href="#" class="ddd"><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/img/otz-btn.png" width="160" height="37" alt="" /></a>
                <a href="<? echo $rev_link; ?>" class="ppp"> Посмотреть<br /> все отзывы</a>

            </li>

        </ul>

    </div>
		
	</div><!-- #content-->
	<script>
    $(document).ready(function(){                                
    $("a.all_text").click(function(){                    
    $(this).parent().find("p.list2.peace").hide();
    $(this).parent().find("p.list2.all").show();
    $(this).hide();
    return false;
});    

});
</script>
<div class="clear"></div>
	<div class="text_box3">
			<span class="block_title">Оптика по марке и модели</span>
			<ul class="model_list">
				<li><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/model_1.jpg" alt="" /></li>
				<li><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/model_2.jpg" alt="" /></li>
				<li><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/model_3.jpg" alt="" /></li>
			</ul>
		</div>
<?php echo $content_top; ?>
<?php echo $content_bottom; ?>
<?php echo $footer; ?>
