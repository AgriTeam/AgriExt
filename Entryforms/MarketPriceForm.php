<?php
function MarketPriceForm(){
?>

<form method = 'POST'>
	<h3>ADD MARKET PRICE</h3>
	<div class = 'form-group'>
		<label for = "name">Commodity Name</label>
		<input type="text" class = "form-control" name = "commodityN" id = "cName"/>
	</div>

	<div class = "form-group">
		<label for = "name">Local Name</label>
		<input type = "text" class = "form-control"name = "LocalN" id = "LName"/>
	</div>

	<div class = "form-control">
		<label for ="name"> Commodity Price</label>
		<input type = "text"  class = "form-control" name = "CommodityP" id = "CPrice"/> 
	</div>

	<div class = "form-control">
		<label for ="name"> Volume Sold</label>
		<input type = "text"  class = "form-control" name = "VolumeS" id = "VSold"/> 
	</div>

	<div class = "form-control">
		<label for ="name"> Price Date</label>
		<input type = "text"  class = "form-control" name = "PriceD" id = "PDate"/> 
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