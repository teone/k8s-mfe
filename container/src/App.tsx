import React, { Suspense } from "react";

const App1 = React.lazy(() => import("app1/App1"));

import "./index.css";

const App = () => (
  <div className="container">
      <h1>Container App</h1>
      <Suspense fallback={<div>Loading... </div>}>
        <App1 />
      </Suspense>
  </div>
);
export default App
