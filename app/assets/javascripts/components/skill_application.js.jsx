var SkillApplication = React.createClass({
 
  getInitialState: function() {
  	return { skills: [] };
  },
  componentDidMount: function() {
  	this.getDataFromApi();
  },
  getDataFromApi() {
  	var self = this;
  	$.ajax({
  		url: '/api/skills',
  		success: function(data) {
  			self.setState({ skills: data });
  			// alert(JSON.stringify(data));
  		},
  		error: function(xhr, status, error) {
  			alert('Cannot get data from API: ', error);
  		}
  	});
  },
  handleSearch: function(skills) {
  	this.setState({ skills: skills });
  },
  render: function() {
    return(
      <div>
      	<div>
          <h1>Gymnastics Skills</h1>
          <p>View what each event's skills look like:</p>
        </div>
      	<div>
      		<SelectEvent handleSearch={this.handleSearch} />
      	</div>
        <div>
          <SkillTable skills={this.state.skills} />
        </div>
      </div>
    )
  }

});