<?php
$connect = mysql_connect("localhost","root", "");
if(!$connect)
	echo mysql_error();
$connect_db = mysql_select_db("agriext");
if(!connect_db)
	echo mysql_error();
?>