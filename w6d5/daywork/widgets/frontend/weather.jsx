import React from 'react';

class Weather extends React.Component {
  constructor(props) {
    super(props);
    this.state = { lat: null, long: null, state: null, city: null, weather: null, temperature_string: null };
    this.getPosition = this.getPosition.bind(this);
    this.fetchWeather = this.fetchWeather.bind(this);
  }

  getPosition () {
    navigator.geolocation.getCurrentPosition((pos) => {
      this.setState({ lat: pos.coords.latitude, long: pos.coords.longitude });
    });
  }

  fetchWeather(lat, long) {
    const that = this;

    return $.ajax ({
      method: "GET",
      url: `http://api.wunderground.com/api/0e26cd353b5a98df/geolookup/q/${lat},${long}.json`
    }).then((response) => {
      const city = response.location.city;
      const state = response.location.state;

      return $.ajax ({
        method: "GET",
        url: `http://api.wunderground.com/api/0e26cd353b5a98df/conditions/q/${state}/${city}.json`
      }).then((response) => {
        const weather = response.current_observation.weather;
        const temperature_string = response.current_observation.temperature_string;

        that.setState({city, state, weather, temperature_string});
      });
    });
  }

  componentDidMount () {
    this.getPosition();
  }

  componentWillUpdate (nextProps, nextState) {

    if (this.state.lat !== nextState.lat) {
      this.fetchWeather(nextState.lat, nextState.long);
    }
  }

  render () {
    return (
      <div className="weather-container">
        <h1>WEATHER HERE!</h1>
        <p>Location: {this.state.city}, {this.state.state}</p>
        <p>Temperature: {this.state.temperature_string}</p>
        <p>Weather Conditions: {this.state.weather}</p>
      </div>
    );
  }

}

export default Weather;
