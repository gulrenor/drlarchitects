<?php

// Setup (this requires MySQL 4.1+ password authentication)
$host = "";
$user = "";
$pw = "";
$db = "";
$query = "";

$config = 'json-dump.config.php';
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
    //echo "<br><hr />";
    //echo "<h2>Current row ProjectID: " . $row['id'] . "</h2>";

    // Grab the image filename + oversized value for the current row
    //$image = array("filename" => $row['filename'], "oversize" => $row['oversize']);
    //array_push($images, $image);
    //$row['filename'] = $images;
    //unset($row['oversize']);

    // if the current project id (determined at the end of the
    // last loop) is still the same as the current row, then
    // add the sliced images for the current row to the running
    // files array. Otherwise, clear the array to make room for
    // the next project.
    //if ($current_project == $row['id']) {
      //unset($row[key($row - 1)]);
    //} else {
    //  $images = array();
    //};

    // After the check is made, set the current project id to
    // the current row.
    //$current_project = $row['id'];



    // work on the fetched image filenames and oversized/
    // on-the-boards attributes.
    if ($row[] = "Files") {
      // first, break the images into an array
      $row['Files'] = explode(';', $row['Files']);
        // then break each value into another array of
        // filename, oversized, ontheboards
        $fields = array('Filename', 'Oversized', 'OnTheBoards');
        foreach ($row['Files'] as $key => $val) {
          $row['Files'][$key] = array_combine($fields, explode(',', $val));
        };
    };



    /* Output for debug
    echo "<table border=1>";
    foreach ($row as $k1 => $v1) {
      echo "<tr><td>";
      echo $k1;
      echo "</td><td>";
      //if ($k1 == 'Files') {
      //  foreach($images as $k2 => $v2) {
      //      echo $k2 . "=" . $v2['filename'] . ", ";
      //      echo $v2['oversize'] . "<br />";
      //  };
      //} else {
        echo $v1;
      //};
      echo "</td></tr>";
    };
    echo "</table>";

    echo "<br><hr />";
    */

    $data[] = $row;

  }

  //$data = array_map("unserialize", array_unique(array_map("serialize", $data)));

  //echo "<pre>" . var_dump($data) . "</pre>";

  //foreach ($result as $clientname => $clientname_val) {
  //  echo $result;
  //}
  //print_r($data);
  //var_dump($data);

  header('Content-type: application/json');
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
