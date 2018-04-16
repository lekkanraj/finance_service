<?php
include '../config/db.php';
require 'customer.php';

$customerslist=new customer($connect);
$post=$_POST;
$customers_info=$customerslist->updateCustomer($post);
if($customers_info){
    print json_encode($customers_info);
}else{
    echo 0;
}