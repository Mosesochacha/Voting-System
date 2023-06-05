import React, { useState, useEffect } from "react";
import { Button } from "./Button";
import { Link } from "react-router-dom";
import logo from "./iebc-logo-4405AFE0AD-seeklogo.com.png";
import { AiOutlineGlobal } from "react-icons/ai";

function LandingPageNavbar() {
  const [click, setClick] = useState(false);
  const [button, setButton] = useState(true);

  const handleClick = () => setClick(!click);
  const closeMobileMenu = () => setClick(false);

  const showButton = () => {
    if (window.innerWidth <= 960) {
      setButton(false);
    } else {
      setButton(true);
    }
  };

  useEffect(() => {
    showButton();
  }, []);

  window.addEventListener("resize", showButton);

  return (
    <nav
      className="navbar navbar-expand-lg navbar-light"
      style={{ position: "sticky", top: 0, zIndex: 100 }}
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
        <button className="navbar-toggler" type="button" onClick={handleClick}>
          <span className="navbar-toggler-icon" />
        </button>
        <div
          className={
            click ? "collapse navbar-collapse show" : "collapse navbar-collapse"
          }
        >
          <ul className="navbar-nav ml-auto">
            <li className="nav-item ml-4">
              <Link to="/blogs" className="nav-link" onClick={closeMobileMenu}>
                Reviews
              </Link>
            </li>
            <li className="nav-item ml-2">
              <Link
                to="/contact-us"
                className="nav-link"
                onClick={closeMobileMenu}
              >
                Contact Us
              </Link>
            </li>
            <li className="nav-item ml-2">
              <Link
                to="/about-us"
                className="nav-link"
                onClick={closeMobileMenu}
              >
                About Us
              </Link>
            </li>
            <li className="nav-item ml-2">
              <Link
                to="/services"
                className="nav-link"
                onClick={closeMobileMenu}
              >
                Services
              </Link>
            </li>
            {/* <li className="nav-item ml-2">
              <Link to="/login" className="nav-link" onClick={closeMobileMenu}>
                Login
              </Link>
            </li> */}
          </ul>
        </div>
        {button && (
          <Button buttonStyle="btn--outline" className="ml-3">
            LOGIN
          </Button>
        )}
      </div>
    </nav>
  );
}

export default LandingPageNavbar;
