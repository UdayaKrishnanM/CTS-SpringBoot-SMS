<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Add a Player</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <script>
    	
        function validateForm() {
            var name = document.forms["addPlayerForm"]["name"].value;
            var age = document.forms["addPlayerForm"]["age"].value;
            var id = document.forms["addPlayerForm"]["id"].value;
            var t20Rank = document.forms["addPlayerForm"]["ranks.t20_rank"].value;
            var odiRank = document.forms["addPlayerForm"]["ranks.odi_rank"].value;
            var testRank = document.forms["addPlayerForm"]["ranks.test_rank"].value;
            
            if (isNaN(id)) {
                alert("ID must be a number");
                return false;
            }

            if (!/^[a-zA-Z ]+$/.test(name)) {
                alert("Name must contain only letters");
                return false;
            }

            if (age < 20 || age > 45) {
                alert("Age must be between 20 and 45");
                return false;
            }

            if (isNaN(t20Rank) || isNaN(odiRank) || isNaN(testRank)) {
                alert("Rank must be a number");
                return false;
            }
            return true;
        }

    </script>


<style>
    body {
    	background-image: url('https://wallpaperaccess.com/full/3818893.jpg');
    	background-repeat: no-repeat;
    	background-size: cover;
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f3f3f3;
    }

    h2 {
        text-align: center;
        margin-top: 5px;
        margin-bottom: 10px;
    }
	
	form:hover{
		border: 1px solid black;
	}

    form {
        width: 50%;
		border-color: black;
        margin: 0 auto;
        padding: 20px;
/*        background-color: #fff;*/
		background: transparent;
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
    width: calc(100% - 20px);
    padding: 8px;
    margin-bottom: 10px;
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 4px;
    opacity: 0.7;
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

    .error {
	   color: red;
	   font-family: sans-serif;
    }
    
    .error{
	    animation: shake 0.5s;
	}
		
	@keyframes shake {
	    0% { transform: translateX(0); }
	    20% { transform: translateX(-10px); }
	    40% { transform: translateX(10px); }
	    60% { transform: translateX(-10px); }
	    80% { transform: translateX(10px); }
	    100% { transform: translateX(0); }
	}
    

 
    
</style>
</head>
<body>

<div class="container">
<br>
<div class="row">
    		<h1 style="display:none;"></h1>
    	</div>
    	
        <div class="row">
        	<div class="col">
        		<h1 style="display:none;">Add</h1>
        	</div>
            <div class="col">
                <h2 class="text-center"><b>Add a Player List</b></h2>
            </div>
            <div class="col">
                <button class="btn btn-primary right" onclick="window.location.href='/index'">Home</button>
            </div>
        </div>
</div>


<form action="/addPlayer" name="addPlayerForm" method="post" onsubmit="return validateForm()">
	<b>
	<div class="error" id="error"><h5>${error}</h5></div>
	
    <label for="id">ID:</label>
    <input type="text" id="id" name="id" required><br>
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" required><br>

    <label for="age">Age:</label>
    <input type="number" id="age" min="20" max="45" name="age" required><br>

    <label for="department">Select the department:</label>
    <select id="department" name="department" required>
        <option value="Batsmen">Batsmen</option>
        <option value="Bowler">Bowler</option>
        <option value="WicketKeeper">WicketKeeper</option>
        <option value="AllRounder">AllRounder</option>
    </select><br>

    <label for="t20_rank">T20 Rank:</label>
    <input type="number" id="t20_rank" name="ranks.t20_rank" required><br>

    <label for="odi_rank">ODI Rank:</label>
    <input type="number" id="odi_rank" name="ranks.odi_rank" required><br>

    <label for="test_rank">Test Rank:</label>
    <input type="number" id="test_rank" name="ranks.test_rank" required><br>

    <input type="submit" value="Submit">

	
	</b>
</form>
<br>

</body>
</html>
