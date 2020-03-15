import React, { Component } from 'react';


class Path extends Component {
  constructor(props) {
    super(props)
    this.state = {
      from: this.props.data.from,
      to: this.props.data.to,
    }
  }
}
