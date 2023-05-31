import React, { useState, useEffect, useMemo } from "react";
import "./App.css";
import {
  BrowserRouter as Router,
  Switch,
  Route,
  useLocation,
  useHistory,
  Redirect,
} from "react-router-dom";
import axios from "axios";
import Vacancies from "../user/Vacancies";
import CandidateList from "../user/Getcandidate";
import RegistrationComponent from "../authatautication/Registration";
import LoginComponent from "../authatautication/Login";
import Footer from "../landingpage/Footer";
import LandingPageNavbar from "../landingpage/Landingpagenav";
import LandingPage from "../landingpage/LandingPage";
import UserDashboard from "../user/UserDashboard";
import AdminDashboard from "../admin/AdminDashboard";
import AboutUs from "../landingpage/about";
import Services from "../landingpage/Services";
import ContactUs from "../landingpage/Contact";

function App() {
  const [loggedIn, setLoggedIn] = useState(false);
  const history = useHistory();
  const location = useLocation();
  const path = location.pathname;

  const showLandingPageNavbar = useMemo(() => {
    const allowedPaths = [
      "/",
      "/about",
      "/blogs",
      "/contact",
      "/services",
      "/login",
      "/reset-password",
      "/register",
      "*",
    ];

    return !loggedIn && allowedPaths.includes(path);
  }, [loggedIn, path]);

  const navbar = showLandingPageNavbar ? <LandingPageNavbar /> : null;

  const footer = useMemo(() => {
    const showFooterPaths = [
      "/login",
      "/register",
      "/services",
      "/about",
      "/contact",
    ];

    if (loggedIn && showFooterPaths.includes(path)) {
      return null;
    } else {
      return <Footer />;
    }
  }, [loggedIn, path]);

  useEffect(() => {
    const checkLoginStatus = async () => {
      try {
        const response = await axios.get("http://localhost:4000/check_login", {
          withCredentials: true,
        });
        setLoggedIn(response.data.logged_in);
        if (response.data.logged_in && response.data.token) {
          axios.defaults.headers.common[
            "Authorization"
          ] = `Bearer ${response.data.token}`;
        }
      } catch (error) {
        setLoggedIn(false);
        console.log("An error occurred during login status check:", error);
      }
    };

    checkLoginStatus();
  }, []);

  const handleLogout = () => {
    axios
      .delete("http://localhost:4000/logout", { withCredentials: true }) // Update the URL to match your server-side logout endpoint
      .then(() => {
        setLoggedIn(false);
        delete axios.defaults.headers.common["Authorization"];
        history.push("/login");
      })
      .catch((error) => {
        console.log("An error occurred during logout:", error);
      });
  };

  const ProtectedRoute = ({ component: Component, ...rest }) => (
    <Route
      {...rest}
      render={(props) =>
        loggedIn ? (
          <Component {...props} handleLogout={handleLogout} />
        ) : (
          <Redirect to="/login" />
        )
      }
    />
  );

  return (
    <Router>
      {navbar}
      <Switch>
        <Route exact path="/" component={LandingPage} />
        <Route path="/about" component={AboutUs} />
        <Route path="/services" component={Services} />
        <Route path="/contact" component={ContactUs} />
        <Route path="/login">
          {loggedIn ? (
            <Redirect to="/user_dashboard" />
          ) : (
            <LoginComponent setLoggedIn={setLoggedIn} />
          )}
        </Route>
        <Route exact path="/register" component={RegistrationComponent} />
        <ProtectedRoute path="/user_dashboard" component={UserDashboard} />
        <ProtectedRoute path="/admin_dashboard" component={AdminDashboard} />
        <Route path="/vacancies" component={Vacancies} />
        <Route path="/candidates" component={CandidateList} />
        <Redirect to="/" />
      </Switch>
      {footer}
    </Router>
  );
}

export default App;
