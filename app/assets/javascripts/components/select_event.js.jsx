var SelectEvent = React.createClass({
	handleSearch: function() {
		// query = "event". get event_id for @event.skills
		var selected_event = ReactDOM.findDOMNode(this.refs.selected_event).value;
		var self = this;
		$.ajax({
			url: 'api/skills/filter',
			data: {selected_event: selected_event},
			success: function(data) {
				self.props.handleSearch(data);
			},
			error: function(xhr, status, error) {
				alert('Search Error: ', status, xhr, error);
			}
		});
	},
	render: function() {
		return(
			<input onChange={this.handleSearch}
				type="text"
				className="form-control"
				placeholder="Which event are you judging?"
				ref="selected_event"
			/>

		)
	}
});
