<?php echo $header; ?>

	
	<div id="content">
	<div class="text_box3">
		<span class="block_title_footer"><?php echo nl2br($this->config->get('footer_underbrand')); ?></span>
		<img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/img/arrow.png" width="50px" alt="" />
		<table class="model_list">
			<tr>
				<td><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/amtel.gif" alt="Amtel" /></td>
				<td><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/bf_goodrich.gif" alt="BGoodrich" /></td>
				<td><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/bridgestone.gif" alt="Bridgestone" /></td>
				<td><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/continental.gif" alt="Continental" /></td>
				<td><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/cordiant.gif" alt="Cordiant" /></td>
				<td><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/dunlop.gif" alt="DUNLOP" /></td>
			</tr>
			<tr>
				<td><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/gislaved.gif" alt="Gislaved" /></td>
				<td><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/goodride.gif" alt="Goodride" /></td>
				<td><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/goodyear.gif" alt="Goodyear" /></td>
				<td><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/kumho.gif" alt="Kumho Tyres" /></td>
				<td><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/maxxis.gif" alt="Maxxis" /></td>
				<td><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/michelin.gif" alt="Michelin" /></td>
			</tr>
			<tr>
				<td><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/pirelli.gif" alt="Pirelli" /></td>
				<td><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/sava.gif" alt="Sava" /></td>
				<td><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/tigar.gif" alt="Tigar" /></td>
				<td><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/yokogama.gif" alt="Yokogama" /></td>
				<td><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/barum.jpg" alt="Barum" /></td>
				<td><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/falken.jpg" alt="Falken" /></td>
			</tr>
			<tr>
				<td><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/hankook.jpg" alt="Hankook" /></td>
				<td><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/matador.jpg" alt="Matador" /></td>
				<td><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/nokian.jpg" alt="Nokian" /></td>
				<td><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/nordman.jpg" alt="Nordman" /></td>
				<td><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/toyo.jpg" alt="Toyo" /></td>
				<td><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/uniroyal.jpg" alt="Uniroyal" /></td>
			</tr>
		</table>
		<!--ul class="model_list">
            <li><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/model_1.jpg" alt="" /></li>
            <li><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/model_2.jpg" alt="" /></li>
            <li><img src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/data_img/model_3.jpg" alt="" /></li>
        </ul-->
	</div>
		<div class="text_box1">
			<span class="block_title">Пять ключевых преимуществ, работы с нами</span>
			<ul class="advantage_list">
			    <?php for($i=1;$i<6;$i++):?>
				<li class="li_<?php echo $i?>" style="background-image: url(<?php echo HTTP_IMAGE . $this->config->get('advantage'.$i.'_img'); ?>)">
					<span><?php echo html_entity_decode($this->config->get('advantage'.$i.'_title')); ?></span>
					<p><?php echo html_entity_decode($this->config->get('advantage'.$i.'_text')); ?></p>
				</li>
				<?php endfor;?>				
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


<?php echo $content_top; ?>
<?php echo $content_bottom; ?>
<?php echo $footer; ?>
