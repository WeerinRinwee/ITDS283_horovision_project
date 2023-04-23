<?php
$servername = "localhost";
$username = "horo";
$password = "horo";
$dbname = "horovision";
$table = "ChineseZodiac";
$conn = new mysqli($servername, $username, $password, $dbname);
if($conn->connect_error){
    die("Connection Failed: " . $conn->connect_error);
}
$sql = "SELECT * from $table ORDER BY CZName ";
$db_data = array();
$result = $conn->query($sql);
if($result->num_rows > 0){
    while($row = $result->fetch_assoc()){
        $db_data[] = $row;
    }
    echo json_encode($db_data);
}else{
    echo "error";
}
$conn->close();
return;
?>
