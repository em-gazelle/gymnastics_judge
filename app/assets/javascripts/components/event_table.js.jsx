var EventTable = React.createClass({
	render: function() {
		var events = [];
		this.props.events.forEach(function(event) {
			events.push(<Event event={event}
								key={'event' + event.id}/>);
		}.bind(this));

		return(
			<table>
				<thead>
					<tr>
						<th>Event Name</th>
						<th>Final Score</th>
					</tr>
				</thead>
				<tbody>
					{events}
				</tbody>
			</table>
		)
	}
});