<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Rest Consumer</title>
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

</head>
<body>
	<div class="container">
	<div class="col-lg-12">
		<h1><u>Consuming REST Web Services</u></h1>
		</div>
		<div class="col-lg-8">
			<div class="form-group">
				<h2>createSite</h2>
				<input id="sName" type="text" placeholder="Enter Site Name">
				<input id="lat" type="text" placeholder="Enter latitude"> <input
					id="lon" type="text" placeholder="Enter longitude"> <input
					id="insertSite" type="button" name="btn" value="Insert Site">
			</div>


			<div class="form-group">
				<h2>deleteSite</h2>
				<input id="deleteID" type="text" placeholder="Enter id to delete">
				<input id="deleteSite" type="button" name="btn" value="Delete Site">
			</div>

			<div class="form-group">
				<h2>findSite</h2>
				<input id="findID" type="text" placeholder="Enter id to find">
				<input id="findSite" type="button" name="btn" value="Find Site">
			</div>

			<div class="form-group">
				<h2>findAllSites</h2>
				<input id="findAllSite" type="button" name="btn"
					value="Find All Sites">
			</div>

			<div class="form-group">
				<h2>updateSite</h2>

				<input id="sId" type="text" placeholder="Enter Site ID"> <input
					id="sNameu" type="text" placeholder="Enter Site Name"> <input
					id="latu" type="text" placeholder="Enter latitude"> <input
					id="lonu" type="text" placeholder="Enter longitude"> <input
					id="updateSite" type="button" name="btn" value="Update Site">
			</div>

		</div>
		
		<div id="result"  class="col-lg-4">
		</div>
		<script type="text/javascript">
			$('#insertSite')
					.click(
							function() {
								var sname = $('#sName').val();
								var lat = parseFloat($('#lat').val());
								var lon = parseFloat($('#lon').val());
								var site = {
									id : 0,
									name : sname,
									latitude : lat,
									longitude : lon
								};
								$
										.ajax({
											url : "/JWS_JPA/api/site",
											dataType : "json",
											type : "post",
											data : JSON.stringify(site),
											contentType : "application/json; charset=utf-8",
											success : function(response) {
												console
														.log("Site was inserted successfully. All sites:");
												clearResults();
												displayResult(response);
												console.log(response);

											},
											error : function(exception) {
												console.log('Exeption:'
														+ exception);
											}

										});

							});

			$('#deleteSite')
					.click(
							function() {
								var siteid = $('#deleteID').val();
								$
										.ajax({
											url : "/JWS_JPA/api/site/" + siteid,
											dataType : "json",
											type : "delete",
											contentType : "application/json; charset=utf-8",
											success : function(response) {
												console
														.log("Site was deleted successfully. Remaining objects:");
												console.log(response);
												clearResults();
												displayResult(response);

											},
											error : function(exception) {
												alert('Exeption:' + exception);
											}

										});

							});

			$('#findSite').click(function() {
				var siteid = $('#findID').val();
				$.ajax({
					url : "/JWS_JPA/api/site/" + siteid,
					dataType : "json",
					type : "get",
					contentType : "application/json; charset=utf-8",
					success : function(data) {
						console.log(data);
						clearResults();
						var table='<table class="table table-striped"><thead><th>ID</th><th>Name</th><th>Longitude</th><th>Latitude</th></thead><tbody>';
						
						
							  var row='<tr><td>'+data.id+'</td><td>'+data.name+'</td><td>'+data.latitude+'</td><td>'+data.longitude+'</td></tr>';
							  table+=row;
							
						
						table+='</tbody><table>'
						$('#result').append(table);

					},
					error : function(exception) {
						alert('Exeption:' + exception);
					}

				});

			});

			$('#findAllSite').click(function() {

				$.ajax({
					url : "/JWS_JPA/api/site",
					dataType : "json",
					type : "get",
					contentType : "application/json; charset=utf-8",
					success : function(response) {
						console.log(response);
						clearResults();
						displayResult(response);

					},
					error : function(exception) {
						alert('Exeption:' + exception);
					}

				});

			});

			$('#updateSite')
					.click(
							function() {
								var sid = $('#sId').val();
								var sname = $('#sNameu').val();
								var lat = parseFloat($('#latu').val());
								var lon = parseFloat($('#lonu').val());
								var site = {
									id : 0,
									name : sname,
									latitude : lat,
									longitude : lon
								};
								$
										.ajax({
											url : "/JWS_JPA/api/site/" + sid,
											dataType : "json",
											type : "put",
											data : JSON.stringify(site),
											contentType : "application/json; charset=utf-8",
											success : function(response) {
												console
														.log("Site was updated successfully. All sites:");
												console.log(response);
												clearResults();
												displayResult(response);

											},
											error : function(exception) {
												console.log('Exeption:'
														+ exception);
											}

										});

							});
			
			
			function displayResult(data)
			{
				var table='<table class="table table-striped"><thead><th>ID</th><th>Name</th><th>Longitude</th><th>Latitude</th></thead><tbody>';
				
				for (i=0;i<data.length;i++)
					{
					  var row='<tr><td>'+data[i].id+'</td><td>'+data[i].name+'</td><td>'+data[i].latitude+'</td><td>'+data[i].longitude+'</td></tr>';
					  table+=row;
					}
				
				table+='</tbody><table>'
				$('#result').append(table);
			}
			
			function clearResults()
			{
				$('#result').empty();
			}
		</script>
</body>
</html>