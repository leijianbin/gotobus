<?php  
class ControllerModuleSidebarSearch extends Controller {
	protected function index($setting) {
		
		$this->language->load('product/search');
		
		$this->load->model('catalog/product');
		
		$this->load->model('tool/image'); 


		$this->data['options'] = $setting['options'];

		/* Language */
		
		$this->language->load('module/sidebarsearch');		

		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['text_searchbox'] = $this->language->get('text_searchbox');
		$this->data['text_categorytop'] = $this->language->get('text_categorytop');
		$this->data['text_subsYN'] = $this->language->get('text_subsYN');
		$this->data['text_descripYN'] = $this->language->get('text_descripYN');

		/* Categories Dropdown */
		
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
		
		
		$this->data['sidebarsearch'] = array();

		if (isset($this->request->get['search'])) { //search keyword as bus_type
			$search = $this->request->get['search'];
		} else {
			$search = '';
		}

		$this->data['search'] = $search;

		// get data for search 
	if (isset($this->request->get['category_id'])) { 

		if (isset($this->request->get['category_id'])) { //category_id keyword as bus_type
			$category_id = $this->request->get['category_id'];
		} else {
			$category_id = '';
		}
		$this->data['category_id'] = $category_id;

		if (isset($this->request->get['category_arrival_id'])) { //category_arrival_id keyword as bus_type
			$category_arrival_id = $this->request->get['category_arrival_id'];
		} else {
			$category_arrival_id = '';
		}
		$this->data['category_arrival_id'] = $category_arrival_id;

		if (isset($this->request->get['passenger_no'])) { //passenger_no keyword as bus_type
			$passenger_no = $this->request->get['passenger_no'];
		} else {
			$passenger_no = '';
		}
		$this->data['passenger_no'] = $passenger_no;

		if (isset($this->request->get['filter_date'])) { //filter_date keyword as bus_type
			$filter_date = $this->request->get['filter_date'];
		} else {
			$filter_date = '';
		}
		$this->data['filter_date'] = $filter_date;

		if (isset($this->request->get['filter_return_date'])) { //filter_return_date keyword as bus_type
			$filter_return_date = $this->request->get['filter_return_date'];
		} else {
			$filter_return_date = '';
		}
		$this->data['filter_return_date'] = $filter_return_date;
	}

		// post data for bus confrim
		// 
		// 
	if (isset($this->request->post['bus_id']))
	{
		if (isset($this->request->post['category_id'])) {
			$category_id = $this->request->post['category_id'];
		} else {
			$category_id = 0;
		} 
		$this->data['category_id'] = $category_id;

		if (isset($this->request->post['category_id_return'])) {
			$category_arrival_id= $this->request->post['category_id_return'];
		} else {
			$category_arrival_id = 0;
		} 
		$this->data['category_arrival_id'] = $category_arrival_id;

		if (isset($this->request->post['filter_date'])) {
			$filter_date = $this->request->post['filter_date'];
		} else {
			$filter_date = 0;
		} 
		$this->data['filter_date'] = $filter_date;
		
		if (isset($this->request->post['filter_date_return'])) {
			$filter_date_return = $this->request->post['filter_date_return'];
		} else {
			$filter_date_return = 0;
		} 
		$this->data['filter_return_date'] = $filter_date_return;

		if (isset($this->request->post['quantity'])) {
			$quantity = $this->request->post['quantity'];
		} else {
			$quantity = 0;
		} 
		$this->data['passenger_no'] = $quantity;

		if (isset($this->request->post['bus_type'])) {
			$bus_type = $this->request->post['bus_type'];
		} else {
			$bus_type = 0;
		} 
		$this->data['search'] = $bus_type;
	}

	/* Load Template */

	if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/sidebarsearch.tpl')) {
		$this->template = $this->config->get('config_template') . '/template/module/sidebarsearch.tpl';
	} else {
		$this->template = 'default/template/module/sidebarsearch.tpl';
	}

	$this->render();
}
}
?>