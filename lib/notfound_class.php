<?php
require_once "abstractdata_class.php";

	class Notfound extends AbstractData {

		private $view;
		private $title;

		function __construct($view) {
		parent::__construct();

			$this->view = $view;
			$this->title = "Помилка 404";
			$this->display("main.tpl");
		}

		private function display($view) {
			$tmp_path = "tpl/";
			include $tmp_path.$view;
		}
	}

?>