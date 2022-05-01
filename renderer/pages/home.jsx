import React, { useState } from 'react';
import Head from 'next/head';
import Link from 'next/link';
import styles from '../styles';



function Home() {

  const [result, setResult] = useState(0);
  const [input, setInput] = useState('0');

  function ClearValues() {
    return (
      <div className={styles.button}>
          <button onClick={()=>{
            setInput(0);
            setResult(0);
          }} className={styles.button}>
              AC
          </button>
      </div>
    )
  }

  const Dial = (props) => (
    <div className={styles.button}>
        <button onClick={()=>{
          const temp = input.concat(props.child);
          setInput(temp)
        }} className={styles.button} >
          {props.child}
        </button>
    </div>
  )

  const clear = () => {

  }


  return (
    <React.Fragment>
      <Head>
        <title>Calculator</title>
      </Head>
      <div className='text-center my-20 '>
        <div className='h-12 bg-gray-50 text-4xl text-black py-1 mx-5 rounded-xl my-2'>
          {input}
        </div>
        <div className=''>
          <div className='flex flex-col mx-5'>
            <div className='flex flex-row place-content-around gap-x-5 '>
              <ClearValues></ClearValues>
              <Dial child="1"></Dial>
              <div className={styles.button}> 2</div>
            </div>
          </div>
        </div>
      </div>
    </React.Fragment>
  );
}

export default Home;
