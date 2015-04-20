<?php
require_once "abstractdata_class.php";

	class Front extends AbstractData {

		private $view;
		private $title;

		private $harakteristic;
		private $news;

		function __construct($view) {
			parent::__construct();

			$this->view = $view;
			$this->title = "Головна || HANDyadka";

			$this->harakteristic = $this->getTable("harakteristic");
			$this->news = $this->getTable("news","id",false,8);
			$this->display("main.tpl");
		}

		private function display($view) {
			$tmp_path = "tpl/";
			include $tmp_path.$view;
		}
	}

?>