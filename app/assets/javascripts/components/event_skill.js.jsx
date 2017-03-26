var EventSkill = React.createClass({
	propTypes: {
		skill_name: React.PropTypes.string,
		points: React.PropTypes.decimal,
		element_group: React.PropTypes.string
	},
	render: function() {
		// alert(JSON.stringify(this.props.event.gender));
		var event_skill = this.props.event_skill;
		return(
			<tr>
				<td>{event_skill.skill_name}</td>
				<td>{event_skill.points}</td>
				<td>{event_skill.element_group}</td>
			</tr>
		)
	}
});