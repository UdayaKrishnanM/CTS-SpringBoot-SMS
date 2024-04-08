<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sports Management System</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f3f3f3;
    }

    h1 {
        text-align: center;
        margin-top: 50px;
        margin-bottom: 30px;
    }

    .container {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        align-items: center;
        margin: 0 auto;
        max-width: 800px;
    }

    .card {
        width: 200px;
        height: 200px;
        margin: 20px;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s;
        background-size: cover; /* Ensure the background image covers the entire card */
        background-position: center center; /* Center the background image both horizontally and vertically */
        
    }

    .card:hover {
        transform: scale(1.05);
    }

    .card img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .button-container {
        text-align: center;
        margin-top: 50px;
    }

    .button-container button {
        padding: 10px 20px;
        font-size: 16px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .button-container button:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>

<h1>Welcome to the Player Management System</h1>

<div class="container">
     <div class="card" alt="Create a Player" style="background-image: url('/image/create.jpg');">    
        <div class="button-container">
            <form action="addPlayer" method="get">
                <button type="submit">Add a Player</button>
            </form>
        </div>
    </div>
     <div class="card" alt="Show All Players" style="background-image: url('/image/list.png');">    
        <div class="button-container">
            <form action="listPlayers" method="get">
                <button type="submit">Show All Players</button>
            </form>
        </div>
    </div>
     <div class="card" alt="Pick Top Player" style="background-image: url('/image/filer.jpg');">    
        <div class="button-container">
            <form action="pickTopPlayers" method="get">
                <button type="submit">Pick Top Players</button>
            </form>
        </div>
    </div>
     <div class="card" alt="Delete a Player" style="background-image: url('/image/delete.png');">    
        <div class="button-container">
            <form action="deletePlayer" method="get">
                <button type="submit">Delete a Player</button>
            </form>
        </div>
    </div>
     <div class="card" alt="Update a Player" style="background-image: url('/image/edit.png');">    
        <div class="button-container">
            <form action="updatePlayer" method="get">
                <button type="submit">Update a Player</button>
            </form>
        </div>
    </div>
</div>

</body>
</html>
