<?php
require "config.php"; // connection details

error_reporting ( 0 ); // no error reporting will be there

$endrecord = $_GET ['endrecord'];

if (strlen ( $endrecord ) > 0 and (!is_numeric ( $endrecord ))) {
	echo "Data Error";
	exit ();
}

$limit = 3; // Number of records per page
$total_records = $dbo->query ( "select count(ProductID) from Products" )->fetchColumn ();
if ($endrecord < $limit) {
	$endrecord = 0;
}

switch ($_GET ['direction']) {
	case "fw" : // Forward button pressed
		$start_record = $endrecord;
		break;
	case "bk" : // Backward button pressed
		$start_record = $endrecord - 2 * $limit;
		break;
	default :
		echo "Data Error";
		exit ();
}
if ($start_record < 0) {
	$start_record = 0;
}
$endrecord = $start_record + $limit;
$sql = "SELECT * FROM Products LIMIT $start_record, $limit";
$row = $dbo->prepare ( $sql );
$row->execute ();
$result = $row->fetchAll ( PDO::FETCH_ASSOC );

if (($endrecord) < $total_records) {
	$end = "yes";
} else { // managing forward button
	$end = "no";
}
if (($endrecord) > $limit) {
	$startrecord = "yes"; // managing reverse button
} else {
	$startrecord = "no";
}
	
$main = array('data'=>$result,'value'=>array("endrecord"=>"$endrecord","limit"=>"$limit","end"=>"$end","startrecord"=>"$startrecord"));
echo  json_encode($main);
?>

