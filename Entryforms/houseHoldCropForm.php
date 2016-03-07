<?php
function HouseHoldcrop(){
?>

<form method = 'POST'>
	<h3>ADD CROP HOUSE HOLD INFORMATION</h3>
	<div class = 'form-group'>
		<label for = "name">Crop Name</label>
		<input type="text" class = "form-control" name = "cName" id = "cName"/>
	</div>

	<div class = "form-group">
		<label for = "name">Local Name</label>
		<input type = "text" class = "form-control"name = "LName" id = "LName"/>
	</div>

	<div class = "form-control">
		<label for ="name">Crop Type</label>
		<input type = "text"  class = "form-control" name = "ctype" id = "ctype"/> 
	</div>

	<div class = "form-control">
		<label for ="name"> Crop Type Local Name</label>
		<input type = "text"  class = "form-control" name = "ctypeLN" id = "ctypeLN"/> 
	</div>

	<div class = "form-control">
		<label for ="name">Acreage</label>
		<input type = "text"  class = "form-control" name = "acre" id = "acre"/> 
	</div>

	<div class = "form-control">
		<label for ="name"> Crop Size</label>
		<input type = "text"  class = "form-control" name = "cSize" id = "cSize"/> 
	</div>

	<div class = "form-control">
		<label for ="name">Last Yield</label>
		<input type = "text"  class = "form-control" name = "lastyield" id = "lastyield"/> 
	</div>

	<div class = "form-control">
		<label for ="name">Expected Yield</label>
		<input type = "text"  class = "form-control" name = "expyield" id = "expyield"/> 
	</div>

	<div class = "form-control">
		<label for ="name"> Date of Planting</label>
		<input type = "text"  class = "form-control" name = "DofP" id = "DofP"/> 
	</div>

	<div class = "form-control">
		<label for ="name"> Expected Harvest Date</label>
		<input type = "text"  class = "form-control" name = "CTNo" id = "CTNo"/> 
	</div>

	<div class = "form-control">
		<label for ="name"> Ready for Market </label>
		<input type = "text"  class = "form-control" name = "readymrkt" id = "readymrkt"/> 
	</div>

	<div class = "form-control">
		<label for ="name"> Price</label>
		<input type = "text"  class = "form-control" name = "price" id = "price"/> 
	</div>

	<div class = "form-control">
		<label for ="name"> Date Added</label>
		<input type = "text"  class = "form-control" name = "date" id = "date"/> 
	</div>

	
	<button type = "submit" class = "btn btn-default">SUBMIT</button>
</form>

<?php
}
?>

