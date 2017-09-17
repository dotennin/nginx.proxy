<?php
define('DB_DATABASE', 'nginx.proxy');    //データベース指定
define('DB_USERNAME', 'root');     //データベースユーザ
define('DB_PASSWORD', 'nginx.proxy');   //データベースパスワード
define('PDO_DSN', 'mysql:dbhost=localhost;dbname=' .DB_DATABASE);
//   データベースに接続するための文字列

try {
    //connect
    $db = new PDO(PDO_DSN, DB_USERNAME, DB_PASSWORD);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    //insert
    $db->exec("insert into users (name, score) values ('ryo', '55')");
    echo "user added!";
    exit;

    //disconnect
    $db = null;
 }catch (PDOException $e){
    echo $e->getMessage();
    exit;
}
?>
