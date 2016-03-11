<?php
	function userAuthentication($con)
	{
		//Start session
		session_start();
		
		//Array to store validation errors
		$errmsg_arr = array();
		
		//Validation error flag
		$errflag = false;
		
		//Sanitize the POST values
		$id = clean($_POST['id']);
		$password = clean($_POST['password']);
		
		//Input Validations
		if($id == '') 
		{
			$errmsg_arr[0] = 'Login_ID_Missing';
			$errflag = true;
		}
		if($password == '') 
		{
			$errmsg_arr[1] = 'Password_Missing';
			$errflag = true;
		}
		
		//If there are input validations, redirect back to the login form
		if($errflag) 
		{
			$_SESSION['ERRMSG_ARR'] = $errmsg_arr;
			session_write_close();
			header("location: index.php");
			exit();
		}
		
		//Create query
		$qry="SELECT `id`, `firstname`, `lastname`, `emailaddress`FROM `users` WHERE `id`='$id' AND `password` = 'password'";
        $row=$con->prepare($sql);
	    $row->execute();
	    $result=$row->fetchAll(PDO::FETCH_ASSOC);
		
		//Check whether the query was successful or not
		if($result) 
		{
			if(mysqli_num_rows($result) == 1) {
				//Login Successful
				session_regenerate_id();
				$member = mysqli_fetch_assoc($result);
				$_SESSION['SESS_MEMBER_ID'] = $member['idEmployee'];
				$_SESSION['SESS_FIRST_NAME'] = $member['FName'];
				$_SESSION['SESS_LAST_NAME'] = $member['LName'];
				$_SESSION['SESS_DEPARTMERNT'] = $member['Department'];
				$_SESSION['SESS_POSITION'] = $member['Position'];

				session_write_close();
				header("location: index.php");
				exit();
			}else {
				//Login failed
				$_SESSION['LOGIN_FAILED'] = 'User ID does not match password';
				header("location: index.php");
				exit();
			}
		}else 
		{
			die("Query failed");
		}	
	}
?>