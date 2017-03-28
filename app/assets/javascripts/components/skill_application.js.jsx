var SkillApplication = React.createClass({
 
  getInitialState: function() {
    return { 
      skills: [], 
      event_id: null, 
      final_score: '', 
      unmet_requirements: [],
      event_skills: [] 
    }
  },
  handleAddEvent: function(data) {
    this.setState({ skills: data.skills, event_id: data.event_id });
  },
  removeFromRoutine: function(data) {
    this.setState({event_skills: data.skills, final_score: data.final_score, unmet_requirements: data.unmet_requirements});
  },
  addSkill: function(data) {
    this.setState({ final_score: data.event_info.final_score, 
                    unmet_requirements: data.event_info.unmet_requirements,
                    event_skills: data.event_info.skills
});
  },
  render: function() {
      var unmet_requirements = this.state.unmet_requirements.map(function(req) {
        return(
              <p>{req}</p>
          )
      }.bind(this));

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
        <div> Which skills would you like to perform in your routine?
          <SkillTable addSkill={this.addSkill} skills={this.state.skills} eventId={this.state.event_id} 
            final_score={this.state.final_score} event_skills={this.state.event_skills} unmet_requirements={this.state.unmet_requirements} />
        </div>
        <div> <p><strong>Final Score: {this.state.final_score} </strong></p>
              <p><strong> Missing Requirements: </strong></p>
                {unmet_requirements}
              <div> <h3>All Skills in Routine:</h3>
                <EventSkillTable removeFromRoutine={this.removeFromRoutine} event_skills={this.state.event_skills} event_id={this.state.event_id}/>
              </div>
        </div>
      </div>
    )
  }

});