var SelectEvent = React.createClass({
  getInitialState: function() {
    return {
        value: 'All Events'
    }
  },
  handleAddEvent: function(event) {
    selected_event = event.target.value;  
    var self = this;
    $.ajax({
      url: 'api/events',
      method: 'POST',
      data: {event: {event_name: selected_event}},
      success: function(data) {
        self.props.handleAddEvent(data);
      },
      error: function(xhr, status, error) {
        alert('Could not add new event: ', status, xhr, error);
      }
    });
  },
  change: function(event){
        this.setState({value: event.target.value});
        this.handleAddEvent(event);
    },
    render: function(){
        return(
           <div className="select-style">
               <select id="selected_event" onChange={this.change} value={this.state.value}>
                  <option disabled value="All Events">Which event are you judging?</option>
                  <option value="Beam">Beam</option>
                  <option value="Uneven Bars">Uneven Bars</option>
                  <option value="Vault">Vault</option>
                  <option value="Floor">Floor</option>
               </select>
{/*               <h3 className="left">{this.state.value} Skills:</h3>  */}
           </div>
        );
     }
});