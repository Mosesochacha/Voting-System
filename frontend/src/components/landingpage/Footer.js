import React from "react";
import { Link } from "react-router-dom";
import { Facebook, Twitter, Instagram } from "@material-ui/icons";

export default function Footer() {
  return (
    <footer className="footer sticky-footer">
      <div className="container" style={{ paddingLeft: 0, paddingRight: 0 }}>
        <div className="row" style={{ marginLeft: 0, marginRight: 0 }}>
          <div className="col-lg-3">
            <h4>I am Heshima</h4>
            <p>
              This an organization that has enabled me gain this skills to work
              for my community.
            </p>
          </div>
          <div className="col-lg-3">
            <h4>Useful Links</h4>
            <ul className="footer-links">
              <li>
                <Link to="/home">Home</Link>
              </li>
              <li>
                <Link to="/about">About</Link>
              </li>
              <li>
                <Link to="/services">Services</Link>
              </li>
              <li>
                <Link to="/contact">Contact</Link>
              </li>
            </ul>
          </div>
          <div className="col-lg-3">
            <h4>Contact Information</h4>
            <p>123 Street, City</p>
            <p>contact@example.com</p>
            <p>+123 456 7890</p>
          </div>
          <div className="col-lg-3">
            <h4>Follow Us</h4>
            <ul className="footer-social-links">
              <li>
                <a href="https://www.facebook.com">
                  <Facebook />
                  Facebook
                </a>
              </li>
              <li>
                <a href="https://www.twitter.com">
                  <Twitter />
                  Twitter
                </a>
              </li>
              <li>
                <a href="https://www.instagram.com">
                  <Instagram />
                  Instagram
                </a>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <hr />
      <div className="container" style={{ marginTop: "-5" }}>
        <div className="row">
          <div className="col-lg-12 text-center">
            <p>
              &copy; {new Date().getFullYear()} Iam Heshima. All rights
              reserved.
            </p>
            <p>
              Designed by <a href="https://bootstrapmade.com/">ochachamoses</a>
            </p>
          </div>
        </div>
      </div>
    </footer>
  );
}
