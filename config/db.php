<?php
require_once 'config.php';
$host=HOST_NAME;
$dbname=DB_NAME;
$username=DB_USER_NAME;
$password=DB_USER_PWD;

$connect=mysqli_connect($host,$username,$password,$dbname);
if(!$connect){
    die("DB connection faild");
}else{
    //echo "success";
}