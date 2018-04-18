<?php 
Class finance{
    private $db_con;    
    // constructor with $db as database connection
    public function __construct($db){
        $this->db_con = $db;
    }
    
    public function customer_list($line_id=""){
        $linetype_table="line_type";
        $linemaster_table="finance_master";
        
        $query=mysqli_query($this->db_con,"select lmt.*, ltt.linetype_name from $linemaster_table as lmt
                                        JOIN $linetype_table as ltt ON  lmt.linetype_id=ltt.linetype_id
                                        WHERE lmt.isactive=1");
        
        $rows=array();
        while($result=mysqli_fetch_assoc($query)){
            $rows[]=$result;
        }
        return $rows;
    }
}