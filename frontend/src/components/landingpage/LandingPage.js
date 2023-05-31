import React from "react";
import { Container, Button } from "react-bootstrap";

const LandingPage = () => {
  return (
    <div className="landing-page" style={{color: "white"}}>
      <div className="landing-background">
        <Container className="text-center" >
          <h1>Welcome to the Online Voting System</h1>
          <p>Make your vote count from anywhere, anytime!</p>
          <Button href="/register" variant="primary">
            Get Started
          </Button>
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
        </Container>
      </div>

    
    </div>
  );
};

export default LandingPage;
