<?php
require_once "config_class.php";

	class DataBase {

		private static $db = NULL;
		private $config;
		public $mysqli;

		function __construct() {
			$this->config = new Config();
			$this->mysqli = new mysqli($this->config->db_host, $this->config->db_user, $this->config->db_password, $this->config->db_name);
			$this->mysqli->query("SET names 'utf8'");
		}

		public static function GetDB() {
			if (self::$db == NULL) self::$db = new DataBase();
			return self::$db;
		}


	}

?>