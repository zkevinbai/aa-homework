import React from 'react';
import { Route, Link, NavLink } from 'react-router-dom';
import Orange from './orange';
import Yellow from './yellow';

class Red extends React.Component {
  render() {
    return(
      <div>
        <h2 className="red"></h2>
        {/* Links here */}
        {/* <Link to="/red/yellow">Yellow</Link>
        <Link to="/red/orange">Orange</Link> */}

        <NavLink exact to='/red/yellow' activeClassName="active">Yellow only</NavLink>
        <NavLink exact to='/red/orange' activeClassName="active">Orange only</NavLink>

        <Route path="/red/yellow" component={Yellow} />
        <Route path="/red/orange" component={Orange} />
      </div>
    );
  }
};

export default Red;
