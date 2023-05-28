import React from "react";
import { Container, Navbar,Jumbotron, Button } from "react-bootstrap";

const LandingPage = () => {
  return (
    <div>
      <Navbar bg="light" expand="lg">
        <Container>
          <Navbar.Brand href="/">
            <img
              src="/path/to/iebc_logo.png" // Replace with actual path to IEBC logo
              alt="IEBC Logo"
              className="logo"
            />
          </Navbar.Brand>
        </Container>
      </Navbar>

      <Jumbotron>
        <Container>
          <h1>Welcome to the Online Voting System</h1>
          <p>Make your vote count from anywhere, anytime!</p>
          <Button href="/register" variant="primary">
            Get Started
          </Button>
        </Container>
      </Jumbotron>

      <Container>
        <h2>Secure and Convenient Voting</h2>
        <p>
          Our online voting system provides a secure and convenient way for
          eligible voters in Kenya to cast their votes remotely.
        </p>

        <h2>Transparent and Trustworthy</h2>
        <p>
          We ensure transparency and trust in the voting process through
          advanced security measures and verifiable results.
        </p>
      </Container>

      <footer className="footer">
        <Container>
          <p>&copy; 2023 Independent Electoral and Boundaries Commission</p>
        </Container>
      </footer>
    </div>
  );
};

export default LandingPage;
