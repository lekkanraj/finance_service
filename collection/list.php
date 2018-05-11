<?php
include '../config/db.php';
require 'collection.php';

$list=new collection($connect);
$collection_list=array();
$post=$_POST;
$get=$_GET;
$collection_list=$list->collection_list($get);
if($collection_list){
    print json_encode($collection_list);
}else{
    print json_encode($collection_list);
}