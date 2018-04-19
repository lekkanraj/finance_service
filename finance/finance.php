<?php 
Class finance{
    private $db_con;    
    // constructor with $db as database connection
    public function __construct($db){
        $this->db_con = $db;
    }
    
    public function customer_list($line_id=""){
        $linemaster_table="line_master";
        $linetype_table="line_type";
        $financemaster_table="finance_master";
        $customer_table="customer_master";
        
        $query=mysqli_query($this->db_con,
                                        "select cm.*, lm.area,  fm.fin_id, fm.fin_amt, fm.hold_amt, fm.by_hand_amt, fm.cmpy_amt, 
                                        fm.rec_amt, fm.bal_amt, fm.profit, fm.fin_start, fm.fin_end, fm.fin_cnt, fm.close_dt, 
                                        fm.closing_cnt, fm.fin_status, fm.remarks from $customer_table as cm
                                        JOIN $linemaster_table as lm ON  cm.line_id=lm.line_id
                                        JOIN $linetype_table as lt ON lm.linetype_id=lt.linetype_id
                                        LEFT JOIN $financemaster_table as fm ON  fm.cus_id=fm.cus_id
                                        WHERE cm.isactive=1");
        
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
}