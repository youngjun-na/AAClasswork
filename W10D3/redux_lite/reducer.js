accountInfo = {
  name: "Bob Andre",
  age: 24,
  nationality: "Belgium",
  employed: false,
  skills: ["JavaSript", "Ruby", "CSS"],
  gender: "M"
};

let ageUp = {
  type: "increase age",
  newAge: 25
};

ageReducer = (oldAge = 0, action) => {
  if (action.type === "change age") {
    return action.newAge;
  }
  else {
    return oldAge;
  }
};

let nationChange = {
  type: "change nationality",
  newNationality: "USA"
}

nationReducer = (oldNationality = null, action) => {
  if (action.type === "change nationality") {
    return action.newNationality;
  }
  else {
    return oldNationality;
  }
};

let reducerList = {
  age: ageReducer,
  nationality: nationReducer
};

function combineReducers(objReducers) {
  let result = {};
  return function(prevState, action) {
    let keys = Object.keys(prevState);
    keys.forEach((key)=> {
      let reducer = objReducers[key];
      result[key] = reducer(prevState[key], action);
    });
    return result;
  };
}

let combinedFunc = combineReducers(reducerList);
combinedFunc()