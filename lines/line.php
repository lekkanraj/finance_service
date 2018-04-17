<?php 
Class line{
    private $db_con;    
    // constructor with $db as database connection
    public function __construct($db){
        $this->db_con = $db;
    }
    
    public function linelist(){
        $linetype_table="line_type";
        $linemaster_table="line_master";
        
         $query=mysqli_query($this->db_con,"select lmt.*, ltt.linetype_name from $linemaster_table as lmt  
                                        JOIN $linetype_table as ltt ON  lmt.linetype_id=ltt.linetype_id 
                                        WHERE lmt.isactive=1");
       
        $rows=array();
        while($result=mysqli_fetch_assoc($query)){
            $rows[]=$result;
         } 
        //$result=mysqli_fetch_assoc($query);
        return $rows;
    }
    
    public function linetypelist(){
        $linetype_table="line_type";        
        $query=mysqli_query($this->db_con,"select * from $linetype_table");        
        $rows=array();
        while($result=mysqli_fetch_assoc($query)){
            $rows[]=$result;
        }
        return $rows;
    }
    
    public function getLineinfo($id){
        $linemaster_table="line_master";
        $query=mysqli_query($this->db_con,"select * from $linemaster_table where line_id=$id");
        $rows=array();
        while($result=mysqli_fetch_assoc($query)){
            $rows[]=$result;
        }
        return $rows;
    }
    
    public function addLine($post){
        $line_master_table="line_master";
        $status=1;
        if($post){
            $query="INSERT into $line_master_table(
                                                linetype_id,
                                                area,
                                                isactive
                                            ) 
                                            values(
                                                '".$post['linetype_id']."',
                                                '".$post['area']."',
                                                '".$status."'
                                            )
                            ";
            //echo $query;
            $res=mysqli_query($this->db_con,$query);
            if($res){
                return $this->linelist();
            }else{
                return false;
            }
        }else{
            return false;
        }
        
    }
    
    public function updateLine($post){
        $status=1;
        $line_master_table="line_master";
        if($post){
            $query="UPDATE $line_master_table set 
                                                linetype_id='".$post['linetype_id']."',
                                                area='".$post['area']."',
                                                isactive= '".$status."'
                                                where line_id='".$post['line_id']."'";
            //echo $query;
            $res=mysqli_query($this->db_con,$query);
            if($res){
                return $this->linelist();
            }else{
                return $res;
            }
            
        }else{
            return false;
        }
    }
    
}
