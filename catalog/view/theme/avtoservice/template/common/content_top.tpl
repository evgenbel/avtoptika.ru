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
              $("#model_list_zakaz-form > span").show();
              $("#model_list_zakaz-form .Title1").text('ТРЕБУЕТСЯ РЕМОНТ АВТОМОБИЛЯ?');
                $('#review-form').trigger( 'reset' );
                $("div.Popup.p_model_list .successHide").show();
                $("div.Popup.p_model_list .successShow").hide();
              $("#model_list_zakaz-form .Descr span").show();
              $("#model_list_zakaz-form .Descr br").show();
              $("#model_list_zakaz-form .Descr span").last().text('Наши менеджеры перезвонят вам в течении 30 мин.');
                $("div.DarkBg").show();
                $("div.Popup.p_model_list").show();
                $("div.Popup.p_model_list .comment").attr('placeholder','Марка машины, необходимый ремонт');
                $("div.Popup.p_model_list").css("top",50);
                return false;
            });

        $("#plus .li_1").click(function(){
            $('#review-form').trigger( 'reset' );
            $("div.Popup.p_model_list .successHide").show();
            $("div.Popup.p_model_list .successShow").hide();
            $("div.DarkBg").show();
            $("div.Popup.p_model_list").show();
            $("div.Popup.p_model_list").css("top",50);
            $("#model_list_zakaz-form .Descr span").hide();
            $("#model_list_zakaz-form .Descr br").hide();
            $("#model_list_zakaz-form .Descr span").last().text('свяжемся с вами в течение 15 минут');
            $("#model_list_zakaz-form .Descr span").last().show();
            $("#model_list_zakaz-form .Title1").text('Вызов Эвакуатора');
            $("#model_list_zakaz-form .Title1").css('margin-bottom','20px');
            $("div.Popup.p_model_list .comment").attr('placeholder','Ваши коментарии');
            return false;
        });

        $("#plus .li_3").click(function(){
            $('#review-form').trigger( 'reset' );
            $("div.Popup.p_model_list .successHide").show();
            $("div.Popup.p_model_list .successShow").hide();
            $("div.DarkBg").show();
            $("div.Popup.p_model_list").show();
            $("div.Popup.p_model_list").css("top",50);
            $("#model_list_zakaz-form .Descr span").hide();
            $("#model_list_zakaz-form .Descr br").hide();
            $("#model_list_zakaz-form .Descr span").last().text('свяжемся с вами в течение 15 минут');
            $("#model_list_zakaz-form .Descr span").last().show();
            $("#model_list_zakaz-form .Title1").text('Записаться на Диагностику');
            $("#model_list_zakaz-form .Title1").css('margin-bottom','20px');
            $("div.Popup.p_model_list .comment").attr('placeholder','Ваши коментарии');
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
                            <div class="Title1" style='font-size:24px;text-align:center;'>ТРЕБУЕТСЯ РЕМОНТ АВТОМОБИЛЯ?</div>
			    <div class="Descr successHide"><br/>

				<span style='color:red;font-weight:bold;font-size:180%;'><?php echo $search_phrase?$search_phrase."<br/>":""; ?></span><br/>
				<span style='font-size:120%;color:red;'>отправьте заявку на калькуляцию<br/>
и получите 10% скидки</span><br/><br/>
				<span>Наши менеджеры перезвонят вам в течении 30 мин.</span>
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
                                                <div class="textarea">
                                                    <i style="border-radius:5px">
                                                        <b>
                                                            <textarea style="height:100px;" rows="5" cols="30" class="comment" type="text" value="" placeholder="Марка машины, необходимый ремонт"></textarea>
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
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>