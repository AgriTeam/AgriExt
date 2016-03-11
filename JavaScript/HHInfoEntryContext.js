function proveAjaxCompatible()
{
	var httpxml;
	try
	{
		// Firefox, Opera 8.0+, Safari
		httpxml=new XMLHttpRequest();
		return httpxml;
		
	}
	catch (e)
	{
		// Internet Explorer
		try
		{
			httpxml=new ActiveXObject("Msxml2.XMLHTTP");
			return httpxml;
		}
		catch (e)
		{
			try
			{
				httpxml=new ActiveXObject("Microsoft.XMLHTTP");
				return httpxml;
			}
			catch (e)
			{
				alert("Your browser does not support AJAX!");
				return false;
			}
		}
	}
}




function HHInfoAjaxFunction()
 {
 	var httpxml = proveAjaxCompatible();
 	
 	function stateck() 
     {
 
 		if(httpxml.readyState==4)
 		{
 			//alert(httpxml.responseText);
 			var myarray = JSON.parse(httpxml.responseText);			
 			
 			// Remove the options from 2nd dropdown list 
 			for(j=document.changeform.location.options.length-1;j>=0;j--)
 			{
 				document.changeform.location.remove(j);
 			}
 			
 			
 			for (i=0;i<myarray.data.length;i++)
 			{
 				var optn = document.createElement("OPTION");
 				optn.text = myarray.data[i].Name;
 				optn.value = myarray.data[i].idEquipment;  // You can change this to subcategory 
 				document.changeform.location.options.add(optn);
 			} 
 			
 		}
     } // end of function stateck
 	
 	var url="EntryContext/HHInfoEntryContext.php";
 	//var itemType=document.getElementById('itemType').value;
 	
 	//url=url+"?itemType="+itemType;
 	//url=url+"&sid="+Math.random();
 	
 	alert(url);
 	
 	httpxml.onreadystatechange=stateck;
 	
 	alert(url);
 	httpxml.open("GET",url,true);
 	httpxml.send(null);
   }
   
   alert("malmike");
   
   
     
 