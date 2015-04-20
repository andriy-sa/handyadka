<?php
require_once "config_class.php";
require_once "db_class.php";

	abstract class AbstractData {

		protected $config;
		protected $db;
		protected $setting;


		function __construct() {
			$this->config = new Config();
			$this->db = DataBase::GetDB();
			$this->initial_setting();
		}

		protected function initial_setting() {

			$query = "SELECT * FROM `setting`";
			$result = $this->db->mysqli->query($query);
			$this->setting = $result->fetch_assoc();

		}

		protected function get_data($result) {
			$array = array();
			while ($row = $result->fetch_assoc()) {
				$array[] = $row;
			}

			return $array;
		}

		protected function getTable($table, $order=false, $up=true, $count=false, $offset=false) {
			$ol=$this->getOl($order,$up,$count,$offset);
			$query="SELECT * FROM `$table` $ol";
			$query = $this->db->mysqli->query($query);
			$result=$this->get_data($query);
			return $result;
		}

		protected function getOl($order,$up,$count,$offset) {
			if ($order) { $order="ORDER BY `$order`";
				if (!$up) $order.=" DESC";
			}
			$limit=$this->getLi($count, $offset);
			return "$order $limit";
		}

		protected function getLi($count, $offset) {
			$limit="";
			if($count) {
				if ($offset) {
					$limit="LIMIT $offset, $count";
				}
				else $limit="LIMIT $count";
			}
			return $limit;
		}

		protected function get_item_by_param($table, $row, $val) {
			$query = "SELECT * FROM `$table` WHERE `$row` = '$val'";
			$result = $this->db->mysqli->query($query);
			$result = $result->fetch_assoc();
			return $result;
		}

		protected function get_items_by_param($table, $row, $val) {
			$query = "SELECT * FROM `$table` WHERE `$row` = '$val' ORDER BY `id` DESC";
			$result = $this->db->mysqli->query($query);
			$result = $this->get_data($result);
			return $result;
		}

	}

?>