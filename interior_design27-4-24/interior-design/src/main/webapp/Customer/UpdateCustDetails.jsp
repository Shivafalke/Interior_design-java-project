<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="sample.VendorDetails" %>
<%@ page import="sample.Customer" %>
<%@ page import="java.util.Base64" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Details</title>
<%
int cid = (Integer)session.getAttribute("customerId");
String cust_name = (String)session.getAttribute("customerName");

VendorDetails vendorDetails = new VendorDetails();

Customer cust = vendorDetails.getCustomerDetails(cid);

String email = cust.getEmail();
String password = cust.getPassword();
String phone=cust.getPhone();
String address=cust.getAddress();

byte[] profileImage =cust.getProfileimg();
String PI = "";
if (profileImage != null) {
    PI = Base64.getEncoder().encodeToString(profileImage);
}

String profileImageText = cust.getProfileImageText();


%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

<style>
        /* Custom CSS */
        body {
            font-family: Arial, sans-serif;
            background-color: #f1f1f1;
            background-image: url('https://img.freepik.com/free-photo/millennial-asia-businessmen-businesswomen-meeting-brainstorming-ideas-about-new-paperwork-project-colleagues-working-together-planning-success-strategy-enjoy-teamwork-small-modern-night-office_7861-2386.jpg?size=626&ext=jpg&ga=GA1.1.426632419.1677587274&semt=sph');
            background-repeat: no-repeat;
            background-size: cover;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            margin-top: 0;
            margin-bottom: 20px;
        }

        .profile-image {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 20px;
        }

        .file-input {
            display: none;
            
        }

        .file-label {
        	
            display: block;
            text-align: center;
            padding: 10px 15px;
            /* color: #fff; */
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            
            /* border: none; */
            /* border-radius: 5px; */
            
            background-color: #007bff;
			border-color: #007bff;
			border-radius: 20px;
        }

        .file-label:hover {
            background-color: #0069d9;
        }

        .file-input-preview {
            margin-top: 10px;
            text-align: center;
        }

        .btn-primary {
        	
            width: 50%;
            padding: 10px;
            /* border: none; */
            /* border-radius: 5px; */
            
            background-color: #007bff;
			border-color: #007bff;
			border-radius: 20px;
			
			
        }

        .btn-primary:hover {
            background-color: #0069d9;
           
        }
        
        
       
		form {
			margin: 0 auto;
			width:40%;
			padding: 50px;
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
		
		
    </style>
</head>
<body>
<br>


		<h1 class="text-center"><%= cust_name %> details</h1>

	<form method="post" action="${pageContext.request.contextPath}/UpdateCustomerDetails" enctype="multipart/form-data">
		<div class="form-group">
			<label for="profileImage">Profile Image:</label> <input type="file"
				id="profileImage" name="profileImage" value="Update"
				class="file-input"> <label for="profileImage"
				class="file-label">Choose Image</label>
			<div id="filePreview" class="file-input-preview">
				<%
				if (PI.isEmpty()) {
				%>
				<img class="profile-image" src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"
					alt="No Profile">
				<%
				} else {
				%>
				<img class="profile-image" src="data:image/jpeg;base64,<%=PI%>">
				<%
				}
				%>
			</div>

		</div>

		
		
		<div class="form-group">
			<label>Email:</label>
			<input type="email" name="email" class="form-control form-control-sm" value="<%= email %>" required>
		</div>
		<div class="form-group">
			<label>Password:</label>
			<input type="text" name="password" class="form-control form-control-sm" value="<%= password %>" required>
		</div>
		<div class="form-group">
			<label>Phone Number:</label>
			<input type="tel" name="phone" class="form-control form-control-sm" value="<%= phone %>" required>
		</div>
		<div class="form-group">
			<label>Address:</label>
			<input type="text" name="address" class="form-control form-control-sm" value="<%= address %>" required>
		</div>
		
		
		<input type="submit" value="Update" class="btn btn-primary ">
	</form>


    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        // Preview the selected profile image
        $(document).ready(function() {
            $('#profileImage').on('change', function() {
                var fileInput = $(this);
                var previewContainer = $('#filePreview');
                var files = fileInput.get(0).files;

                if (files.length > 0) {
                    var file = files[0];
                    var reader = new FileReader();

                    reader.onload = function(e) {
                        var imgSrc = e.target.result;
                        var img = $('<img>').addClass('profile-image').attr('src', imgSrc);
                        previewContainer.html(img);
                    }

                    reader.readAsDataURL(file);
                } else {
                    previewContainer.empty();
                }
            });
        });
    </script>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>

<!-- Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp" crossorigin="anonymous"></script>

<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    
</body>
</html>