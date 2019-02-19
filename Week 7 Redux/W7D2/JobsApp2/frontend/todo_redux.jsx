import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

const addLoggingToDispatch = store => next => action => {
  console.log("Action Received:", action);
  console.log("State pre-dispatch:", store.getState());

  let result = next(action);

  console.log("State post-dispatch:", store.getState());

  return result;
};

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = configureStore(preloadedState);
  let dispatch = store.dispatch;
  store.dispatch = addLoggingToDispatch(store)(dispatch);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});
