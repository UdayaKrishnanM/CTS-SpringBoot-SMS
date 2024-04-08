<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update a Player Details</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    

    function showInput() {
        var type = document.getElementById("type").value;
        var inputContainer = document.getElementById("inputContainer");
        if (type === "age") {
            inputContainer.innerHTML = '<label for="value">Enter the age:</label>' +
                '<input type="number" id="value" min="20" max="45" name="value" required>';
        } else if (type === "department") {
            // Show dropdown for department
            inputContainer.innerHTML = '<label for="value">Select the department:</label>' +
                '<select id="value" name="value" required>' +
                '<option value="Batsmen">Batsmen</option>' +
                '<option value="Bowler">Bowler</option>' +
                '<option value="WicketKeeper">WicketKeeper</option>' +
                '<option value="AllRounder">AllRounder</option>' +
                '</select>';
        }
    }
    
    var message = "${message}";
    if (message.trim() !== "" && performance.navigation.type !== 1) {
        alert(message);
    }

    function validateForm(event) {
        var id = document.getElementById("id").value;
        var type = document.getElementById("type").value;
        var value = document.getElementsByName("value")[0].value;

        if (isNaN(id)) {
            alert("ID must be a number");
            return false;
        }

        if (type === "age" && (value < 20 || value > 45)) {
            alert("Age must be between 20 and 45");
            return false;
        }

        return true;
    }
</script>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f0f0f0;
    }

    h1 {
        text-align: center;
        margin-top: 20px;
        margin-bottom: 20px;
    }

    form {
        width: 50%;
        margin: 0 auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    label {
        display: block;
        margin-bottom: 5px;
    }

    input[type="text"],
    input[type="number"],
    select {
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

    #inputContainer {
        margin-top: 10px;
    }
</style>
</head>
<body>
    <h1>Update Player</h1>
    <form action="/players/updatePlayer" method="post" onsubmit="return validateForm()">
        <label for="id">Player ID:</label>
        <input type="text" id="id" name="id" required><br><br>
        
        <label for="type">Select update type:</label>
        <select id="type" name="type" onchange="showInput()" required>
            <option value="age">Age</option>
            <option value="department">Department</option>
        </select><br><br>
        
        <div id="inputContainer">
            <label for="value">Enter the age:</label>
            <input type="number" id="value" min="20" max="45" name="value" required>
        </div><br><br>
        
        <input type="submit" value="Submit">
    </form>
</body>
</html>
