<?php
include '../config/db.php';
require 'finance.php';

$list=new finance($connect);
$customer_info=array();
$get=$_GET;
$id=$get['id'];
$customer_info=$list->getFinCustomerinfo($id);
if($customer_info){
    print json_encode($customer_info);
}else{
    print json_encode($customer_info);
}