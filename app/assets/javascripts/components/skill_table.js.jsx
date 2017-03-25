var SkillTable = React.createClass({
	
	onItemClick: function(e) {
	    var skillDemo = document.getElementById('skillDemo');
	    skill_link = e.currentTarget.dataset.id;
        if (skill_link.includes("?")) {skill_link = skill_link+"&autoplay=1"; }
        else { skill_link = skill_link+"?autoplay=1"}
		skillDemo.src = skill_link;
	},
	addSkill: function(e) {

		e.preventDefault();
		var self = this;
		skill_id = e.currentTarget.dataset.id;
		event_id = self.props.eventId;
		// if (this.validForm()) {
		  $.ajax({
			url: '/api/routines',
			method: 'POST',
			data: { routine: { event_id: event_id, skill_id: skill_id } },
			success: function(data) {
				self.props.addSkill(data);
				// self.setState(self.getInitialState());
				// will need to set '@event' data (@event.final_info) @event.skills + @event.final_score + @event.unmet_requirements...	
			},
			error: function(xhr, status, error) {
				alert('Skill cannot be added to routine: ', error);
			}
		  })


		// if (this.validForm()) {
		//   $.ajax({
		// 	url: '/api/routines',
		// 	method: 'POST',
		// 	data: { routine: {event_id: event_id, skill_id: this.props.skill.id} },
		// 	success: function(data) {
		// 		self.props.addSkill(data);
		// 		// self.setState(self.getInitialState());
		// 		// will need to set '@event' data (@event.final_info) @event.skills + @event.final_score + @event.unmet_requirements...	
		// 	},
		// 	error: function(xhr, status, error) {
		// 		alert('Skill cannot be added to routine: ', error);
		// 	}
		//   })
		// } else {
		// 	alert('Something went wrong');
		// }
	},
	// validForm: function() {
	// 	if (this.state.eventId) && (this.state.skill.id) {
	// 		return true;
	// 	} else {
	// 		return false;
	// 	}
	// },
	render: function() {
		var event_id = this.props.eventId;
		// debugger;
		var skills = this.props.skills.map(function(skill) {
			return(
			    <tr>
			      <td>{skill.skill_name}</td>
			      <td onClick={this.onItemClick} data-id={skill.link} key={skill.id}><a href="#">&#9658;</a></td>
			      <td>eventid: {event_id}</td>
			      <td>skillID: {skill.id} </td>
			      <td onClick={this.addSkill} data-id={skill.id} key={(skill.id+400)}><button>Include Skill</button></td>
			    </tr>
			)
		}.bind(this));
	
		return(
			<div id="skills-and-demo">
				<table id="skills-table" className="horizontal">
					<thead>
						<tr>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						{skills}
				    </tbody>
				</table>
				<div id="demo" className="horizontal"> 
					<div className="center"><iframe id="skillDemo" width="560" height="315" src="about:blank" frameBorder="1"></iframe></div>
				    {/* <ReactPlayer url='https://www.youtube.com/watch?v=d46Azg3Pm4c' playing /> */}
				</div>
			</div>
		)
	}
});