import React from "react";
import { Link } from "react-router-dom";
import logo from "./iebc-logo-4405AFE0AD-seeklogo.com.png";
import PublicIcon from "@material-ui/icons/Public";
import "./Sidebar.css";
import "./Dashboard.css";

const UserDashboard = ({ handleLogout }) => {
  return (
    <div className="dashboard">
      <nav
        className="navbar navbar-expand-lg navbar-light"
        style={{ position: "sticky", top: 0, zIndex: 100 }}
      >
        <div className="container">
          <Link to="/" className="navbar-brand">
            <img
              src={logo}
              alt="IEBC Logo"
              className="navbar-logo"
              style={{ width: "1.5em" }}
            />
            Kenya Voting
            <PublicIcon style={{ color: "#ffffff" }} />
          </Link>
          <button onClick={handleLogout}>Logout</button>
        </div>
      </nav>

      <div className="sidebar">
        <div className="row">
          <div className="col-lg-3 col-md-4 col-sm-12">
            <ul className="list-group">
              <li className="list-group-item">
                <Link to="/vote">Vote</Link>
              </li>
              <li className="list-group-item">
                <Link to="/profile">Profile</Link>
              </li>
              <li className="list-group-item">
                <Link to="/candidates">Candidates</Link>
              </li>
              <li className="list-group-item">
                <Link to="/voting-history">Voting History</Link>
              </li>
              <li className="list-group-item">
                <Link to="/vacancies">Vacancies</Link>
              </li>
            </ul>
          </div>
          <div className="col-lg-9 col-md-8 col-sm-12">
            {/* Add your professional dashboard content here */}
            {/* This section will display the content related to the selected menu item */}
          </div>
        </div>
      </div>
    </div>
  );
};

export default UserDashboard;
