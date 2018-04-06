<?php
Class user{
    
    private $db_con;
    
    // constructor with $db as database connection
    public function __construct($db){
        $this->db_con = $db;
    }
    
    //Function for Checking the User Login
    public function login(){
        $user_table="user_master";
        $query=mysqli_query($this->db_con,"select * from $user_table");
        $rows=array();
        while($result=mysqli_fetch_assoc($query)){
            $rows[]=$result;
        }
      return $rows;        
    }
    
    //Function for User Registration
    public function register(){
        $user_table="user_master";
        if($post){
            $query="INSERT into users(username,firstname,lastname) values('".$post['username']."','".$post['firstName']."','".$post['lastName']."')";
            //echo $query;
            $res=mysqli_query($connect,$query);
            return $res;
        }else{
            return false;
        }
    }
    
}