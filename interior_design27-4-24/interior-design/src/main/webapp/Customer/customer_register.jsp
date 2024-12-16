<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Matteo Bruni">
    <title>Register Template</title>

    <!-- Custom styles for this template -->
    <link href="css/particles.css" rel="stylesheet"/>
    <link href="css/auth.css" rel="stylesheet"/>
</head>

<body>
<div id="tsparticles"></div>
<main class="box">
    <h2>Customer Register</h2>
    <form action="${pageContext.request.contextPath}/CustomerRegister" method="post" onsubmit="return validateForm()">
        <div class="inputBox">
            <label for="userName">Name</label>
            <input type="text" name="userName" id="userName" placeholder="type your name" required/>
        </div>
         <div class="inputBox">
            <label for="userName">Address</label>
            <input type="text" name="Address" id="address" placeholder="type your Address" required/>
        </div>
         <div class="inputBox">
            <label for="userName">Phone</label>          
            <input type="number" name="Phone" id="phone" placeholder="Type your contact" required/>

        </div>
        <div class="inputBox">
            <label for="userName">Email</label>
            <input type="email" name="email" id="userName" placeholder="type your email" required/>
        </div>
        <div class="inputBox">
            <label for="userPassword">Password</label>
            <input type="password" name="userPassword" id="userPassword" placeholder="type your password"
                   required/>
        </div>
        <div class="inputBox">
            <label for="userConfirmPassword">Confirm Password</label>
            <input type="password" name="userConfirmPassword" id="userConfirmPassword" placeholder="confirm your password"
                   required/>
        </div>
        <button type="submit" style="float: left;">Submit</button>
        <!-- <a class="button" href="login.html" style="float: left;">Login</a> -->
    </form>
</main>
<footer>
</footer>

<script src="https://cdn.jsdelivr.net/npm/tsparticles@1.34.1/tsparticles.min.js" integrity="sha256-D6LXCdCl4meErhc25yXnxIFUtwR96gPo+GtLYv89VZo="
		 crossorigin="anonymous"></script>
<script type="text/javascript" src="js/particles.js"></script>
<script type="text/javascript">
        function validateForm() {
            var password = document.getElementById("userPassword").value;
            var confirm_password = document.getElementById("userConfirmPassword").value;
            if (password != confirm_password) {
                alert("Passwords do not match!");
                return false;
            }
        }
        
        const inputElement = document.getElementById('phone');

        inputElement.addEventListener('keydown', function(event) {
          const maxLength = 10;
          if (inputElement.value.length >= maxLength && event.key !== 'Backspace') {
            event.preventDefault();
          }
        });

     </script>
</body>

</html>