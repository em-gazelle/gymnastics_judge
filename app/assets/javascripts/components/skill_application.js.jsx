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
      <div className="all">
      	<div>
          <h1 className="center">Gymnastics Skills - Build your own Routine</h1>
        </div>
        <div className="center">
        	<div className="horizontal select-title">
            Choose your favorite gymnastics event:
      		</div>
          <div className="horizontal">
            <SelectEvent handleSearch={this.handleSearch} />
        	</div>
        </div>
        <div>
          <SkillTable skills={this.state.skills} />
        </div>
      </div>
    )
  }

});