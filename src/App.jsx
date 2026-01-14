function App() {
  return (
    <div className="container">
      <h1>🚀 Auto Deployment Successful by me </h1>
      <p>
        This React app is deployed automatically using:
      </p>
      <ul>
        <li>GitHub Actions</li>
        <li>Docker</li>
        <li>AWS ECR</li>
        <li>Ubuntu EC2</li>
      </ul>

      <p className="note">
        Change this text → commit → push → site updates automatically 😎
      </p>
    </div>
  );
}

export default App;
