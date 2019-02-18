import React from 'react';
import ReactDOM from 'react-dom';
import Widget from './components/widget';
import store from './store';
// import selectLocation from './actions';

document.addEventListener("DOMContentLoaded", function(){
  ReactDOM.render(<Widget store={store} />, document.getElementById('root'));
});
