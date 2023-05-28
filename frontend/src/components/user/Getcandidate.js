import React, { useEffect, useState } from "react";
import axios from "axios";

const CandidatesList = () => {
  const [candidates, setCandidates] = useState([]);
  const [selectedLevel, setSelectedLevel] = useState("");

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await axios.get(
          `http://localhost:4000/candidates/${selectedLevel}`
        );
        const data = response.data;
        setCandidates(data);
      } catch (error) {
        console.log("Error:", error.message);
      }
    };

    fetchData();
  }, [selectedLevel]);

  const handleLevelChange = (event) => {
    setSelectedLevel(event.target.value.replace(/_/g, " "));
  };

  return (
    <div>
      <h1>Candidates List</h1>
      <div>
        <label htmlFor="level">Select Level:</label>
        <select id="level" value={selectedLevel} onChange={handleLevelChange}>
          <option value="">-- Select Level --</option>
          <option value="President">President</option>
          <option value="Governor">Governor</option>
          <option value="Senator">Senator</option>
          <option value="Women Representative">Women Representative</option>
          <option value="Member of Parliament">Member of Parliament</option>
          <option value="Member of County Assembly">
            Member of County Assembly
          </option>
        </select>
      </div>
      <div>
        {candidates.length > 0 ? (
          <table>
            <thead>
              <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Education</th>
                <th>Manifesto</th>
                <th>Party Name</th>
                <th>Position</th>
                <th>Ward</th>
                <th>County</th>
              </tr>
            </thead>
            <tbody>
              {candidates.map((candidate) => (
                <tr key={candidate.id}>
                  <td>{candidate.name}</td>
                  <td>{candidate.email}</td>
                  <td>{candidate.education}</td>
                  <td>{candidate.manifesto}</td>
                  <td>{candidate.party_name}</td>
                  <td>{candidate.position_name}</td>
                  <td>{candidate.ward_name}</td>
                  <td>{candidate.county_name}</td>
                </tr>
              ))}
            </tbody>
          </table>
        ) : (
          <p>No candidates available</p>
        )}
      </div>
    </div>
  );
};

export default CandidatesList;
