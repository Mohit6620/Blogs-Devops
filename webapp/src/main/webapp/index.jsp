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
      padding: 20px;
      margin: 0;
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

    .registerbtn {
      width: 100%;
      padding: 12px;
      border: none;
      border-radius: 10px;
      background-color: #00bcd4;
      color: white;
      font-size: 16px;
      cursor: pointer;
      margin-top: 10px;
    }

    .signin {
      text-align: center;
      margin-top: 20px;
      color: white;
    }

    @media screen and (max-width: 600px) {
      .container {
        padding: 15px;
        width: 90%;
      }

      textarea {
        height: 150px;
      }

      .registerbtn {
        font-size: 14px;
      }
    }
  </style>
</head>
<body>

<form id="blogForm">
  <div class="container">
    <h1>Blogging Website</h1>
    <p>A place where you can share your travel stories.</p>
    <hr style="border-color: rgba(255,255,255,0.2);">

    <label for="Name">Enter your name</label>
    <input type="text" placeholder="Enter Full Name" name="Name" id="Name" required>

    <label for="mobile">Enter place</label>
    <input type="text" placeholder="Enter Place" name="mobile" id="mobile" required>

    <label for="Date">Date</label>
    <input type="date" name="Date" id="Date" required>

    <label for="Blog">Blog</label>
    <textarea placeholder="Write your story..." name="Blog" id="Blog" required></textarea>

    <button type="submit" class="registerbtn">Submit</button>
  </div>
</form>

<!-- Output Box OUTSIDE the Form -->
<div class="container signin" id="outputBox">
  <!-- Output will be displayed here -->
</div>

<script>
  document.getElementById('blogForm').addEventListener('submit', function(e) {
    e.preventDefault(); // Prevent form from submitting

    const name = document.getElementById('Name').value;
    const place = document.getElementById('mobile').value;
    const date = document.getElementById('Date').value;
    const blog = document.getElementById('Blog').value;

    const outputBox = document.getElementById('outputBox');
    outputBox.innerHTML = `
      <h3>Your Blog Submission</h3>
      <p><strong>Name:</strong> ${name}</p>
      <p><strong>Place:</strong> ${place}</p>
      <p><strong>Date:</strong> ${date}</p>
      <p><strong>Blog:</strong> ${blog}</p>
    `;
  });
</script>

</body>
</html>
