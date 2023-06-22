import React, { useEffect, useState } from "react";
import axios from "axios";
import { Link } from "react-router-dom";

function Vacancies() {
  const [positions, setPositions] = useState([]);
  const [error, setError] = useState(null);

  useEffect(() => {
    axios
      .get("http://localhost:4000/vacancies", { withCredentials: true })
      .then((response) => {
        setPositions(response.data);
        setError(null);
      })
      .catch((error) => {
        setError("Error fetching vacancies");
        console.log("An error occurred:", error);
      });
  }, []);

  const getPositionCreateRoute = (positionName) => {
    if (positionName === "President") {
      return "/president";
    } else if (positionName === "Governor") {
      return "/governor";
    } else if (positionName === "Senator") {
      return "/senator";
    } else if (positionName === "Women_Representative") {
      return "/womenrep";
    } else if (positionName === "Member_of_Parliament") {
      return "/member_of_parliament";
    } else if (positionName === "Member_of_Count_Assembly") {
      return "/create/mca";
    } else {
      return "/"; // Default route if position name doesn't match
    }
  };

  if (error) {
    return <div>{error}</div>;
  }

  return (
    <div>
      <h1>Vacancies</h1>
      {positions.map((position) => (
        <div key={position.id}>
          <h2>{position.name}</h2>
          <h3>Requirements:</h3>
          <ul>
            {position.requirements.map((requirement, index) => (
              <li key={index}>{requirement}</li>
            ))}
          </ul>
          <Link to={getPositionCreateRoute(position.name)}>
            Apply for {position.name}
          </Link>
        </div>
      ))}
    </div>
  );
}

export default Vacancies;
