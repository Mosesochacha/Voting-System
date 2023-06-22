import React, { useState } from "react";
import axios from "axios";
import { useHistory } from "react-router-dom";
import { TextField, Typography } from "@mui/material";
import AccountCircleIcon from "@mui/icons-material/AccountCircle";
import MailOutlineIcon from "@mui/icons-material/MailOutline";
import LockOutlinedIcon from "@mui/icons-material/LockOutlined";

import { Button, Spinner } from "react-bootstrap";
import "bootstrap/dist/css/bootstrap.min.css";
import "./Auth.css";

function RegistrationComponent() {
  const history = useHistory();

  const [registerFormData, setRegisterFormData] = useState({
    name: "",
    email: "",
    password: "",
    password_confirmation: "",
  });

  const [errors, setErrors] = useState([]);
  const [message, setMessage] = useState("");
  const [isRegistering, setIsRegistering] = useState(false);

  const handleRegisterChange = (e) => {
    setRegisterFormData({
      ...registerFormData,
      [e.target.name]: e.target.value,
    });
  };

  const handleRegisterSubmit = async (e) => {
    e.preventDefault();

    setIsRegistering(true);

    try {
      const response = await axios.post("http://localhost:4000/register", {
        name: registerFormData.name,
        email: registerFormData.email,
        password: registerFormData.password,
        password_confirmation: registerFormData.password_confirmation,
      });

      const data = response.data;
      console.log(data);

      if (data.message) {
        setMessage(data.message);
        setErrors([]);
        history.push("/login");
        window.location.reload();
      } else if (data.errors) {
        setMessage("");
        setErrors(data.errors);
        console.log(data.errors);
      }
    } catch (error) {
      setMessage("");
      setErrors(error.response.data.errors);
    }

    setIsRegistering(false);
  };

  return (
    <div className="card">
      <Typography variant="h6" component="div" className="text">
        Register
      </Typography>
      <form onSubmit={handleRegisterSubmit}>
        <div className="field">
          <AccountCircleIcon className="span" />
          <TextField
            type="text"
            name="name"
            label="Name"
            value={registerFormData.name}
            onChange={handleRegisterChange}
            className="input"
          />
        </div>
        <div className="field">
          <MailOutlineIcon className="span" />
          <TextField
            type="email"
            name="email"
            label="Email"
            variant="filled"
            value={registerFormData.email}
            onChange={handleRegisterChange}
            className="input"
          />
        </div>
        <div className="field">
          <LockOutlinedIcon className="span" />
          <TextField
            type="password"
            name="password"
            label="Password"
            value={registerFormData.password}
            onChange={handleRegisterChange}
            className="input"
          />
        </div>
        <div className="field">
          <LockOutlinedIcon className="span" />
          <TextField
            type="password"
            name="password_confirmation"
            label="Confirm Password"
            value={registerFormData.password_confirmation}
            onChange={handleRegisterChange}
            className="input"
          />
        </div>
        <Button
          variant="primary"
          type="submit"
          disabled={isRegistering}
          className="button"
        >
          {isRegistering ? (
            <>
              <Spinner animation="border" size="sm" className="mr-2" />
              Registering...
            </>
          ) : (
            "Register"
          )}
        </Button>
        <div>
          {errors.map((error, index) => (
            <Typography key={index} variant="body2" color="error">
              {error}
            </Typography>
          ))}
        </div>
        <Typography variant="body2" className="sign-up">
          Already a member? <a href="/login">Login</a>
        </Typography>
        {message && <Typography variant="body1">{message}</Typography>}
      </form>
    </div>
  );
}

export default RegistrationComponent;
