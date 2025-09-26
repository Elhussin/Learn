import { useState } from 'react'

import Nav from './compnent/nav'
import Main from './compnent/main'
import Artical from './compnent/artical'
import List from './compnent/list'
import { todo } from './assets/data'
import Status from './compnent/stat/status'
import Form from './compnent/stat/form'
import Form2 from './compnent/stat/form2'

function App() {

  return (
    <>
      <Nav />
      {/* <List list={todo} />
      <Main />
      <Artical name='John' age={30} email='h@mail.com'>
        <p style={{ color: "red" }}>this is a child</p>
      </Artical> */}
      <hr />
      <h1>Status</h1>
      <Status />
      <hr />
      <h1>Status Form </h1>
      <Form />
            <h1>Status Form 2 </h1>
      <Form2 />
    </>
  )
}

export default App
