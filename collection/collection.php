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
        $linetype=$line="";
        $line=isset($post['line'])? $post['line'] :"";
        $collection_date=isset($post['collection_date'])? date("Y-m-d",strtotime($post['collection_date'])) : "";
        $status_pending=1;
        
     echo  $qry="select cm.cus_id,cm.cus_name,cm.net_amt,cm.rec_amt,cm.bal_amt from $customer_table as cm
               LEFT JOIN $finance_collection_table as fc ON cm.cus_id=fc.cus_id
                WHERE cm.isactive=1 AND  cm.line_id=$line AND fc.coll_dt='".$collection_date."'
                ORDER BY cm.cus_id ASC";
        $query=mysqli_query($this->db_con,$qry);
        
        //
        $rows=array();
        while($result=mysqli_fetch_assoc($query)){
            $rows[]=$result;
        }
        return $rows;
        
    }
    
}