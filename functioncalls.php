<?php 

include'includeparameters.php';

login();

$auth = $_REQUEST['auth'];

userAuthentication($con);

//$a = $_REQUEST['action'];

//linkHome();
//switch ($a) {
//	case 'houseHold':
//		HouseHoldInfo();
//		break;
//	
//	case 'houseHoldcrop':
//		HouseHoldcrop();
//		break;
//	case 'animalinfo':
//		AnimalInfo();
//		break;

//	case 'animalpdt':
//		AnimalProduct();
//		break;
//	
//	case 'cropab':
//		CropAbnormality();
//		break;
//	
//	case 'animalab':
//		AnimalAbnormality();
//		break;
//	case 'marktinfo':
//		market();
//		break;
//	
//	
//	case 'marktprice':
//		MarketPriceForm();
//		break;
//	
//	default:
//		# code...
//		break;
//}

?>

