<?php  
class ControllerCommonFooter extends Controller {
	protected function index() {
		$this->language->load('common/footer');
		
		$this->data['text_information'] = $this->language->get('text_information');
		$this->data['text_service'] = $this->language->get('text_service');
		$this->data['text_extra'] = $this->language->get('text_extra');
		$this->data['text_contact'] = $this->language->get('text_contact');
		$this->data['text_return'] = $this->language->get('text_return');
    	$this->data['text_sitemap'] = $this->language->get('text_sitemap');
		$this->data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$this->data['text_voucher'] = $this->language->get('text_voucher');
		$this->data['text_affiliate'] = $this->language->get('text_affiliate');
		$this->data['text_special'] = $this->language->get('text_special');
		$this->data['text_account'] = $this->language->get('text_account');
		$this->data['text_order'] = $this->language->get('text_order');
		$this->data['text_wishlist'] = $this->language->get('text_wishlist');
		$this->data['text_newsletter'] = $this->language->get('text_newsletter');
        $this->data['username'] = isset($_COOKIE['username'])?$_COOKIE['username']:"";
        $this->data['userphone'] = isset($_COOKIE['userphone'])?$_COOKIE['userphone']:"";
        $this->data['uservin'] = isset($_COOKIE['uservin'])?$_COOKIE['uservin']:"";

		$this->load->model('catalog/information');
		
		$this->data['informations'] = array();

		foreach ($this->model_catalog_information->getInformations() as $result) {
			if ($result['bottom']) {
				$this->data['informations'][] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			}
    	}

		$this->data['contact'] = $this->url->link('information/contact');
		$this->data['return'] = $this->url->link('account/return/insert', '', 'SSL');
    	$this->data['sitemap'] = $this->url->link('information/sitemap');
		$this->data['manufacturer'] = $this->url->link('product/manufacturer');
		$this->data['voucher'] = $this->url->link('account/voucher', '', 'SSL');
		$this->data['affiliate'] = $this->url->link('affiliate/account', '', 'SSL');
		$this->data['special'] = $this->url->link('product/special');
		$this->data['account'] = $this->url->link('account/account', '', 'SSL');
		$this->data['order'] = $this->url->link('account/order', '', 'SSL');
		$this->data['wishlist'] = $this->url->link('account/wishlist', '', 'SSL');
		$this->data['newsletter'] = $this->url->link('account/newsletter', '', 'SSL');
        $this->data['search_phrase'] = $this->finder();
        $this->data['yandexphone'] = $this->config->get('config_telephone_yandex');

		$this->data['powered'] = sprintf($this->language->get('text_powered'), $this->config->get('config_name'), date('Y', time()));
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/footer.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/footer.tpl';
		} else {
			$this->template = 'default/template/common/footer.tpl';
		}
		
		$this->render();
	}

    function finder(){
        if (isset($_SERVER['HTTP_REFERER'])) $referer = $_SERVER['HTTP_REFERER'];
        else return '';

        if (stristr($referer, 'yandex.ru')) {
            $search = 'text=';
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
        } else $phrase2="";
        return $phrase2;
    }
}
?>