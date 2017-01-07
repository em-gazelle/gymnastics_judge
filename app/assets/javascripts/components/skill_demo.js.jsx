var SkillDemo = React.createClass({
	// getInitialState: function() {
		// return { skill_link: "" };
	// 	alert(skill_link);
	// },
	render: function() {
	// render: function(skill_link) {
		var skill_link = "oops";
		// this.props.skill_link = <Skill skill_link={skill_link} />
		return(
			<div>
				{skill_link}
				<Skill onItemClick={this.onItemClick}/>
			{/*
					<Skill onItemClick={this.onItemClick} />

				<Skill handleClickOnSearch={this.handleSearch} skill_link={ skill_link } />
				<Skill onItemClick={this.handleSearch} skill_link={ skill_link } />
			
				<div><iframe width="560" height="315" src={skill_link} frameBorder="0"></iframe></div>
			*/}
			</div>
		)
	}
});