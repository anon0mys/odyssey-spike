import React, { Component } from 'react';
import Graph from 'components/Story/Graph'

const URL = '/api/v1/stories/'


class StoryBoard extends Component {
  constructor(props) {
    super(props)
    this.state = {
      graph: null
    }
  }

  componentDidMount() {
    fetch(URL + this.props.story_id + '/graph')
      .then(response => response.json())
      .then(data => this.setState({ graph: data}))
  }

  render() {
    return (
      <div className='story-board'>
        <Graph graph={this.state.graph} />
      </div>
    );
  }
}

export default StoryBoard
