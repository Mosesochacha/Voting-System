import React, { useState } from "react";
import axios from "axios";
import { useHistory } from "react-router-dom";

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

      const data = response.data; // Use response.data instead of just response
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
    <div>
      <h2>Register</h2>
      <form onSubmit={handleRegisterSubmit}>
        <input
          type="text"
          name="name"
          placeholder="Name"
          value={registerFormData.name}
          onChange={handleRegisterChange}
        />
        <input
          type="email"
          name="email"
          placeholder="Email"
          value={registerFormData.email}
          onChange={handleRegisterChange}
        />
        <input
          type="password"
          name="password"
          placeholder="Password"
          value={registerFormData.password}
          onChange={handleRegisterChange}
        />
        <input
          type="password"
          name="password_confirmation"
          placeholder="Confirm Password"
          value={registerFormData.password_confirmation}
          onChange={handleRegisterChange}
        />
        <button type="submit" disabled={isRegistering}>
          {isRegistering ? "Registering..." : "Register"}
        </button>
        <div>
          {errors.map((error, index) => (
            <p key={index}>{error}</p>
          ))}
        </div>
        {message && <p>{message}</p>}
      </form>
    </div>
  );
}

export default RegistrationComponent;
