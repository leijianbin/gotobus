<?php
class ControllerPaymentCod extends Controller {
	protected function index() {
    	$this->data['button_confirm'] = $this->language->get('button_confirm');

    	$this->load->model('checkout/order');
		
		$order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);
		
		//use the get method to pass the data, it's not safe
		$this->data['continue'] = $this->url->link('checkout/success') .'&order_id='. $this->session->data['order_id']. '&confirm_no='. $order_info['invoice_no'];
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/cod.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/payment/cod.tpl';
		} else {
			$this->template = 'default/template/payment/cod.tpl';
		}	
		
		$this->render();
	}
	
	public function confirm() {
		$this->load->model('checkout/order');
		
		$this->model_checkout_order->confirm($this->session->data['order_id'], $this->config->get('cod_order_status_id'));
	}
}
?>