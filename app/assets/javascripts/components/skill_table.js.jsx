var SkillTable = React.createClass({
	render: function() {
		var skills = [];
		this.props.skills.forEach(function(skill) {
			skills.push(<Skill skill={skill}
							key={'skill' + skill.id} />);
		}.bind(this));

		return(
			<table>
				<thead>
					<tr>
						<th>Skill</th>
						<th>Click for Demo</th>
					</tr>
				</thead>
				<tbody>
					{skills}
				</tbody>
			</table>
		)
	}
});