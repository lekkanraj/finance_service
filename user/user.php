<?php
Class user{
    
    private $db_con;
    
    // constructor with $db as database connection
    public function __construct($db){
        $this->db_con = $db;
    }
    
    //Function for Checking the User Login
    public function login($data=""){
        if($data !=''){
            $user_table="user_master";
            
            $user_name=$user_pwd='';
            $user_name=$data['username'];
            $user_pwd=$data['password'];
            $query=mysqli_query($this->db_con,"select user_id,user_name from $user_table where user_name='".$user_name."' AND user_pwd='".$user_pwd."'");
            $rows=array();
            /* while($result=mysqli_fetch_array($query)){
                $rows[]=$result;
            } */
            $result=mysqli_fetch_assoc($query);
            return $result; 
        }else{
            return false;
        }
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