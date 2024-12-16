<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Vendor Sign Up</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <!-- Custom CSS -->
    <style>
        body {
            background-image: url('https://img.freepik.com/free-photo/office-supplies_23-2148103963.jpg?w=996&t=st=1681195296~exp=1681195896~hmac=6b729f69a982a62cb048c07224b48fe3f074e871e8651b69a86abf052c759957');
            background-repeat: no-repeat;
            background-size: cover;
        }
        
        h1 {
            text-align: center;
            margin-top: 50px;
            margin-bottom: 30px;
            color: white;
        }
        
        form {
            max-width: 400px;
            margin: auto;
            border: 2px solid #007bff;
            border-radius: 10px;
            padding: 20px;
            background-color: #fff;
        }
        
        label {
            font-weight: bold;
            color: #6c757d;
        }
        
        input[type="text"], input[type="email"], input[type="password"] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        
        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        
        input[type="submit"]:hover {
            background-color: #0069d9;
        }
    </style>
</head>
<body>
    <h1>Vendor Sign Up</h1>
    <form action="VendorAccountcreate" method="post" onsubmit="return validateForm()" enctype="multipart/form-data">
        <div class="form-group">
            <label for="name">Company Name:</label>
            <input type="text" name="name" id="name" class="form-control" required>
        </div>
        
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" name="email" id="email" class="form-control" required>
        </div>
        
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" name="password" id="password" class="form-control" required>
        </div>
        
        <div class="form-group">
            <label for="confirm_password">Confirm Password:</label>
            <input type="password" name="confirm_password" id="confirm_password" class="form-control" required>
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
			<label for="profileImage">Profile Image:</label> 
			<input type="file"
				id="profileImage" name="profileImage" value="Update"
				class="file-input" required> <label for="profileImage"
				class="file-label">Choose Image</label>
		</div>		
        <button type="submit" class="btn btn-primary btn-block">Register</button>
    </form>

    <!-- Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <!-- Custom JS -->
    <script type="text/javascript">
        function validateForm() {
            var password = document.getElementById("password").value;
            var confirm_password = document.getElementById("confirm_password").value;
            if (password != confirm_password) {
                alert("Passwords do not match!");
                return false;
            }
     </script>
     </body>
     </html>
