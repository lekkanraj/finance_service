<?php
include '../config/db.php';
require 'line.php';

$line=new line($connect);
$post=$_POST;
$line_info=$line->updateLine($post);
if($line_info){
    print json_encode($line_info);
}else{
    echo 0;
}