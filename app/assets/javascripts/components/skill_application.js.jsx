var SkillApplication = React.createClass({
 
  getInitialState: function() {
    return { skills: [], event_id: null };
  },
  // componentDidMount: function() {
  // 	this.getDataFromApi();
  // },
  // getDataFromApi() {
  // 	var self = this;
  // 	$.ajax({
  // 		url: '/api/skills/filter',
  // 		success: function(data) {
  // 			self.setState({ skills: data });
  // 			// alert(JSON.stringify(data));
  // 		},
  // 		error: function(xhr, status, error) {
  // 			alert('Cannot get data from API: ', error);
  // 		}
  // 	});
  // },
  handleAddEvent: function(data) {
    this.setState({ skills: data.skills, event_id: data.event_id });
  },
  render: function() {
    return(
      <div className="all">
      	<div>
          <h1 className="center">Gymnastics Skills - Build your own Routine</h1>
        </div>
        <div className="center">
        	<div className="horizontal select-title">
            Choose your favorite gymnastics event:
      		</div>
          <div className="horizontal">
            <SelectEvent handleAddEvent={this.handleAddEvent} />
        	</div>
        </div>
        <div> All Skills: Event ID: {this.state.event_id}
          <SkillTable skills={this.state.skills} eventId={this.state.event_id} />
        </div>
      </div>
    )
  }

});