<?php 
Class finance{
    private $db_con;    
    // constructor with $db as database connection
    public function __construct($db){
        $this->db_con = $db;
    }
    
    public function customer_list($get=""){
        $linemaster_table="line_master";
        $linetype_table="line_type";
        $financemaster_table="finance_master";
        $customer_table="customer_master";
        $linetype=$line="";
        $linetype=isset($get['linetype'])? $get['linetype'] :"";
        $line=isset($get['line'])? $get['line'] :"";
        
        $where="";
        if($linetype !=""){
            $where .=" AND lm.linetype_id=$linetype";
        }
        if($line !=""){
            $where .=" AND lm.line_id=$line";
        }
        
        $query=mysqli_query($this->db_con,
                                        "select cm.*, lm.area,  fm.fin_id, fm.fin_amt, fm.hold_amt, fm.by_hand_amt, fm.cmpy_amt, 
                                        fm.rec_amt, fm.bal_amt, fm.profit, fm.fin_start, fm.fin_end, fm.fin_cnt, fm.close_dt, 
                                        fm.closing_cnt, fm.fin_status_id, fm.remarks from $customer_table as cm
                                        JOIN $linemaster_table as lm ON  cm.line_id=lm.line_id
                                        JOIN $linetype_table as lt ON lm.linetype_id=lt.linetype_id
                                        LEFT JOIN $financemaster_table as fm ON  cm.cus_id=fm.cus_id
                                        WHERE cm.isactive=1 $where");
        
       
        
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
    
    public function getFinCustomerinfo($id){
        $linemaster_table="line_master";
        $linetype_table="line_type";
        $financemaster_table="finance_master";
        $customer_table="customer_master";
        $financestatusmaster_table="finance_status_master";
        
        $query_string="select cm.*, lm.area,lt.linetype_name, fm.fin_id, fm.fin_amt, fm.hold_amt, fm.by_hand_amt, fm.cmpy_amt,
                    cm.net_amt,cm.rec_amt, cm.bal_amt, fm.profit, fm.fin_start, fm.fin_end, fm.fin_cnt, fm.close_dt,
                    fm.closing_cnt, fm.fin_status_id, fsm.finance_status, fm.remarks from $customer_table as cm
                    JOIN $linemaster_table as lm ON  cm.line_id=lm.line_id
                    JOIN $linetype_table as lt ON lm.linetype_id=lt.linetype_id
                    LEFT JOIN $financemaster_table as fm ON  cm.cus_id=fm.cus_id
                    LEFT JOIN $financestatusmaster_table as fsm ON  fm.fin_status_id=fsm.id
                    where cm.cus_id=$id
                    ";
        $query=mysqli_query($this->db_con,$query_string);
        $rows=array();
        while($result=mysqli_fetch_assoc($query)){
            $rows[]=$result;
        }
        return $rows;
    }
    
    public function updateFinCustomer($post){
        $financemaster_table="finance_master";
        $customer_table="customer_master";        
      
        if($post){
           // echo "<pre>";print_r($post);die();
            $cus_id=$fin_id=$fin_amt=$hold_amt=$by_hand_amt=$cmpy_amt=$fin_start=$fin_end="";
            $cus_id=$post['cus_id'];
            
            $fin_id=$post['fin_id'];
            $net_amt=$post['net_amt'];
            $bal_amt=$post['bal_amt'];
            $rec_amt=$post['rec_amt'];
            
            $fin_amt=$post['fin_amt'];
            $hold_amt=$post['hold_amt'];
            $profit=$hold_amt;
            $by_hand_amt=$post['by_hand_amt'];
            $cmpy_amt=$post['cmpy_amt'];
            
            $fin_start=date("Y-m-d",strtotime($post['fin_start']));
            $fin_end=$post['fin_end'];
            $remarks=$post['remarks'];
            $status_pending=1;
            $status_completed=2;
            $zero=0;
            
            if($fin_id==""){
                $query="INSERT into $financemaster_table
                (cus_id,fin_amt,hold_amt,by_hand_amt,cmpy_amt,profit,fin_start,fin_status_id,remarks)
                values
                ('".$cus_id."','".$fin_amt."','".$hold_amt."','".$by_hand_amt."','".$cmpy_amt."','".$profit."','".$fin_start."','".$status_pending."','".$remarks."')
                 ";
                $res=mysqli_query($this->db_con,$query);
                $finid=mysqli_insert_id($this->db_con);
                $query="UPDATE $customer_table set
                                                fin_id='".$finid."',
                                                net_amt='".$fin_amt."',
                                                rec_amt='".$zero."',
                                                bal_amt= '".$fin_amt."'
                                                where cus_id='".$cus_id."'";
                $res=mysqli_query($this->db_con,$query); 
            }
            
            
            
            if($res){
                return $res;
            }else{
                return $res;
            }
            
        }else{
            return false;
        }
    }
}