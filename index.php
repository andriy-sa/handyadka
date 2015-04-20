<?php
session_start();
ob_start();

require_once "lib/url_class.php";

$url = new Url();

$view = $url->get_view();

require_once "lib/".$view."_class.php";
new $view($view);

?>