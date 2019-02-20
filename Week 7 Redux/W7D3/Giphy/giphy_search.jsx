// ENTRY FILE

import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import { receiveSearchGiphys, fetchSearchGiphys} from './actions/giphy_actions';
// import { fetchSearchGiphys } from '../Giphy/util/api_util';


document.addEventListener("DOMContentLoaded", () => {
    const rootElement = document.getElementById("root");
    const store = configureStore();
    window.store = store;
    window.fetchSearchGiphys = fetchSearchGiphys;
    window.receiveSearchGiphys = receiveSearchGiphys;

    ReactDOM.render(<Root store={store} />, rootElement);
});
