<?php
include '../config/db.php';
require 'customer.php';

$customerslist=new customer($connect);
$customers_info=array();
$customers_info=$customerslist->customerslist();
if($customers_info){
    print json_encode($customers_info);
}else{
    print json_encode($customers_info);
}