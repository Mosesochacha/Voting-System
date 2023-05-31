import React, { useState, useMemo } from "react";
import { useHistory } from "react-router-dom";
import axios from "axios";
import { Button, Spinner } from "react-bootstrap";
import "./Auth.css";

function LoginComponent({setLoggedIn}) {
  const history = useHistory();

  const [loginFormData, setLoginFormData] = useState({
    email: "",
    password: "",
  });

  const [error, setError] = useState("");
  const [message, setMessage] = useState("");
  const [isLoggingIn, setIsLoggingIn] = useState(false);
  const [isLoading, setIsLoading] = useState(false);

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
        axios.defaults.headers.common["Authorization"] = `Bearer ${data.token}`;
      }

      if (data.message === "Welcome, User!") {
        setMessage(data.message);
        setIsLoading(false)
        setLoggedIn(true);
        window.location.reload()
        history.push("/user_dashboard");
      } else if (data.message === "Welcome, Clerk!") {
        setMessage(data.message);
        setIsLoading(false)
        setLoggedIn(true);
        history.push("/clerk_dashboard");
        window.location.reload()
      } else if (data.message === "Welcome, Admin!") {
        setMessage(data.message);
        setIsLoading(false)
        setLoggedIn(true);
        history.push("/admin_dashboard");
        window.location.reload()
      } else {
        setMessage("Unknown role");
      }
    } catch (error) {
      setError(error.response.data.errors);
    } finally {
      setIsLoggingIn(false);
    }
  };

  const loginButtonContent = useMemo(() => {
    if (isLoggingIn) {
      return (
        <>
          <Spinner
            as="span"
            animation="border"
            size="sm"
            role="status"
            aria-hidden="true"
            className="mr-2"
          />
          Logging in...
        </>
      );
    } else {
      return "Log in";
    }
  }, [isLoggingIn]);

  return (
    <div className="card">
      <div className="text">Login</div>
      {error && <div className="error">{error}</div>}
      {message && <div className="message">{message}</div>}
      <form onSubmit={handleLoginSubmit}>
        <div className="field">
          <input
            type="text"
            name="email"
            className="input"
            placeholder="email"
            required
            value={loginFormData.email}
            onChange={handleLoginChange}
          />
          <span className="span">
            <svg
              className=""
              xmlSpace="preserve"
              style={{ enableBackground: "new 0 0 512 512" }}
              viewBox="0 0 512 512"
              y="0"
              x="0"
              height="20"
              width="50"
              xmlnsXlink="http://www.w3.org/1999/xlink"
              version="1.1"
              xmlns="http://www.w3.org/2000/svg"
            >
              <g>
                <path
                  className=""
                  data-original="#000000"
                  fill="#595959"
                  d="M256 0c-74.439 0-135 60.561-135 135s60.561 135 135 135 135-60.561 135-135S330.439 0 256 0zm0 240c-57.897 0-105-47.103-105-105S198.103 30 256 30s105 47.103 105 105-47.103 105-105 105zm0 0"
                ></path>
                <path
                  className=""
                  data-original="#000000"
                  fill="#595959"
                  d="M456 436h-10.277C438.07 428.875 446 418.734 446 407V225.895c0-68.49-55.727-124.106-124.98-124.891C260.07 89.528 256.037 90 256 90c-4.542 0-9.084-.216-13.617-.641-23.995-2.029-43.867-17.98-50.402-40.297C189.628 14.719 182.345 0 172.995 0h-65.789C98.12 0 90 8.12 90 18.206V407c0 11.773 7.929 21.887 18.723 24.834H56c-30.327 0-55 24.673-55 55v15c0 8.271 6.729 15 15 15h470c8.271 0 15-6.729 15-15v-15c0-30.327-24.673-55-55-55zm0 0"
                ></path>
              </g>
            </svg>
          </span>
          <label className="label"></label>
        </div>
        <div className="field">
          <input
            type="password"
            name="password"
            className="input"
            required
            placeholder="Password"
            value={loginFormData.password}
            onChange={handleLoginChange}
          />
          <span className="span">
            <svg
              className=""
              xmlSpace="preserve"
              style={{ enableBackground: "new 0 0 512 512" }}
              viewBox="0 0 512 512"
              y="0"
              x="0"
              height="20"
              width="50"
              xmlnsXlink="http://www.w3.org/1999/xlink"
              version="1.1"
              xmlns="http://www.w3.org/2000/svg"
            >
              <g>
                <path
                  className=""
                  data-original="#000000"
                  fill="#595959"
                  d="M336 192h-16v-64C320 57.406 262.594 0 192 0S64 57.406 64 128v64H48c-26.453 0-48 21.523-48 48v224c0 26.477 21.547 48 48 48h288c26.453 0 48-21.523 48-48V240c0-26.477-21.547-48-48-48zm-229.332-64c0-47.063 38.27-85.332 85.332-85.332s85.332 38.27 85.332 85.332v64H106.668zm0 0"
                ></path>
              </g>
            </svg>
          </span>
          <label className="label"></label>
        </div>
        <Button
          variant="primary"
          type="submit"
          disabled={isLoggingIn}
          className="btn"
        >
          {loginButtonContent}
        </Button>
        <p>
          Not a member? <a href="/register">Sign up</a>
        </p>
      </form>
      {isLoading && (
        <div className="loader-overlay">
          <Spinner animation="border" role="status" />
        </div>
      )}
    </div>
  );
}

export default LoginComponent;
