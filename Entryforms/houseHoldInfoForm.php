<?php
function HouseHoldInfo(){
    include'EntryContext/HHInfoEntryContext.php';
?>

<form method = 'POST'>
	<h3>ADD HOUSE HOLD INFORMATION</h3>
	<div class = 'form-group'>
		<label for = "name">Location</label>
         
        <select name="location" id="location">
             <?php
               $result = HHInfoContext(); 
               foreach($result as $item)
               {
                  ?>
            <option><?php echo $item['sub_county']?></option>
            <?php
               }
            ?>
               
		</select>
	</div>

	<div class = "form-group">
		<label for = "name">Latitude</label>
		<input type = "text" class = "form-control"name = "Latitude" id = "Longitude"/>
	</div>

	<div class = "form-control">
		<label for ="name">Longitude</label>
		<input type = "text"  class = "form-control" name = "longitude" id = "longitude"/> 
	</div>

	<div class = "form-control">
		<label for ="name"> Agent Allocated</label>
		<input type = "text"  class = "form-control" name = "agent" id = "agent"/> 
	</div>

	<div class = "form-control">
		<label for ="name">Head of House Hold</label>
		<input type = "text"  class = "form-control" name = "HofHH" id = "HofHH"/> 
	</div>

	<div class = "form-control">
		<label for ="name"> Size of Land</label>
		<input type = "text"  class = "form-control" name = "SofL" id = "SofL"/> 
	</div>

	<div class = "form-control">
		<label for ="name">Size of Agricultural Land</label>
		<input type = "text"  class = "form-control" name = "SofAL" id = "SofAL"/> 
	</div>

	<div class = "form-control">
		<label for ="name"> Size of Land Shelter</label>
		<input type = "text"  class = "form-control" name = "SofLS" id = "SofLS"/> 
	</div>

	<div class = "form-control">
		<label for ="name"> Size of Land Unused</label>
		<input type = "text"  class = "form-control" name = "SofLU" id = "SofLU"/> 
	</div>

	<div class = "form-control">
		<label for ="name"> Crop Type No</label>
		<input type = "text"  class = "form-control" name = "CTNo" id = "CTNo"/> 
	</div>

	<div class = "form-control">
		<label for ="name"> Crop Land Size</label>
		<input type = "text"  class = "form-control" name = "CropLS" id = "CropLS"/> 
	</div>

	<div class = "form-control">
		<label for ="name"> Animal Type No</label>
		<input type = "text"  class = "form-control" name = "AnimalTNo" id = "AnimalTNo"/> 
	</div>

	<div class = "form-control">
		<label for ="name"> Animal Land Size</label>
		<input type = "text"  class = "form-control" name = "AnimalLS" id = "AnimalLS"/> 
	</div>

	<div class = "form-control">
		<label for ="name">Date Added</label>
		<input type = "text"  class = "form-control" name = "date" id = "date"/> 
	</div>
	<button type = "submit" class = "btn btn-default">SUBMIT</button>
</form>

<?php
}
?>

