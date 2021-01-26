import React from "react";
import {
  BrowserRouter as Router
} from "react-router-dom";
import Sidebar from './components/Sidebar'
import ContentBox from './components/ContentBox'
import Header from './components/Header'

export default function App() {
  return (
    <Router>
      <Header />
      <div style={{ display: "flex" }}>
        <Sidebar />
        <ContentBox />
      </div>
    </Router>
  );
}
