import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

// Stage 1
// const addLoggingToDispatch = store => next => action => {
//   console.log("Action Received:", action);
//   console.log("State pre-dispatch:", store.getState());

//   let result = next(action);

//   console.log("State post-dispatch:", store.getState());

//   return result;
// };

// Stage 2
function addLoggingToDispatch(store){
  return function(next){
    return function(action){
        console.log("Action Received:", action);
        console.log("State pre-dispatch:", store.getState());

        let result = next(action);

        console.log("State post-dispatch:", store.getState());

        return result;
    };
  };
}

// Stage 3

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  let store = configureStore(preloadedState);
  let dispatch = store.dispatch;

  // Stage 1
  // store.dispatch = addLoggingToDispatch(store)(dispatch);

  // Stage 2
  // function applyMiddlewares(store, ...middlewares) {
  //   middlewares = Array.from(middlewares);
  //   middlewares.forEach((middleware) => {
  //     dispatch = middleware(store)(dispatch);
  //   }
  //   );
  //   return Object.assign({}, store, { dispatch });
  // }

  // store = applyMiddlewares(store, addLoggingToDispatch);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});
