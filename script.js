const express = require('express');
const app = express();
const path = require('path');

// const audio = new Audio('firework_audio.mp3');
// setTimeout(() =>{
//     audio.play();
// },1500);

app.use(express.static(path.join(__dirname)));
app.use('/styles', express.static(path.join(__dirname, 'styles')));

app.get('/', (req,res) =>{
    res.sendFile(path.join(__dirname, "index.html"))
} )

app.listen(8000, "0.0.0.0" ,() =>{
    console.log("Server is running in http://localhost:8000");
});