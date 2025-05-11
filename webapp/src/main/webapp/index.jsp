<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Travel Blog Form</title>
  <style>
    body {
      background: url('https://images.pexels.com/photos/14374972/pexels-photo-14374972.jpeg') no-repeat center center fixed;
      background-size: cover;
      margin: 0;
      padding: 20px;
      font-family: Arial, sans-serif;
    }

    .container {
      max-width: 500px;
      margin: auto;
      padding: 20px;
      border-radius: 15px;
      background: rgba(255, 255, 255, 0.1);
      backdrop-filter: blur(10px);
      box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
      border: 1px solid rgba(255, 255, 255, 0.18);
      color: white;
    }

    h1, p {
      text-align: center;
    }

    label {
      font-weight: bold;
    }

    input[type="text"],
    input[type="date"],
    textarea {
      width: 100%;
      padding: 10px;
      margin: 10px 0;
      border: none;
      border-radius: 10px;
      box-sizing: border-box;
    }

    textarea {
      height: 200px;
      resize: vertical;
    }

    .registerbtn, .viewbtn {
      width: 48%;
      padding: 12px;
      border: none;
      border-radius: 10px;
      background-color: #00bcd4;
      color: white;
      font-size: 16px;
      cursor: pointer;
      margin-top: 10px;
    }

    .viewbtn {
      background-color: #4CAF50;
    }

    .signin {
      text-align: center;
      margin-top: 20px;
      color: white;
    }

    .button-container {
      display: flex;
      justify-content: space-between;
    }

    .success-message {
      color: lightgreen;
      font-size: 18px;
      font-weight: bold;
      margin-top: 10px;
      animation: fadeIn 0.5s;
    }

    @keyframes fadeIn {
      from { opacity: 0; }
      to { opacity: 1; }
    }
  </style>
</head>

<body>

<form id="blogForm">
  <div class="container">
    <h1>Blogging Website — CICD  fixing view button </h1>
    <h1>fix 2</h1>
    <h1>For testing purpose only</h1>
    <p>A place where you can share your travel stories.</p>
    <hr style="border-color: rgba(255,255,255,0.2);">

    <label for="Name">Enter your name</label>
    <input type="text" placeholder="Enter Full Name" name="Name" id="Name" required>

    <label for="place">Enter place</label>
    <input type="text" placeholder="Enter Place" name="place" id="place" required>

    <label for="Date">Date</label>
    <input type="date" name="Date" id="Date" required>

    <label for="Blog">Blog</label>
    <textarea placeholder="Write your story..." name="Blog" id="Blog" required></textarea>

    <div class="button-container">
      <button type="submit" class="registerbtn">Submit</button>
      <button type="button" class="viewbtn" id="viewBtn">View</button>
    </div>
  </div>

  <div id="messageBox" class="signin"></div>
</form>

<!-- Output box for blog content -->
<div class="container signin" id="outputBox"></div>

<script>
  const API_URL = "https://sheetdb.io/api/v1/dligb7b6oxsun"; // Replace with your actual endpoint if needed

  // ✅ Function to display the blog data on screen
  function displayOutput(name, place, date, blog) {
  const outputBox = document.getElementById('outputBox');
  outputBox.innerHTML = `
    <h3>Your Blog</h3>
    <p><strong>Name:</strong> ${name}</p>
    <p><strong>Place:</strong> ${place}</p>
    <p><strong>Date:</strong> ${date}</p>
    <p><strong>Blog:</strong> ${blog}</p>
  `;
}


  // ✅ Function to show a success message
  function showSuccessMessage(message) {
    const messageBox = document.getElementById('messageBox');
    if (messageBox) {
      messageBox.innerHTML = `<p class="success-message">${message}</p>`;
      setTimeout(() => { messageBox.innerHTML = ''; }, 2000);
    }
  }

  // ✅ Submit form and POST data to API_URL (Google Sheet endpoint)
  document.getElementById('blogForm').addEventListener('submit', async function(e) {
    e.preventDefault();

    const Name = document.getElementById('Name').value.trim();
    const Place = document.getElementById('place').value.trim();
    const Date = document.getElementById('Date').value;
    const Blog = document.getElementById('Blog').value.trim();

    const blogData = { Name, Place, Date, Blog };

    try {
      const res = await fetch(API_URL, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ data: blogData })
      });

      if (res.ok) {
        showSuccessMessage("Saved to Google Sheet ✅");
        document.getElementById('blogForm').reset();
      } else {
        const errorText = await res.text();
        alert("Failed to save data. " + errorText);
      }
    } catch (err) {
      console.error(err);
      alert("Error submitting data.");
    }
  });

  // ✅ View latest blog entry by GET request
  document.getElementById('viewBtn').addEventListener('click', async function () {
    const outputBox = document.getElementById('outputBox');

    try {
      const res = await fetch(API_URL);
      const data = await res.json();

      console.log("Fetched data:", data); // Debug line

      if (Array.isArray(data) && data.length > 0) {
        const latest = data[data.length - 1];

        // ✅ Normalize field names in case of lowercase from Google Sheet
        const name = latest.Name || latest.name || "Unknown";
        const place = latest.Place || latest.place || "Unknown";
        const date = latest.Date || latest.date || "Unknown";
        const blog = latest.Blog || latest.blog || "No content";

        // ✅ Display blog using normalized values
        displayOutput(name, place, date, blog);
      } else {
        outputBox.innerHTML = "<p>No blog data found.</p>";
      }
    } catch (err) {
      console.error("Fetch error:", err);
      outputBox.innerHTML = "<p>Failed to fetch blog data.</p>";
    }
  });
</script>


</body>
</html>
