<?php
include '../config/db.php';
require 'user.php';

$user=new user($connect);
$userinfo=$user->login();

print json_encode($userinfo);