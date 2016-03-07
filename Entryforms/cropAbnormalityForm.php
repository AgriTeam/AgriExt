<?php
function CropAbnormality(){
?>

<form method = 'POST'>
	<h3>ADD Crop Abnormality</h3>
	<div class = 'form-group'>
		<label for = "name">Abnormal Name</label>
		<input type="text" class = "form-control" name = "abnormalN" id = "abnormalN"/>
	</div>

	<div class = "form-group">
		<label for = "name">Abnormal Local Name</label>
		<input type = "text" class = "form-control"name = "abnormalN" id = "abnormalN"/>
	</div>

	<div class = "form-control">
		<label for ="name"> Crop Size Affeted</label>
		<input type = "text"  class = "form-control" name = "affected" id = "affected"/> 
	</div>

	<div class = "form-control">
		<label for ="name"> Crop Size After</label>
		<input type = "text"  class = "form-control" name = "csize" id = "csize"/> 
	</div>

	<div class = "form-control">
		<label for ="name"> Expert Advise</label>
		<input type = "text"  class = "form-control" name = "expertad" id = "experad"/> 
	</div>

	<div class = "form-control">
		<label for ="name"> Pest-Disease</label>
		<input type = "text"  class = "form-control" name = "pd" id = "pd"/> 
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