import React from "react";
import { Link } from "react-router-dom";
import "./Sidebar.css";

export default function Sidebar() {
  return (
    <div className="sidebar">
      <ul className="sidebar-links ">
        <li>
          <Link exact to="/user_dashboard" activeClassName="active">
            Dashboard
          </Link>
        </li>
        <li>
          <Link to="/candidates" activeClassName="active">
            Candidates
          </Link>
        </li>
        <li>
          <Link to="/history" activeClassName="active">
            Voting History
          </Link>
        </li>
        <li>
          <Link to="/profile" activeClassName="active">
            Profile
          </Link>
        </li>
      </ul>
    </div>
  );
}
