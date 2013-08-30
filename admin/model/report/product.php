<?php
class ModelReportProduct extends Model {
	public function getProductsViewed($data = array()) {
		$sql = "SELECT pd.name, p.model, p.viewed FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.viewed > 0 ORDER BY p.viewed DESC";
					
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
	}	
	
	public function getTotalProductsViewed() {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "product WHERE viewed > 0");
		
		return $query->row['total'];
	}
	
	public function getTotalProductViews() {
      	$query = $this->db->query("SELECT SUM(viewed) AS total FROM " . DB_PREFIX . "product");
		
		return $query->row['total'];
	}
			
	public function reset() {
		$this->db->query("UPDATE " . DB_PREFIX . "product SET viewed = '0'");
	}
	
	public function getPurchased($data = array()) {
		//$sql = "SELECT os.name AS os_name, o.date_added,o.invoice_no,o.firstname, op.order_id, o.lastname,op.departure_date,op.product_id, op.customer, op.confirm_no, op.name, op.model, SUM(op.quantity) AS quantity, SUM(op.total + op.total * op.tax / 100) AS total FROM " . DB_PREFIX . "order_product op LEFT JOIN `" . DB_PREFIX . "order` o ON (op.order_id = o.order_id)". "LEFT JOIN `" . DB_PREFIX . "order_status` os ON (os.order_status_id = o.order_status_id)" ;
		$sql = "SELECT ops.order_status_id AS ops_id, ops.name AS ops_name, o.date_added, op.* , SUM(op.quantity) AS quantity, SUM(op.total + op.total * op.tax / 100) AS total FROM " . DB_PREFIX . "order_product op LEFT JOIN `" . DB_PREFIX . "order` o ON (op.order_id = o.order_id)". "LEFT JOIN `" . DB_PREFIX . "order_product_status` ops ON (ops.order_status_id = op.ticket_status_id)" ;

		if (!empty($data['filter_order_status_id'])) {
			$sql .= " WHERE o.order_status_id = '" . (int)$data['filter_order_status_id'] . "'";
		} else {
			$sql .= " WHERE o.order_status_id > '0'";
		}
		if (!empty($data['filter_order_schedule'])) {
			$sql .= " AND op.product_id = '" . (int)$data['filter_order_schedule'] . "'";
		} else {
			$sql .= " AND op.product_id > '0'";
		}
		
		if (!empty($data['filter_date_start'])) {
			$sql .= " AND DATE(op.departure_date) >= '" . $this->db->escape($data['filter_date_start']) . "'";
		}

		if (!empty($data['filter_date_end'])) {
			$sql .= " AND DATE(op.departure_date) <= '" . $this->db->escape($data['filter_date_end']) . "'";
		}

		if (!empty($data['filter_confirm_no'])) {
			$sql .= " AND op.confirm_no ='" . $this->db->escape($data['filter_confirm_no']) . "'";
		}
		
		//$sql .= " GROUP BY op.model ORDER BY total DESC";
		$sql .= " GROUP BY op.order_product_id ORDER BY o.date_added DESC";
					
		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}			

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}	
			
			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		//echo $sql;
		//echo "<br/>";
		
		$query = $this->db->query($sql);
	
		return $query->rows;
	}
	
	public function getTotalPurchased($data) {
		//$sql = "SELECT os.name AS os_name, o.date_added,o.invoice_no,o.firstname, op.order_id, o.lastname,op.departure_date,op.product_id, op.name, op.model, SUM(op.quantity) AS quantity, SUM(op.total + op.total * op.tax / 100) AS total FROM " . DB_PREFIX . "order_product op LEFT JOIN `" . DB_PREFIX . "order` o ON (op.order_id = o.order_id)". "LEFT JOIN `" . DB_PREFIX . "order_status` os ON (os.order_status_id = o.order_status_id)" ;
		$sql = "SELECT ops.name AS ops_name, o.date_added, op.* , SUM(op.quantity) AS quantity, SUM(op.total + op.total * op.tax / 100) AS total FROM " . DB_PREFIX . "order_product op LEFT JOIN `" . DB_PREFIX . "order` o ON (op.order_id = o.order_id)". "LEFT JOIN `" . DB_PREFIX . "order_product_status` ops ON (ops.order_status_id = op.ticket_status_id)" ;

		if (!empty($data['filter_order_status_id'])) {
			$sql .= " WHERE o.order_status_id = '" . (int)$data['filter_order_status_id'] . "'";
		} else {
			$sql .= " WHERE o.order_status_id > '0'";
		}

		if (!empty($data['filter_order_schedule'])) {
			$sql .= " AND op.product_id = '" . (int)$data['filter_order_schedule'] . "'";
		} else {
			$sql .= " AND op.product_id > '0'";
		}
		
		if (!empty($data['filter_date_start'])) {
			$sql .= " AND DATE(op.departure_date) >= '" . $this->db->escape($data['filter_date_start']) . "'";
		}

		if (!empty($data['filter_date_end'])) {
			$sql .= " AND DATE(op.departure_date) <= '" . $this->db->escape($data['filter_date_end']) . "'";
		}
		
		if (!empty($data['filter_confirm_no'])) {
			$sql .= " AND op.confirm_no ='" . $this->db->escape($data['filter_confirm_no']) . "'";
		}

		//$sql .= " GROUP BY op.model ORDER BY total DESC";
		$sql .= " GROUP BY op.order_product_id ORDER BY o.date_added DESC";
					
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
				
		return count($query->rows);
	}

	public function getTotalModel() {
      	$sql = "SELECT model,product_id FROM `" . DB_PREFIX . "order_product`";
		
		$query = $this->db->query($sql);
				
		return $query->rows;
	}

	public function getTotalName() {
      	$sql = "SELECT distinct name,product_id FROM `" . DB_PREFIX . "order_product`";
		
		$query = $this->db->query($sql);
				
		return $query->rows;
	}
}
?>