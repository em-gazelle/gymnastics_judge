var EventSkillTable = React.createClass({
	getInitialState: function() {
		return {
			event_skills: this.props.event_skills,
			skill_links: [],
			ind: 0
		}
	},

	removeFromRoutine: function(e) {
		// e.preventDefault();
		var skill_id = e.currentTarget.dataset.id;
		var event_id = this.props.event_id;

		$.ajax({
			url: 'api/skills/'+skill_id,
			method: 'DELETE',
			data: { id: skill_id, event_id: event_id },
			success: (data) => {
				this.props.removeFromRoutine(data);
			},
			error: function(xhr, status, error) {
				alert('Skill could not be removed from routine.');
			}
		});
	},
	next: function() {
		this.setState({ind: (this.state.ind+1) });
	},
	getLink: function() {
		var skill_links = this.props.event_skills.map(function(s) {return s.link;});
		return skill_links[this.state.ind];
	},
	render: function() {
		var skill_links = this.props.event_skills.map(function(s) {return s.link;});

		var event_skills = this.props.event_skills.map(function(event_skill) {
			return(
			    <tr>
			      <td>{event_skill.skill_name}</td>
			      <td onClick={this.removeFromRoutine} data-id={event_skill.id} key={('RS'+event_skill.id)}><button>X</button></td>
			    </tr>
			)
		}.bind(this));

		return(
			<div>
				<table>
					<thead>
						<tr>
							<th>Skill Name</th>
							<th>Remove?</th>
						</tr>
					</thead>
					<tbody>
						{event_skills}
					</tbody>
				</table>

				Play: 
				<ReactPlayer url={this.getLink()} playing onEnded={this.next} />

			</div>
		)
	}
});
