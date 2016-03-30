<?php   
class ControllerCommonHeader extends Controller {
	protected function index() {
		$this->data['title'] = $this->document->getTitle();
		$this->data['heading_title'] = $this->config->get('config_title');
                $months=array(
                    1=>"Января",
                    2=>"Февраля",
                    3=>"Марта",
                    4=>"Апреля",
                    5=>"Мая",
                    6=>"Июня",
                    7=>"Июля",
                    8=>"Августа",
                    9=>"Сентября",
                    10=>"Октября",
                    11=>"Ноября",
                    12=>"Декабря",
                        );
                $tm=time();
                $d=ceil(floor($tm/(24*3600))/3);
                $tm=$d*3*24*3600-4*3600;
		$tm = $tm>time()?$tm:$tm+24*3600;
                $day=date("d",$tm);
                if ($day % 2 == 0) {
                    $day+=1;
                    $tm+=24*3600;
                }
                $day=  str_pad($day, 2, 0, STR_PAD_LEFT) ;
                
                $month=(int)date("m",$tm);
                
                $t_l=$tm-time();
                $this->data['tm']=$t_l;
                $this->data['sec']=$t_l % 60;//секунды
                $t_l=floor($t_l/60);
                $this->data['min']=$t_l % 60;//минуты
                $t_l=floor($t_l/60);
                $this->data['hour']=$t_l;//часы, приводим к москве на день вперед, чтоб до конца дня


                $this->data['month']=$months[$month];
                $this->data['days']=array(substr($day,0,1),substr($day,1));
                
		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$this->data['base'] = $this->config->get('config_ssl');
		} else {
			$this->data['base'] = $this->config->get('config_url');
		}
		
		$this->data['description'] = $this->document->getDescription();
		$this->data['keywords'] = $this->document->getKeywords();
		$this->data['links'] = $this->document->getLinks();	 
		$this->data['styles'] = $this->document->getStyles();
		$this->data['scripts'] = $this->document->getScripts();
		$this->data['lang'] = $this->language->get('code');
		$this->data['direction'] = $this->language->get('direction');
		$this->data['google_analytics'] = html_entity_decode($this->config->get('config_google_analytics'), ENT_QUOTES, 'UTF-8');
        $this->data['search_phrase'] = $this->finder();
        $this->data['yandexphone'] = $this->config->get('config_telephone_yandex');
        $this->data['referer'] = (isset($_SERVER['HTTP_REFERER']))?$_SERVER['HTTP_REFERER']:"";

        if (isset($this->request->get['akciya'])){
            $this->data['config_banner'] = $this->config->get('config_banner');
            $this->data['banner_name'] = $this->config->get('banner_name');
            $this->data['banner_old_price'] = $this->config->get('banner_old_price');
            $this->data['banner_new_price'] = $this->config->get('banner_new_price');
            $this->data['banner_text1'] = $this->config->get('banner_text1');
            $this->data['banner_text2'] = $this->config->get('banner_text2');
        }elseif(isset($this->request->get['kolodki']) or isset($this->request->get['condition'])){
            $this->data['config_banner'] = $this->config->get('config_banner_3');
            $this->data['banner_name'] = $this->config->get('banner_name_3');
            $this->data['banner_old_price'] = $this->config->get('banner_old_price_3');
            $this->data['banner_new_price'] = $this->config->get('banner_new_price_3');
            $this->data['banner_text1'] = $this->config->get('banner_text1_3');
            $this->data['banner_text2'] = $this->config->get('banner_text2_3');
            $this->data['banner_a'] = isset($this->request->get['kolodki'])?"kolodki":"condition";
        }elseif(isset($this->request->get['diski']) or isset($this->request->get['cool'])){
            $this->data['config_banner'] = $this->config->get('config_banner_2');
            $this->data['banner_name'] = $this->config->get('banner_name_2');
            $this->data['banner_old_price'] = $this->config->get('banner_old_price_2');
            $this->data['banner_new_price'] = $this->config->get('banner_new_price_2');
            $this->data['banner_text1'] = $this->config->get('banner_text1_2');
            $this->data['banner_text2'] = $this->config->get('banner_text2_2');
            $this->data['banner_a'] = isset($this->request->get['diski'])?"diski":"cool";
        }else{
            $this->data['config_banner'] = $this->config->get('config_banner');
            $this->data['banner_name'] = $this->config->get('banner_name');
            $this->data['banner_old_price'] = $this->config->get('banner_old_price');
            $this->data['banner_new_price'] = $this->config->get('banner_new_price');
            $this->data['banner_text1'] = $this->config->get('banner_text1');
            $this->data['banner_text2'] = $this->config->get('banner_text2');


            $keyfind=false;
            $keys = $this->config->get('banner_keys_2');
            $keys = explode(',', $keys);
            foreach($keys as $word){
                if (stripos($this->data['search_phrase'],$word)!==FALSE){
                    $this->data['config_banner'] = $this->config->get('config_banner_2');
                    $this->data['banner_name'] = $this->config->get('banner_name_2');
                    $this->data['banner_old_price'] = $this->config->get('banner_old_price_2');
                    $this->data['banner_new_price'] = $this->config->get('banner_new_price_2');
                    $this->data['banner_text1'] = $this->config->get('banner_text1_2');
                    $this->data['banner_text2'] = $this->config->get('banner_text2_2');
                    $this->data['banner_a'] = "diski";
                    $keyfind=true;
                    break;
                }
            }

            if (!$keyfind){
                $keys = $this->config->get('banner_keys_3');
                $keys = explode(',', $keys);
                foreach($keys as $word){
                    if (stripos($this->data['search_phrase'],$word)!==FALSE){
                        $this->data['config_banner'] = $this->config->get('config_banner_3');
                        $this->data['banner_name'] = $this->config->get('banner_name_3');
                        $this->data['banner_old_price'] = $this->config->get('banner_old_price_3');
                        $this->data['banner_new_price'] = $this->config->get('banner_new_price_3');
                        $this->data['banner_text1'] = $this->config->get('banner_text1_3');
                        $this->data['banner_text2'] = $this->config->get('banner_text2_3');
                        $this->data['banner_a'] = "kolodki";
                        break;
                    }
                }
            }
        }

        $this->data['banner_banner'] = $this->config->get('config_banner');

		// Whos Online
		if ($this->config->get('config_customer_online')) {
			$this->load->model('tool/online');
	
			if (isset($this->request->server['REMOTE_ADDR'])) {
				$ip = $this->request->server['REMOTE_ADDR'];	
			} else {
				$ip = ''; 
			}
			
			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];	
			} else {
				$url = '';
			}
			
			if (isset($this->request->server['HTTP_REFERER'])) {
				$referer = $this->request->server['HTTP_REFERER'];	
			} else {
				$referer = '';
			}
						
			$this->model_tool_online->whosonline($ip, $this->customer->getId(), $url, $referer);
		}
				
		$this->language->load('common/header');
		
		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$server = HTTPS_IMAGE;
		} else {
			$server = HTTP_IMAGE;
		}	
				$this->load->model('tool/image');
		if ($this->config->get('config_icon') && file_exists(DIR_IMAGE . $this->config->get('config_icon'))) {			
			$this->data['icon'] = $this->model_tool_image->resize($this->config->get('config_icon'), 16, 16);;
			//$this->data['icon'] = "http://".$this->request->server['HTTP_HOST'] . '/image/' . $this->config->get('config_icon');
		} else {
			$this->data['icon'] = '';
		}
		
		$this->data['name'] = $this->config->get('config_name');
				
		if ($this->config->get('config_logo') && file_exists(DIR_IMAGE . $this->config->get('config_logo'))) {
			$this->data['logo'] = $this->model_tool_image->resize($this->config->get('config_logo'), 695, 155);//$server . $this->config->get('config_logo');
		} else {
			$this->data['logo'] = '';
		}
		
		if ($this->config->get('triger_left_img') && file_exists(DIR_IMAGE . $this->config->get('triger_left_img'))) {
			$this->data['triger_left_img'] = $this->model_tool_image->resize($this->config->get('triger_left_img'), 87, 87);//$server . $this->config->get('config_logo');
		} else {
			$this->data['triger_left_img'] = '';
		}
		
		if ($this->config->get('triger_right_img') && file_exists(DIR_IMAGE . $this->config->get('triger_right_img'))) {
			$this->data['triger_right_img'] = $this->model_tool_image->resize($this->config->get('triger_right_img'), 143, 87);//$server . $this->config->get('config_logo');
		} else {
			$this->data['triger_right_img'] = '';
		}
		
		$this->data['text_home'] = $this->language->get('text_home');
		$this->data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		$this->data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
    	$this->data['text_search'] = $this->language->get('text_search');
		$this->data['text_welcome'] = sprintf($this->language->get('text_welcome'), $this->url->link('account/login', '', 'SSL'), $this->url->link('account/register', '', 'SSL'));
		$this->data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', 'SSL'), $this->customer->getFirstName(), $this->url->link('account/logout', '', 'SSL'));
		$this->data['text_account'] = $this->language->get('text_account');
    	$this->data['text_checkout'] = $this->language->get('text_checkout');
				
		$this->data['home'] = $this->url->link('common/home');
		$this->data['wishlist'] = $this->url->link('account/wishlist', '', 'SSL');
		$this->data['logged'] = $this->customer->isLogged();
		$this->data['account'] = $this->url->link('account/account', '', 'SSL');
		$this->data['shopping_cart'] = $this->url->link('checkout/cart');
		$this->data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');

        $this->data['username'] = isset($_COOKIE['username'])?$_COOKIE['username']:"";
        $this->data['userphone'] = isset($_COOKIE['userphone'])?$_COOKIE['userphone']:"";
        $this->data['uservin'] = isset($_COOKIE['uservin'])?$_COOKIE['uservin']:"";

		if (isset($this->request->get['filter_name'])) {
			$this->data['filter_name'] = $this->request->get['filter_name'];
		} else {
			$this->data['filter_name'] = '';
		}
		
		// Menu
		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}

		$this->load->model('catalog/category');
		
		$this->load->model('catalog/product');
		
		$this->data['categories'] = array();

        $this->data['docs'] = $this->model_catalog_product->getProducts(array("filter_category_id"=>59));

		$categories = $this->model_catalog_category->getCategories(0);
		
		foreach ($categories as $category) {
			if ($category['top']) {
				$children_data = array();
				
				$children = $this->model_catalog_category->getCategories($category['category_id']);
				
				foreach ($children as $child) {
					$data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);
					
					$product_total = $this->model_catalog_product->getTotalProducts($data);
									
					$children_data[] = array(
						'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $product_total . ')' : ''),
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])	
					);						
				}
				
				// Level 1
				$this->data['categories'][] = array(
					'name'     => $category['name'],
					'children' => $children_data,
					'active'   => in_array($category['category_id'], $parts),
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}
		
		$this->children = array(
			'module/language',
			'module/currency',
			'module/cart'
		);
				
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/header.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/header.tpl';
		} else {
			$this->template = 'default/template/common/header.tpl';
		}
		
    	$this->render();
	}

    function finder(){
        if (isset($_SERVER['HTTP_REFERER'])) $referer = $_SERVER['HTTP_REFERER'];
        else return '';

        if (stristr($referer, 'yandex.ru')) {
            $search = 'q=';
            $crawler = 'Yandex';
        }
        if (stristr($referer, 'rambler.ru')) {
            $search = 'words=';
            $crawler = 'Rambler';
        }
        if (stristr($referer, 'google.com') || stristr($referer, 'google.ru')) {
            $search = 'q=';
            $crawler = 'Google';
        }
        if (stristr($referer, 'mail.ru')) {
            $search = 'q=';
            $crawler = 'Mail';
        }
        if (stristr($referer, 'bing.com')) {
            $search = 'q=';
            $crawler = 'Bing';
        }
        if (stristr($referer, 'yahoo.com')) {
            $search = 'p=';
            $crawler = 'YAHOO';
        }
        if (isset($crawler)) {
            $phrase = urldecode($referer);
            preg_match('/'.$search.'([^&]*)'.'/i', $phrase.'&', $phrase2);
            $phrase2 = isset($phrase2[1])?$phrase2[1]:"";
            $this->checkSubdomain($phrase2);
        } else $phrase2="";
        if (empty($phrase2) && isset($_GET['utm_term'])){
            $phrase2 = str_replace("+", " ", $_GET['utm_term']);
        }
        return $this->translit($phrase2);
        //return $phrase2;
    }

    private function checkSubdomain($phrase){
        if (isset($_SESSION['redirect'])){
            unset($_SESSION['redirect']);
            return;
        }
        switch((int)$this->config->get('config_store_id')){
            case 0:
                if (
                    strpos($phrase,"фара") ||
                    strpos($phrase,"фары") ||
                    strpos($phrase,"фонарь") ||
                    strpos($phrase,"фонари") ||
                    strpos($phrase,"оптика") ||
                    strpos($phrase,"противотуманки") ||
                    strpos($phrase,"противотуманные")
                ){
                    $_SESSION['redirect'] = true;
                    header("Location: http://авто_оптика.avtoptika.ru");
                    exit;
                }
                break;
            case 2:
                if (
                    strpos($phrase,"диски") ||
                    strpos($phrase,"диск")
                ){
                        $_SESSION['redirect'] = true;
                        header("Location: http://тормозные_диски.avto-tormoza.ru");
                        exit;
                }
                if (
                    strpos($phrase,"главный")
                ){
                    $_SESSION['redirect'] = true;
                    header("Location: http://главный_тормозной.avto-tormoza.ru");
                    exit;
                }
                break;
        }
    }

    private function translit($phrase){
        $str[0] = array('й' => 'q', 'ц' => 'w', 'у' => 'e', 'к' => 'r', 'е' => 't', 'н' => 'y', 'г' => 'u', 'ш' => 'i', 'щ' => 'o', 'з' => 'p', 'х' => '[', 'ъ' => ']', 'ф' => 'a', 'ы' => 's', 'в' => 'd', 'а' => 'f', 'п' => 'g', 'р' => 'h', 'о' => 'j', 'л' => 'k', 'д' => 'l', 'ж' => ';', 'э' => '\'', 'я' => 'z', 'ч' => 'x', 'с' => 'c', 'м' => 'v', 'и' => 'b', 'т' => 'n', 'ь' => 'm', 'б' => ',', 'ю' => '.','Й' => 'Q', 'Ц' => 'W', 'У' => 'E', 'К' => 'R', 'Е' => 'T', 'Н' => 'Y', 'Г' => 'U', 'Ш' => 'I', 'Щ' => 'O', 'З' => 'P', 'Х' => '[', 'Ъ' => ']', 'Ф' => 'A', 'Ы' => 'S', 'В' => 'D', 'А' => 'F', 'П' => 'G', 'Р' => 'H', 'О' => 'J', 'Л' => 'K', 'Д' => 'L', 'Ж' => ';', 'Э' => '\'', '?' => 'Z', 'ч' => 'X', 'С' => 'C', 'М' => 'V', 'И' => 'B', 'Т' => 'N', 'Ь' => 'M', 'Б' => ',', 'Ю' => '.',);
        $str[1] = array (  'q' => 'й', 'w' => 'ц', 'e' => 'у', 'r' => 'к', 't' => 'е', 'y' => 'н', 'u' => 'г', 'i' => 'ш', 'o' => 'щ', 'p' => 'з', '[' => 'х', ']' => 'ъ', 'a' => 'ф', 's' => 'ы', 'd' => 'в', 'f' => 'а', 'g' => 'п', 'h' => 'р', 'j' => 'о', 'k' => 'л', 'l' => 'д', ';' => 'ж', '\'' => 'э', 'z' => 'я', 'x' => 'ч', 'c' => 'с', 'v' => 'м', 'b' => 'и', 'n' => 'т', 'm' => 'ь', ',' => 'б', '.' => 'ю','Q' => 'Й', 'W' => 'Ц', 'E' => 'У', 'R' => 'К', 'T' => 'Е', 'Y' => 'Н', 'U' => 'Г', 'I' => 'Ш', 'O' => 'Щ', 'P' => 'З', '[' => 'Х', ']' => 'Ъ', 'A' => 'Ф', 'S' => 'Ы', 'D' => 'В', 'F' => 'А', 'G' => 'П', 'H' => 'Р', 'J' => 'О', 'K' => 'Л', 'L' => 'Д', ';' => 'Ж', '\'' => 'Э', 'Z' => '?', 'X' => 'ч', 'C' => 'С', 'V' => 'М', 'B' => 'И', 'N' => 'Т', 'M' => 'Ь', ',' => 'Б', '.' => 'Ю', );

        //получаем список слов исключений
        $content = file_get_contents(DIR_SYSTEM."no-translit.txt");
        $content = strtolower($content);
        $content = explode("\r\n", $content);
        foreach($content as &$val){
            $val = trim($val);
        }
        //var_dump($content);
        //разбиваем фразу на отдельные слова
        $phrase = explode(" ", $phrase);
        $result = array();
        //проверяем каждое слово, не является ли оно исключением
        foreach($phrase as $word){
            $text = strtolower(trim($word));
            if (empty($text)) continue;
            //если не является то делаем транслит

            if (!in_array($text, $content)){
                $return = strtr($text, $str[1]);
                $result[] = mb_strtolower($return, 'UTF-8');
            }else{
                $result[] = $text;
            }
        }

        return implode(" ", $result);
    }
}
?>