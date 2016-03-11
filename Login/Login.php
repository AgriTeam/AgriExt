<?php 
	function login()
	{
		session_start();
		if($_SESSION['ERRMSG_ARR'][0] != "") 
		{
			$id = $_SESSION['ERRMSG_ARR'][0];
		}else
		{
			$id = "Enter_Email";
		}
		
		if($_SESSION['ERRMSG_ARR'][1] != "") 
		{
			$pass = $_SESSION['ERRMSG_ARR'][1];
		}else
		{
			$pass = "Enter_Password";
		}
?>		
        <div class="container">
		<form role="form" method="post" action="functioncalls.php?auth=login"> 
			<h3>LOGIN <small><?php if($_SESSION['LOGIN_FAILED'] != '') echo $_SESSION['LOGIN_FAILED'];?></small></h3>
			<div class="form-group"> 
				<label for="name">AGENT CODE</label> 
				<input type="text" class="form-control" name="id" id="id" placeholder = <?php echo $id ?>> 
			</div> 			
			<div class="form-group"> 
				<label for="name">PASSWORD</label> 
				<input type="password" class="form-control" name="password" id="password" placeholder = <?php echo $pass ?>> 
			</div> 
			
			<button type="submit" class="btn btn-default">SUBMIT</button> 
		</form>
		</div>

<?php
		//clear $_SESSION['ERRMSG_ARR'] 
		$_SESSION['ERRMSG_ARR'] = '';
		$_SESSION['LOGIN_FAILED'] = '';
	}
?>


