<?Php
    
    function HHInfoContext()
    {
        require'ConnectDB/Connect.php';
        $sql="SELECT `id`, `sub_county` FROM `sub_counties`";

	    $row=$con->prepare($sql);
	    $row->execute();
	    $result=$row->fetchAll(PDO::FETCH_ASSOC);

	    //$main = array('data'=>$result);
	    //echo json_encode($main);
         return $result;   
    }
    

?>