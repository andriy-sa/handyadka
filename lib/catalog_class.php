<?php
require_once "abstractdata_class.php";

	class Catalog extends AbstractData {

		private $view;
		private $title;

		private $product_categories;
		private $product_count;
		private $product;

		function __construct($view) {
			parent::__construct();

			$this->view = $view;
			$this->title = "Каталог";
			$this->initial_unical_categoty();
			$this->get_product_count();
			$this->product = $this->getTable("product", "id",false,9);

			$this->display("main.tpl");
		}

		private function initial_unical_categoty() {
			$query = "SELECT `category` FROM `product`";
			$result = $this->db->mysqli->query($query);
			$result = $this->get_data($result);
			$array = array();
				foreach ($result as $item) {
					if (!in_array($item['category'], $array))
						$array[] = $item['category'];
				}
			$this->product_categories = $array;
		}

		private function get_product_count() {
			$query = "SELECT COUNT(*) FROM `product`";
			$result = $this->db->mysqli->query($query);
			$result = $result->fetch_assoc();
			$this->product_count = $result['COUNT(*)'];
		}

		private function display($view) {
			$tmp_path = "tpl/";
			include $tmp_path.$view;
		}
	}

?>