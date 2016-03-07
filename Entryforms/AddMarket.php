<?php
/*$connect = mysql_connect("localhost","root", "");
if(!$connect)
	echo mysql_error();
$connect_db = mysql_select_db("agriext");
if(!$connect_db)
	echo mysql_error();*/
	function market(){
?>
<div>
	<h1> Add Market</h1>
</div>
<form action="?action=insert" method= "post">
	
	<div class="control-group">
	    <label class="control-label">Market Name</label>
	        <div class="controls">
	            <input id="Market" type="text" name="mName" />
	        </div>
	</div>
	<div class="control-group">
	    <label class="control-label">Latitude</label>
	        <div class="controls">
	        	<input id="lat" type="text" name="latitude" />
	        </div>
	</div>
	<div class="control-group">
	    <label class="control-label">Longitude</label>

    <div class="controls">
	            <input id="long" type="text" name="longitude" />
	        </div>
	</div>
	<div class="control-group">
	    <label class="control-label">Date Added</label>
	        <div class="controls">
	            <input id="date" type="date" name="Dadded" />
	        </div>
	</div>
	<div class="form-actions">
        <input id="back" class="btn btn-primary" type="submit" name="saveBtn" value="Save Market" />
   	</div>

</form>

<?php
}

?>
