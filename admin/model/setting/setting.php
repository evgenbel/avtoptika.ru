<?php 
class ModelSettingSetting extends Model {
	public function getSetting($group, $store_id = 0) {
		$data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE store_id = '" . (int)$store_id . "' AND `group` = '" . $this->db->escape($group) . "'");
		
		foreach ($query->rows as $result) {
			if (!$result['serialized']) {
				$data[$result['key']] = $result['value'];
			} else {
				$data[$result['key']] = unserialize($result['value']);
			}
		}

		return $data;
	}
	
	public function editSetting($group, $data, $store_id = 0) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "setting WHERE store_id = '" . (int)$store_id . "' AND `group` = '" . $this->db->escape($group) . "'");

		foreach ($data as $key => $value) {
			if (!is_array($value)) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "setting SET store_id = '" . (int)$store_id . "', `group` = '" . $this->db->escape($group) . "', `key` = '" . $this->db->escape($key) . "', `value` = '" . $this->db->escape($value) . "'");
			} else {
				$this->db->query("INSERT INTO " . DB_PREFIX . "setting SET store_id = '" . (int)$store_id . "', `group` = '" . $this->db->escape($group) . "', `key` = '" . $this->db->escape($key) . "', `value` = '" . $this->db->escape(serialize($value)) . "', serialized = '1'");
			}
		}
	}
	
	public function deleteSetting($group, $store_id = 0) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "setting WHERE store_id = '" . (int)$store_id . "' AND `group` = '" . $this->db->escape($group) . "'");
	}

    //обновляем телефон по главному магазину
    public function updPhone(){
        $sql = "UPDATE  " . DB_PREFIX . "setting
                SET value=(SELECT value FROM (SELECT value FROM " . DB_PREFIX . "setting WHERE `group`='config' AND `key`='config_telephone' and store_id=0) t limit 1)
                WHERE `group`='config' AND `key`='config_telephone' and store_id>0";
        $this->db->query($sql);
    }

    //обновляем яндекс подмену по главному магазину
    public function updPhoneYandex(){
        $sql = "UPDATE  " . DB_PREFIX . "setting
                SET value=(SELECT value FROM (SELECT value FROM " . DB_PREFIX . "setting WHERE `group`='config' AND `key`='config_telephone_yandex' and store_id=0) t limit 1)
                WHERE `group`='config' AND `key`='config_telephone_yandex' and store_id>0";
        $this->db->query($sql);
    }

	//обновляем яндекс подмену по главному магазину
	public function updEmail(){
		$sql = "UPDATE  " . DB_PREFIX . "setting
                SET value=(SELECT value FROM (SELECT value FROM " . DB_PREFIX . "setting WHERE `group`='config' AND `key`='config_email' and store_id=0) t limit 1)
                WHERE `group`='config' AND `key`='config_email' and store_id>0";
		$this->db->query($sql);
	}

    public function updTagManager(){
        $sql = "UPDATE  " . DB_PREFIX . "setting
                SET value=(SELECT value FROM (SELECT value FROM " . DB_PREFIX . "setting WHERE `group`='config' AND `key`='config_tag_manager' and store_id=0) t limit 1)
                WHERE `group`='config' AND `key`='config_tag_manager' and store_id>0";
        $this->db->query($sql);
    }
}
?>