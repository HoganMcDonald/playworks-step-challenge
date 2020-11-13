import React, { Component } from 'react';
import { connect } from 'react-redux';
import mapStoreToProps from '../../../redux/mapStoreToProps';
import { Grid, Typography } from "@material-ui/core";
import './EditUserLogs.css';
import Nav from '../../Nav/Nav.js'

class EditUserLogs extends Component {
  state = {
    team: this.props.store.user.teams_id
  };

  render() {
    console.log('this.prop', this.props.history);
    
    return (
      <div>
        <Nav />
      <Grid container direction="column" alignItems="center">
        <Grid item>
        <Typography variant='h5'>{this.props.store.userLogs[0] && this.props.store.userLogs[0].username}<button>Delete User</button></Typography>
          <center>
            <table>
              <thead>
                <th>Time Submitted</th>
                <th>Steps</th>
                <th>Edit?</th>
              </thead>
              <tbody>
                {this.props.store.userLogs.map(log =>
                <tr>
                  <td>{log.date}</td>
                  <td>{log.steps}</td>
                  <td><button>Edit</button></td>
                </tr>
                  )}
              </tbody>
            </table>
          </center>
        </Grid>
        <Grid item><button>Cancel</button><button>Save</button></Grid>
      </Grid>
      </div>
    );
  }
}

export default connect(mapStoreToProps)(EditUserLogs);