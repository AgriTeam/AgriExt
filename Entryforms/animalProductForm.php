<?php
function AnimalProduct(){
?>

<form method = 'POST'>
	<h3>ADD Animal Products</h3>
	<div class = 'form-group'>
		<label for = "name">Product Name</label>
		<input type="text" class = "form-control" name = "pdtN" id = "pdtN"/>
	</div>

	<div class = "form-group">
		<label for = "name">Volume of Last Season</label>
		<input type = "text" class = "form-control"name = "vol" id = "vol"/>
	</div>

	<div class = "form-control">
		<label for ="name"> Volume Expected</label>
		<input type = "text"  class = "form-control" name = "volexpt" id = "volexpt"/> 
	</div>

	<div class = "form-control">
		<label for ="name"> Date Expected</label>
		<input type = "text"  class = "form-control" name = "dateexpt" id = "dateexpt"/> 
	</div>

	<div class = "form-control">
		<label for ="name"> Ready Sell</label>
		<input type = "text"  class = "form-control" name = "ready" id = "ready"/> 
	</div>

	<div class = "form-control">
		<label for ="name"> Price</label>
		<input type = "text"  class = "form-control" name = "price" id = "price"/> 
	</div>

	<div class = "form-control">
		<label for ="name"> Date Added</label>
		<input type = "text"  class = "form-control" name = "DateA" id = "DAdded"/> 
	</div>
	<button type = "submit" class = "btn btn-default">SUBMIT</button>
</form>

<?php
}
?>