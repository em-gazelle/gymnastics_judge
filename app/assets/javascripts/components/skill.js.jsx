var Skill = React.createClass({
    getInitialState: function() {
        return {
            skill_link: ''
        }
    },
	
	propTypes: {
		skill_name: React.PropTypes.string,
		link: React.PropTypes.string
	},
	onItemClick: function(e) {
		skill_link = e.currentTarget.dataset.id;	
	    this.setState({ skill_link: skill_link});	
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