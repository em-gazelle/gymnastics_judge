var SkillTable = React.createClass({
	
	onItemClick: function(e) {
	    var skillDemo = document.getElementById('skillDemo');
	    skill_link = e.currentTarget.dataset.id;
        if (skill_link.includes("?")) {skill_link = skill_link+"&autoplay=1"; }
        else { skill_link = skill_link+"?autoplay=1"}
		skillDemo.src = skill_link;
	},

	render: function() {
		var skills = this.props.skills.map(function(skill) {
			return(
			    <tr onClick={this.onItemClick} data-id={skill.link} key={skill.id}>
			      <td>{skill.skill_name}</td>
			      <td><a href="#">&#9658;</a></td>
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