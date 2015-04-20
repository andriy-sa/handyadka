<?php
	require_once "abstractdata_class.php";

	class Product extends AbstractData {

		private $view;
		private $title;

		private $prod_url;
		private $product;
		private $comment;
		private $comment_count;

		function __construct($view) {
			parent::__construct();

			$this->view = $view;
			$this->prod_url = $this->get_prod_url();
			$this->product = $this->get_item_by_param("product", "url", $this->prod_url);
			$this->title = $this->product['title'];
			$this->comment = $this->get_items_by_param("product_comment", "product_id", $this->product['id']);
			$this->comment_count = count($this->comment);
			$this->display("main.tpl");
		}

		private function get_prod_url() {
			$view=$_SERVER['REQUEST_URI'];
			$view = substr($view, 1);

			if (($pos=strpos($view,'?'))!==false) {
				$view=substr($view,0,$pos);
			}

			return $view;
		}

		private function display($view) {
			$tmp_path = "tpl/";
			include $tmp_path.$view;
		}
	}
?>