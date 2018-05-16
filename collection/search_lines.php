<?php
include '../config/db.php';
require 'collection.php';

$collection=new collection($connect);
$search_list=array();
$get=$_GET;
$search_list=$collection->search_lines($get);
if($search_list){
    print json_encode($search_list);
}else{
    print json_encode($search_list);
}