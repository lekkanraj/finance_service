<?php
include '../config/db.php';
require 'customer.php';

$customerslist=new customer($connect);
$get=$_GET;
$id=$get['id'];
$customers_info=$customerslist->getCustomerinfo($id);
if($customers_info){
    print json_encode($customers_info);
}else{
    echo 0;
}