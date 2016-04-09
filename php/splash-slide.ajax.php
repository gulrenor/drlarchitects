<?php

// Setup (this requires MySQL 4.1+ password authentication)
$host = "";
$user = "";
$pw = "";
$db = "";
$query = "";

$config = 'mysql.config.php';
if (is_file($config)) {
  include $config;

  // Connect, query, and output JSON
  $connect = mysqli_connect($host, $user, $pw, $db);
  $result = mysqli_query($connect, $query);
  $data = array();
  while ($row = mysqli_fetch_array($result)) {
    $data[] = $row;
  }
  //header('Content-type: application/json');
  print json_encode($data);

} else {
  // Use dummy data otherwise
  $file = array();

  $dir = opendir('../images');
  while ($file = readdir($dir)) {
    if ($file == '.' || $file == '..') {
      continue;
    }
    $dummyData[] = $file;
  }
  header('Content-type: application/json');
  print json_encode($dummyData);
}


?>
