<?php
function AnimalInfo(){
?>

<form method = 'POST'>
	<h3>ADD ANIMAL INFORMATION</h3>
	<div class = 'form-group'>
		<label for = "name">Animal Name</label>
		<input type="text" class = "form-control" name = "animalN" id = "animalN"/>
	</div>

	<div class = "form-group">
		<label for = "name">Local Name</label>
		<input type = "text" class = "form-control"name = "LName" id = "LName"/>
	</div>

	<div class = "form-control">
		<label for ="name">Animal Breed</label>
		<input type = "text"  class = "form-control" name = "breed" id = "breed"/> 
	</div>

	<div class = "form-control">
		<label for ="name">Breed Local Name</label>
		<input type = "text"  class = "form-control" name = "breedLN" id = "breedLN"/> 
	</div>

	<div class = "form-control">
		<label for ="name">Acreage</label>
		<input type = "text"  class = "form-control" name = "acre" id = "acre"/> 
	</div>

	<div class = "form-control">
		<label for ="name"> Number reared</label>
		<input type = "text"  class = "form-control" name = "noreared" id = "noreared"/> 
	</div>

	<div class = "form-control">
		<label for ="name">Number Sold Last Season</label>
		<input type = "text"  class = "form-control" name = "SoldLS" id = "SoldLS"/> 
	</div>

	<div class = "form-control">
		<label for ="name"> Number Brought In</label>
		<input type = "text"  class = "form-control" name = "broughtIn" id = "broughtIn"/> 
	</div>

	<div class = "form-control">
		<label for ="name"> Expected Sell</label>
		<input type = "text"  class = "form-control" name = "expsell" id = "exptsell"/> 
	</div>

	<div class = "form-control">
		<label for ="name">Date of Expected Sell</label>
		<input type = "text"  class = "form-control" name = "dofExpSell" id = "dofExpSell"/> 
	</div>

	<div class = "form-control">
		<label for ="name"> Ready sell</label>
		<input type = "text"  class = "form-control" name = "ready" id = "ready"/> 
	</div>

	<div class = "form-control">
		<label for ="name"> Price</label>
		<input type = "text"  class = "form-control" name = "price" id = "price"/> 
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

