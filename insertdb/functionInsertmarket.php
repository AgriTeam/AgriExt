<?php 

function insertmarket(){

		$mName = $_POST["mName"];
		$latitude = $_POST["latitude"];
		$longitude = $_POST["longitude"];
		$loc = "sds";
		$date = date('Y-m-d', strtotime("now"));

		$ins = mysql_query("INSERT INTO marketinfo VALUES('NULL', '$loc', '$mName', '$latitude', '$longitude', '$date')");
		if(!$ins)
		{
			echo $mName.'</br>';
			echo $latitude.'</br>';
			echo $longitude.'</br>';
			echo $loc.'</br>';
			echo $date.'</br>';
			echo "something went wrong</br>";
			echo mysql_error();
		}

	}

?>