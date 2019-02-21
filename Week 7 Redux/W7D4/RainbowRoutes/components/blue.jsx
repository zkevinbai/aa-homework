import React from 'react';
import { Route, Link, NavLink } from 'react-router-dom';
import Indigo from './indigo';


class Blue extends React.Component {
  render() {
    return (
      <div>
        <h2 className="blue"></h2>
        {/* Links here */}
        <Link to="/blue/indigo">Indigo</Link>
        <Route path="/blue/indigo" component={Indigo}></Route>
      </div>
    );
  }
};

export default Blue;
