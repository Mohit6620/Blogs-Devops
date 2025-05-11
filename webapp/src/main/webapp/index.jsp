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
    <h1>Blogging Website — CICD</h1>
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

<!-- Added message box for success message -->
<div id="messageBox" class="container signin"></div>

<!-- Output box for blog content -->
<div class="container signin" id="outputBox"></div>

<script>

window.onload = function() {
  const data = localStorage.getItem('blogData');
  if (data) {
    const parsed = JSON.parse(data);
    displayOutput(parsed.name, parsed.place, parsed.date, parsed.blog);
  }
};


  // Utility function to display output
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

  // Show success message
  function showSuccessMessage(message) {
    const messageBox = document.getElementById('messageBox');
    if (messageBox) {
      messageBox.innerHTML = `<p class="success-message">${message}</p>`;
      setTimeout(() => {
        messageBox.innerHTML = '';
      }, 2000);
    }
  }

  // Handle form submit
  document.getElementById('blogForm').addEventListener('submit', function(e) {
    e.preventDefault();

    const name = document.getElementById('Name').value.trim();
    const place = document.getElementById('place').value.trim();
    const date = document.getElementById('Date').value;
    const blog = document.getElementById('Blog').value.trim();

    const blogData = { name, place, date, blog };

    try {
      localStorage.setItem('blogData', JSON.stringify(blogData));
      showSuccessMessage("Blog saved successfully ✅");
      document.getElementById('blogForm').reset();
    } catch (err) {
      alert("Failed to save blog to localStorage.");
      console.error("localStorage error:", err);
    }
  });

  // Handle View Button
  document.getElementById('viewBtn').addEventListener('click', function() {
    const outputBox = document.getElementById('outputBox');
    const data = localStorage.getItem('blogData');

    if (data) {
      try {
        const parsed = JSON.parse(data);
        displayOutput(parsed.name, parsed.place, parsed.date, parsed.blog);
      } catch (err) {
        outputBox.innerHTML = "<p style='color: red;'>Error reading blog data.</p>";
        console.error("JSON parsing failed:", err);
      }
    } else {
      outputBox.innerHTML = "<p>No blog data found. Please submit a blog first.</p>";
    }
  });
</script>


</body>
</html>
