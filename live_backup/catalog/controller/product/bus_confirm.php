<?php 
class ControllerProductBusConfirm extends Controller { 	
	public function index() { 
		$this->language->load('product/search');
		
		$this->load->model('catalog/category');
		
		$this->load->model('catalog/product');
		
		$this->load->model('tool/image'); 
		
		//get the post date

		if (isset($this->request->post['bus_id'])) {
			$bus_id = $this->request->post['bus_id'];
		} else {
			$bus_id = 0;
		} 

		if (isset($this->request->post['bus_id_return'])) {
			$bus_id_return = $this->request->post['bus_id_return'];
		} else {
			$bus_id_return = 0;
		} 

		if (isset($this->request->post['filter_date'])) {
			$filter_date = $this->request->post['filter_date'];
		} else {
			$filter_date = 0;
		} 
		
		if (isset($this->request->post['filter_date_return'])) {
			$filter_date_return = $this->request->post['filter_date_return'];
		} else {
			$filter_date_return = 0;
		} 

		if (isset($this->request->post['quantity'])) {
			$quantity = $this->request->post['quantity'];
		} else {
			$quantity = 0;
		} 

		if (isset($this->request->post['bus_type'])) {
			$bus_type = $this->request->post['bus_type'];
		} else {
			$bus_type = 0;
		} 
		//	
		
		$this->document->addScript('catalog/view/javascript/jquery/jquery.total-storage.min.js');
		
		
		$this->data['text_empty'] = $this->language->get('text_empty');
		$this->data['text_critea'] = $this->language->get('text_critea');
		$this->data['text_search'] = $this->language->get('text_search');
		$this->data['text_keyword'] = $this->language->get('text_keyword');
		$this->data['text_category'] = $this->language->get('text_category');
		$this->data['text_sub_category'] = $this->language->get('text_sub_category');
		$this->data['text_quantity'] = $this->language->get('text_quantity');
		$this->data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$this->data['text_model'] = $this->language->get('text_model');
		$this->data['text_price'] = $this->language->get('text_price');
		$this->data['text_tax'] = $this->language->get('text_tax');
		$this->data['text_points'] = $this->language->get('text_points');
		$this->data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
		$this->data['text_display'] = $this->language->get('text_display');
		$this->data['text_list'] = $this->language->get('text_list');
		$this->data['text_grid'] = $this->language->get('text_grid');		
		$this->data['text_sort'] = $this->language->get('text_sort');
		$this->data['text_limit'] = $this->language->get('text_limit');
		
		$this->data['entry_search'] = $this->language->get('entry_search');
		$this->data['entry_description'] = $this->language->get('entry_description');

		$this->data['button_search'] = $this->language->get('button_search');
		$this->data['button_cart'] = $this->language->get('button_cart');
		$this->data['button_wishlist'] = $this->language->get('button_wishlist');
		$this->data['button_compare'] = $this->language->get('button_compare');

		$this->data['compare'] = $this->url->link('product/compare');
		
		$this->load->model('catalog/category');
		
		// 3 Level Category Search
		$this->data['categories'] = array();

		$categories_1 = $this->model_catalog_category->getCategories(0);
		
		foreach ($categories_1 as $category_1) {
			$level_2_data = array();
			
			$categories_2 = $this->model_catalog_category->getCategories($category_1['category_id']);
			
			foreach ($categories_2 as $category_2) {
				$level_3_data = array();
				
				$categories_3 = $this->model_catalog_category->getCategories($category_2['category_id']);
				
				foreach ($categories_3 as $category_3) {
					$level_3_data[] = array(
						'category_id' => $category_3['category_id'],
						'name'        => $category_3['name'],
						);
				}
				
				$level_2_data[] = array(
					'category_id' => $category_2['category_id'],	
					'name'        => $category_2['name'],
					'children'    => $level_3_data
					);					
			}
			
			$this->data['categories'][] = array(
				'category_id' => $category_1['category_id'],
				'name'        => $category_1['name'],
				'children'    => $level_2_data
				);
		}

		// Search Products
		$this->data['product'] = array();

		$this->data['product_return'] = array();


		if($bus_id){
			$result = $this->model_catalog_product->getProduct($bus_id,$filter_date);

			$this->data['product'] = array(
				'bus_id'  => $bus_id,
				'line_name' => $result['name'],
				'line_id'  => $result['model'],
				'departure_date'        => $filter_date,
				'departure_time'   => $result['departure_time'],
				'arrive_time'   => $result['arrive_time'],
				'departure_station'   => $result['departure_station'],
				'arrival_station'   => $result['arrive_station'],
				'quantity'   => $quantity,
				'price'   => $result['price'],
				);
		}


			//如果有回程。查询回程
		if($bus_id_return){

			$result = $this->model_catalog_product->getProduct($bus_id_return,$filter_date_return);

			$this->data['product_return'] = array(
				'bus_id_return'  => $bus_id_return,
				'line_name' => $result['name'],
				'line_id'  => $result['model'],
				'departure_date'        => $filter_date_return,
				'departure_time'   => $result['departure_time'],
				'arrive_time'   => $result['arrive_time'],
				'departure_station'   => $result['departure_station'],
				'arrival_station'   => $result['arrive_station'],
				'quantity'   => $quantity,
				'price'   => $result['price'],
				);
		}
//			echo '<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">';
//			var_dump($this->data['products']);
//			var_dump($this->data['products_return']);
//			var_dump($this->data['buses']);
//			exit;

		$this->data['filter_date'] = $filter_date;
		$this->data['filter_date_return'] = $filter_date_return;

		$url = 'index.php?route=checkout/cart/addBus&product_id='. $bus_id . "&product_return_id=" . $bus_id_return . "&quantity=" . $quantity . "&filter_date=" . $filter_date. "&filter_date_return=" . $filter_date_return;

		$this->data['addtochat'] = $url;

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/bus_confirm.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/product/bus_confirm.tpl';
		} else {
			$this->template = 'default/template/product/bus_confirm.tpl';
		}

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
}
?>
