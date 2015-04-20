<?php
	require_once "abstractdata_class.php";

	class Ajax extends AbstractData {

		public $comment;
		public $comment_count;

		public $news;


		function __construct($view = false) {
			parent::__construct();

		}

		public function new_comment($name, $text,$product_id) {
			$name = trim($name);
			$name = htmlspecialchars($name);
			$name = $this->db->mysqli->real_escape_string($name);
			$text = trim($text);
			$text = htmlspecialchars($text);
			$text = $this->db->mysqli->real_escape_string($text);
			$product_id = $this->db->mysqli->real_escape_string(htmlspecialchars($product_id));

			if ($name != "" && $text != "") {
				$date = date("d.m.Y")." ".date("H:i");


				$query = "INSERT INTO `product_comment`
				(`product_id`,`name`, `text`, `data`)
				VALUES ('$product_id','$name', '$text', '$date')";
				$this->db->mysqli->query($query);
			}

			$this->comment = $this->get_items_by_param('product_comment', 'product_id', $product_id);
			$this->comment_count = count($this->comment);

		}

		public function get_news($id) {
			$this->news = $this->get_item_by_param('news', 'id', $id);
		}

		public function send_message($name, $mail, $phone, $theme, $message) {
			if ($name == "" || $mail =="" || $theme == "" || $message == "") return false;

			$name = trim($name);
			$mail = trim($mail);
			$theme = trim($theme);

			$emailTo = $this->setting['email'];
		    $body = "Name: $name \n\nEmail: $mail \n\nSubject: $theme \n\nComments:\n $message";
		    $headers = 'From: HANDyadka <'.$emailTo.'>' . "\r\n" . 'Reply-To: ' . $mail;
		    mail($emailTo, $subject, $body, $headers);
		    $emailSent = true;
		}

		public function add_to_cart($product_id, $count=1) {
			if (!empty($_SESSION['products'][$product_id])) {
				$_SESSION['products'][$product_id]['count']++;
			}
			else {
			$_SESSION['products'][$product_id] = array();
			$price= array();
			$newcoast = $this->get_item_by_param('product', 'id', $product_id);
			$_SESSION['products'][$product_id]['count']=$count;
			$_SESSION['products'][$product_id]['coast']=$newcoast['price'];
			}
			$this->update_cart();
		}

		public function update_cart() {
			$_SESSION['products_incart']=0;

			$_SESSION['cart_coast']=0;

			foreach ($_SESSION['products'] as $key=>$value) {
				$_SESSION['cart_coast']+=$_SESSION['products'][$key]['coast']* $_SESSION['products'][$key]['count'];
				$_SESSION['products_incart']+=$_SESSION['products'][$key]['count'];
			}
		}

		public function remove_from_cart($id) {
			unset($_SESSION['products'][$id]);
			$this->update_cart();
		}

		public function update_cart_product_count($id,$count) {
			$_SESSION['products'][$id]['count'] = $count;
			$this->update_cart();
		}

		public function get_product_item($table, $row, $val) {
			return $this->get_item_by_param($table, $row, $val);
		}
	}
?>