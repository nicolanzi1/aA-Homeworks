console.log("Hello from the JavaScript console!");

// Your AJAX request here
$.ajax({
    type: 'GET',
    url: "http://api.openweathermap.org/data/2.5/weather?q=new%20york,US&appid=3b2fb61df0db4615d0235c044e975650",
    success(data) {
        console.log("We have your weather!")
        console.log(data);
    },
    error() {
        console.error("An error ocurred.");
    },
});
// Add another console log here, outside your AJAX request
console.log("A console log outside the AJAX request!");