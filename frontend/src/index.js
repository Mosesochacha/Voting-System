import React from "react";
import { createRoot } from "react-dom/client";
import { createBrowserHistory } from "history";
import "./index.css";
import App from "./components/app/App";

const history = createBrowserHistory();

function Root() {
  return <App history={history} />;
}

createRoot(document.getElementById("root")).render(<Root />);
