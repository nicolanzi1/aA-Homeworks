const initialState = {
  city: "Please Select", 
  jobs: []
};

const reducer = (state = initialState, action) => {
  switch (action.type) {
    case "SWITCH_LOCATION":
      return {
        city: action.city,
        jobs: action.jobs
      };
    default:
      return state;
  }
};

// let action = {
//   type: "SWITCH_LOCATION",
//   city: "remote",
//   jobs: [
//     {
//       id: 1,
//       title: "Test Job",
//       company: "Github",
//       type: "Full Time",
//       location: "remote",
//       description: "test description",
//       url: "www.github.com/appacademy"
//     }
//   ]
// };
// reducer(null, action);

export default reducer;
