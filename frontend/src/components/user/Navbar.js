// import React, { useState } from "react";
// import { Link } from "react-router-dom";
// import logo from "./iebc-logo-4405AFE0AD-seeklogo.com.png";
// import PublicIcon from "@material-ui/icons/Public";
// import "./Sidebar.css";

// function Navbar({ handleLogout }) {
//   const [click, setClick] = useState(false);

//   const handleClick = () => setClick(!click);
//   const closeMobileMenu = () => setClick(false);

//   return (
//     <>
//       <nav className="navbar navbar-top">
//         <div className="container">
//           <Link to="/" className="navbar-brand" onClick={closeMobileMenu}>
//             <img
//               src={logo}
//               alt="IEBC Logo"
//               className="navbar-logo"
//               style={{ width: "1.5em" }}
//             />
//             Kenya Voting
//             <PublicIcon style={{ color: "#ffffff" }} />
//           </Link>
//           <button
//             className="navbar-toggler"
//             type="button"
//             onClick={handleClick}
//           >
//             <span className="navbar-toggler-icon" />
//           </button>
//           <div
//             className={
//               click
//                 ? "collapse navbar-collapse show"
//                 : "collapse navbar-collapse"
//             }
//           >
//             <ul className="navbar-nav ml-auto">
//               <li className="nav-item ml-4"></li>
//               <li className="nav-item ml-2"></li>
//               <li className="nav-item ml-2"></li>
//               <li className="nav-item ml-2"></li>
//             </ul>
//           </div>
//           <button className="nav-link logout-button" onClick={handleLogout}>
//             Logout
//           </button>
//         </div>
//       </nav>
//     </>
//   );
// }

// export default Navbar;
