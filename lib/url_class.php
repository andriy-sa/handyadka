<?php
require_once "abstractdata_class.php";

	class Url extends AbstractData {

		private $view;
		private $url;
		private $url_arr = array("front", "catalog","about","contact","search","notfound","cart","order");
		private $product_url;

		function __construct() {
			parent::__construct($view = false);

			$this->product_url = $this->get_product_url();

			$view=$_SERVER['REQUEST_URI'];
			$view = substr($view, 1);

			if (($pos=strpos($view,'?'))!==false) {
				$view=substr($view,0,$pos);
			}
			$this->url = $view;

			$this->check_url($view);
		}

		public function get_view() {
			return $this->view;
		}

		public function get_url() {
			return $this->url;
		}

		private function check_url($url) {
			if ($url == "" || $url == "index.php") {
				$url = "front";
				$this->view = $url;
				return true;
			}
			else
			if (in_array($url, $this->url_arr)) {
				$this->view = $url;
				return true;
			}
			else
			if (in_array($url, $this->product_url)) {
				$this->view = "product";
				return true;
			}
			else
				header("Location: notfound");
		}

		private function get_product_url() {
			$query = "SELECT `url` FROM `product`";
			$result = $this->db->mysqli->query($query);
			$result = $this->get_data($result);
			$array = array();
				foreach ($result as $item) {
					$array[] = $item['url'];
				}
			return $array;
		}
	}
?>