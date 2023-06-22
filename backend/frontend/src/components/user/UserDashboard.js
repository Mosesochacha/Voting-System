import "bootstrap/dist/css/bootstrap.min.css";
import "bootstrap-icons/font/bootstrap-icons.css";
import React, { useState, useEffect, useMemo } from "react";
import { Link } from "react-router-dom";
import logo from "./iebc-logo-4405AFE0AD-seeklogo.com.png";
import { AiOutlineGlobal } from "react-icons/ai";
import "./Sidebar.css"

export default function UserDashboard({ handleLogout }) {
  const [click, setClick] = useState(false);

  const handleClick = () => setClick(!click);
  const closeMobileMenu = () => setClick(false);

  const showButton = useMemo(() => {
    const handleResize = () => {
      if (window.innerWidth <= 960) {
        setClick(false);
      }
    };

    handleResize();
    window.addEventListener("resize", handleResize);

    return handleResize;
  }, []);

  useEffect(() => {
    showButton();
    return () => {
      window.removeEventListener("resize", showButton);
    };
  }, [showButton]);

  return (
    <div className="userdashboard">
      <nav
        className="navbar navbar-expand-lg navbar-light  sticky-top"
        style={{ zIndex: 100 }}
      >
        <div className="container">
          <Link to="/" className="navbar-brand" onClick={closeMobileMenu}>
            <img
              src={logo}
              alt="IEBC Logo"
              className="navbar-logo"
              style={{ width: "1.5em" }}
            />
            Kenya Voting
            <AiOutlineGlobal style={{ color: "#ffffff" }} />
          </Link>
          <button
            className="navbar-toggler"
            type="button"
            onClick={handleClick}
          >
            <span className="navbar-toggler-icon" />
          </button>
          <div
            className={
              click
                ? "collapse navbar-collapse show"
                : "collapse navbar-collapse"
            }
          >
            <ul className="navbar-nav ml-auto">
           
            </ul>
          </div>
        </div>
      </nav>

      <div className="container-fluid">
        <div className="row">
          <div className="col-auto col-md-2 min-vh-100 sidebar">
            <ul className="nav flex-column">
              <li className="nav-item">
                <Link className="nav-link" to="/user-dashboard">
                  <i className="bi bi-house" />
                  <span className="ms-1">Home</span>
                </Link>
              </li>
              <li className="nav-item">
                <Link className="nav-link" to="/user-dashboard">
                  <i className="fa fa-fw fa-envelope" />
                  <span className="ms-1">Vote</span>
                </Link>
              </li>
              <li className="nav-item">
                <Link className="nav-link" to="/user-dashboard">
                  <i className="bi bi-person" />
                  <span className="ms-1">Profile</span>
                </Link>
              </li>
              <li className="nav-item">
                <Link className="nav-link" to="/user-dashboard">
                  <i className="fa fa-fw fa-history" />
                  <span className="ms-1">Voting History</span>
                </Link>
              </li>
              <li className="nav-item">
                <Link className="nav-link" to="/user-dashboard">
                  <i className="bi bi-briefcase" />
                  <span className="ms-1">Vacancies</span>
                </Link>
              </li>
              <li className="nav-item">
                <Link className="nav-link" to="/user-dashboard">
                  <i className="bi bi-people" />
                  <span className="ms-1">Candidate List</span>
                </Link>
              </li>
              <li className="nav-item " style={{marginRight: "2em"}}>
                <button className="nav-link" onClick={handleLogout}>
                  Logout
                </button>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  );
}

// eslint-disable-next-line
