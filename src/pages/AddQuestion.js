import React, {useState} from 'react'
import Modal from '../components/Reusable Components/Modal/Modal'
import TextArea from '../components/Reusable Components/Input Field/TextArea'
import InputField from '../components/Reusable Components/Input Field/InputField'
import IconButton from '../components/Reusable Components/Icon Button/IconButton';
import AddIcon from '@mui/icons-material/Add';
import RadioButton from '../components/Reusable Components/Radio Button/RadioButton';

const AddQuestion = () => {

  const [question, setQuestion] = useState({
    difficulty: 'Hard',
    is_true_false: false,
    chapter: 0
  });

  const [chapter, setChapter] = useState({
    id: 1,
    name: 'Select Chapter',
    level: ''
  })

  const [chapters, setChapters] = useState([
    'Chapter One',
    'Chapter Two',
    'Chapter Three'
  ])

  const [answers, setAnswers] = useState([])
  const [answer, setAnswer] = useState('')


  const addAnswer = () => {
    let lastId = answers.length > 0 ? answers[answers.length - 1].id + 1 : 1;
    setAnswers([...answers, {
      text: answer,
      id: lastId 
    }])
    setAnswer('')
  }

  const difficulties = [
    'Easy',
    'Medium',
    'Hard'
  ]

  const types = [
    'MCQ',
    'True or False'
  ]

  
  return (
    <Modal title="Add Question">
      <div onClick={() => console.log(question)}>fdds</div>

      <TextArea label="Question Text" />
      <div className="row mt-26">
        <div className="col-6">
          <InputField label="Degree" />
        </div>
        <div className="col-6">
          <InputField label="Difficulty" value={question.difficulty} dropdown list={difficulties} onchange={(e) => setQuestion({...question, difficulty: e.target.dataset.selected})} autoWidth />
        </div>
      </div>
      <div className='row mt-26'>
        <div className="col-6">
          <InputField label="Type of question" dropdown list={types} value={question.is_true_false ? 'True or False' : 'MCQ'} onchange={(e) => setQuestion({...question, is_true_false: e.target.dataset.selected === 'True or False' ? true : false})} />
        </div>
        <div className='col-6'>
          <InputField autoWidth withInput label="Chapter" type="number" dropdown list={chapters} setList={setChapters} value={chapter.name} onchange={(e) => {
            setChapter({...chapter, name: e.target.dataset.selected});
            setQuestion({...question, chapter: e.target.dataset.id})
          }} />
        </div>
      </div>
      <div className='row mt-26'>
          <div className='col-6'>
            <div className='flex'>
            <InputField keypress={addAnswer} mr7 label="Answers" value={answer} onchange={(e) => setAnswer(e.target.value)} />
            <IconButton onclick={addAnswer} variant="circled" size="medium" color="secondary" icon={<AddIcon fontSize="small" />} />
            </div>
            <div className="flex-align-center mt-26 radio-toolbar" style={{ flexWrap: 'wrap' }} >
              {
                answers.map(answer => <RadioButton list={answers} setList={setAnswers} id={answer.id} label={answer.text} />)
              }
            </div>
          </div>
      </div>
    </Modal>
  )
}

export default AddQuestion