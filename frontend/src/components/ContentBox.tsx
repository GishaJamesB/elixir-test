import React from 'react';
import {
  Switch,
  Route
} from "react-router-dom";


import {routes} from './routes'


export default function ContentBox() {
  return (
    <div style={{ flex: 1, padding: "10px" }} className="col-md-9">
      <Switch>
        {routes.map((route, index) => (
          <Route
            key={index}
            path={route.path}
            exact={route.exact}
            children={<route.main />}
          />
        ))}
      </Switch>
    </div>
  );
}