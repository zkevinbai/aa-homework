import React from 'react';
import {
  Route,
  Link,
  NavLink
} from 'react-router-dom';

import Red from './red';
import Green from './green';
import Blue from './blue';
import Violet from './violet';

class Rainbow extends React.Component {
  render() {
    return (
      <div>
        <h1>Rainbow Router!</h1>
        {/* Your links should go here */}
        {/* <Link to='/red' >Red</Link>
        <Link to='/green' >Green</Link>
        <Link to='/blue' >Blue</Link>
        <Link to='/violet' >Violet</Link> */}

        <NavLink exact to='/red' activeClassName="active">Red only</NavLink>
        <NavLink exact to='/green' activeClassName="active">Green only</NavLink>
        <NavLink exact to='/blue' activeClassName="active">Blue only</NavLink>
        <NavLink exact to='/violet' activeClassName="active">Violet only</NavLink>

        <div id="rainbow">
          {/* Your routes should go here */}
          <Route path="/red" component={Red} />
          <Route path="/green" component={Green} />
          <Route path="/blue" component={Blue} />
          <Route path="/violet" component={Violet} />
        </div>
      </div>
    );
  }
};

export default Rainbow;

