<script>
    $(document).ready(function(){        
          var hideForm=function(){
             $("div.DarkBg").hide();
             $("div.Popup.review").hide();
		$.each($('#review-form').find('tr:has(font)').find('input'),
  			function(key,item){
				$(item).parent().parent().css('border-color','#A7A7A7');
			});

          }
          $("div.DarkBg").click(hideForm);
          $("div.Popup.review .CloseButton").click(hideForm);    
          $("div.button.cancel").click(hideForm);
          
          $("a.ddd").click(function(){
                $('#review-form').trigger( 'reset' );
                $("div.Popup.review .successHide").show();
                $("div.Popup.review .successShow").hide();
                $("div.DarkBg").show();
                $("div.Popup.review").show();
                $("div.Popup.review").css("top",50);
                return false;
            });
    });
</script>
<div  class="DarkBg">&nbsp;</div>

<div class="Popup review" style="width: 600px; margin-left: -300px; display: none; ">
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
                        <form method="post" action="<?php echo $action; ?>" id="review-form">
                            <div class="Title">Оставить отзыв</div>
                            <div class="oT2 successHide">
                                <table>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <span>
                                                    ФИО:
                                                    <font color="red">*</font>
                                                </span>
                                            </td>
                                            <td>
                                                <div class="inputText">
                                                    <i>
                                                        <b>
                                                            <input type="text" value="" name="review[name]">
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
                                                <div class="inputText" style="width:150px;">
                                                    <i>
                                                        <b>
                                                            <input id="phone_number" class="phonemask" type="text" value="" name="review[phone]">
                                                        </b>
                                                    </i>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span>
                                                    Город:
                                                    <font color="red">*</font>
                                                </span>
                                            </td>
                                            <td>
                                                <div class="inputText" style="width:150px;">
                                                    <i>
                                                        <b>
                                                            <input type="text" value="" name="review[city]">
                                                        </b>
                                                    </i>
                                                </div>
                                            </td>
                                        </tr>                                        
                                        <tr>
                                            <td>
                                                <span>
                                                    Отзыв:
                                                    <font color="red">*</font>
                                                </span>
                                            </td>
                                            <td>
                                                <div class="textarea">
                                                    <i>
                                                        <b>
                                                            <textarea style="height:200px;" rows="10" cols="30" name="review[message]"></textarea>
                                                        </b>
                                                    </i>
                                                </div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <span>Ваша фотография:</span>
                                            </td>
                                            <td>
                                                <div>
                                                    <input type="file" value="" name="image">
                                                </div>
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <td>
                                                <span>Видео с youtube:</span>
                                            </td>
                                            <td>
                                                <div>
                                                    <input type="text" value="" name="review[youtube]"> <span> http://youtu.be/...</span>
                                                </div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="empty"> </td>
                                            <td>
                                                <div class="Buttons">
                                                    <div class="button red send" id="submit-button">
                                                        <i>
                                                            <b>Отправить</b>
                                                        </i>
                                                    </div>
                                                    <div class="button gray cancel">
                                                        <i>
                                                            <b>Отмена</b>
                                                        </i>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="Descr successShow" style="display:none">
                                <br>
                                Ваш отзыв добавлен. Спасибо! Нам очень важно ваше мнение.
                            </div>    
                            <div class="Buttons successShow" style="display:none;text-align:center;">
                                <div class="button gray cancel">
                                    <i>
                                        <b>ОК</b>
                                    </i>
                                </div>
                            </div>    
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
   $(document).ready(function() { 
        $("#submit-button").click(function(){
		var err=false;
		$.each($('#review-form').find('tr:has(font)').find('input, textarea'),
  			function(key,item){
				if ($.trim($(item).val()).length==0){
					 err=true;
					$(item).parent().parent().css('border-color','red');
					$(item).change(function(){
						if ($.trim($(this).val()).length>0){
							$(item).parent().parent().css('border-color','#A7A7A7');

						}
					});
				}else{
					$(item).parent().parent().css('border-color','#A7A7A7');
				}
			});
		if (err){
			alert('Пожалуйста, заполните все обязательные поля!');
			return;
		}
		$('#review-form').submit();
	});
        $('#review-form').ajaxForm({
            dataType:'json',
            success:function(res){                
                if (res.error) alert(res.error);
                else {
                    $('div.successHide').hide();
                    $('div.successShow').show();
                }
            },
            error:function(resp){
                alert(resp.responseText);
            }
        }); 
    }); 
</script>