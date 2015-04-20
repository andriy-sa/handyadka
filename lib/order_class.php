<?php
require_once "abstractdata_class.php";

	class Order extends AbstractData {

		private $view;
		private $title;

		function __construct($view) {
			parent::__construct();
			$this->view = $view;
			$this->title = "Оформлення замовлення";

			if (isset($_POST['order'])) {
				$this->new_order();
			}

			$this->display("main.tpl");
		}
		private function display($view) {
			$tmp_path = "tpl/";
			include $tmp_path.$view;
		}

		private function new_order() {
			$data = $this->xss($_REQUEST);
			$name = $data['name'];
			$sname = $data['sname'];
			$mail = $data['mail'];
			$phone = $data['phone'];
			$address = $data['address'];
			$data =date("Y-m-d")." ".date("H:i:s");
			$products = json_encode($_SESSION['products']);
			$price = $_SESSION['cart_coast'];
			$query = "INSERT INTO `order` (`name`,`sname`,`email`,`phone`,`address`,`data`,`products`,`total_price`,`status`) VALUES ('$name','$sname','$mail','$phone','$address','$data','$products','$price','Новий')";
			$result = $this->db->mysqli->query($query);
			$this->clear_cart();
			header("Location: order");
		}

		private function clear_cart() {
			unset($_SESSION['products']);
			unset($_SESSION['cart_coast']);
			unset($_SESSION['products_incart']);
		}

		private function xss($data) {
		if (is_array($data)) {
			$escaped = array();
			foreach ($data as $key => $value) {
				$escaped[$key] = $this->xss($value);
			}
			return $escaped;
		}
		return $this->db->mysqli->real_escape_string(htmlspecialchars($data));
	}
	}

?>