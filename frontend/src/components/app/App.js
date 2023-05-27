import React, { useState, useEffect } from "react";
import {
  BrowserRouter as Router,
  Route,
  Switch,
  Redirect,
} from "react-router-dom";
import axios from "axios";
import Navbar from "../user/Navbar";
import CandidatesList from "../user/GetCandidate";
import RegistrationComponent from "../authatautication/Registration";
import LoginComponent from "../authatautication/Login";

function App() {
  const [loggedIn, setLoggedIn] = useState(false);

  useEffect(() => {
    checkLoginStatus();
  }, []);

  const checkLoginStatus = async () => {
    try {
      const response = await axios.get("http://localhost:4000/check_login", {
        withCredentials: true, // Send cookies with the request
      });
      setLoggedIn(response.data.logged_in);
    } catch (error) {
      console.log("An error occurred during login status check:", error);
    }
  };

  const handleLogout = () => {
    axios
      .delete("http://localhost:4000/logout", { withCredentials: true }) // Send cookies with the request
      .then(() => {
        setLoggedIn(false);
      })
      .catch((error) => {
        console.log("An error occurred during logout:", error);
      });
  };

  const PrivateRoute = ({ component: Component, ...rest }) => (
    <Route
      {...rest}
      render={(props) =>
        loggedIn ? <Component {...props} /> : <Redirect to="/login" />
      }
    />
  );

  return (
    <Router>
      <Navbar loggedIn={loggedIn} handleLogout={handleLogout} />
      <Switch>
        <Route exact path="/register" component={RegistrationComponent} />
        <Route exact path="/login" component={LoginComponent} />
        <PrivateRoute exact path="/user_dashboard" component={CandidatesList} />
      </Switch>
    </Router>
  );
}

export default App;
