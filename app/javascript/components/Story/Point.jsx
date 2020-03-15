import React, { Component } from 'react';


class Point extends Component {
  constructor(props) {
    super(props)
    this.state = {
      id: this.props.id,
      name: this.props.name
    }
  }

  render() {
    return (
      <div className='story-point' id={this.state.id}>{this.props.name}</div>
    )
  }
}

export default Point
