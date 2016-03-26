<?php echo $header; ?>
<div id="content">
         <span class="block_title">ОТЗЫВЫ наших клиентов</span>
	   <ul class="advantage_lista">
                <?php if(is_array($reviews)): ?>
                <?php foreach($reviews as $key=>$review): ?>
                    <?php if($key>0) echo '<div class="bord"></div>';?>
                    <li class="li_a wimg">
                        <div class='left'>
                        <?php if($review['foto']): ?>
                            <img src="<?php echo '/image/' . $review['foto']?>"  height="121" alt="" /> <br/>
                        <?php else: ?>    
                            <img src="/image/no_image.jpg"  height="121" alt="" /> <br/>
                        <?php endif; ?>                            
                        <?php if($review['video'] and $review['video']!='http://youtube.com/embed/'): ?>
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
        <?php echo $content_bottom; ?>
<?php echo $footer; ?>
