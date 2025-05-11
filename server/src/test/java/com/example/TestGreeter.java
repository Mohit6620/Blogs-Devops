package com.example;

import org.junit.Before;
import org.junit.Test;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.Matchers.greaterThan;
import static org.junit.Assert.assertThat;
import static org.junit.matchers.JUnitMatchers.containsString;

public class TestGreeter {

  private Greeter greeter;

  @Before
  public void setup() {
    greeter = new Greeter();
  }

  @Test
  public void greetShouldIncludeTheOneBeingGreeted() {
    String someone = "World";

    assertThat(greeter.greet(someone), containsString(someone));
  }

  @Test
  public void greetShouldIncludeGreetingPhrase() {
    String someone = "World";

    assertThat(greeter.greet(someone).length(), is(greaterThan(someone.length())));
  }

  // Test case for login functionality
  @Test
  public void loginShouldReturnSuccessForValidCredentials() {
    String userId = "user123";
    String password = "password123";

    assertThat(greeter.login(userId, password), is("Login successful!"));
  }

  @Test
  public void loginShouldReturnErrorForInvalidUserId() {
    String userId = "invalidUser";
    String password = "password123";

    assertThat(greeter.login(userId, password), is("Invalid credentials!"));
  }

  @Test
  public void loginShouldReturnErrorForInvalidPassword() {
    String userId = "user123";
    String password = "wrongPassword";

    assertThat(greeter.login(userId, password), is("Invalid credentials!"));
  }

  @Test
  public void loginShouldReturnErrorForBothInvalidCredentials() {
    String userId = "invalidUser";
    String password = "wrongPassword";

    assertThat(greeter.login(userId, password), is("Invalid credentials!"));
  }
}
