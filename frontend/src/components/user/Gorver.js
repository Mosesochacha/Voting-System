import React, { useState } from "react";
import axios from "axios";

export default function GovernorComponent() {
  const [candidateData, setCandidateData] = useState({
    name: "",
    email: "",
    education: "",
    manifesto: "",
    partyName: "",
    wardName: "",
  });

  const handleInputChange = (e) => {
    setCandidateData({
      ...candidateData,
      [e.target.name]: e.target.value,
    });
  };

  const handleFormSubmit = async (e) => {
    e.preventDefault();

    try {
      const response = await axios.post(
        "http://localhost:4000/candidates/governor",
        {
          candidate: candidateData,
        }
      );

      console.log(response.data); // Log the response to the console
      // Perform any additional actions after successful registration
    } catch (error) {
      console.error(error.response.data.errors);
      // Handle error cases
    }
  };

  return (
    <div>
      <h2>Register for Governor</h2>
      <form onSubmit={handleFormSubmit}>
        <input
          type="text"
          name="name"
          placeholder="Name"
          value={candidateData.name}
          onChange={handleInputChange}
        />
        <input
          type="email"
          name="email"
          placeholder="Email"
          value={candidateData.email}
          onChange={handleInputChange}
        />
        <input
          type="text"
          name="education"
          placeholder="Education"
          value={candidateData.education}
          onChange={handleInputChange}
        />
        <textarea
          name="manifesto"
          placeholder="Manifesto"
          value={candidateData.manifesto}
          onChange={handleInputChange}
        ></textarea>
        <input
          type="text"
          name="partyName"
          placeholder="Party Name"
          value={candidateData.partyName}
          onChange={handleInputChange}
        />
        <input
          type="text"
          name="wardName"
          placeholder="Ward Name"
          value={candidateData.wardName}
          onChange={handleInputChange}
        />
        <button type="submit">Register</button>
      </form>
    </div>
  );
}
