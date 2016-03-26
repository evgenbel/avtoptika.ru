<?php echo $header; ?>


<div id="content">
    <div class="text_box3">
        <span class="block_title">Качественный ремонт для всех иномарок</span>
        <ul class="model_list">
            <li><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/img/model_1.jpg" alt="" /></li>
            <li><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/img/model_2.jpg" alt="" /></li>
            <li><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/img/model_3.jpg" alt="" /></li>
        </ul>
    </div>
    
    <div class="text_box1">
        <span class="block_title">Пять преимуществ, стать нашими клиентами!</span>
        <ul class="advantage_list">
            <li class="li_1">
                <span>Гарантия качества</span>
                <p>Высоко квалифицированные сотрудники профессионально выполнят все работы и заменят детали качественно и со знанием дела.</p>
            </li>
            <li class="li_2">
                <span>Конкурентная цена</span>
                <p>В отличии от официальных дилеров у нас нет завышенных требований к стоимости норма часа, и  работая на прямую c поставщиками запчастей и  минуя длинную цепочку поставщиков, можем так же предложить приятные цены на автозапчасти. </p>
            </li>
            <li class="li_3">
                <span>Сроки выполнения работ</span>
                <p>Мы понимаем, что каждый автовладелец может сильно зависить от своего автомобиля и находиться без него больше одного дня крайне не удобно, поэтому мы осуществляем ремонт максимально быстро, как это возможно, и что не мало важно, скорость ремонта не влияет на качество. Так же большим плюсом, который влияет на сроки ремонта, это наличие собственного склада запчастей, и вам не придется заказывать и ждать запчасти для ремонта по несколько дней.</p>
            </li>
            <li class="li_4">
                <span>Не понравится, Вернем деньги!</span>
                <p>Если вам по какой-либо причине не понравилось как произведен ремонт, то мы вернём вам деньги или переделаем работу совершенно бесплатно!</p>
            </li>
            <li class="li_5">
                <span>С нами удобно и комфортно</span>
                <p>Во время ремонта, вашего автомобиля, вы можете с комфортом провести время, в специальной зоне отдыха клиентов, где всегда сможете вкусно перекусить в кафе, или просто получить незабываемые ощущения от проведенного времени в массажном кресле. Также что не мало важно после ремонта вы получите свой автомобиль в чистом виде, т.к. для клиентов автосервиса у нас бесплатная мойка в подарок!</p>
            </li>
        </ul>
    </div>
    <!--div class="text_box2">
        <span class="block_title2">ОТЗЫВЫ наших клиентов</span>
        <ul class="advantage_list2">
            <?php /*if(is_array($reviews)): ?>
            <?php foreach($reviews as $key=>$review): ?>
            <?php if($key>0) echo '<div class="bord"></div>';?>
            <li class="list2 wimg">
                <?php if($review['foto']): ?>
                <img src="<?php echo '/image/' . $review['foto']?>" width="91" alt="" />
                <?php else: ?>    
                            <img src="/image/no_image.jpg"  height="121" alt="" /> <br/>
                <?php endif; ?>    
                <?php if(mb_strlen($review['text'],'utf-8')>$review_piece_length): ?>
                    <p class="list2 peace"><?php echo mb_substr(nl2br($review['text']),0,$review_piece_length,'utf-8') ?>...</p>
                    <p class="list2 all" style='display:none'><?php echo nl2br($review['text']) ?></p>
                <?php else: ?>                        
                    <p class="list2 all" ><?php echo nl2br($review['text']) ?></p>                    
                <?php endif; ?>
                <p class="name"><?php echo $review['author'] ?></p>
                <p class="name"><?php echo $review['city'] ?></p>
            </li>                                
            <?php endforeach; ?>    
            <?php endif;*/ ?>
        </ul>
        <ul class="advantage_list3">
            <li class="list3">
                <a href="#" class="ddd"><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/img/otz-btn.png" width="160" height="37" alt="" /></a>
                <a href="<? echo $rev_link; ?>" class="ppp"> Посмотреть<br /> все отзывы</a>

            </li>

        </ul>

    </div-->
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
<div class="our-works">
    <span class="block_title">Наши работы, и их примеры</span>
    <div class="left">
        <h2>До ремонта</h2>
        <div>
            <img src="/image/data/our_works/1.jpg" />
        </div>
        <div>
            <img src="/image/data/our_works/2.jpg" />
        </div>
        <div>
            <img src="/image/data/our_works/3.jpg" />
        </div>
        <div>
            <img src="/image/data/our_works/4.jpg" />
        </div>
        <div>
            <img src="/image/data/our_works/5.jpg" />
        </div>
        <div>
            <img src="/image/data/our_works/6.jpg" />
        </div>
        <div>
            <img src="/image/data/our_works/7.jpg" />
        </div>
        <div>
            <img src="/image/data/our_works/8.jpg" />
        </div>
        <div>
            <img src="/image/data/our_works/9.jpg" />
        </div>
        <div>
            <img src="/image/data/our_works/100.jpg" />
        </div>
        <div>
            <img src="/image/data/our_works/200.jpg" />
        </div>
        <div>
            <img src="/image/data/our_works/300.jpg" />
        </div>
    </div>
    <div class="right">
        <h2>После ремонта</h2>
        <div>
            <img src="/image/data/our_works/1.1.jpg" />
        </div>
        <div>
            <img src="/image/data/our_works/22.jpg" />
        </div>
        <div>
            <img src="/image/data/our_works/33.jpg" />
        </div>
        <div>
            <img src="/image/data/our_works/44.jpg" />
        </div>
        <div>
            <img src="/image/data/our_works/55.jpg" />
        </div>
        <div>
            <img src="/image/data/our_works/66.jpg" />
        </div>
        <div>
            <img src="/image/data/our_works/77.jpg" />
        </div>
        <div>
            <img src="/image/data/our_works/88.jpg" />
        </div>
        <div>
            <img src="/image/data/our_works/99.jpg" />
        </div>
        <div>
            <img src="/image/data/our_works/110.jpg" />
        </div>
        <div>
            <img src="/image/data/our_works/220.jpg" />
        </div>
        <div>
            <img src="/image/data/our_works/330.jpg" />
        </div>
    </div>
</div>
<div class="clear"></div>
<div class="reviews">
<span class="block_titla">ОТЗЫВЫ наших клиентов</span>
<ul class="advantage_lista">
    <?php if(is_array($reviews_n)): ?>
    <?php foreach($reviews_n as $key=>$review): ?>
    <?php if($key>0) echo '<div class="bord"></div>';?>
    <li class="li_a wimg">
        <div class='left'>
            <?php if($review['foto']): ?>
            <img src="<?php echo '/image/' . $review['foto']?>" height="121" alt="" /> <br/>
            <?php else: ?>
            <img src="/image/no_image.jpg"  height="121" alt="" /> <br/>
            <?php endif; ?>
            <?php if($review['video']  and $review['video']!='http://youtube.com/embed/'): ?>
            <a href="<?php echo $review['video']; ?>" class='fancybox iframe'>
                <img src="/image/play.png" width="40px" /> <span style='margin-top:-30px;margin-left:50px;display:block;'>Видео</span>
            </a>
            <?php endif; ?>
        </div>
        <p class="text-riwe" ><?php echo nl2br($review['text']) ?></p>
        <p class="name"><?php echo $review['author'] ?></p>
        <p class="name"><?php echo $review['city'] ?></p>
        <p class="name"><?php echo date('d.m.Y',strtotime($review['date_added'])) ?></p>
    </li>
    <?php endforeach; ?>
    <?php endif; ?>
</ul>




<p><a href="#" class="ddd"><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/img/otz-btn.png" width="160" height="37" alt="" /> </a></p>
</div><!-- #content-->

<div class="clear"></div>
<div class="tslog">
     <p>
     Мы всегда идём клиентам  на встречу, ведь лучшая благодарность для нас – <br />
        это довольный клиент, который получит удовольствие от работы с нами <br />
        и будет советовать нас своим друзьям!
     </p>
 </div>

<?php echo $content_top; ?>
<?php echo $content_bottom; ?>
<?php echo $footer; ?>
