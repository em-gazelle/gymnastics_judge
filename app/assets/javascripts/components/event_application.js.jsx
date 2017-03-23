var EventApplication = React.createClass({
  
  getInitialState: function() {
  	return { events: [] };
  },
  componentDidMount: function() {
  	this.getDataFromApi();
  },
  getDataFromApi() {
  	var self = this;
  	$.ajax({
  		url: '/api/events',
  		success: function(data) {
  			self.setState({ events: data });
  			alert(JSON.stringify(data));
  		},
  		error: function(xhr, status, error) {
  			alert('Cannot get data from API: ', error);
  		}
  	});
  },
  handleSearch: function(events) {
  	this.setState({ events: events });
  },
  handleAdd: function(event) {
  	var events = this.state.events;
  	events.push(event);
  	this.setState({ events: events });
  },

  render: function() {
    return(
    <div>
    	<div>
          <h1>ReactJS Tutorial</h1>
          <p>step by step</p>
        </div>
    	<div>
    		<SearchForm handleSearch={this.handleSearch} />
    	</div>
    	<div>
    		<NewForm handleAdd={this.handleAdd} />
    	</div>
        <div>
	        <EventTable events={this.state.events} />
        </div>
      </div>
    )
  }

});
