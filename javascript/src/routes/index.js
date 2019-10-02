import React from 'react';
import { BrowserRouter as Router, Route, Switch} from 'react-router-dom'
import { Login } from '../components/Login'
import { Home } from '../components/Home'
import {AdminRouter} from './AdminRouter'

export const Routes = () => {

  return (
    <Router>
        <Switch>
          <Route exact path='/' component={Home}/>
          <Route exact path='/login' component={Login}/>
          <Route path='/admin' component={AdminRouter} />
        </Switch>
    </Router>
  )
}