<?php
require_once "abstractdata_class.php";

	class Cart extends AbstractData {

		private $view;
		private $title;

		function __construct($view) {
			parent::__construct();

			$this->view = $view;
			$this->title = "Кошик";

			$this->display("main.tpl");
		}
		private function display($view) {
			$tmp_path = "tpl/";
			include $tmp_path.$view;
		}
	}

?>