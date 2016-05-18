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
  $files = array();
  $current_project = "";
  $image = array();
  $images = array();

  while ($row = mysqli_fetch_assoc($result)) {
    if ($row[] = "Files") {
      // first, break the images into an array
      $row['Files'] = explode(';', $row['Files']);
        // then break each value into another array of
        // filename, oversized, ontheboards, active
        $fields = array('Filename', 'Oversized', 'OnTheBoards', 'Active');
        foreach ($row['Files'] as $key => $val) {
          $row['Files'][$key] = array_combine($fields, explode(',', $val));
        };
    };
    $data[] = $row;
  }
  header('Content-type: application/json');
  print json_encode($data);



} else {
  // Use dummy data otherwise
  // this probably isnt needed
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
