<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Upload Video/Image</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<style>
	 body {
    background-color:  #333333;
  	}
  .form-container {
    max-width: 400px;
    margin: 0 auto;
    padding: 20px;
    background-color: #f7f7f7;
    border: 1px solid #ccc;
    border-radius: 7px;
  }

  .form-container label {
    font-weight: bold;
  }

  .form-container textarea {
    resize: vertical;
  }

  .form-container .btn-upload {
    display: inline-block;
    padding: 6px 12px;
    margin-top: 10px;
    font-size: 14px;
    font-weight: bold;
    text-align: center;
    text-transform: uppercase;
    color: #fff;
    background-color: #007bff;
    border: 1px solid #007bff;
    border-radius: 5px;
    cursor: pointer;
  }

  .form-container .btn-upload:hover {
    background-color: #0069d9;
    border-color: #0062cc;
  }

  .form-container .error-message {
    color: #dc3545;
    font-size: 14px;
  }
</style>
</head>
<body>
<br>
<center><h1 class="display-5" style="color: white;">Upload Video/Image</h1></center>
<br>
<br>
<div class="container">
  <div class="form-container">
    <form action="${pageContext.request.contextPath}/UploadImageVideo" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
      <div class="form-group">
        <label for="file">Select File:</label>
        <input type="file" name="file" id="file" accept="image/*, video/*" required class="form-control-file">
      </div>
      <div class="form-group">
        <label for="description">Description:</label>
        <textarea name="description" id="description" rows="4" required class="form-control"></textarea>
      </div>
      <div class="form-group">
        <center><input type="submit" value="Upload" class="btn btn-primary btn-upload"></center>
      </div>
      <div id="error-message" class="error-message"></div>
    </form>
  </div>
</div>

<script>
  function validateForm() {
    var fileInput = document.getElementById("file");
    var descriptionInput = document.getElementById("description");
    var errorMessage = document.getElementById("error-message");

    // Check if file is selected
    if (fileInput.files.length === 0) {
      errorMessage.innerHTML = "Please select a file.";
      return false;
    }

    // Check if description is empty
    if (descriptionInput.value.trim() === "") {
      errorMessage.innerHTML = "Please enter a description.";
      return false;
    }

    return true;
  }
</script>
</body>
</html>
