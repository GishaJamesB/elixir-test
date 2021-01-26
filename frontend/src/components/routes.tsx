import React from 'react';
import Home from './Home'


export const routes = [
  { path: '/',
    exact: true,
    main: () => <Home />
  }
]