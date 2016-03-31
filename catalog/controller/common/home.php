<?php

class ControllerCommonHome extends Controller {

    public function index() {
        $this->document->setTitle($this->config->get('config_title'));
        $this->document->setDescription($this->config->get('config_meta_description'));

        $this->data['heading_title'] = $this->config->get('config_title');
	$this->data['heading_phone'] = $this->config->get('config_telephone');

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/home.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/common/home.tpl';
        } else {
            $this->template = 'default/template/common/home.tpl';
        }
        $months = array(
            1 => "Января",
            2 => "Февраля",
            3 => "Марта",
            4 => "Апреля",
            5 => "Мая",
            6 => "Июня",
            7 => "Июля",
            8 => "Августа",
            9 => "Сентября",
            10 => "Октября",
            11 => "Ноября",
            12 => "Декабря",
        );
        $tm = time();
        $d = ceil(floor($tm / (24 * 3600)) / 3);
        $tm = $d * 3 * 24 * 3600;
        $day = str_pad(date("d", $tm), 2, 0, STR_PAD_LEFT);
        $month = (int) date("m", $tm);

        $this->data['month'] = $months[$month];
        $this->data['days'] = array(substr($day, 0, 1), substr($day, 1));
        $this->data['rev_link'] = $this->url->link('common/home/reviews');

        $prId = 42;
        $this->load->model('catalog/review');
        $this->data['review_piece_length'] = 200;
        $this->data['reviews'] = $this->model_catalog_review->getReviewsByProductIdMain($prId,$this->config->get('config_store_id'), 0, 2);

        $this->data['reviews_n'] = $this->model_catalog_review->getReviewsByProductId($prId,$this->config->get('config_store_id'));

        $this->children = array(
            'common/column_left',
            'common/column_right',
            'common/content_top',
            'common/content_bottom',
            'common/footer',
            'common/header'
        );

        $this->response->setOutput($this->render());
    }

    public function thanks(){
        $this->data['title'] = $this->document->getTitle();
        $this->data['heading_title'] = $this->config->get('config_title');
        $this->data['description'] = $this->document->getDescription();
        $this->data['keywords'] = $this->document->getKeywords();
        $this->data['links'] = $this->document->getLinks();
        $this->data['styles'] = $this->document->getStyles();
        $this->data['scripts'] = $this->document->getScripts();

        $day = date("D");
        $minute = date("H")*60+date("i");


        if($day == 'Sun'){
            $work_from_sun = explode(':', $this->config->get('work_from_sun'));
            $work_from_work_hour = $work_from_sun[0];
            $work_from_work_min = $work_from_sun[1];

            $work_to_sun = explode(':', $this->config->get('work_to_sun'));
            $work_to_work_hour = $work_to_sun[0];
            $work_to_work_min = $work_to_sun[1];
        }else if($day == 'Sat') {
            $work_from_sat = explode(':', $this->config->get('work_from_sat'));
            $work_from_work_hour = $work_from_sat[0];
            $work_from_work_min = $work_from_sat[1];

            $work_to_sat = explode(':', $this->config->get('work_to_sat'));
            $work_to_work_hour = $work_to_sat[0];
            $work_to_work_min = $work_to_sat[1];
        }else {
            $work_from_work = explode(':', $this->config->get('work_from_work'));
            $work_from_work_hour = $work_from_work[0];
            $work_from_work_min = $work_from_work[1];

            $work_to_work = explode(':', $this->config->get('work_to_work'));
            $work_to_work_hour = $work_to_work[0];
            $work_to_work_min = $work_to_work[1];
        }

        if ($minute>$work_from_work_hour*60+$work_from_work_min || $minute<$work_to_work_hour*60+$work_to_work_min){
            $this->data['not_work'] = true;
        }else{
            $this->data['not_work'] = false;
        }



        $this->load->model('tool/image');
        if ($this->config->get('config_icon') && file_exists(DIR_IMAGE . $this->config->get('config_icon'))) {
            $this->data['icon'] = $this->model_tool_image->resize($this->config->get('config_icon'), 16, 16);;
            //$this->data['icon'] = "http://".$this->request->server['HTTP_HOST'] . '/image/' . $this->config->get('config_icon');
        } else {
            $this->data['icon'] = '';
        }

        $this->children = array(
            'common/footer',
            'common/header'
        );

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/thanks.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/common/thanks.tpl';
        } else {
            $this->template = 'default/template/common/thanks.tpl';
        }

        $this->response->setOutput($this->render());
    }
	
	public function captcha() {
		$this->load->library('captcha');
		
		$captcha = new Captcha();
		
		$this->session->data['captcha'] = $captcha->getCode();
		
		$captcha->showImage();
	}

    public function savereview() {
        $prId = 42;
        $this->load->model('catalog/review');
        $dataS = $this->request->post['review'];
        $data = array();		
        if (isset($this->request->files['image']) && $this->request->files['image']['tmp_name']) {
            $res = $this->upload();
            if (isset($res['error'])) {//ошибка загузки фото
                $this->response->setOutput(json_encode($res));
                return;
            }
            $data['foto'] = 'data/' . $res['filename'];
        } else $data['foto'] ="";

        if (!empty($dataS['youtube'])){
            $pre = 'http://youtu.be/';
            if (substr($dataS['youtube'], 0, strlen($pre)) != $pre) {//неверная ссылка
                $res['error']="Не верная ссылка на видео, должно быть в формате http://youtu.be/...";
                $this->response->setOutput(json_encode($res));
                return;
            }
            $data['video'] = "http://youtube.com/embed/" . substr($dataS['youtube'], strlen($pre));
        } else $data['video'] ="";
		if (!isset($dataS['captcha']) || ($this->session->data['captcha'] != $dataS['captcha'])) {
			$res['error']="Не верно введена капча";
			$this->response->setOutput(json_encode($res));
			return;
		}
        $data['name']=$dataS['name'];
        $data['text']=$dataS['message'];
        $data['rating']=5;
        $data['phone']=$dataS['phone'];
        $data['city']=$dataS['city'];
        $data['duties']="";
        $data['website']="";
        $data['store']=$this->config->get('config_store_id');
        $this->model_catalog_review->addReview($prId, $data);
        $res=array('error'=>0);
        $this->response->setOutput(json_encode($res));
    }

    public function upload() {
        $json = array();

        if (isset($this->request->files['image']) && $this->request->files['image']['tmp_name']) {
            $filename = basename(html_entity_decode($this->request->files['image']['name'], ENT_QUOTES, 'UTF-8'));

            if ((strlen($filename) < 3) || (strlen($filename) > 255)) {
                $json['error'] = "Неверное имя файла";
            }

            $directory = rtrim(DIR_IMAGE . 'data/');

            if (!is_dir($directory)) {
                $json['error'] = "Не могу сохранить, отсутствует дирректория сохранения";
            }

            if ($this->request->files['image']['size'] > 300000) {
                $json['error'] = "Слишком большой файл";
            }

            $allowed = array(
                'image/jpeg',
                'image/pjpeg',
                'image/png',
                'image/x-png',
                'image/gif',
                'application/x-shockwave-flash'
            );

            if (!in_array($this->request->files['image']['type'], $allowed)) {
                $json['error'] = "Тип файла не поддерживается";
            }

            $allowed = array(
                '.jpg',
                '.jpeg',
                '.gif',
                '.png',
                '.flv'
            );

            if (!in_array(strtolower(strrchr($filename, '.')), $allowed)) {
                $json['error'] = "Тип файла не поддерживается";
            }

            if ($this->request->files['image']['error'] != UPLOAD_ERR_OK) {
                $json['error'] = 'error_upload_' . $this->request->files['image']['error'];
            }
        } else {
            $json['error'] = "Ошибка файла";
        }

        if (!isset($json['error'])) {
            if (@move_uploaded_file($this->request->files['image']['tmp_name'], $directory . '/' . $filename)) {
                $json['success'] = "";
                $json['filename'] = $filename;
            } else {
                $json['error'] = "Не удалось сохранить файл";
            }
        }
        return $json;
    }

    public function reviews() {
        $this->document->setTitle($this->config->get('config_title'));
        $this->document->setDescription($this->config->get('config_meta_description'));

        $this->data['heading_title'] = $this->config->get('config_title');

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/reviews.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/common/reviews.tpl';
        } else {
            $this->template = 'default/template/common/home.tpl';
        }

        $prId = 42;
        $this->load->model('catalog/review');
        $this->data['reviews'] = $this->model_catalog_review->getReviewsByProductId($prId,$this->config->get('config_store_id'));

        $this->children = array(
            'common/column_left',
            'common/column_right',
            'common/content_top',
            'common/content_bottom',
            'common/footer',
            'common/header'
        );

        $this->response->setOutput($this->render());
    }
	
	public function callTouch() {		
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_HTTPHEADER, array("Content-type: application/x-www-form-urlencoded;charset=utf-8"));

		curl_setopt($ch, CURLOPT_URL,"http://api.calltouch.ru/calls-service/RestAPI/requests/orders/register/");
		curl_setopt($ch, CURLOPT_POST, 1);
		if(isset($this->request->post['vin']))
			curl_setopt($ch, CURLOPT_POSTFIELDS,
			"clientApiId=810974240ctfb8ceae952a68d330d5a18265dd4390d&sessionId=" . $this->request->post['sessionId'] . "&name=" . $this->request->post['name'] ."&phoneNumber=" . $this->request->post['phone'] ."&vin=" . $this->request->post['vin'] ."&message=" . $this->request->post['txt']);
		else
			curl_setopt($ch, CURLOPT_POSTFIELDS,
			"clientApiId=810974240ctfb8ceae952a68d330d5a18265dd4390d&sessionId=" . $this->request->post['sessionId'] . "&name=" . $this->request->post['name'] ."&phoneNumber=" . $this->request->post['phone'] ."&message=" . $this->request->post['txt']);

		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		$calltouch = curl_exec ($ch);

        if (!empty($calltouch)){
            $calltouch = json_decode($calltouch);
            $_SESSION['calltouchOrderNumber'] = $calltouch->order->orderNumber;
            echo json_encode(array("success"=>1));
        }
		
		curl_close ($ch);
        exit;
	}

    public function ajaxmail() {
        $order_id = $this->addOrder();
		$add_emails = $this->config->get('config_add_emails');
		if(!empty($add_emails)){
			$this->load->model('setting/setting');
			$add_emails = explode(',', $add_emails);
			
			$current_email = $this->config->get('current_email');
			if(isset($current_email) && !empty($current_email)){
				$key = array_search($current_email, $add_emails);				
				if(isset($add_emails[$key+1]))
					$current_email = $add_emails[$key+1];
				else
					$current_email = $add_emails[0];
			}
			else
				$current_email = $add_emails[0];
				
			$this->model_setting_setting->editSetting($_SERVER['HTTP_HOST'] . '_current_email', array($_SERVER['HTTP_HOST'] . '_current_email' => $current_email));		
			
			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->hostname = $this->config->get('config_smtp_host');
			$mail->username = $this->config->get('config_smtp_username');
			$mail->password = $this->config->get('config_smtp_password');
			$mail->port = $this->config->get('config_smtp_port');
			$mail->timeout = $this->config->get('config_smtp_timeout');
			$mail->setTo($current_email);
			$mail->setFrom("avto-spectr@mail.ru");
			$mail->setSender($this->config->get('config_name'));
			$parts = explode('@', $current_email);
			$mail->setSubject(html_entity_decode('Поступила новая заявка №' . $order_id . ' на почту ' . $parts[0], ENT_QUOTES, 'UTF-8'));

			$name = $this->request->post['name'];
			$phone = $this->request->post['phone'];
			$vin = $this->request->post['vin'];
			$txt = $this->request->post['txt'];
			$body = 'Заказ:' . $order_id . "\r\n";
			$body.= $name . "\r\n";			
			$body.= $phone . "\r\n";
			$body.='Vin:' . $vin . "\r\n";
			$body.= $txt . "\r\n\r\n";

            if(!empty($_SESSION['calltouchOrderNumber'])){
                $body.= 'Calltouch:' . $_SESSION['calltouchOrderNumber'] . "\r\n";
            }
			if(!empty($this->request->post['utm_campaign']))
				$body.= $this->request->post['utm_campaign'] . "\r\n";
			
			if(!empty($this->request->post['utm_source']))
				$body.= 'Канал:' . $this->request->post['utm_source'] . "\r\n";
			if(!empty($this->request->post['referer']))
				$body.= 'Источник:' . $this->request->post['referer'] . "\r\n";	

			$mail->setText(html_entity_decode($body, ENT_QUOTES, 'UTF-8'));
			$mail->send();
		}
		
		$mail = new Mail();
		$mail->protocol = $this->config->get('config_mail_protocol');
		$mail->parameter = $this->config->get('config_mail_parameter');
		$mail->hostname = $this->config->get('config_smtp_host');
		$mail->username = $this->config->get('config_smtp_username');
		$mail->password = $this->config->get('config_smtp_password');
		$mail->port = $this->config->get('config_smtp_port');
		$mail->timeout = $this->config->get('config_smtp_timeout');
		$mail->setTo($this->config->get('config_email'));
		//$mail->setTo('evgenbel@bk.ru');
		$mail->setFrom("avto-spectr@mail.ru");
		$mail->setSender($this->config->get('config_name'));
		if(isset($parts[0]))
			$mail->setSubject(html_entity_decode('Поступила новая заявка №' . $order_id . ' на почту ' . $parts[0], ENT_QUOTES, 'UTF-8'));
		else
			$mail->setSubject(html_entity_decode('Поступила новая заявка №' . $order_id, ENT_QUOTES, 'UTF-8'));

		$name = $this->request->post['name'];
		$phone = $this->request->post['phone'];
		$vin = $this->request->post['vin'];
		$txt = $this->request->post['txt'];
		$body = 'Заказ:' . $order_id . "\r\n";
		$body.= $name . "\r\n";			
		$body.= $phone . "\r\n";
		$body.='Vin:' . $vin . "\r\n";
        $body.= $txt . "\r\n\r\n";

        if(!empty($_SESSION['calltouchOrderNumber'])){
            $body.= 'Calltouch:' . $_SESSION['calltouchOrderNumber'] . "\r\n";
            unset($_SESSION['calltouchOrderNumber']);
        }

		if(!empty($this->request->post['utm_campaign']))
			$body.= $this->request->post['utm_campaign'] . "\r\n";
			
		if(!empty($this->request->post['utm_source']))
			$body.= 'Канал:' . $this->request->post['utm_source'] . "\r\n";

        if(!empty($this->request->post['referer']))
			$body.= 'Источник:' . $this->request->post['referer'] . "\r\n";	
			
		$mail->setText(html_entity_decode($body, ENT_QUOTES, 'UTF-8'));
		$mail->send();
		
        die('{"status":"ok","descr":"Ваша заявка отправлена !"}');
    }
	
	public function saveCurEmail(){
        $this->load->model('account/customer');
        $customer_id = $this->customer->getId();
        $email = $this->customer->getEmail();
        $exists = $this->model_account_customer->checkEmailWithEmail($email);

        if(!$exists){
            $this->model_account_customer->saveEmail($email, $customer_id);
        }
        $this->redirect($this->url->link('account/account', '', 'SSL'));
    }

	public function saveEmail(){			
		if (utf8_strlen($this->request->post['email']) > 96 || !preg_match("/^([a-z0-9_\.-]+)@([a-z0-9_\.-]+)\.([a-z\.]{2,6})$/", $this->request->post['email'])) {
            $error = "Не верный email";
			
			echo json_encode(array("error"=>$error));
        }
		else{						
			$this->load->model('account/customer');
			
			$random = '';
			while(strlen($random) < 10){
				$rand = rand(0, 1000);
				$random .= $rand;
			}
			
			$data = array(
				'username' => $this->request->post['email'],
				'email' => $this->request->post['email'],
				'password' => $random,
				'firstname' => '',
				'lastname' => '',
				'telephone' => '',
			);
			
			$exists = $this->model_account_customer->checkEmailWithEmail($this->request->post['email']);  
			
			if($exists)
				echo json_encode(array("success"=>'Вы уже подписаны на рассылку.'));
			else{
				
				$success = array("success"=>'Вы подписаны на рассылку.');
				//$exists = $this->model_account_customer->checkCustomersWithEmail($this->request->post['email']);
				
				//if(!$exists){
					//$customer_id = $this->model_account_customer->addCustomer($data);
					//$this->customer->login($this->request->post['email'], $random);
				//}
				//else{
					$customer_id = 0;
					$success = array("success"=>'Вы подписаны на рассылку.', 'redirect' => true);
				//}
				$this->model_account_customer->saveEmail($this->request->post['email'], $customer_id);
				echo json_encode($success);
			}
		}
	}	

    private function addOrder() {
        $prId = 42;
        $this->load->model('catalog/product');
        $product_info = $this->model_catalog_product->getProduct($prId);
        $product_info["quantity"] = 1;
        $product_info["total"] = 0;
        $product_info["tax"] = 0;
        $product_info["option"] = array();
        $product_info["download"] = array();

        $total_data = array();
        $total = 0;
        $product_total = $total;

        $this->load->model('setting/extension');

        $this->language->load('checkout/checkout');

        $data = array();

        $data['invoice_prefix'] = $this->config->get('config_invoice_prefix');
        $data['store_id'] = $this->config->get('config_store_id');
        $data['store_name'] = $this->config->get('config_name');

        if ($data['store_id']) {
            $data['store_url'] = $this->config->get('config_url');
        } else {
            $data['store_url'] = HTTP_SERVER;
        }

        $data['customer_id'] = 0;
        $data['customer_group_id'] = "";
        $data['firstname'] = $this->request->post['name'];
        $data['lastname'] = "";
        $data['email'] = "";
        $data['telephone'] = $this->request->post['phone'];
        $data['fax'] = ""; //$this->session->data['guest']['fax'];

        $data['payment_firstname'] = $this->request->post['name'];
        $data['payment_lastname'] = ""; // $payment_address['lastname'];	
        $data['payment_company'] = ""; //$payment_address['company'];	
        $data['payment_company_id'] = ""; //$payment_address['company_id'];	
        $data['payment_tax_id'] = ""; //$payment_address['tax_id'];	
        $data['payment_address_1'] = ""; //$payment_address['address_1'];
        $data['payment_address_2'] = ""; //$payment_address['address_2'];
        $data['payment_city'] = ""; //$payment_address['city'];
        $data['payment_postcode'] = ""; //$payment_address['postcode'];
        $data['payment_zone'] = ""; //$payment_address['zone'];
        $data['payment_zone_id'] = ""; //$payment_address['zone_id'];
        $data['payment_country'] = ""; //$payment_address['country'];
        $data['payment_country_id'] = ""; //$payment_address['country_id'];
        $data['payment_address_format'] = ""; //$payment_address['address_format'];
        $data['payment_method'] = '';
        $data['payment_code'] = '';

        $data['shipping_firstname'] = $this->request->post['name'];
        $data['shipping_lastname'] = ""; //$shipping_address['lastname'];	
        $data['shipping_company'] = ""; //$shipping_address['company'];	
        $data['shipping_address_1'] = ""; //$shipping_address['address_1'];
        $data['shipping_address_2'] = ""; //$shipping_address['address_2'];
        $data['shipping_city'] = ""; //$shipping_address['city'];
        $data['shipping_postcode'] = ""; //$shipping_address['postcode'];
        $data['shipping_zone'] = ""; //$shipping_address['zone'];
        $data['shipping_zone_id'] = ""; //$shipping_address['zone_id'];
        $data['shipping_country'] = ""; //$shipping_address['country'];
        $data['shipping_country_id'] = ""; //$shipping_address['country_id'];
        $data['shipping_address_format'] = ""; //$shipping_address['address_format'];

        $data['shipping_method'] = '';
        $data['shipping_code'] = '';

        $product_data = array();

        $product_data[] = $product_info;

        // Gift Voucher
        $voucher_data = array();

        $data['products'] = $product_data;
        $data['vouchers'] = $voucher_data;
        $data['totals'] = $total_data;
        $vin = $this->request->post['vin'];
        $txt = $this->request->post['txt'];
        $data['comment'] = $vin . " " . $txt; //$this->session->data['comment'];
        $data['total'] = $total;

        $data['affiliate_id'] = 0;
        $data['commission'] = 0;


        $data['language_id'] = $this->config->get('config_language_id');
        $data['currency_id'] = $this->currency->getId();
        $data['currency_code'] = $this->currency->getCode();
        $data['currency_value'] = $this->currency->getValue($this->currency->getCode());
        $data['ip'] = $this->request->server['REMOTE_ADDR'];

        if (!empty($this->request->server['HTTP_X_FORWARDED_FOR'])) {
            $data['forwarded_ip'] = $this->request->server['HTTP_X_FORWARDED_FOR'];
        } elseif (!empty($this->request->server['HTTP_CLIENT_IP'])) {
            $data['forwarded_ip'] = $this->request->server['HTTP_CLIENT_IP'];
        } else {
            $data['forwarded_ip'] = '';
        }

        if (isset($this->request->server['HTTP_USER_AGENT'])) {
            $data['user_agent'] = $this->request->server['HTTP_USER_AGENT'];
        } else {
            $data['user_agent'] = '';
        }

        if (isset($this->request->server['HTTP_ACCEPT_LANGUAGE'])) {
            $data['accept_language'] = $this->request->server['HTTP_ACCEPT_LANGUAGE'];
        } else {
            $data['accept_language'] = '';
        }
        try {
            $this->load->model('checkout/order');

            $order_id = $this->model_checkout_order->addOrder($data);
            /* $this->session->data['order_id']=$order_id;
              $this->session->data['guest']['firstname']=$this->request->post['name']; */

            $this->load->model('checkout/order');

            $this->model_checkout_order->confirm($order_id, $this->config->get('cod_order_status_id'));
        } catch (Exception $e) {
            
        }
        return $order_id;
    }


}

?>