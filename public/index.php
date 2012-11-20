
<html>
<head>
<title>Captcha</title>

<style type="text/css">
  	body {
    		background-color: #16344C 
	}
	.img {
		text-align: center;
		position: relative;
		margin-left: auto;
		margin-right: auto;
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
require_once("solvemedialib.php");			//include the Solve Media library
require_once('adscaptchalib.php');

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
		echo "<div class=\"img\">";
		echo "<img src=\"validated.png\" alt=\"Validated\"><br>";
		echo "<span style=\"color:green;font-family: 'RieslingRegular', Arial, sans-serif;font-size:90%\"> Captcha valide ! </span>";
		echo "</div>";
		echo "<script language=javascript>captchaValid();</script>";
		exit();
	} else {
		$error = $response->error;
		//echo "<div><input type=\"submit\" value=\"Valider le Captcha\"/></div>";

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
	echo "<br><br><br><br><br><br>";
	echo "<div class=\"img\">";
	echo captchme_generate_html($publicKey, $error, false, $customAttributes, $captcha);
	if ($error != null) { echo "<script>document.getElementById('captchmeerreur').style.display
		= 'inline';</script>"; 
	}
	echo "</div>";
	echo "<div><input type=\"submit\" value=\"Valider le Captcha\"/></div>";

} else {
	//Implémentation alternative propre à votre site et vos besoins
	/*
	On n'utilise plus les captchas de solvemedia
	echo solvemedia_get_html("a1KL8sKzLD3BXkZ93MzP.XNqfo8qxLo3");	//outputs the widget

	$privkey="xkj9yUxKt.HJCJ2LmmW4dqnJx.Lwc9YQ";
	$hashkey="FpjuF4il4c0XwxHQBMWEXBmanBLqyqDJ";
	
	if (isset($_POST["adcopy_response"])) {

	$solvemedia_response = solvemedia_check_answer($privkey,
					$_SERVER["REMOTE_ADDR"],
					$_POST["adcopy_challenge"],
					$_POST["adcopy_response"],
					$hashkey);
					
	if (!$solvemedia_response->is_valid) {
	//handle incorrect answer
	print "Error: ".$solvemedia_response->error;
	echo "<div><input type=\"submit\" value=\"Valider le Captcha\"/></div>";
	} else {		
		echo "<span style=\"color:green;font-family: 'RieslingRegular', Arial, sans-serif;font-size:90%\"> Captcha valide ! </span>";
		echo "<script language=javascript>captchaValid();</script>";

		

	}*/

	$captchaId  = '3760';   // Set your captcha id here
	$publicKey  = 'b6d80129-9160-4cf9-9a1e-2a945d70612c';   // Set your public key here
	echo GetCaptcha($captchaId, $publicKey);

	$privateKey = '5899127f-c9e0-4acf-b933-18066e25d368';   // Set your private key here
	$challengeValue = $_POST['adscaptcha_challenge_field'];
	$responseValue  = $_POST['adscaptcha_response_field'];
	$remoteAddress  = $_SERVER["REMOTE_ADDR"];

	if (isset($_POST["adscaptcha_response_field"])) {
	if ("true" == ValidateCaptcha($captchaId, $privateKey, $challengeValue, $responseValue, $remoteAddress))
	{
	    // Corrent answer, continue with your submission process
		echo "<span style=\"color:green;font-family: 'RieslingRegular', Arial, sans-serif;font-size:90%\"> Captcha valide ! </span>";
		echo "<script language=javascript>fermer();</script>";

	} else {
	    // Wrong answer, you may display a new AdsCaptcha and add an error message 
		echo "<span style=\"color:red;font-family: 'RieslingRegular', Arial, sans-serif;font-size:90%\"> Captcha non valide, veuillez réessayer. </span>";
		echo "<div><input type=\"submit\" value=\"Valider le Captcha\"/></div>";
	}
	} else {
		echo "<div><input type=\"submit\" value=\"Valider le Captcha\"/></div>";
}
	

}


?>
</form>


</body>
</html>
