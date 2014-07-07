<?php
class ControllerReportProductPurchased extends Controller { 
	public function index() {   
		$this->language->load('report/product_purchased');

		$this->document->setTitle($this->language->get('heading_title'));
		
		if (isset($this->request->get['filter_date_start'])) {
			$filter_date_start = $this->request->get['filter_date_start'];
		} else {
			//$filter_date_start = '';
			$today = time();
			$filter_date_start = date('Y-m-d',$today);
		}

		if (isset($this->request->get['filter_date_end'])) {
			$filter_date_end = $this->request->get['filter_date_end'];
		} else {
			$today = time();
			$filter_date_end = date('Y-m-d',$today);
			//$filter_date_end = '';
		}
		
		if (isset($this->request->get['filter_order_status_id'])) {
			$filter_order_status_id = $this->request->get['filter_order_status_id'];
		} else {
			$filter_order_status_id = 0;
		}

		if (isset($this->request->get['filter_order_schedule'])) {
			$filter_order_schedule = $this->request->get['filter_order_schedule'];
		} else {
			$filter_order_schedule = 0;
		}

		if (isset($this->request->get['filter_confirm_no'])) {
			$filter_confirm_no = $this->request->get['filter_confirm_no'];
		} else {
			$filter_confirm_no = "";
		}
						
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';
						
		if (isset($this->request->get['filter_date_start'])) {
			$url .= '&filter_date_start=' . $this->request->get['filter_date_start'];
		}
		
		if (isset($this->request->get['filter_date_end'])) {
			$url .= '&filter_date_end=' . $this->request->get['filter_date_end'];
		}
		
		if (isset($this->request->get['filter_order_status_id'])) {
			$url .= '&filter_order_status_id=' . $this->request->get['filter_order_status_id'];
		}

		if (isset($this->request->get['filter_order_schedule'])) {
			$url .= '&filter_order_schedule=' . $this->request->get['filter_order_schedule'];
		}
								
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

   		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('report/product_purchased', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);		
		
		$this->load->model('report/product');
		
		$this->data['products'] = array();

		
		$data = array(
			'filter_date_start'	     => $filter_date_start, 
			'filter_date_end'	     => $filter_date_end, 
			'filter_order_status_id' => $filter_order_status_id,
			'filter_order_schedule'  => $filter_order_schedule,
			'filter_confirm_no'		 => $filter_confirm_no,
			'start'                  => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit'                  => $this->config->get('config_admin_limit')
		);
				
		$product_total = $this->model_report_product->getTotalPurchased($data);

		$this->data['order_schedules'] = $this->model_report_product->getTotalName();
		//$this->data['current_schedules'] = $this->model_report_product->getTotalName();


		if(empty($filter_order_schedule))
		{
			$this->data['current_schedules'] = $this->model_report_product->getTotalName();
		}
		else 
		{
			foreach($this->data['order_schedules'] as $current_schedule)
			{
				if($current_schedule['product_id'] == $filter_order_schedule)
				{
					$this->data['current_schedules'] = array($current_schedule);
				}
			}
		}  


		$results = $this->model_report_product->getPurchased($data);
		
		foreach ($results as $result) {
			$action = array();
									
			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('sale/order/update', 'token=' . $this->session->data['token'] . '&order_id=' . $result['order_id'] . $url, 'SSL')
			);

			$this->data['products'][] = array(
				'name'       => $result['name'],
				'model'      => $result['model'],
				'quantity'   => $result['quantity'],
				'departure_date' => $result['departure_date'],
				//'invoice_no' => $result['invoice_no'],
				'confirm_no' => $result['confirm_no'],
				'customer' => $result['customer'],
				'product_id' => $result['product_id'],
				//'customer' => $result['firstname']." ".$result['lastname'],
				'total'      => $this->currency->format($result['total'], $this->config->get('config_currency')),
				'action'        => $action,
				'date_added'	=> date('Y-m-d', strtotime($result['date_added'])),
				'ops_name'		=>  $result['ops_name'],
			);
		}
				
		$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['text_no_results'] = $this->language->get('text_no_results');
		$this->data['text_all_status'] = $this->language->get('text_all_status');
		
		$this->data['column_name'] = $this->language->get('column_name');
		$this->data['column_model'] = $this->language->get('column_model');
		$this->data['column_quantity'] = $this->language->get('column_quantity');
		$this->data['column_total'] = $this->language->get('column_total');
		
		$this->data['entry_date_start'] = $this->language->get('entry_date_start');
		$this->data['entry_date_end'] = $this->language->get('entry_date_end');
		$this->data['entry_status'] = $this->language->get('entry_status');

		$this->data['button_filter'] = $this->language->get('button_filter');
		
		$this->data['token'] = $this->session->data['token'];
		
		$this->load->model('localisation/order_status');
		
		//$this->data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();
		$this->data['order_statuses'] = $this->model_localisation_order_status->getTicketStatuses();

		
		$url = '';
						
		if (isset($this->request->get['filter_date_start'])) {
			$url .= '&filter_date_start=' . $this->request->get['filter_date_start'];
		}

		if (isset($this->request->get['filter_confirm_no'])) {
			$url .= '&filter_confirm_no=' . $this->request->get['filter_confirm_no'];
		}
		
		if (isset($this->request->get['filter_date_end'])) {
			$url .= '&filter_date_end=' . $this->request->get['filter_date_end'];
		}

		if (isset($this->request->get['filter_order_status_id'])) {
			$url .= '&filter_order_status_id=' . $this->request->get['filter_order_status_id'];
		}
		
		$pagination = new Pagination();
		$pagination->total = $product_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('report/product_purchased', 'token=' . $this->session->data['token'] . $url . '&page={page}');

		$this->data['pagination'] = $pagination->render();		
		
		$this->data['filter_date_start'] = $filter_date_start;
		$this->data['filter_date_end'] = $filter_date_end;
		$this->data['filter_confirm_no'] = $filter_confirm_no;			
		$this->data['filter_order_status_id'] = $filter_order_status_id;
		$this->data['filter_order_schedule'] = $filter_order_schedule;
		
		$this->template = 'report/product_purchased.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}	
}
?>