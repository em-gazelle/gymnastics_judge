var Event = React.createClass({
	propTypes: {
		event_name: React.PropTypes.string,
		final_score: React.PropTypes.number
	},
	render: function() {
		// alert(JSON.stringify(this.props.event.gender));
		var event = this.props.event;
		return(
			<tr>
				<td>{event.event_name}</td>
				<td>{event.final_score}</td>
			</tr>
		)
	}
});