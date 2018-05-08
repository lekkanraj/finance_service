<?php
include '../config/db.php';
require 'finance.php';

$list=new finance($connect);
$customer_info=array();
$post=$_POST;
$customer_info=$list->updateFinCustomer($post);
if($customer_info){
    print json_encode($customer_info);
}else{
    print json_encode($customer_info);
}