
<html>
<head>
<title>Captcha</title>

<style type="text/css">
  	body {
    		background-color: #16344C 
	}
  </style>
</head>
<body>
<script type="text/javascript">
    function captchaValid() {
		setTimeout("fermer () ",2000);
    };

    function fermer() {
	    window.opener = self;
	    window.close();
    }
	function scrollTo(hash) {
	    location.hash = "#" + hash;
	}	
</script>
<br>
<form method='post'>
<?php
require_once('captchme-lib.php');

$publicKey = "51b26ac8ca4fd0b6d4e66db3c1da2ca602dfc373fcc8469067162d961bc0335e";
$privateKey = "dc15d50379f8f0a7f1ede04611f069371b8b8457cca7f04c51475abc5c7a7184";
$authenKey = "4c20895912ca989fd08f9b3cb21f4bb3fee7448cb3ce1c7dc179287e7553208c";

# Reponse des services Captchme
$response = null;
# Code erreur
$error = null;

if (isset($_POST["captchme_response_field"])) {
	$remoteIp = $_SERVER['REMOTE_ADDR'];
# Controle du captcha
	$response = captchme_verify ($privateKey,
			$_POST["captchme_challenge_field"],
			$_POST["captchme_response_field"],
			$remoteIp,
			$authenKey);

	if ($response->is_valid) {
		echo "<img src=\"validated.png\" alt=\"Validated\"><br>";
		echo "<span style=\"color:white;font-family: 'RieslingRegular', Arial, sans-serif;font-size:90%\"><b> Captcha valide ! Merci, vous povez valider le formulaire. </b> </span>";
		echo "<script language=javascript>captchaValid();</script>";
		exit();
	} else {
		$error = $response->error;
	}

}

# Affichage du captcha
// Pré-chargement du captcha
$captcha = captchme_load_captcha($publicKey, $_SERVER['REMOTE_ADDR'], "fr", "classic", false) ;

// Contrôle s’il s’agit d’un captcha publicitaire
if($captcha->isAd() ) {
	// Affichage du captcha dans la page
//echo"<span style=\"color:white;font-family: 'RieslingRegular', Arial, sans-serif;font-size:90%\"><b> Veuillez valider le captcha suivant pour valider le formulaire : </b> </span> ";
	$customAttributes = array ('theme' => "white");
	echo captchme_generate_html($publicKey, $error, false, $customAttributes, $captcha);
	if ($error != null) { echo "<script>document.getElementById('captchmeerreur').style.display
		= 'inline';</script>"; 
	}
}
else {
	//Implémentation alternative propre à votre site et vos besoins
	echo "<span style=\"color:white;font-family: 'RieslingRegular', Arial, sans-serif;font-size:90%\"><b> Aucun captcha publicitaire généré. Vous pouvez quand même valider le formulaire.</b> </span>";
	echo "<script language=javascript>captchaValid();</script>";
}
?>
<div><input type="submit" value="Valider le Captcha"/></div>
</form>


</body>
</html>
