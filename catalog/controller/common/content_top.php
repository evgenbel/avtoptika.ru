<?php  
class ControllerCommonContentTop extends Controller {
	public function index() {
		$this->load->model('design/layout');
		$this->load->model('catalog/category');
		$this->load->model('catalog/product');
		$this->load->model('catalog/information');
		
		if (isset($this->request->get['route'])) {
			$route = (string)$this->request->get['route'];
		} else {
			$route = 'common/home';
		}
		
		$layout_id = 0;
		
		if ($route == 'product/category' && isset($this->request->get['path'])) {
			$path = explode('_', (string)$this->request->get['path']);
				
			$layout_id = $this->model_catalog_category->getCategoryLayoutId(end($path));			
		}
		
		if ($route == 'product/product' && isset($this->request->get['product_id'])) {
			$layout_id = $this->model_catalog_product->getProductLayoutId($this->request->get['product_id']);
		}
		
		if ($route == 'information/information' && isset($this->request->get['information_id'])) {
			$layout_id = $this->model_catalog_information->getInformationLayoutId($this->request->get['information_id']);
		}
		
		if (!$layout_id) {
			$layout_id = $this->model_design_layout->getLayout($route);
		}
				
		if (!$layout_id) {
			$layout_id = $this->config->get('config_layout_id');
		}

		$module_data = array();
		
		$this->load->model('setting/extension');
		
		$extensions = $this->model_setting_extension->getExtensions('module');		
		
		foreach ($extensions as $extension) {
			$modules = $this->config->get($extension['code'] . '_module');
			
			if ($modules) {
				foreach ($modules as $module) {
					if ($module['layout_id'] == $layout_id && $module['position'] == 'content_top' && $module['status']) {
						$module_data[] = array(
							'code'       => $extension['code'],
							'setting'    => $module,
							'sort_order' => $module['sort_order']
						);				
					}
				}
			}
		}
		
		$sort_order = array(); 
	  
		foreach ($module_data as $key => $value) {
      		$sort_order[$key] = $value['sort_order'];
    	}
		
		array_multisort($sort_order, SORT_ASC, $module_data);
		
		$this->data['modules'] = array();
		
		foreach ($module_data as $module) {
			$module = $this->getChild('module/' . $module['code'], $module['setting']);
			
			if ($module) {
				$this->data['modules'][] = $module;
			}
		}
				
		$this->data['search_phrase']='';
		$this->data['search_phrase']=$this->finder();

        $this->data['username'] = isset($_COOKIE['username'])?$_COOKIE['username']:"";
        $this->data['userphone'] = isset($_COOKIE['userphone'])?$_COOKIE['userphone']:"";
        $this->data['uservin'] = isset($_COOKIE['uservin'])?$_COOKIE['uservin']:"";

		if (empty($this->data['search_phrase'])){
		    if (isset($_COOKIE['search_phrase'])) $this->data['search_phrase']=$_COOKIE['search_phrase'];
		}
		if (!empty($this->data['search_phrase'])) setcookie("search_phrase",$this->data['search_phrase']);
		
		if(isset($_REQUEST['utm_source']))
			$this->data['utm_source'] = $_REQUEST['utm_source'];
		else
			$this->data['utm_source'] = '';

		if(isset($_REQUEST['utm_campaign']))
			$this->data['utm_campaign'] = $_REQUEST['utm_campaign'];
		else
			$this->data['utm_campaign'] = '';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/content_top.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/content_top.tpl';
		} else {
			$this->template = 'default/template/common/content_top.tpl';
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
	    if (stristr($referer, 'google.com')) {
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
            /*$q = parse_url($phrase);
            if (isset($q['query'])){
                $gets = explode("&",$q['query']);
                foreach($gets as $get){
                    $res = explode("=", $get);
                    if ($res[0]."="==$search){
                        return $res[1];
                    }
                }
            }*/
            preg_match('/'.$search.'([^&]*)'.'/i', $phrase.'&', $phrase2);
            $phrase2 = isset($phrase2[1])?$phrase2[1]:"";
	    } else $phrase2="";
	    return $phrase2;
	}
}
?>