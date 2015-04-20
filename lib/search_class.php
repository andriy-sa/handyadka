<?php
require_once "abstractdata_class.php";

	class Search extends AbstractData {

		private $view;
		private $title;
		private $search;

		private $product = array();

		function __construct($view) {
			parent::__construct();

			if(!isset($_GET['search'])) {
				header("Location: index.php");
			}

			$this->view = $view;
			$this->title = "Пошук";
			$this->search = htmlspecialchars(trim($_GET['search']));
			$this->product = $this->search_product();
			$this->display("main.tpl");

		}

		private function display($view) {
			$tmp_path = "tpl/";
			include $tmp_path.$view;
		}

		private function search_product() {
			if (!empty($this->search)) {
				$data = $this->db->mysqli->real_escape_string($this->search);
				$query = "SELECT * FROM `product` WHERE `title` LIKE '%$data%' OR `category` LIKE '%$data%' OR `price` LIKE '%$data%' OR `proiz` LIKE '%$data%' OR `description` LIKE '%$data%' ORDER BY 'id' DESC";
				$result = $this->db->mysqli->query($query);
				$result=$this->get_data($result);
				return $result;
			}
		}
	}
?>