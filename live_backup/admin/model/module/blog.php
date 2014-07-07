<?php
class ModelModuleBlog extends Model {
	public function addPost($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "blog SET create_time = '" . date('Y-m-d H:i:s') . "', update_time = '" . date('Y-m-d H:i:s') . "', status = '" . (int)$data['status'] . "', sort_order = '" . (int)$data['sort_order'] . "', date = '" . $this->db->escape($data['date']) . "'");

		$blog_id = $this->db->getLastId(); 
		
		foreach ($data['blog_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "blog_description SET blog_id = '" . (int)$blog_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', intro_text = '" . $this->db->escape($value['intro_text']) . "', text = '" . $this->db->escape($value['text']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
		}
		
		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "blog_description SET image = '" . $this->db->escape(html_entity_decode($data['image'], ENT_QUOTES, 'UTF-8')) . "' WHERE blog_id = '" . (int)$blog_id . "'");
		}
		$this->cache->delete('blog');
	}

	public function editPost($blog_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "blog SET update_time = '" . date('Y-m-d H:i:s') . "', sort_order = '" . (int)$data['sort_order'] . "', date = '" . $this->db->escape($data['date']) . "', status = '" . (int)$data['status'] . "' WHERE blog_id = '" . (int)$blog_id . "'");
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "blog_description WHERE blog_id = '" . (int)$blog_id . "'");
		

		foreach ($data['blog_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "blog_description SET blog_id = '" . (int)$blog_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', intro_text = '" . $this->db->escape($value['intro_text']) . "', text = '" . $this->db->escape($value['text']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
		}

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "blog_description SET image = '" . $this->db->escape(html_entity_decode($data['image'], ENT_QUOTES, 'UTF-8')) . "' WHERE blog_id = '" . (int)$blog_id . "'");
			//$this->db->query("UPDATE " . DB_PREFIX . "blog_description SET image = 'hellowordl'" .  " WHERE blog_id = '15'");
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'blog_id=" . (int)$blog_id. "'");
		
		$this->cache->delete('blog');
	}

	public function getPost($blog_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "blog WHERE blog_id = '" . (int)$blog_id . "'");
		
		return $query->row;
	}
	
	public function getPosts($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "blog b LEFT JOIN " . DB_PREFIX . "blog_description bd ON (b.blog_id = bd.blog_id) WHERE bd.language_id = '" . (int)$this->config->get('config_language_id') . "'";
			
			$sort_data = array(
				'b.create_time',
				'b.update_time',
				'b.date',
				'b.sort_order',
				'bd.title',
			);		
		
			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];	
			} else {
				$sql .= " ORDER BY b.sort_order";
			}
			
			if (isset($data['order']) && ($data['order'] == 'ASC')) {
				$sql .= " ASC";
			} else {
				$sql .= " DESC";
			}
			
			if (isset($data['start']) || isset($data['limit'])) {
				if ($data['start'] < 0) {
					$data['start'] = 0;
				}		

				if ($data['limit'] < 1) {
					$data['limit'] = 20;
				}	
			
				$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
			}	
			
			$query = $this->db->query($sql);
			
			return $query->rows;
		} else {
			$blog_data = $this->cache->get('blog.' . (int)$this->config->get('config_language_id'));
		
			if (!$blog_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "blog b LEFT JOIN " . DB_PREFIX . "blog_description bd ON (b.blog_id = bd.blog_id) WHERE bd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY b.sort_order DESC");
				
				$blog_data = $query->rows;
				
				$this->cache->set('blog.' . (int)$this->config->get('config_language_id'), $blog_data);
			}	
			
			return $blog_data;
		}
	}

	public function getPostDescriptions($blog_id) {
		$blog_description_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "blog_description WHERE blog_id = '" . (int)$blog_id . "'");

		foreach ($query->rows as $result) {
			$blog_description_data[$result['language_id']] = array(
				'title'				=> $result['title'],
				'intro_text'		=> $result['intro_text'],
				'text'				=> $result['text'],
				'meta_description'	=> $result['meta_description'],
				'meta_keyword'		=> $result['meta_keyword'],
				'image'				=> $result['image'],
			);
		}
		
		return $blog_description_data;
	}

	public function getTotalposts() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "blog");

		return $query->row['total'];
	}

	public function deletePost($blog_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "blog WHERE blog_id = '" . (int)$blog_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "blog_description WHERE blog_id = '" . (int)$blog_id . "'");

		$this->cache->delete('blog');
	}

	public function install() {
		// Blog table
		$sql = "
			CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog` (
				`blog_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
				`status` tinyint(1) DEFAULT '1',
				`sort_order` int(11) NOT NULL,
				`create_time` datetime NOT NULL,
				`update_time` datetime NOT NULL,
				`date` date NOT NULL,
				PRIMARY KEY (`blog_id`)
			) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;
		";

		$this->db->query($sql);

		// Blog description table
		$sql = "
			CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_description` (
				`blog_id` int(11) unsigned NOT NULL,
				`language_id` int(10) unsigned NOT NULL,
				`title` varchar(255) NOT NULL,
				`image` varchar(255) NOT NULL,
				`intro_text` text NOT NULL,
				`text` text NOT NULL,
				`meta_description` text NOT NULL,
				`meta_keyword` text NOT NULL,
				PRIMARY KEY (`blog_id`,`language_id`)
			) ENGINE=MyISAM DEFAULT CHARSET=utf8;
		";

		$this->db->query($sql);
	}
	
	public function uninstall() {
		$this->db->query("DROP TABLE " . DB_PREFIX . "blog");
		$this->db->query("DROP TABLE " . DB_PREFIX . "blog_description");
	}

	public function upgrade() {
		$sql = "SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA ='" . DB_DATABASE . "' AND TABLE_NAME='" . DB_PREFIX . "blog' AND COLUMN_NAME = 'sort_order'";

		$query = $this->db->query($sql);
    
		if (empty($query->row)) {
			// add column
			$sql = "ALTER TABLE  `" . DB_PREFIX . "blog` ADD  `sort_order` INT NOT NULL AFTER  `date`";
			$this->db->query($sql);

			// update sort_order values
			$sql = "SELECT * FROM " . DB_PREFIX . "blog b ORDER BY b.date DESC";
			$query = $this->db->query($sql);

			if ($query->rows) {
				$posts = array_reverse($query->rows);

				foreach ($posts as $key => $post) {
					$this->db->query("UPDATE " . DB_PREFIX . "blog SET sort_order = '" . ($key + 1) . "' WHERE blog_id = '" . (int)$post['blog_id'] . "'");
				}
			}
		}
	}

}
?>
