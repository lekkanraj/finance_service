<?php 
Class customer{
    private $db_con;    
    // constructor with $db as database connection
    public function __construct($db){
        $this->db_con = $db;
    }
    
    public function customerslist(){
        $customer_master_table="customer_master";
        $query=mysqli_query($this->db_con,"select * from $customer_master_table where isactive=1");
        $rows=array();
        while($result=mysqli_fetch_assoc($query)){
            $rows[]=$result;
         } 
        return $rows;
    }
    
    public function getCustomerinfo($id){
        $customer_master_table="customer_master";
        $query=mysqli_query($this->db_con,"select * from $customer_master_table where cus_id=$id");
        $rows=array();
        while($result=mysqli_fetch_assoc($query)){
            $rows[]=$result;
        }
        return $rows;
    }
    
    public function addCustomer($post){
        $customer_master_table="customer_master";
        $status=1;
        if($post){
            $query="INSERT into $customer_master_table(
                                                cus_name,
                                                job_name,
                                                mobile_no,
                                                cur_addr,
                                                per_addr,
                                                house,
                                                bailee_name,
                                                bailee_mob,
                                                security_type,
                                                security_id,
                                                line_id,
                                                isactive
                                            ) 
                                            values(
                                                '".$post['cus_name']."',
                                                '".$post['job_name']."',
                                                '".$post['mobile_no']."',
                                                '".$post['cur_addr']."',
                                                '".$post['per_addr']."',
                                                '".$post['house']."',
                                                '".$post['bailee_name']."',
                                                '".$post['bailee_mob']."',
                                                '".$post['security_type']."',
                                                '".$post['security_id']."',
                                                '".$post['line_id']."',
                                                '".$status."'
                                            )
                            ";
            $res=mysqli_query($this->db_con,$query);
            if($res){
                return $this->customerslist();
            }else{
                return false;
            }
        }else{
            return false;
        }
        
    }
    
    public function updateCustomer($post){
        $customer_master_table="customer_master";
        $status=1;
        if($post){
            $query="UPDATE $customer_master_table set 
                                                cus_name='".$post['cus_name']."',
                                                job_name='".$post['job_name']."',
                                                mobile_no='".$post['mobile_no']."',
                                                cur_addr='".$post['cur_addr']."',
                                                per_addr='".$post['per_addr']."',
                                                house='".$post['house']."',
                                                bailee_name= '".$post['bailee_name']."',
                                                bailee_mob= '".$post['bailee_mob']."',
                                                security_type='".$post['security_type']."',
                                                security_id='".$post['security_id']."',
                                                line_id='".$post['line_id']."',
                                                isactive= '".$status."' where cus_id='".$post['cus_id']."'";
           $res=mysqli_query($this->db_con,$query);
            if($res){
                return $this->customerslist();
            }else{
                return $res;
            }
            
        }else{
            return false;
        }
    }
    
    public function getinfo($info_type){        
        if($info_type=="security"){
            $security_master_table="security_master";
            $query=mysqli_query($this->db_con,"select * from $security_master_table");
            $rows=array();
            while($result=mysqli_fetch_assoc($query)){
                $rows[]=$result;
            }
            return $rows;
        }        
        if($info_type=="house"){
            $house_master_table="house_master";
            $query=mysqli_query($this->db_con,"select * from $house_master_table");
            $rows=array();
            while($result=mysqli_fetch_assoc($query)){
                $rows[]=$result;
            }
            return $rows;
        }
        return false;        
    }
    
}
