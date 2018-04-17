<?php
include '../config/db.php';
require 'line.php';

$lines=new line($connect);
$post=$_POST;
$lines_info=$lines->addLine($post);
if($lines_info){
    print json_encode($lines_info);
}else{
    echo 0;
}