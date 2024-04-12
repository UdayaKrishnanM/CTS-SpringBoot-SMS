<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete a Player</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
   
//document.addEventListener("DOMContentLoaded", function() {
  //      var message = "${message}";
    //    if (message.trim() !== "") {
      //      alert(message);
        //}
        
//        document.querySelector("form").addEventListener("submit", function(event) {
 //           var confirmDelete = confirm('Are you sure you want to delete this player?');
  //          if (!confirmDelete) {
    //            event.preventDefault(); // Prevent form submission if user cancels
      //      } else{
 //           	alert("$error");
 //           }
 //       });
        
 //       var error = "${error}";
 //       if (error.trim() !== "") {
  //          alert(error);
   //     }
  //  });
  
  function validateForm() {
    var playerId = document.getElementById('id').value;
    // Check if playerId is a number
    if (isNaN(playerId)) {
        alert('Please enter a valid player ID.');
        return false;
    }
    // Check if playerId exists in the database
    $.ajax({
        url: '/checkPlayer/' + playerId,
        type: 'GET',
        async: false,
        success: function(response) {
            if (response === 'true') {
                return confirm('Are you sure you want to delete player with ID ' + playerId + '?');
            } else {
                alert('Player with ID ' + playerId + ' not found.');
                return false;
            }
        },
        error: function() {
            alert('Error checking player ID. Please try again.');
            return false;
        }
    });
    return false;
}

  
</script>
<style>

    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
    }

    h1 {
        text-align: center;
        margin-top: 20px;
        color: #fff;
    }

    form {
        width: 50%;
        margin: 0 auto;
        padding: 20px;
        background-color: rgba(255, 255, 255, 0.7);
        border-radius: 5px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    label {
        display: block;
        margin-bottom: 10px;
        color: #333;
    }

    input[type="text"] {
        width: 100%;
        padding: 8px;
        margin-bottom: 10px;
        box-sizing: border-box;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    input[type="submit"] {
        width: 100%;
        background-color: #4CAF50;
        color: white;
        padding: 10px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #45a049;
    }

    p.error {
        color: red;
        text-align: center;
    }
</style>
</head>
<body> 
    <h1>Delete Player</h1>
    <form action="/deletePlayer" method="post">
        <label for="id">Player ID:</label>
        <input type="text" name="id" required><br><br>
        <input type="submit" value="Submit">
    </form>



</body>
</html>
