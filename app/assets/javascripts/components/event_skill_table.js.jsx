var EventSkillTable = React.createClass({
		getInitialState: function() {
			return {
				event_skills: []
			}
		},
		render: function() {
		var event_skills = [];
		this.props.event_skills.forEach(function(event_skill) {
			event_skills.push(<EventSkill event_skill={event_skill} event_id={this.props.event_id}
								key={'event_skill' + event_skill.id}/>);
		}.bind(this));

		return(
			<table>
				<thead>
					<tr>
						<th>Skill Name</th>
						<th>Points</th>
						<th>Remove?</th>
					</tr>
				</thead>
				<tbody>
					{event_skills}
				</tbody>
			</table>
		)
	}
});