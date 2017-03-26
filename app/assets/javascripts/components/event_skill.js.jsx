var EventSkill = React.createClass({
	propTypes: {
		skill_name: React.PropTypes.string,
		points: React.PropTypes.decimal,
		element_group: React.PropTypes.string,
		id: React.PropTypes.integer
		// event_skills: []
	},
	removeFromRoutine: function(e) {
		debugger;
		e.preventDefault();
		var self = this;
		skill_id = e.currentTarget.dataset.id;
		event_id = self.props.event_id;
		$.ajax({
			url: 'api/skills/'+skill_id,
			method: 'DELETE',
			data: { id: skill_id, event_id: event_id },
			success: function(data) {
				// self.props.removeFromRoutine(data);
			},
			error: function(xhr, status, error) {
				alert('Skill could not be removed from routine.');
			}
		});
	},

	render: function() {
		// alert(JSON.stringify(this.props.event.gender));
		var event_skill = this.props.event_skill;
		return(
			<tr>
				<td>{event_skill.skill_name}</td>
				<td>{event_skill.points}</td>
				<td>{event_skill.element_group}</td>
				<td>Skill ID: {event_skill.id}</td>
				<td>Event ID: {this.props.event_id}</td>
				<td onClick={this.removeFromRoutine} data-id={event_skill.id}><button>X</button></td>
			</tr>
		)
	}
});