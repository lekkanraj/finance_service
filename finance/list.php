<?php
include '../config/db.php';
require 'finance.php';

$list=new finance($connect);
$customer_list=array();
$post=$_POST;
$get=$_GET;
$customer_list=$list->customer_list($get);
if($customer_list){
    print json_encode($customer_list);
}else{
    print json_encode($customer_list);
}