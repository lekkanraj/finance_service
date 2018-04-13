<?php

include '../config/db.php';
require 'user.php';

/* header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

 */
// get posted data
$data=$_POST;

//print json_encode($data);

$user=new user($connect);
$user=$user->register($data);