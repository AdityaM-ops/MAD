 first.html

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Login Page</title>
  <link rel="manifest" href="/manifest.json" />
  <script>
    localStorage.setItem("username", "rvce");
    localStorage.setItem("passme1", "rvce");
  </script>
</head>
<body>
  <form onsubmit="event.preventDefault(); 
    const u = document.getElementById('username').value;
    const p = document.getElementById('password').value;
    const un = localStorage.getItem('username');
    const pw = localStorage.getItem('passme1');
    if (u === un && p === pw) {
      alert('Authentication done');
    } else {
      alert('Authentication failure');
    }">
    <p>Username: <input type="text" id="username" /></p>
    <p>Password: <input type="password" id="password" /></p>
    <p><input type="submit" value="Submit" /></p>
  </form>
</body>
</html>











manifest.json

{

"name": "my_first_manifest",

"short_name": "first_manifest",

"start_url": "/first.html",

"display": "fullscreen",

"background_color": "#ffff00",

"description": "A simple applicationfor manifestation",

"orientation": "portrait-primary",

"theme_color":"#2196F3",

"icons": [

{

"src": "/icons/rvce_logo.png",

"sizes": "432x432",

"type": "image/png"

},

{

"src": "/icons/rvce_logo (1).png",

"sizes": "108x108",

"type": "image/png"

},

{

"src": "/icons/rvce_logo (2).png",

"sizes": "216x216",

"type": "image/png"

}

]

}


 
 
 
 
 

