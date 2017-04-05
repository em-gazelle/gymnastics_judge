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
			},
			error: function(xhr, status, error) {
				alert('Skill cannot be added to routine: ', error);
			}
	    });
	},
	render: function() {
		var event_id = this.props.eventId;
		var skills = this.props.skills.map(function(skill) {
			return(
			    <tr>
			      <td>{skill.skill_name}</td>
			      <td onClick={this.onItemClick} data-id={skill.link} key={'FS'+skill.id}><a href="#">&#9658;</a></td>
			      <td onClick={this.addSkill} data-id={skill.id} key={('AS'+skill.id)}><button>Include Skill</button></td>
			    </tr>
			)
		}.bind(this));
	
		return(
			<div>
				<div id="skills-and-demo">
					<table id="skills-table" className="horizontal">
						<thead>
							<tr>
								<th>Skill</th>
								<th>Skill Demo</th>
								<th>Add Skill to Routine</th>
							</tr>
						</thead>
						<tbody>
							{skills}
					    </tbody>
					</table>
					<div id="demo" className="horizontal"> 
						<div className="center"><iframe id="skillDemo" width="380" height="200" src="about:blank" frameBorder="1"></iframe></div>
					</div>
				</div>
	    	</div>
		)
	}
});