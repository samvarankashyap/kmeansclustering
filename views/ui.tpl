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
                        $("#error").html("");
                        postObj["x_param"] = $( "#x_param" ).val();
                        postObj["y_param"] = $( "#y_param" ).val();
                        postObj["noofclusters"] = $( "#noofclusters" ).val();
                        var intRegex = /^\d+$/;
                        var str = $('#noofclusters').val();
                        if(intRegex.test(str)){
                        console.log(postObj);
               			$.post("/clusterimage",postObj,
    				function(data, status){
                                	//$("#content").text(data);
                                        console.log(data);
                                        var res = data.split("#");
                                        $("#cluster_image").attr("src", "/static/"+res[0])
                                        $("#cluster_image").show()
                                        $("#caption").show()
                                        var instances = JSON.parse(res[1]);
                                        var distances = JSON.parse(res[2]);
                                        for(x in instances){
                                            if(instances[x]>0){
                                            $("#error").append(x+":"+instances[x]+"<br>");
                                              }
                                        }
                                        for(y in distances){
                                             $("#error").append(y+":"+distances[y]+"<br>");
                                        }
                                        
               			});
                        }
                        else{
                         $("#error").html("Number of clusters invalid")
                         }
		});

});
</script>

</head>

<body>

<!--
field_names = ['Report No.','Report Date','Sent to Manufacturer / Importer / Private Labeler','Publication Date','Category of Submitter','Product Description','Product Category','Product Sub Category','Product Type','Product Code','Manufacturer / Importer / Private Labeler Name','Brand','Model Name or Number','Serial Number','UPC','Date Manufactured','Manufacturer Date Code','Retailer','Retailer State','Purchase Date','Purchase Date Is Estimate','Incident Description','City','State','ZIP','Location','(Primary) Victim Severity','(Primary) Victims Gender','My Relation To The (Primary) Victim','(Primary) Victims Age (years)','Submitter Has Product','Product Was Damaged Before Incident','Damage Description','Damage Repaired','Product Was Modified Before Incident','Have You Contacted The Manufacturer','If Not Do You Plan To','Answer Explanation','Company Comments','Associated Report Numbers']
-->
<input type="button" id="show" value="cluster">
<br>
<img id="cluster_image" src='' ></img>
<h2 id="caption">No.of X axis vs No.of Y axis<h2>

<select id="x_param">
<option value='latitude'>latitude</option>
<option value='longitude'>longitude</option>
<option value='depth'>depth</option>
<option value='mag'>mag</option>
<option value='nst'>nst</option>
<option value='gap'>gap</option>
<option value='dmin'>dmin</option>
<option value='rms'>rms</option>
</select>

<select id="y_param">
<option value='latitude'>latitude</option>
<option value='longitude'>longitude</option>
<option value='depth'>depth</option>
<option value='mag'>mag</option>
<option value='nst'>nst</option>
<option value='gap'>gap</option>
<option value='dmin'>dmin</option>
<option value='rms'>rms</option>
</select>
<input type="text" id="noofclusters">
<br>
<div id="error"></div>
</body>
</html>
