var Skill = React.createClass({
	propTypes: {
		skill_name: React.PropTypes.string,
		link: React.PropTypes.string
	},
	render: function() {
		var skill = this.props.skill;
		return(
			<tr>
				<td>{skill.skill_name}</td>
				<td>{skill.link}</td>
			</tr>
		)
	}
});