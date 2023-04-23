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

if(isset($_GET['name'])){
    $name = $_GET['name'];

    $sql = "SELECT * from $table WHERE CZName = '$name'";
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
}else{
    echo "Please provide a name parameter in the URL.";
}

$conn->close();
return;
?>
