stock.html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <title>Stock Display</title>
  <link rel="manifest" href="manifest.json">
  <style>
    table {
      border-collapse: collapse;
    }

    td, th {
      padding: 1em;
      border: 1px solid black;
    }
  </style>
</head>

<body>
  <center>
    <h2>Stock Market Data Display</h2>
    <div id="stock"></div>
  </center>

  <script>
    // Register the service worker
    if ('serviceWorker' in navigator) {
      navigator.serviceWorker.register("sw.js")
        .then((registration) => {
          if (registration.active === null) {
            console.log("Service Worker registered successfully.");
          }
        })
        .catch((error) => {
          console.error("Service Worker registration failed:", error);
        });
    } else {
      console.log("Browser does not support service workers.");
    }

    // Fetch stock data
    fetch("stocks.json")
      .then((res) => res.json())
      .then((stock) => {
        // Create table with stock data
        let table = "<table>";
        table += "<tr><th>Company</th><th>Description</th><th>Initial Price</th><th>Price in 2007</th><th>Symbol</th></tr>";

        for (let item of stock) {
          table += `
            <tr>
              <td>${item.company}</td>
              <td>${item.description}</td>
              <td>${item.initial_price}</td>
              <td>${item.price_2007}</td>
              <td>${item.symbol}</td>
            </tr>`;
        }

        table += "</table>";
        document.getElementById("stock").innerHTML = table;
      })
      .catch((err) => {
        console.error("Failed to fetch stock data:", err);
        document.getElementById("stock").innerHTML = "<p>Failed to load stock data.</p>";
      });
  </script>
</body>

</html>




stocks.json
[
  {
    "company": "3M",
    "description": "3M, based in Minnesota",
    "initial_price": 44.28,
    "price_2002": 56.27,
    "price_2007": 95.85,
    "symbol": "MMM"
  },
  {
    "company": "Amazon.com",
    "description": "Amazon.com, Inc.Washington.",
    "initial_price": 89.38,
    "price_2002": 17.01,
    "price_2007": 93.43,
    "symbol": "AMZN"
  },
  {
    "company": "3M",
    "description": "3M, based in Minnesota",
    "initial_price": 44.28,
    "price_2002": 56.27,
    "price_2007": 95.85,
    "symbol": "MMM"
  },
  {
    "company": "Amazon.com",
    "description": "Amazon.com, Inc.Washington.",
    "initial_price": 89.38,
    "price_2002": 17.01,
    "price_2007": 93.43,
    "symbol": "AMZN"
  }
]



sw.js
// Listen for the 'install' event
self.addEventListener("install", (event) => {
    console.log("Service Worker: Installed");
  
    // Pre-cache necessary assets
    event.waitUntil(
      caches.open("stock").then((cache) => {
        return cache.addAll([
          "/",
          "./assets/logo.ico",
          "./assets/logo.png",
          "./stocks.json",
          "./index.html",
          "./manifest.json",
          "./sw.js"
        ]);
      }).catch((err) => {
        console.error("Caching failed during install:", err);
      })
    );
  });
  
  // Listen for the 'activate' event
  self.addEventListener("activate", (event) => {
    console.log("Service Worker: Activated");
  
    // Optional: Clean up old caches if needed
    event.waitUntil(
      caches.keys().then((cacheNames) => {
        return Promise.all(
          cacheNames.map((cacheName) => {
            if (cacheName !== "stock") {
              return caches.delete(cacheName);
            }
          })
        );
      })
    );
  });
  
  // Listen for fetch events
  self.addEventListener("fetch", (event) => {
    console.log("Service Worker: Fetching", event.request.url);
  
    event.respondWith(
      caches.match(event.request).then((cachedResponse) => {
        // Serve from cache if available, otherwise fetch from network
        return cachedResponse || fetch(event.request);
      }).catch((err) => {
        console.error("Fetch failed:", err);
      })
    );
  });




manifest.json

  {

"name": "Stock Display", "short_name": "Stock-Display", "display": "standalone", "start_url": "/",

"id": "/",

"description": "Display stock from json file", "icons": [

{

"src": "assets/logo.png", "type": "image/png",

"sizes": "512x512", "purpose": "maskable"

},

{

"src": "assets/logo.png", "type": "image/png",

"sizes": "512x512",

"purpose": "any"

}

],

"background_color": "#00AA00", "theme_color": "#00CC00"

}
