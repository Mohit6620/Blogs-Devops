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
    <h1>fix 8</h1>
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
  const API_URL = "https://sheetdb.io/api/v1/dligb7b6oxsun"; // ✅ Replace with your actual SheetDB endpoint

  // ✅ Function to display a success message
  function showSuccessMessage(message) {
    const messageBox = document.getElementById('messageBox');
    if (messageBox) {
      messageBox.innerHTML = `<p class="success-message">${message}</p>`;
      setTimeout(() => { messageBox.innerHTML = ''; }, 2000);
    }
  }

  // ✅ Function to handle form submit
  document.getElementById('blogForm').addEventListener('submit', async function (e) {
    e.preventDefault();

    const Name = document.getElementById('Name').value.trim();
    const Place = document.getElementById('place').value.trim();
    const Date = document.getElementById('Date').value;
    const Blog = document.getElementById('Blog').value.trim();

    const blogData = { Name, Place, Date, Blog };
    const payload = { data: blogData };

    console.log("📤 Submitting data:", payload);

    try {
      const res = await fetch(API_URL, {
        method: "POST",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify(payload)
      });

      console.log("📥 POST response status:", res.status);
      const responseText = await res.text();
      console.log("📥 POST response text:", responseText);

      if (res.ok) {
        showSuccessMessage("Saved to Google Sheet ✅");
        document.getElementById('blogForm').reset();
      } else {
        alert("❌ Failed to save data.\n\n" + responseText);
      }
    } catch (err) {
      console.error("❌ Error submitting data:", err);
      alert("⚠️ Network error submitting data.");
    }
  });

  // ✅ Function to handle View button click and fetch all blogs
  document.getElementById('viewBtn').addEventListener('click', async function () {
    const outputBox = document.getElementById('outputBox');
    outputBox.innerHTML = ""; // Clear previous content

    try {
      const res = await fetch(API_URL);
      const data = await res.json();

      console.log("📥 Fetched data:", data);

      if (Array.isArray(data) && data.length > 0) {
        const table = document.createElement('table');
        table.style.width = "100%";
        table.style.borderCollapse = "collapse";
        table.style.color = "white";

        const thead = document.createElement('thead');
        thead.innerHTML = `
          <tr style="background-color: rgba(255,255,255,0.1);">
            <th style="border: 1px solid white; padding: 8px;">#</th>
            <th style="border: 1px solid white; padding: 8px;">Name</th>
            <th style="border: 1px solid white; padding: 8px;">Place</th>
            <th style="border: 1px solid white; padding: 8px;">Date</th>
            <th style="border: 1px solid white; padding: 8px;">Blog</th>
          </tr>
        `;
        table.appendChild(thead);

        const tbody = document.createElement('tbody');
        data.forEach((entry, index) => {
          const row = document.createElement('tr');
          row.innerHTML = `
            <td style="border: 1px solid white; padding: 8px;">${index + 1}</td>
            <td style="border: 1px solid white; padding: 8px;">${entry.Name || 'Unknown'}</td>
            <td style="border: 1px solid white; padding: 8px;">${entry.Place || 'Unknown'}</td>
            <td style="border: 1px solid white; padding: 8px;">${entry.Date || 'Unknown'}</td>
            <td style="border: 1px solid white; padding: 8px;">${entry.Blog || 'No content'}</td>
          `;
          tbody.appendChild(row);
        });

        table.appendChild(tbody);
        outputBox.appendChild(table);
      } else {
        outputBox.innerHTML = "<p>No blog data found.</p>";
      }
    } catch (err) {
      console.error("❌ Fetch error:", err);
      outputBox.innerHTML = "<p>Failed to fetch blog data.</p>";
    }
  });
</script>




</body>
</html>
