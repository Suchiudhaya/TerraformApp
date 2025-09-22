import React, {useEffect, useState} from 'react';


function App(){
const [a, setA] = useState(null);
const [b, setB] = useState(null);


useEffect(()=>{
fetch('/api/service-a')
.then(r=>r.json())
.then(setA)
.catch(()=>setA({error:true}));


fetch('/api/service-b')
.then(r=>r.json())
.then(setB)
.catch(()=>setB({error:true}));
},[]);


return (
<div style={{fontFamily:'Arial',padding:20}}>
<h1>Demo React App (served by nginx)</h1>
<h2>Service A</h2>
<pre>{JSON.stringify(a, null, 2)}</pre>
<h2>Service B</h2>
<pre>{JSON.stringify(b, null, 2)}</pre>
</div>
)
}


export default App;
