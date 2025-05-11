package com.example;

/**
 * This is a class.
 */
public class Greeter {

  // Hardcoded user credentials
  private static final String VALID_USER_ID = "user123";
  private static final String VALID_PASSWORD = "password123";

  /**
   * This is a constructor.
   */
  public Greeter() {
  }

  /**
   * Greets the user with a message.
   * 
   * @param someone the name of the person to greet.
   * @return greeting message
   */
  public String greet(String someone) {
    return String.format("Hello, %s!", someone);
  }

  /**
   * Simulates user login by checking the credentials.
   * 
   * @param userId the user ID.
   * @param password the password.
   * @return login success message.
   */
  public String login(String userId, String password) {
    if (VALID_USER_ID.equals(userId) && VALID_PASSWORD.equals(password)) {
      return "Login successful!";
    } else {
      return "Invalid credentials!";
    }
  }
}
