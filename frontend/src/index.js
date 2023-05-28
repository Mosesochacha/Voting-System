import React from "react";
import { createRoot } from "react-dom/client";
import { createBrowserHistory } from "history";
import "./index.css";
import App from "./components/app/App";
import 'bootstrap/dist/css/bootstrap.min.css';


const history = createBrowserHistory();

function Root() {
  return <App history={history} />;
}

createRoot(document.getElementById("root")).render(<Root />);
