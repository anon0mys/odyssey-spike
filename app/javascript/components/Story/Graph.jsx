import React, { Component } from 'react';


class Graph extends Component {
  constructor(props) {
    super(props)
    this.state = {
      graph: this.props.graph,
    }
  }

  render() {
    var graph = this.state.paths.map((path) => {

    });

    return (
      <div>This is the graph</div>
    );
  }
}

export default Graph
