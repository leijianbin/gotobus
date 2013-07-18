<?php
class ControllerModuleBlog extends Controller {
	public function index() {
		$this->language->load('module/blog');

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'		=> $this->language->get('text_home'),
			'href'		=> $this->url->link('common/home'),
			'separator'	=> false
		);

		$this->data['breadcrumbs'][] = array(
			'text'		=> $this->language->get('text_blog'),
			'href'		=> $this->url->link('module/blog'),
			'separator'	=> $this->language->get('text_separator')
		);
		
		$this->data['text_blog'] = $this->language->get('text_blog');
		$this->data['text_read_more'] = $this->language->get('text_read_more');
		$this->data['text_image'] = $this->language->get('text_image');

		$this->load->model('module/blog');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$limit = $this->config->get('config_catalog_limit');

		$this->data['posts'] = array();

		$posts_total = $this->model_module_blog->getTotalPosts();

		$data = array(
			'start' => ($page - 1) * $limit,
			'limit' => $limit,
		);

		$results = $this->model_module_blog->getPosts($data);
		
		foreach ($results as $result) {
			$this->data['posts'][] = array(
				'title'			=> $result['title'],
				'date'			=> str_replace('-', '.', $result['date']),
				'intro_text'	=> html_entity_decode($result['intro_text'], ENT_QUOTES, 'UTF-8'),
				'text'			=> html_entity_decode($result['text'], ENT_QUOTES, 'UTF-8'),
				'href'			=> $this->url->link('module/blog/view', 'blog_id=' . $result['blog_id']),
				'image'			=> $result['image'],
			);
		}
		
		$pagination = new Pagination();
		$pagination->total = $posts_total;
		$pagination->page = $page;
		$pagination->limit = $limit;
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('module/blog', '&page={page}');

		$this->data['pagination'] = $pagination->render();

		$this->children = array(
			'common/column_left',
			'common/column_right',
			//'common/content_top',
			//'common/content_bottom',
			'common/footer',
			'common/header'
		);

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/blog_list.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/blog_list.tpl';
		} else {
			$this->template = 'default/template/module/blog_list.tpl';
		}
		
		$this->response->setOutput($this->render());
	}

	public function view() {
		$this->language->load('module/blog');

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'		=> $this->language->get('text_home'),
			'href'		=> $this->url->link('common/home'),
			'separator'	=> false
		);

		$this->data['breadcrumbs'][] = array(
			'text'		=> $this->language->get('text_blog'),
			'href'		=> $this->url->link('module/blog'),
			'separator'	=> $this->language->get('text_separator')
		);

		$this->load->model('module/blog');

		if (isset($this->request->get['blog_id'])) {
			$blog_id = (int)$this->request->get['blog_id'];
		} else {
			$blog_id = 0;
		}

		$post_info = $this->model_module_blog->getPost($blog_id);

		if ($post_info) {

			$this->document->setTitle($post_info['title']);
			$this->document->setDescription($post_info['meta_description']);
			$this->document->setKeywords($post_info['meta_keyword']);
			$this->document->addLink($this->url->link('module/blog/view', 'blog_id=' . $blog_id), 'canonical');
			
			$this->data['heading_title'] = $post_info['title'];

			$this->data['breadcrumbs'][] = array(
				'text'		=> $post_info['title'],
				'href'		=> $this->url->link('module/blog/view', 'blog_id=' . $blog_id),
				'separator'	=> $this->language->get('text_separator')
			);

			$previous_item = $this->model_module_blog->getPreviousPost($blog_id);

			if (isset($previous_item['blog_id'])) {
				$previous_item['href'] = $this->url->link('module/blog/view', 'blog_id=' . $previous_item['blog_id']);

				$this->data['previous_item'] = $previous_item;
			} else {
				$this->data['previous_item'] = array();
			}

			$next_item = $this->model_module_blog->getNextPost($blog_id);

			if (isset($next_item['blog_id'])) {
				$next_item['href'] = $this->url->link('module/blog/view', 'blog_id=' . $next_item['blog_id']);

				$this->data['next_item'] = $next_item;
			} else {
				$this->data['next_item'] = array();
			}

			$this->data['button_previous_item'] = $this->language->get('button_previous_item');
			$this->data['button_next_item'] = $this->language->get('button_next_item');
			
			$this->data['date'] = str_replace('-', '.', $post_info['date']);
			$this->data['title'] = $post_info['title'];
			$this->data['text'] = html_entity_decode($post_info['text'], ENT_QUOTES, 'UTF-8');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/blog_item.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/module/blog_item.tpl';
			} else {
				$this->template = 'default/template/module/blog_item.tpl';
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
		} else {
			$this->document->setTitle($this->language->get('text_error'));

			$this->data['heading_title'] = $this->language->get('text_error');

			$this->data['text_error'] = $this->language->get('text_error');

			$this->data['button_continue'] = $this->language->get('button_continue');

			$this->data['continue'] = $this->url->link('common/home');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/error/not_found.tpl';
			} else {
				$this->template = 'default/template/error/not_found.tpl';
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
}
?>
