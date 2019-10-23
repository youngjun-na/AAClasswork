import React from 'react';

const TabContent = ({id, list}) => {
  console.log(id);
  return (
    <div className='content-box'>
      
      {list[id].content}
    </div>
  )
}
export default TabContent;