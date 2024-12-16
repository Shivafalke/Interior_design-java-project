<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>New Vendor Registration</title>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<!-- Additional CSS -->
	<style>
		body {
	            background-image: url('https://img.freepik.com/free-photo/millennial-asia-businessmen-businesswomen-meeting-brainstorming-ideas-about-new-paperwork-project-colleagues-working-together-planning-success-strategy-enjoy-teamwork-small-modern-night-office_7861-2386.jpg?size=626&ext=jpg&ga=GA1.1.426632419.1677587274&semt=sph');
	            background-repeat: no-repeat;
	            background-size: cover;
	        }
		form {
			padding: 20px;
			background-color: #f2f2f2;
			border-radius: 10px;
			box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
			margin-top: 50px;
		}
		h1 {
			margin-bottom: 30px;
			color: white;
		}
		.form-control-sm {
			font-size: 0.75rem; /* 14px */
			padding: 0.25rem 0.5rem;
			border-radius: 0;
		}
		label {
			font-weight: bold;
		}
		.btn-primary {
			background-color: #007bff;
			border-color: #007bff;
			border-radius: 20px;
			float: right;
		}
		.btn-primary:hover {
			background-color: #0062cc;
			border-color: #0062cc;
		}
	</style>
	<!-- <style>
		form {
			padding: 20px;
			background-color: #f2f2f2;
			border-radius: 10px;
			box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
			margin-top: 50px;
		}
		h1 {
			margin-bottom: 30px;
		}
		.form-control-sm {
			font-size: 0.75rem; /* 14px */
			padding: 0.25rem 0.5rem;
		}
	</style> -->
</head>
<body>
	<div class="container">
		<h1 class="text-center">New Vendor Registration</h1>

	<form method="post" action="NewRegisterVendorServlet">
		<div class="form-group">
			<label>Company Name:</label>
			<input type="text" name="company_name" class="form-control form-control-sm" required>
		</div>
		
		<div class="form-group">
			<label>Email:</label>
			<input type="email" name="email" class="form-control form-control-sm" required>
		</div>
		<div class="form-group">
			<label>Phone Number:</label>
			<input type="tel" name="phone" class="form-control form-control-sm" required>
		</div>
		<div class="form-group">
			<label>Address:</label>
			<input type="text" name="address" class="form-control form-control-sm" required>
		</div>
		<div class="form-group">
			    <label for="category">Select category:</label>
			    <br>
			    <input type="checkbox" name="category[]" value="interior"> Interior<br>
			    <input type="checkbox" name="category[]" value="bedroom"> Bedroom<br>
			    <input type="checkbox" name="category[]" value="kitchen"> Kitchen<br>
			    <input type="checkbox" name="category[]" value="garden"> Garden<br>
		</div>

		<div class="form-group">
			<label>City:</label>
			<input type="text" name="city" class="form-control form-control-sm" required>
		</div>
		<div class="form-group">
			<label>State:</label>
			<input type="text" name="state" class="form-control form-control-sm" required>
		</div>
		<div class="form-group">
			<label>Zip Code:</label>
			<input type="text" name="zip_code" class="form-control form-control-sm" required>
		</div>
		<div class="form-group">
			<label>Description:</label>
			<textarea name="description" class="form-control form-control-sm" rows="5" required></textarea>
		</div>
		<input type="submit" value="Submit" class="btn btn-primary">
	</form>
</div>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>

<!-- Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp" crossorigin="anonymous"></script>

<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</body>
</html>