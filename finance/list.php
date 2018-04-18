<?php
include '../config/db.php';
require 'finance.php';

$list=new finance($connect);
$customer_list=array();
$post=$_POST;
$customer_list=$list->customer_list($line_id="");
if($customer_list){
    print json_encode($customer_list);
}else{
    print json_encode($customer_list);
}