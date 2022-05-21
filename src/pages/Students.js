import React, {useEffect, useState} from 'react'
import DataTable from '../components/Reusable Components/Data Table/DataTable'

function Students() {
  const [students, setStudents] = useState([])

  useEffect(() => {
    let fetchedArr = [
      {
        id: 1,
        name: "Omar Nader",
        phone: "01095196249",
        home_phone: '03 4376510',
        email: 'omarnader6636@gmail.com',
        grade: 'A',
        group: "1",
        isChecked: false
      },
      {
        id: 2,
        name: "Mohamed Hesham",
        phone: "01275486215",
        home_phone: '03 5489545',
        email: 'hesmammohamed@gmail.com',
        grade: 'A',
        group: "2",
        isChecked: true
      },
    ]
    let arr = []
    fetchedArr.forEach((res) => arr.push({
      id: res.id,
      first: res.name,
      second: res.phone,
      third: res.home_phone,
      fourth: res.email,
      fifth: res.grade,
      sixth: res.group
    }))
    setStudents(arr)
  }, [])

  const COLUMNS = [
    {
      text: 'Student Name',
      align: 'start'
    },
    {
      text: 'Phone',
      align: 'start'
    },
    {
      text: 'Home Phone',
      align: 'start'
    },
    {
      text: 'Email',
      align: 'start'
    },
    {
      text: 'Grade',
      align: 'center'
    },
    {
      text: 'Group',
      align: 'center'
    }
  ]

  return (
    <div>
      <h1 className='headings'>Students</h1>
      <DataTable columns={COLUMNS} results={students} setResults={setStudents} />
    </div>
  )
}

export default Students