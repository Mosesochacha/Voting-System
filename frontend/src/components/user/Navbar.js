import React from "react";

function Navbar({ loggedIn, handleLogout }) {
  const handleRefresh = () => {
    window.location.reload();
  };

 
  return (
    <nav>
      <ul>
        <li>
          <button
            style={{
              background: "none",
              border: "none",
              margin: "0",
              padding: "0",
              cursor: "pointer",
              color: "blue",
            }}
            onClick={() => {
              handleRefresh();
              window.location.href = "/";
            }}
          >
            Home
          </button>
        </li>
        {loggedIn ? (
          <>
            <li>
              <button
                style={{
                  background: "none",
                  border: "none",
                  margin: "0",
                  padding: "0",
                  cursor: "pointer",
                  color: "blue",
                }}
                onClick={() => {
                  handleRefresh();
                  window.location.href = "/candidates";
                }}
              >
                Candidates
              </button>
            </li>
            <li>
              <button
                style={{
                  background: "none",
                  border: "none",
                  margin: "0",
                  padding: "0",
                  cursor: "pointer",
                  color: "blue",
                }}
                onClick={() => {
                  handleRefresh();
                  window.location.href = "/vacancies";
                }}
              >
                Vacancies
              </button>
            </li>
            <li>
              <button
                style={{
                  background: "none",
                  border: "none",
                  margin: "0",
                  padding: "0",
                  cursor: "pointer",
                  color: "blue",
                }}
                onClick={handleLogout}
              >
                Logout
              </button>
            </li>
          </>
        ) : (
          <>
            <li>
              <button
                style={{
                  background: "none",
                  border: "none",
                  margin: "0",
                  padding: "0",
                  cursor: "pointer",
                  color: "blue",
                }}
                onClick={() => {
                  handleRefresh();
                  window.location.href = "/login";
                }}
              >
                Login
              </button>
            </li>
            <li>
              <button
                style={{
                  background: "none",
                  border: "none",
                  margin: "0",
                  padding: "0",
                  cursor: "pointer",
                  color: "blue",
                }}
                onClick={() => {
                  handleRefresh();
                  window.location.href = "/register";
                }}
              >
                Register
              </button>
            </li>
          </>
        )}
      </ul>
    </nav>
  );
}

export default Navbar;
