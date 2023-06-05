import "bootstrap/dist/css/bootstrap.min.css";
import "bootstrap-icons/font/bootstrap-icons.css";
import React, { useState, useEffect, useMemo } from "react";
import { Link } from "react-router-dom";
import logo from "./iebc-logo-4405AFE0AD-seeklogo.com.png";
import { AiOutlineGlobal } from "react-icons/ai";

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
        className="navbar navbar-expand-lg navbar-light bg-dack sticky-top"
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
              <li className="nav-item ml-4">
                <button className="nav-link" onClick={handleLogout}>
                  Logout
                </button>
              </li>
            </ul>
          </div>
        </div>
      </nav>

      <div className="container-fluid">
        <div className="row">
          <div className="col-auto col-md-2 min-vh-100 bg-dark">
            <ul className="nav flex-column">
              <li className="nav-item">
                <a className="nav-link" href="/user-dashboard">
                  <i className="bi bi-house" />
                  <span className="ms-1">Home</span>
                </a>
              </li>
              <li className="nav-item">
                <a className="nav-link" href="/user-dashboard">
                  <i className="bi bi-vote" />
                  <span className="ms-1">Vote</span>
                </a>
              </li>
              <li className="nav-item">
                <a className="nav-link" href="/user-dashboard">
                  <i className="bi bi-person" />
                  <span className="ms-1">Profile</span>
                </a>
              </li>
              <li className="nav-item">
                <a className="nav-link" href="/user-dashboard">
                  <i className="bi bi-history" />
                  <span className="ms-1">Voting History</span>
                </a>
              </li>
              <li className="nav-item">
                <a className="nav-link" href="/user-dashboard">
                  <i className="bi bi-briefcase" />
                  <span className="ms-1">Vacancies</span>
                </a>
              </li>
              <li className="nav-item">
                <a className="nav-link" href="/user-dashboard">
                  <i className="bi bi-people" />
                  <span className="ms-1">Candidate List</span>
                </a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  );
}

// eslint-disable-next-line
