<?php
include '../config/db.php';
require 'finance.php';

$finance=new finance($connect);
$search_list=array();
$search_list=$finance->search_linetypes();
if($search_list){
    print json_encode($search_list);
}else{
    print json_encode($search_list);
}