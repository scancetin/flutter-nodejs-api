const request = require('request');
const express = require('express');
const app = express();
const port = 8000;

var url = 'https://rickandmortyapi.com/api/character/?page=1';
var jsonText = "";
var count = 0;
var characters;

getCharacters(url, true);

function getCharacters(url, initialRun){
    request(url, { json: true }, (err, res, body) => {
        if (err) { return console.log(err); }
        
        if (initialRun){
            count = body.info.count;
            jsonText =  '{"count" : ' + count + ',' +'"results" : [';
        }

        url = body.info.next;
        characters = body.results;

        for (char of characters){
            jsonText +=
            '{"id" : ' + char.id + ',' +
            '"name" : "' + char.name + '",' +
            '"status" : "' + char.status + '",' +
            '"species" : "' + char.species + '",' +
            '"type" : "' + char.type + '",' +
            '"gender" : "' + char.gender + '",' +
            '"origin" : "' + char.origin.name + '",' +
            '"location" : "' + char.location.name + '",' +
            '"image" : "' + char.image + '"},'; 
        }

        if (url != null){
            getCharacters(url, false);
        }else{
            jsonText = jsonText.slice(0, -1) + "]}";
            var obj = JSON.parse(jsonText);
            postCharacters(obj);
        }
      }
    );   
}

function postCharacters(obj){
    app.get('/', (req, res) => res.json(obj));
    app.listen(port, () => console.log(`Character details listening on port ${port}!`))
}
