<script>
    $(document).ready(function(){        
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
          
          $(".model_list img").click(function(){
                $('#review-form').trigger( 'reset' );
                $("div.Popup.p_model_list .successHide").show();
                $("div.Popup.p_model_list .successShow").hide();
                $("div.DarkBg").show();
                $("div.Popup.p_model_list").show();
                $("div.Popup.p_model_list").css("top",50);
		$("span.brend").text($(this).attr("alt"));
		$("input.brend").val($(this).attr("alt"));
                return false;
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
                        <form method="post" id="model_list_zakaz-form">
			    <input class="brend" type="hidden" value="">
                            <div class="Title1 successHide" style='font-size:24px;text-align:center;'>Нужны шины?</div>
			    <div class="Descr successHide"><br/>

				<span style='color:red;font-weight:bold;font-size:160%;' class="brend"></span><br/><br/>
				<span style='font-size:120%;'>ЗВОНИ И УЗНАЙ ЦЕНУ!</span><br/><br/>
				<?php 
				$phone=$this->config->get('config_telephone');
				$phone=explode(" ",$phone); 
				?>
				<div class="phones" style="font-size: 200%;padding-top:5px;"><span>(<?php echo isset($phone[1])?$phone[0]:499 ?>)</span> <?php echo isset($phone[1])?$phone[1]:$phone[0]; ?></div><br/>
				ИЛИ<br/><br/>
				<span style='font-size:120%;'>ОТПРАВЬ ЗАЯВКУ</span><br/><br/>
				Наши менеджеры перезвонят вам в течении 30 мин.
			    </div>
                            <div class="oT2 successHide">
                                <table>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <span>
                                                    ИМЯ:
                                                    <font color="red">*</font>
                                                </span>
                                            </td>
                                            <td>
                                                <div class="inputText">
                                                    <i style="border-radius:5px">
                                                        <b>
                                                            <input class="name" type="text" value="" placeholder="Ваше имя">
                                                        </b>
                                                    </i>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span>
                                                    Телефон:
                                                    <font color="red">*</font>
                                                </span>
                                            </td>
                                            <td>
                                                <div class="inputText">
                                                    <i style="border-radius:5px">
                                                        <b>
                                                            <input class="phone_number phonemask" type="text" value="" placeholder="Телефон">
                                                        </b>
                                                    </i>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span>
                                                    Комментарии:                                                    
                                                </span>
                                            </td>
                                            <td>
                                                <div class="class="textarea"">
                                                    <i style="border-radius:5px">
                                                        <b>
                                                            <textarea style="height:100px;" rows="5" cols="30" class="comment" type="text" value="" placeholder="Радиус, размеры, количество"></textarea>
                                                        </b>
                                                    </i>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="empty"> </td>
                                            <td>
                                                <div class="Buttons">
                                                    <div class="button red send" style='padding:10px 60px;' onclick="sendinfo_();return false;">
                                                        <i>
                                                            <b style="font-size:120%;">Отправить</b>
                                                        </i>
                                                    </div>                                                    
                                                </div>
                                            </td>
                                        </tr>
					<tr>
                                            <td class="empty"> </td>
					    <td></td>
					 </tr>
                                    </tbody>
                                </table>
                            </div>       
			    <div class="Descr successShow" style="display:none">
                                <br>
                                Ваша заявка отправлена. Наши менеджеры свяжутся с вами в течении 30мин.
                            </div> 
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>