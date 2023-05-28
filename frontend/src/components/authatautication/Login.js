import React, { useState } from "react";
import { useHistory } from "react-router-dom";
import axios from "axios";

function LoginComponent() {
  const history = useHistory();

  const [loginFormData, setLoginFormData] = useState({
    email: "",
    password: "",
  });

  const [error, setError] = useState("");
  const [message, setMessage] = useState("");
  const [isLoggingIn, setIsLoggingIn] = useState(false);

  const handleLoginChange = (e) => {
    setLoginFormData({
      ...loginFormData,
      [e.target.name]: e.target.value,
    });
  };

  const handleLoginSubmit = async (e) => {
    e.preventDefault();
    setIsLoggingIn(true);

    try {
      const response = await axios.post(
        "http://localhost:4000/login",
        {
          email: loginFormData.email,
          password: loginFormData.password,
        },
        {
          withCredentials: true, // Send cookies with the request
        }
      );

      const { data } = response;
      console.log(data); // Log the response to the console

      if (data.token) {
        axios.defaults.headers.common[
          "Authorization"
        ] = `Bearer ${data.token}`;
      }

      if (data.message === "Welcome, User!") {
        setMessage(data.message);
        history.push("/user_dashboard");
      } else if (data.message === "Welcome, Clerk!") {
        setMessage(data.message);
        history.push("/clerk_dashboard");
      } else if (data.message === "Welcome, Admin!") {
        setMessage(data.message);
        history.push("/admin_dashboard");
      } else {
        setMessage("Unknown role");
      }
    } catch (error) {
      setError(error.response.data.errors);
    } finally {
      setIsLoggingIn(false);
    }
  };

  return (
    <div>
      <h2>Login</h2>
      <form onSubmit={handleLoginSubmit}>
        <input
          type="email"
          name="email"
          placeholder="Email"
          value={loginFormData.email}
          onChange={handleLoginChange}
        />
        <input
          type="password"
          name="password"
          placeholder="Password"
          value={loginFormData.password}
          onChange={handleLoginChange}
        />
        <button type="submit" disabled={isLoggingIn}>
          {isLoggingIn ? "Logging in..." : "Login"}
        </button>
        {error && <p>{error}</p>}
        {message && <p>{message}</p>}
      </form>
    </div>
  );
}

export default LoginComponent;
