import React, { useState, useEffect } from "react";
import {
  BrowserRouter as Router,
  Route,
  Switch,
  Redirect,
  useHistory,
} from "react-router-dom";
import axios from "axios";
import Navbar from "../user/Navbar";
import Vacancies from "../user/Vacancies";
import CandidatesList from "../user/Getcandidate";
import PresidentComponent from "../user/President";
import GovernorComponent from "../user/Gorver";
import SenatorComponent from "../user/Senator";
import WomenRepresentativeComponent from "../user/Womrep";
import MemberOfParliamentComponent from "../user/Mp";
import MemberOfCountyAssemblyComponent from "../user/Mcas";
import RegistrationComponent from "../authatautication/Registration";
import LoginComponent from "../authatautication/Login";

function App() {
  const [loggedIn, setLoggedIn] = useState(false);
  const history = useHistory();

  useEffect(() => {
    checkLoginStatus();
  }, []);

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

  const PrivateRoute = ({ component: Component, ...rest }) => {
    return (
      <Route
        {...rest}
        render={(props) =>
          loggedIn ? <Component {...props} /> : <Redirect to="/login" />
        }
      />
    );
  };

  const requireAuth = (Component) => {
    return loggedIn ? <Component /> : <Redirect to="/login" />;
  };

  return (
    <Router>
      <Navbar loggedIn={loggedIn} handleLogout={handleLogout} />
      <Switch>
        <Route exact path="/register" component={RegistrationComponent} />
        <Route exact path="/login" component={LoginComponent} />
        <PrivateRoute exact path="/user_dashboard" component={CandidatesList} />
        <PrivateRoute
          exact
          path="/vacancies"
          component={() => requireAuth(Vacancies)}
        />
        <PrivateRoute exact path="/president" component={PresidentComponent} />
        <PrivateRoute exact path="/governor" component={GovernorComponent} />
        <PrivateRoute exact path="/senator" component={SenatorComponent} />
        <PrivateRoute
          exact
          path="/womenrep"
          component={WomenRepresentativeComponent}
        />
        <PrivateRoute
          exact
          path="/member_of_parliament"
          component={MemberOfParliamentComponent}
        />
        <PrivateRoute
          exact
          path="/create/mca"
          component={MemberOfCountyAssemblyComponent}
        />
        <Redirect exact from="/" to="/user_dashboard" />
        <Route path="*" component={() => <div>404 Not Found</div>} />
      </Switch>
    </Router>
  );
}

export default App;
