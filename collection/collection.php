<?php 
Class collection{
    private $db_con;    
    // constructor with $db as database connection
    public function __construct($db){
        $this->db_con = $db;
    }
    
    public function collection_list($post){
        $linemaster_table="line_master";
        $linetype_table="line_type";
        $financemaster_table="finance_master";
        $customer_table="customer_master";
        $finance_collection_table="finance_collection";
        
        $line=isset($post['line'])? $post['line'] :"";
        $join_con='';
        if($post['collection_date'] !=""){
            $collection_date=isset($post['collection_date'])? date("Y-m-d",strtotime($post['collection_date'])) : "";
            $join_con=" AND fc.coll_dt='$collection_date'";
        }
        
       $qry="select cm.cus_id,cm.cus_name,cm.net_amt,cm.rec_amt,cm.bal_amt,cm.fin_id,fc.coll_amt from $customer_table as cm
               LEFT JOIN $finance_collection_table as fc ON cm.cus_id=fc.cus_id $join_con
                WHERE cm.isactive=1 AND  cm.line_id=$line 
                ORDER BY cm.cus_id ASC";
        $query=mysqli_query($this->db_con,$qry);
        
        //echo  $qry;
        $rows=array();
        while($result=mysqli_fetch_assoc($query)){
            $rows[]=$result;
        }
        return $rows;
        
    }
    
    public function search_linetypes(){
        $linetype_table="line_type";
        $linetypes=array();
        
        $query=mysqli_query($this->db_con, "select lt.* from $linetype_table as lt");
        while($result=mysqli_fetch_assoc($query)){
            $linetypes[]=$result;
        }
        return $linetypes;
    }
    
    public function search_lines($get=""){
        $linemaster_table="line_master";
        $lines=array();
        
        $where="";
        $linetype=isset($get['linetype']) ? $get['linetype'] :'';
        if($linetype !=""){
            $where=" Where lm.linetype_id=$linetype";
        }
        
        $query=mysqli_query($this->db_con, "select lm.* from $linemaster_table as lm $where");
        while($result=mysqli_fetch_assoc($query)){
            $lines[]=$result;
        }
        return $lines;
        
    }
    
    public function update_collection($post=null){
        $fin_id=$post['fin_id'];
        $cus_id=$post['cus_id'];
        $coll_amt=$post['coll_amt'];
        $rec_amt=$post['rec_amt'];
        $bal_amt=$post['bal_amt']; 
        $collection_date=date("Y-m-d",strtotime($post['collection_date']));        
        
        $finance_collection_table="finance_collection";
        $financemaster_table="finance_master";
        $customer_table="customer_master"; 
        
        /*Finance Collection Start*/
        $query1="INSERT into $finance_collection_table
                (fin_id,cus_id,coll_amt,coll_dt)
                values
                ('".$fin_id."','".$cus_id."','".$coll_amt."','".$collection_date."')
                 ";
        $res1=mysqli_query($this->db_con,$query1);
        /*Finance Collection End*/
        
        /*Finance,Customer Master Start*/
        $status_pending=1;
        $status_completed=2;
        $rec_amt1=($rec_amt+$coll_amt);
        $bal_amt1=($bal_amt-$coll_amt);
        $fin_end="";
        $fin_id1=$fin_id;
        if($bal_amt<=0){
            $status=$status_completed;
            $fin_end=$collection_date;
            $fin_id1="";
        }else{
            $status=$status_pending;
        }
        $query2="UPDATE $financemaster_table set
                                                rec_amt='".$rec_amt1."',
                                                bal_amt='".$bal_amt1."',
                                                fin_status_id= '".$status."',
                                                fin_end='".$fin_end."'
                                                where fin_id='".$fin_id."'";
       $res2=mysqli_query($this->db_con,$query2);
     
       $query3="UPDATE $customer_table set
                                                fin_id='".$fin_id1."', 
                                                rec_amt='".$rec_amt1."',
                                                bal_amt= '".$bal_amt1."'
                                                where cus_id='".$cus_id."'                                                
                                                ";
       $res3=mysqli_query($this->db_con,$query3);
        
      // echo $query2."</br>";
      // echo $query3;
        /*Finance Master End*/
       
       $line=isset($post['line_id'])? $post['line_id'] :"";
       $join_con='';
       if($post['collection_date'] !=""){
           $collection_date=isset($post['collection_date'])? date("Y-m-d",strtotime($post['collection_date'])) : "";
           $join_con=" AND fc.coll_dt='$collection_date'";
       }
       
       $qry="select cm.cus_id,cm.cus_name,cm.net_amt,cm.rec_amt,cm.bal_amt,fc.coll_amt from $customer_table as cm
               LEFT JOIN $finance_collection_table as fc ON cm.cus_id=fc.cus_id $join_con
                WHERE cm.isactive=1 AND  cm.line_id=$line
                ORDER BY cm.cus_id ASC";
       $query=mysqli_query($this->db_con,$qry);
       
       //echo  $qry;
       $rows=array();
       while($result=mysqli_fetch_assoc($query)){
           $rows[]=$result;
       }
       return $rows;
        
    }
    
}