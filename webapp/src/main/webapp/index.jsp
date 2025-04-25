<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Travel Blog</title>
</head>
<body style="
  background: url('https://images.pexels.com/photos/14374972/pexels-photo-14374972.jpeg') no-repeat center center fixed;
  background-size: cover;
  padding: 40px;
">

<form action="SubmitServlet" method="post">
  <div class="container" style="
    max-width: 500px;
    margin: auto;
    padding: 20px;
    border-radius: 15px;
    background: rgba(255, 255, 255, 0.1);
    backdrop-filter: blur(10px);
    box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
    border: 1px solid rgba(255, 255, 255, 0.18);
    color: white;
    font-family: Arial, sans-serif;
  ">

    <h1 style="text-align:center;">Blogging Website</h1>
    <p style="text-align:center;">A Place where you can share your travel stories.</p>
    <hr style="border-color: rgba(255,255,255,0.2);">

    <label for="Name"><b>Enter your name</b></label>
    <input type="text" placeholder="Enter Full Name" name="Name" id="Name" required
      style="width: 100%; padding: 10px; margin: 10px 0; border: none; border-radius: 10px;">

    <label for="mobile"><b>Enter place</b></label>
    <input type="text" placeholder="Enter Place" name="mobile" id="mobile" required
      style="width: 100%; padding: 10px; margin: 10px 0; border: none; border-radius: 10px;">

    <label for="email"><b>Date</b></label>
    <input type="date" name="email" id="email" required
      style="width: 100%; padding: 10px; margin: 10px 0; border: none; border-radius: 10px;">

    <label for="psw"><b>Blog</b></label>
    <textarea placeholder="Write your story..." name="psw" id="psw" required
      style="width: 100%; height: 200px; padding: 10px; margin: 10px 0; border: none; border-radius: 10px; resize: vertical;">
    </textarea>

    <div style="display: flex; gap: 10px; margin-top: 10px;">
      <button type="submit" style="
        flex: 1;
        padding: 12px;
        border: none;
        border-radius: 10px;
        background-color: #00bcd4;
        color: white;
        font-size: 16px;
        cursor: pointer;
      ">Submit</button>

      <button type="button" onclick="window.location.href='view.jsp';" style="
        flex: 1;
        padding: 12px;
        border: none;
        border-radius: 10px;
        background-color: #4CAF50;
        color: white;
        font-size: 16px;
        cursor: pointer;
      ">View Blogs</button>
    </div>
  </div>
</form>

</body>
</html>
