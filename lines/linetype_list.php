<?php
include '../config/db.php';
require 'line.php';

$linestypelist=new Line($connect);
$linestype_info=array();
$linestype_info=$linestypelist->linetypelist();
if($linestype_info){
    print json_encode($linestype_info);
}else{
    print json_encode($linestype_info);
}