import React, { useState } from 'react';
import { useHistory } from 'react-router-dom';
import axios from 'axios';

function LoginComponent() {
  const history = useHistory();

  const [loginFormData, setLoginFormData] = useState({
    email: '',
    password: '',
  });

  const [error, setError] = useState('');
  const [message, setMessage] = useState('');
  const [isLoggingIn, setIsLoggingIn] = useState(false);

  const handleLoginChange = (e) => {
    setLoginFormData({
      ...loginFormData,
      [e.target.name]: e.target.value,
    });
  };

  const handleLoginSubmit = async (e) => {
    e.preventDefault();

    setIsLoggingIn(true);

    try {
      const response = await axios.post('https://localhost:4000/login', {
        email: loginFormData.email,
        password: loginFormData.password,
      });

      const { data } = response;

      if (data.message === 'admin') {
        history.push('/dashboard');
        setTimeout(() => {
          window.location.reload();
        }, 50);
        setMessage(data.message);
      } else if (data.message === 'user') {
        history.push('/welcome');
        setTimeout(() => {
          window.location.reload();
        }, 50);
        setMessage(data.message);
      } else {
        setMessage('');
        setError(data.errors);
        console.log(data.errors);
      }
    } catch (error) {
      setError('An error occurred during login.');
    }

    setIsLoggingIn(false);
  };

  return (
    <div>
      <h2>Login</h2>
      <form onSubmit={handleLoginSubmit}>
        <input
          type="email"
          name="email"
          placeholder="Email"
          value={loginFormData.email}
          onChange={handleLoginChange}
        />
        <input
          type="password"
          name="password"
          placeholder="Password"
          value={loginFormData.password}
          onChange={handleLoginChange}
        />
        <button type="submit" disabled={isLoggingIn}>
          {isLoggingIn ? 'Logging in...' : 'Login'}
        </button>
        {error && <p>{error}</p>}
        {message && <p>{message}</p>}
      </form>
    </div>
  );
}

export default LoginComponent;
