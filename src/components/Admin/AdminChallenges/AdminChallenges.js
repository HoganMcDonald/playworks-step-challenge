import React, { Component } from 'react';
import { connect } from 'react-redux';
import mapStoreToProps from '../../../redux/mapStoreToProps';
import './AdminChallenges.css';
import ChallengesGrid from '../ChallengesGrid/ChallengesGrid';
import CreateChallenges from '../CreateChallenges/CreateChallenges';
import AdminNav from '../../Admin/AdminNav/AdminNav.js';
import { Typography } from '@material-ui/core';

class AdminChallenges extends Component {
  state = {
    heading: 'Challenges',
    description: '',
    date: ''
  };

  componentDidMount() {
    this.setChallenges();
  }

  setChallenges = () => {
    this.props.dispatch({
      type: 'FETCH_CHALLENGES'
    });
  }

  render() {
    return (
        <div>
            <Typography variant='h5'>{this.state.heading}</Typography>
            {this.props.store.challenges.map((challenge, i) => 
            <ChallengesGrid 
              key={challenge.id}
              challenge={challenge} />
              )}
            <CreateChallenges/>
        </div>
    );
  }
}

export default connect(mapStoreToProps)(AdminChallenges);