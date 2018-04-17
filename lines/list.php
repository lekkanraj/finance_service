<?php
include '../config/db.php';
require 'line.php';

$lineslist=new line($connect);
$lines_info=array();
$lines_info=$lineslist->linelist();
if($lines_info){
    print json_encode($lines_info);
}else{
    print json_encode($lines_info);
}