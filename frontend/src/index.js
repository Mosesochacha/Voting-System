import React from "react";
import { createRoot } from "react-dom/client";
import { BrowserRouter } from "react-router-dom";
import { createBrowserHistory } from "history";
import "./index.css";
import App from "./components/app/App";
import "bootstrap/dist/css/bootstrap.min.css";

const history = createBrowserHistory();

function Root() {
  return (
    <div className="body">
      <React.StrictMode>
        {" "}
        <BrowserRouter>
          {" "}
          <App history={history} />
        </BrowserRouter>
      </React.StrictMode>
    </div>
  );
}

createRoot(document.getElementById("root")).render(<Root />);
