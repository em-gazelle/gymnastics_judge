var SkillTable = React.createClass({
	
	onItemClick: function(e) {
	    var skillDemo = document.getElementById('skillDemo');
	    skill_link = e.currentTarget.dataset.id;
        if (!!skill_link) {skill_link = skill_link+"?autoplay=1"; }
		skillDemo.src = skill_link;
	},

	render: function() {
		var skills = this.props.skills.map(function(skill) {
			return(
				<table>
					<tbody>
				    <tr onClick={this.onItemClick} data-id={skill.link} key={skill.id}>
				      <td>{skill.skill_name}</td>
				      <td><a href="#">&#9658;</a></td>
				    </tr>
				    </tbody>
				</table>
			)
		}.bind(this));
	
		return(
			<div>
				<div>{skills}</div>
				<div class="skillDemo"> Demo of Gymnastics Skill:
					<iframe id="skillDemo" width="560" height="315" src="about:blank" frameBorder="1"></iframe>
				</div>
			</div>
		)
	}
});