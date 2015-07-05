<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script>
$( document ).ready(function() {
    $("#cluster_image").hide()
    $("#caption").hide()
    console.log( "ready!" );
               $( "#show" ).click(function() {
                        var postObj = {};
                        postObj["x_param"] = $( "#x_param" ).val();
                        postObj["y_param"] = $( "#y_param" ).val();
                        console.log(postObj);
               			$.post("/clusterimage",postObj,
    				function(data, status){
                                	//$("#content").text(data);
                                        console.log(data)
                                        $("#cluster_image").attr("src", "/static/"+data)
                                        $("#cluster_image").show()
                                        $("#caption").show()
               			});
		});

});
</script>

</head>

<body>

<!--
field_names = ['Report No.','Report Date','Sent to Manufacturer / Importer / Private Labeler','Publication Date','Category of Submitter','Product Description','Product Category','Product Sub Category','Product Type','Product Code','Manufacturer / Importer / Private Labeler Name','Brand','Model Name or Number','Serial Number','UPC','Date Manufactured','Manufacturer Date Code','Retailer','Retailer State','Purchase Date','Purchase Date Is Estimate','Incident Description','City','State','ZIP','Location','(Primary) Victim Severity','(Primary) Victims Gender','My Relation To The (Primary) Victim','(Primary) Victims Age (years)','Submitter Has Product','Product Was Damaged Before Incident','Damage Description','Damage Repaired','Product Was Modified Before Incident','Have You Contacted The Manufacturer','If Not Do You Plan To','Answer Explanation','Company Comments','Associated Report Numbers']
-->
Parameter1 : 
<select id="x_param">
<option value='Report No.'>Report No.</option>
<option value='Report Date'>Report Date</option>
<option value='Sent to Manufacturer / Importer / Private Labeler'>Sent to Manufacturer / Importer / Private Labeler</option>
<option value='Publication Date'>Publication Date</option>
<option value='Category of Submitter'>Category of Submitter</option>
<option value='Product Description'>Product Description</option>
<option value='Product Category'>Product Category</option>
<option value='Product Sub Category'>Product Sub Category</option>
<option value='Product Type'>Product Type</option>
<option value='Product Code'>Product Code</option>
<option value='Manufacturer / Importer / Private Labeler Name'>Manufacturer / Importer / Private Labeler Name</option>
<option value='Brand'>Brand</option>
<option value='Model Name or Number'>Model Name or Number</option>
<option value='Serial Number'>Serial Number</option>
<option value='UPC'>UPC</option>
<option value='Date Manufactured'>Date Manufactured</option>
<option value='Manufacturer Date Code'>Manufacturer Date Code</option>
<option value='Retailer'>Retailer</option>
<option value='Retailer State'>Retailer State</option>
<option value='Purchase Date'>Purchase Date</option>
<option value='Purchase Date Is Estimate'>Purchase Date Is Estimate</option>
<option value='Incident Description'>Incident Description</option>
<option value='City'>City</option>
<option value='State'>State</option>
<option value='ZIP'>ZIP</option>
<option value='Location'>Location</option>
<option value='(Primary) Victim Severity'>(Primary) Victim Severity</option>
<option value='(Primary) Victims Gender'>(Primary) Victims Gender</option>
<option value='My Relation To The (Primary) Victim'>My Relation To The (Primary) Victim</option>
<option value='(Primary) Victims Age (years)'>(Primary) Victims Age (years)</option>
<option value='Submitter Has Product'>Submitter Has Product</option>
<option value='Product Was Damaged Before Incident'>Product Was Damaged Before Incident</option>
<option value='Damage Description'>Damage Description</option>
<option value='Damage Repaired'>Damage Repaired</option>
<option value='Product Was Modified Before Incident'>Product Was Modified Before Incident</option>
<option value='Have You Contacted The Manufacturer'>Have You Contacted The Manufacturer</option>
<option value='If Not Do You Plan To'>If Not Do You Plan To</option>
<option value='Answer Explanation'>Answer Explanation</option>
<option value='Company Comments'>Company Comments</option>
<option value='Associated Report Numbers'>Associated Report Numbers</option>
</select>
<br>
Parameter2:
<select id="y_param">
<option value='Report No.'>Report No.</option>
<option value='Report Date'>Report Date</option>
<option value='Sent to Manufacturer / Importer / Private Labeler'>Sent to Manufacturer / Importer / Private Labeler</option>
<option value='Publication Date'>Publication Date</option>
<option value='Category of Submitter'>Category of Submitter</option>
<option value='Product Description'>Product Description</option>
<option value='Product Category'>Product Category</option>
<option value='Product Sub Category'>Product Sub Category</option>
<option value='Product Type'>Product Type</option>
<option value='Product Code'>Product Code</option>
<option value='Manufacturer / Importer / Private Labeler Name'>Manufacturer / Importer / Private Labeler Name</option>
<option value='Brand'>Brand</option>
<option value='Model Name or Number'>Model Name or Number</option>
<option value='Serial Number'>Serial Number</option>
<option value='UPC'>UPC</option>
<option value='Date Manufactured'>Date Manufactured</option>
<option value='Manufacturer Date Code'>Manufacturer Date Code</option>
<option value='Retailer'>Retailer</option>
<option value='Retailer State'>Retailer State</option>
<option value='Purchase Date'>Purchase Date</option>
<option value='Purchase Date Is Estimate'>Purchase Date Is Estimate</option>
<option value='Incident Description'>Incident Description</option>
<option value='City'>City</option>
<option value='State'>State</option>
<option value='ZIP'>ZIP</option>
<option value='Location'>Location</option>
<option value='(Primary) Victim Severity'>(Primary) Victim Severity</option>
<option value='(Primary) Victims Gender'>(Primary) Victims Gender</option>
<option value='My Relation To The (Primary) Victim'>My Relation To The (Primary) Victim</option>
<option value='(Primary) Victims Age (years)'>(Primary) Victims Age (years)</option>
<option value='Submitter Has Product'>Submitter Has Product</option>
<option value='Product Was Damaged Before Incident'>Product Was Damaged Before Incident</option>
<option value='Damage Description'>Damage Description</option>
<option value='Damage Repaired'>Damage Repaired</option>
<option value='Product Was Modified Before Incident'>Product Was Modified Before Incident</option>
<option value='Have You Contacted The Manufacturer'>Have You Contacted The Manufacturer</option>
<option value='If Not Do You Plan To'>If Not Do You Plan To</option>
<option value='Answer Explanation'>Answer Explanation</option>
<option value='Company Comments'>Company Comments</option>
<option value='Associated Report Numbers'>Associated Report Numbers</option>
</select>
<input type="button" id="show" value="cluster">
<br>
<img id="cluster_image" src='' ></img>
<h2 id="caption">No.of X axis vs No.of Y axis<h2>
</body>
</html>

