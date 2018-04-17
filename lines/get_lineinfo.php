<?php
include '../config/db.php';
require 'line.php';

$line=new line($connect);
$get=$_GET;
$id=$get['id'];
$line_info=array();
$line_info=$line->getLineinfo($id);
if($line_info){
    print json_encode($line_info);
}else{
    print json_encode($line_info);
}