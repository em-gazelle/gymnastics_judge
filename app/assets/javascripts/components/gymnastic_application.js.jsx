var GymnasticApplication = React.createClass({
  render: function() {
    return(
    <div>
    	<div>
          <h1>ReactJS Tutorial</h1>
          <p>step by step</p>
        </div>

        <div className="row">
          <div className="col-md-12">
            <GymnasticTable />
          </div>
        </div>
      </div>
    )
  }
});
