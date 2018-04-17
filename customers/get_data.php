<?php
include '../config/db.php';
require 'customer.php';

$customerslist=new customer($connect);
$get=$_GET;
$info=$get['info'];
$info_data=$customerslist->getinfo($info);
if($info_data){
    print json_encode($info_data);
}else{
    echo 0;
}