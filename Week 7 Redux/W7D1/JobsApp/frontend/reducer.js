const initialState = {
  city: "Please Select", 
  jobs: []
};

const reducer = (state = initialState, action) => {
  switch(action.type){
    case "SWITCH_LOCATION":
      console.log("SWITCH_LOCATION");
      console.log(action);
      return {
        city: action.city,
        jobs: action.jobs[0]
      };
    default:
      console.log("state");
      return state; // remove this and fill out the body of the reducer function
  }
};

export default reducer;
