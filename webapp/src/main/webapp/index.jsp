<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Travel Blog Form</title>
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@500&family=Open+Sans&display=swap" rel="stylesheet">

  <style>
    /* Set full-page background with fixed scenic image */
    body {
      background: url('https://images.pexels.com/photos/14374972/pexels-photo-14374972.jpeg') no-repeat center center fixed;
      background-size: cover;
      margin: 0;
      padding: 20px;
      font-family: 'Open Sans', sans-serif;
      color: #f8f9fa;
    }

    /* Container for the form content */
    .container {
      max-width: 600px;
      margin: auto;
      padding: 30px;
      border-radius: 20px;
      background: rgba(0, 0, 0, 0.55);
      backdrop-filter: blur(12px);
      box-shadow: 0 10px 40px rgba(0, 0, 0, 0.6);
    }

    /* Heading styling */
    h1, p {
      text-align: center;
      font-family: 'Playfair Display', serif;
    }

    h1 {
      margin-bottom: 10px;
      font-size: 28px;
      color: #ffffff;
    }

    p {
      margin-bottom: 20px;
      font-size: 16px;
      color: #e0e0e0;
    }

    /* Label styling */
    label {
      display: block;
      margin-top: 15px;
      font-weight: bold;
      font-size: 15px;
      color: #f1f1f1;
    }

    /* Input fields and textarea */
    input[type="text"],
    input[type="date"],
    textarea {
      width: 100%;
      padding: 12px;
      margin-top: 8px;
      border: none;
      border-radius: 8px;
      background: rgba(255, 255, 255, 0.9);
      color: #333;
      font-size: 14px;
    }

    textarea {
      height: 180px;
      resize: vertical;
    }

    /* Buttons */
    .button-container {
      display: flex;
      justify-content: space-between;
      margin-top: 20px;
    }

    .registerbtn, .viewbtn {
      width: 48%;
      padding: 12px;
      border: none;
      border-radius: 8px;
      font-size: 16px;
      font-weight: bold;
      cursor: pointer;
      transition: all 0.3s ease-in-out;
    }

    .registerbtn {
      background-color: #007BFF;
      color: white;
    }

    .registerbtn:hover {
      background-color: #0056b3;
    }

    .viewbtn {
      background-color: #28a745;
      color: white;
    }

    .viewbtn:hover {
      background-color: #1e7e34;
    }

    /* Message area */
    .signin {
      text-align: center;
      margin-top: 30px;
      font-size: 16px;
      color: #f0f0f0;
    }

    /* Output message */
    .success-message {
      color: lightgreen;
      font-size: 18px;
      font-weight: bold;
      animation: fadeIn 0.5s;
    }

    /* Fade in animation */
    @keyframes fadeIn {
      from { opacity: 0; }
      to { opacity: 1; }
    }

    /* Table styling for output data */
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }

    th, td {
      padding: 10px;
      border: 1px solid rgba(255, 255, 255, 0.3);
      text-align: left;
    }

    th {
      background-color: rgba(255, 255, 255, 0.2);
      color: #ffffff;
    }

    td {
      background-color: rgba(255, 255, 255, 0.1);
      color: #ffffff;
    }
  </style>
</head>

<body>

<!-- Blog submission form -->
<form id="blogForm">
  <div class="container">
    <h1>Travel Blog Portal fix-003</h1>
    <p>Share your unforgettable travel adventures with the world.</p>
    <hr style="border-color: rgba(255,255,255,0.3);">

    <!-- Input: User's name -->
    <label for="Name">Your Name</label>
    <input type="text" placeholder="Enter your full name" name="Name" id="Name" required>

    <!-- Input: Travel location -->
    <label for="place">Travel Location</label>
    <input type="text" placeholder="Enter destination" name="place" id="place" required>

    <!-- Input: Travel date -->
    <label for="Date">Date of Travel</label>
    <input type="date" name="Date" id="Date" required>

    <!-- Input: Blog content -->
    <label for="Blog">Your Story</label>
    <textarea placeholder="Describe your experience..." name="Blog" id="Blog" required></textarea>

    <!-- Buttons: Submit and View -->
    <div class="button-container">
      <button type="submit" class="registerbtn">Submit</button>
      <button type="button" class="viewbtn" id="viewBtn">View</button>
    </div>
  </div>

  <!-- Message area for success/error -->
  <div id="messageBox" class="signin"></div>
</form>

<!-- Output section for displaying blog entries -->
<div class="container signin" id="outputBox"></div>

<!-- JavaScript logic -->
<!-- JavaScript logic -->
<script>
  const API_URL = "https://sheetdb.io/api/v1/dligb7b6oxsun?_converted=false";

  // View button: Fetch and display data
  document.getElementById('viewBtn').addEventListener('click', async function () {
    const outputBox = document.getElementById('outputBox');
    outputBox.innerHTML = ""; // Clear old output

    try {
      const res = await fetch(API_URL);
      const data = await res.json();

      console.log("📥 Fetched data:", data);

      if (!Array.isArray(data) || data.length === 0) {
        outputBox.innerHTML = "<p>No blog data found.</p>";
        return;
      }

      // Create table
      const table = document.createElement('table');

      const thead = document.createElement('thead');
      thead.innerHTML = `
        <tr>
          <th>#</th>
          <th>Name</th>
          <th>Place</th>
          <th>Date</th>
          <th>Blog</th>
        </tr>
      `;
      table.appendChild(thead);

      const tbody = document.createElement('tbody');

      data.forEach((entry, index) => {
        const row = document.createElement('tr');
        row.innerHTML = `
          <td>${index + 1}</td>
          <td>${entry.Name || ''}</td>
          <td>${entry.Place || ''}</td>
          <td>${entry.Date || ''}</td>
          <td>${entry.Blog || ''}</td>
        `;
        tbody.appendChild(row);
      });

      table.appendChild(tbody);
      outputBox.appendChild(table);
    } catch (err) {
      console.error("❌ Fetch error:", err);
      outputBox.innerHTML = "<p>Failed to fetch blog data.</p>";
    }
  });

  // Submit new entry
  document.getElementById('blogForm').addEventListener('submit', async function (e) {
    e.preventDefault(); // Stop form from reloading

    const name = document.getElementById('Name').value.trim();
    const place = document.getElementById('place').value.trim();
    const date = document.getElementById('Date').value;
    const blog = document.getElementById('Blog').value.trim();
    const messageBox = document.getElementById('messageBox');

    if (!name || !place || !date || !blog) {
      messageBox.innerHTML = `<p style="color: yellow;">⚠️ Please fill in all fields.</p>`;
      return;
    }

    const blogData = {
      Name: name,
      Place: place,
      Date: date,
      Blog: blog
    };

    try {
      const response = await fetch(API_URL, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({ data: [blogData] })
      });

      if (response.ok) {
        messageBox.innerHTML = `<p class="success-message">✅ Blog submitted successfully!</p>`;
        document.getElementById('blogForm').reset();
      } else {
        throw new Error("Submission failed");
      }
    } catch (error) {
      console.error("❌ Submission error:", error);
      messageBox.innerHTML = `<p style="color: red;">Failed to submit. Try again.</p>`;
    }
  });
</script>



</body>
</html>
