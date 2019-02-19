import { createStore, applyMiddleware } from 'redux';
import rootReducer from '../reducers/root_reducer';
import logger from 'redux-logger';

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

const configureStore = (preloadedState = {}) => {
  const store = createStore(rootReducer, preloadedState, applyMiddleware(addLoggingToDispatch));
  console.log(applyMiddleware)
  debugger
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
};

export default configureStore;
