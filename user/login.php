<?php
include '../config/db.php';
require 'user.php';

$user=new user($connect);

$post=$_POST;
$userinfo=$user->login($post);
if($userinfo){
    print json_encode($userinfo);
}else{
    echo 0;
}
