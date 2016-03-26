<script>
    $(document).ready(function(){    
		
		  var first_focus_phone = true, first_focus_name = true;
          var hideForm=function(){
             $("div.DarkBg").hide();
             $("div.Popup.p_model_list").hide();
		$.each($('#review-form').find('tr:has(font)').find('input'),
  			function(key,item){
				$(item).parent().parent().css('border-color','#A7A7A7');
			});

          }
          $("div.DarkBg").click(hideForm);
          $("div.Popup.p_model_list .CloseButton").click(hideForm);    
          $("div.button.cancel").click(hideForm);
          
          $(".model_list img,#show_form,.li_1,.li_3").click(function(){
				if($(this).attr('id') == 'show_form'){
					$('#search_zapp').show();
					$('#search_predoplata').hide();
					$('#search_emidiatly').hide();
				}
				else if($(this).attr('id') == 'fast_order'){
					$('#search_emidiatly').show();
					$('#search_zapp').hide();
					$('#search_predoplata').hide();
				}
				else{
					$('#search_zapp').hide();
					$('#search_predoplata').show();
					$('#search_emidiatly').hide();
				}
                //$('#review-form').trigger( 'reset' );
                $("div.Popup.p_model_list .successHide").show();
                $("div.Popup.p_model_list .successShow").hide();
                $("div.DarkBg").show();
                $("div.Popup.p_model_list").show();
                $("div.Popup.p_model_list").css("top",50);

				if(typeof($(this).attr("alt")) != 'undefined'){
					$("#comment").text($(this).attr("alt") + ' ' + $("#search_phrase").text());}

				if($('#search_value').val() != '')
					$("#comment").text($('#search_value').val());
                return false;
            });
			$(".phonemask").focus(function(){
				if (first_focus_phone){
					$(this).attr("placeholder",$(this).val());
					$(this).val("");
					first_focus_phone = false;
				}
			});
			$(".phonemask").blur(function(){			
				if ($(this).val()==""){					
					$(this).val($(this).attr("placeholder"));
					first_focus_phone = true;
				}
			});
			$("#zakaz_firstname").focus(function(){
				if (first_focus_name){
					$(this).attr("placeholder",$(this).val());
					$(this).val("");
					first_focus_name = false;
				}
			});
			$("#zakaz_firstname").blur(function(){
				if ($(this).val()==""){
					$(this).val($(this).attr("placeholder"));
					first_focus_name = true;
				}
			});
			$("#zakaz_firstname_popup").focus(function(){
				if (first_focus_name){
					$(this).attr("placeholder",$(this).val());
					$(this).val("");
					first_focus_name = false;
				}
			});
			$("#zakaz_firstname_popup").blur(function(){
				if ($(this).val()==""){
					$(this).val($(this).attr("placeholder"));
					first_focus_name = true;
				}
			});
    });
</script>
<div  class="DarkBg">&nbsp;</div>
<div class="Popup p_model_list" style="width: 600px; margin-left: -300px; display: none;">
    <div class="in">
        <div class="Bg">
            <div class="t">
                <i><b> </b></i>                        
            </div>
            <div class="m">
                <i>
                    <b>
                        <u>
                            <tt> </tt>
                        </u>
                    </b>
                </i>
            </div>
            <div class="b">
                <i>
                    <b> </b>
                </i>
            </div>
        </div>
        <div class="C">
            <div class="in">
                <div class="CloseButton">X</div>
                <div class="Block">
                    <div class="PopupBlock">
                        <h4 id="search_zapp" style='font-size:30px;margin:0px;text-align: center;'>Ищите запчасти?</h4><br />						
						<h4 id="search_predoplata" style='font-size:30px;margin:0px;text-align: center;'>Оформить заказ без предоплаты</h4><br />
						<h4 id="search_emidiatly" style='font-size:26px;margin:0px;text-align: center;'>Оформить срочную доставку</h4><br />
						<h4 style='font-size:24px; font-weight: bold; margin:0px;text-align: center;'><?php echo $search_phrase?$search_phrase:""; ?></h4><br />
						<h4 style='font-size:30px; font-weight: bold; color:red;margin:0px;text-align: center;'>Отправьте запрос на подбор</h4><br />
						<form method="post" id="model_list_zakaz-form">
							<input type="hidden" id="utm_source" value="<?php echo $utm_source;?>" />
							<input type="hidden" id="utm_campaign" value="<?php echo $utm_campaign;?>" />
							<p style='text-align: center;font-weight: bold;margin: 0;font-size:16px;'>менеджеры подберут вам запчасть в течение 15 мин.</p>
							<div style="margin:0px auto; width: 460px;">
								<input class="name" id="zakaz_firstname_popup" style='border:1px solid black;border-radius: 5px;width: 100%;background-color: #d9d9d9;padding:5px;margin-top:5px;' type="text" name="zakaz[firstname]" id="zakaz_firstname" placeholder="Ваше имя*" value="<?php echo $username;?>"/>
							</div>
							<div style="margin:0px auto; width: 460px;">
								<input class="phone_number phonemask" style='border:1px solid black;border-radius: 5px;width: 100%;background-color: #d9d9d9;padding:5px;margin-top:5px;' type="text" name="zakaz[phone]" class="phonemask" placeholder="+7 XXX XXXXXXX" placeholder="Телефон" value="<?php echo $userphone;?>" />
							</div>
							<div style="margin:0px auto; width: 460px;">
								<textarea id="comment" class="comment" style='border:1px solid black;border-radius: 5px;width: 100%;padding:5px;margin-top:5px;font-size:18px;font-weight: bold;' name="zakaz[note]" placeholder="Комментарий" ><?php echo $search_phrase?$search_phrase:""; ?></textarea>
							</div>
							<div style="font-size:13px;margin:0px auto; width: 410px;padding: 5px 0px; font-weight: bold;text-align: center;">
								<img src='http://autot.invbl.ru/catalog/view/theme/tormoza/img/lock.png' style="float: left;width: 50px;" />
								Ваши данные необходимы только для связи с Вами и не передаются третьим лицам
							</div>
							<div style="clear:both;"></div>
							<button class="zapros_button" onclick="sendinfoThanks_();return false;" style="cursor: pointer; padding:10px 20px;border:0px;font-weight: bold; font-size: 20px;margin:10px auto;text-align: center;display: block;margin-bottom:30px;height: 65px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
						</form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>