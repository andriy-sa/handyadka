<?php
	require_once "../lib/config_class.php";
	$config = new Config();

	if (isset($_POST['auth'])) {
		$log = mb_strtolower($_POST['log']);
		$pass = md5($_POST['pass']);

		if ($log == $config->adm_log && $pass==$config->adm_pass) {
			$_SESSION['adm_log']=$log;
			$_SESSION['adm_pass']=$pass;
			header("Location: /");
		}
		else {
?>
	<script> $('.auth p.error-auth').fadeIn(); </script>
<?php
		}
	}
?>