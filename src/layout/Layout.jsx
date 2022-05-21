import React from 'react'
import './layout.css'
import Sidebar from '../components/sidebar/sidebar'
import Topbar from '../components/topbar/Topbar'
import AdminRoutes from '../AdminRoutes'

function Layout() {
  return (
    
        <div className='layout'>
          <Sidebar />
        <div className='layout__container'>
          <Topbar />
          <div className='content'>
            <AdminRoutes/>
          </div>
        </div>
      </div>

  )
}

export default Layout