<?php
require_once "abstractdata_class.php";

	class Contact extends AbstractData {

		private $view;
		private $title;

		function __construct($view) {
			parent::__construct();

			$this->view = $view;
			$this->title = "Контакти";
			$this->display("main.tpl");

		}

		private function display($view) {
			$tmp_path = "tpl/";
			include $tmp_path.$view;
		}
	}
?>