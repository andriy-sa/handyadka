<?php
session_start();
ob_start();


if (!isset($_SESSION['adm_log']) && !isset($_SESSION['adm_pass'])) {
	include "tpl/auth.tpl";
	include "auth.php";
}
else {
	include "tpl/main.tpl";
}

/*require_once "lib/url_class.php";

$url = new Url();

$view = $url->get_view();

require_once "lib/".$view."_class.php";
new $view($view); */

?>