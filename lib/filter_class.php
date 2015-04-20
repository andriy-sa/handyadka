<?php
require_once "abstractdata_class.php";

	class Filter extends AbstractData {

		public $product;
		public $product_count;
		public $product_count_limit;

		function __construct($view) {
			parent::__construct();


		}

		public function get_filter($min_price, $max_price, $category, $sort, $count) {
			$min_price = $this->db->mysqli->real_escape_string($min_price);
			$max_price = $this->db->mysqli->real_escape_string($max_price);
			$category = $this->db->mysqli->real_escape_string($category);
			$sort = $this->db->mysqli->real_escape_string($sort);
			$count = $this->db->mysqli->real_escape_string($count);
			if ($category == "oll") {
				$category = "";
			}
			else {
				$category = "AND `category` = '$category'";
			}
			$query = "SELECT * FROM `product` WHERE `price` >= '$min_price' AND `price` <= '$max_price' ".$category." ";

			switch($sort) {
				case 1 : $sql_sort = " ORDER BY `id` DESC"; break;
				case 2 : $sql_sort = " ORDER BY `id`"; break;
				case 3 : $sql_sort = " ORDER BY `price`"; break;
				case 4 : $sql_sort = " ORDER BY `price` DESC"; break;
			}

			$query1 = $query.$sql_sort." LIMIT $count";
			$query2 = $query.$sql_sort;
			//return $query1;
			$result1 = $this->db->mysqli->query($query1);
			$result2 = $this->db->mysqli->query($query2);
			$result1 = $this->get_data($result1);
			$result2 = $this->get_data($result2);

			$this->product = $result1;
			$this->product_count = count($result2);
			$this->product_count_limit = $count;

		}

	}

?>