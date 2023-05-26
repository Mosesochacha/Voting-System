import React, { useState } from "react";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import axios from "axios";
import Navbar from "../user/Navbar";
import RegistrationComponent from "../authatautication/Registration";
import LoginComponent from "../authatautication/Login";

function App() {
  const [loggedIn, setLoggedIn] = useState(false);

  const handleLogout = () => {
    axios
      .delete("http://localhost:4000/logout")
      .then(() => {
        setLoggedIn(false);
      })
      .catch((error) => {
        console.log("An error occurred during logout:", error);
      });
  };

  axios.interceptors.request.use(function (config) {
    if (loggedIn) {
      config.headers.Authorization = `Bearer ${localStorage.getItem(
        "token"
      )}`;
    }
    return config;
  });

  return (
    <Router>
      <Navbar loggedIn={loggedIn} handleLogout={handleLogout} />
      <Switch>
        <Route exact path="/register" component={RegistrationComponent} />
        <Route exact path="/login" component={LoginComponent} />
        {/* Add more routes for different roles */}
      </Switch>
    </Router>
  );
}

export default App;
