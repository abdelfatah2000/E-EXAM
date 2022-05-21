import React from 'react'
import { Route, Routes } from 'react-router'
import AddExam from './pages/AddExam'
import Exams from './pages/Exams'
import Groups from './pages/Groups'
import Home from './pages/Home'
import Students from './pages/Students'
import Questions from './pages/Questions'

function AdminRoutes() {
  return (
      <Routes>
          <Route path="/" end element={<Home />} />
          <Route path='/students' end element={<Students />} />
          <Route path="/exams" element={<Exams />} />
          <Route path="/exams/add-exam" element={<AddExam />} />
          <Route path="/groups" element={<Groups />}/>
          <Route path="/questions" element={<Questions />} />
      </Routes>
  )
}

export default AdminRoutes