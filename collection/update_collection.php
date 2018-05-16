<?php
include '../config/db.php';
require 'collection.php';

$list=new collection($connect);
$collection_list=array();
$post=$_POST;
$collection_list=$list->update_collection($post);
if($collection_list){
    print json_encode($collection_list);
}else{
    print json_encode($collection_list);
}