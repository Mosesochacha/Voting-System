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
// import PresidentComponent from "../user/President";
// import GovernorComponent from "../user/Governor";
// import SenatorComponent from "../user/Senator";
// import WomenRepresentativeComponent from "../user/";
// import MemberOfParliamentComponent from "../user/Mp"
// import MemberOfCountyAssemblyComponent from "../user/MemberOfCountyAssembly";
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

  const navbar = useMemo(() => {
    if (
      path === "/" ||
      path === "/about" ||
      path === "/blogs" ||
      path === "/contact" ||
      path === "/services" ||
      path === "/login" ||
      path === "/reset-password" ||
      path === "/register" ||
      path === "*"
    ) {
      return <LandingPageNavbar />;
    } else if (
      path === "/user_dashboard" ||
      path === "/vacancies" ||
      path === "/candidates" ||
      path === "/profile-setup" ||
      path === "/top-up" ||
      path === "/user-transaction" ||
      path === "/user-profile" ||
      path === "/new-beneficiary" ||
      path === "/beneficiaries" ||
      path === "/update-profile"
    ) {
      return <UserDashboard />;
    } else {
      return <AdminDashboard />;
    }
  }, [path]);

  const footer = useMemo(() => {
    if (
      path === "/" ||
      path === "/about" ||
      path === "/blogs" ||
      path === "/contact" ||
      path === "/services" ||
      path === "/login" ||
      path === "/reset-password" ||
      path === "/register" ||
      path === "*"
    ) {
      return <Footer />;
    } else {
      return null;
    }
  }, [path]);

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
        console.log("An error occurred during login status check:", error);
      }
    };

    checkLoginStatus();
  }, []);

  const handleLogout = () => {
    axios
      .delete("http://localhost:4000/logout", { withCredentials: true })
      .then(() => {
        setLoggedIn(false);
        delete axios.defaults.headers.common["Authorization"];
        history.push("/login");
      })
      .catch((error) => {
        console.log("An error occurred during logout:", error);
      });
  };

  return (
    <Router>
      {navbar}
      <Switch>
        <Route exact path="/" component={LandingPage} />
        <Route path="/about" component={AboutUs} />
        <Route path="/services" component={Services} />
        <Route path="/contact" component={ContactUs} />
        <Route path="/login">
          {loggedIn ? <Redirect to="/user_dashboard" /> : <LoginComponent setLoggedIn={setLoggedIn}/>}
        </Route>
        <Route path="/register">
          {loggedIn ? (
            <Redirect to="/user_dashboard" />
          ) : (
            <RegistrationComponent />
          )}
        </Route>
        <Route path="/user_dashboard">
          {loggedIn ? (
            <UserDashboard handleLogout={handleLogout} />
          ) : (
            <Redirect to="/login" />
          )}
        </Route>
        <Route path="/admin_dashboard">
          {loggedIn ? (
            <AdminDashboard handleLogout={handleLogout} />
          ) : (
            <Redirect to="/login" />
          )}
        </Route>
        <Route path="/vacancies" component={Vacancies} />
        {/* <Route path="/president" component={PresidentComponent} />
        <Route path="/governor" component={GovernorComponent} />
        <Route path="/senator" component={SenatorComponent} /> */}
        {/* <Route
          path="/women_representative"
          component={WomenRepresentativeComponent}
        /> */}
        {/* <Route
          path="/member_of_parliament"
          component={MemberOfParliamentComponent}
        /> */}
        {/* <Route
          path="/member_of_county_assembly"
          component={MemberOfCountyAssemblyComponent}
        /> */}
        <Route path="/candidates" component={CandidateList} />
      </Switch>
      {footer}
    </Router>
  );
}

export default App;
