<?php	
	ini_set('max_execution_time', 0);
	ini_set('memory_limit', '-1');
	
#------------------Changes to be done here-----------------------------
	
	$host='localhost'; #hostname
	$user='geophalcon';          #user
	$password='geophalcon';      #password
	$database='geophalcon';      #database name
	#path of the download folder which is in the geonames folder..Dont forget to end with /
	$path= getcwd() . '/geonames/download/';
	
#*****************************************************************************	
	
	#Database base connection string
	$con=mysql_connect($host,$user,$password);
	mysql_select_db($database,$con);
	
	#opening connection for the insertion og utf8 characters
	mysql_query("SET NAMES utf8");
?>