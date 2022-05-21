import React from 'react'
import './sidebar.css'
import HomeIcon from '@mui/icons-material/Home';
import GroupsIcon from '@mui/icons-material/Groups';
import SchoolIcon from '@mui/icons-material/School';
import AssignmentIcon from '@mui/icons-material/Assignment';
import QuizIcon from '@mui/icons-material/Quiz';
import RoomPreferencesIcon from '@mui/icons-material/RoomPreferences';
import { NavLink } from 'react-router-dom';

function Sidebar() {
  return (
    <div className='sidebar__container'>
        <div className='logo'>
            <h1 className='logo__title'>E-EXAM</h1>
        </div>
        <ul className="sidebar__items">
          <li>
            <NavLink className='sidebar__item' activeClassName="active-link" end to="/app" >
              <HomeIcon className="mr-5" />
              Home
            </NavLink>
          </li>
          <li>
            <NavLink className='sidebar__item' activeClassName="active-link"  to="/app/groups">
              <GroupsIcon className="mr-5" />
              Groups
            </NavLink>
          </li>
          <li>
            <NavLink className='sidebar__item' activeClassName="active-link"  to="/app/students">
              <SchoolIcon className="mr-5" />
              Students
            </NavLink>
          </li>
          <li>
            <NavLink className='sidebar__item' activeClassName="active-link"  to="/app/exams">
              <AssignmentIcon className="mr-5" />
              Exams
            </NavLink>
          </li>
          <li>
            <NavLink className='sidebar__item' activeClassName="active-link"  to="/app/questions">
              <QuizIcon className="mr-5" />
              Questions
            </NavLink>
          </li>
          <li>
            <NavLink className='sidebar__item' activeClassName="active-link"  to="/app/requests">
              <RoomPreferencesIcon className="mr-5" />
              Requests
            </NavLink>
          </li>
        </ul>
    </div>
  )
}

export default Sidebar