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
        //$result=mysqli_fetch_assoc($query);
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
            //echo $query;
            $res=mysqli_query($this->db_con,$query);
            return $res;
        }else{
            return false;
        }
        
    }
    
}
