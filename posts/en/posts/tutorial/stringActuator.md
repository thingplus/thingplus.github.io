---
title: String-Actuator examples
tags: "tutorial"
published: true
img : ic_codeshare.png
permalink: /en/help/stringActuator.html
---
### example contents

1. [Listening to music in the RaspberryPi using String-Actuator](#tutorial-music-player)


---
<div id='tutorial-music-player'></div>
### Listening to music in the RaspberryPi using String-Actuator

- What is String-Actuator?
<br/>
![stringActuator](/assets/(en)tutorial-stringActuator-1.png)
<br/>
This is an actuator like Led, Lcd. Just as light is turned on in Led and strings are output in Lcd, stringActuator is an actuator that can send strings. You might ask, "Where will the string sent by the actuator go?" The answer to the question is "It depends on the developer." Use stringActuator to send a string (or command) to the location you want.

- Scenario
<br/>
In this example, we are trying to playback a music file with RaspberryPi using stringActuator. First we will send a command like `play, #` using stringActuator.(# is the index number of the music file) This string is converted to a command that controls the playback of the music in RaspberryPi.

- Preparations
  
  - [RaspberryPi](https://www.seeedstudio.com/Raspberry-Pi-3-Model-B-p-2625.html)
  - [RaspberryPi interworking](http://support.thingplus.net/en/open-hardware/raspberry-pi-user-guide.html)
  - [Gateway registration](http://support.thingplus.net/en/user-guide/registration.html#id-gateway) 
  - Install Media player 
  ```bash
  # In this example, intall omxplayer 
  sudo apt-get install omxplayer
  ```
  ```bash
  # ex)playback the music file  
  omxplayer [Music file path]\[mix\]\[피키라이브\]\ 혁 오\ -\ isn\'t\ She\ Lovely\ \(Stevie\ Wonder\).mp3
  ```
  [omxplayer reference](http://www.raspberry-projects.com/pi/software_utilities/media-players/omxplayer)

---
1) How string-actuator works
- Once you have installed the Thing + Embedded package, you can see `app.js` and` string-actuator.js` in `/ opt / thingplus / raspberrypi / grovePi-starter-kit /`.
- app.js
```javascript
  set: function (id, cmd, options, result) { 
    logger.info('[set actuator] id=%s cmd=%s options=%j', id, cmd, options);
    var target = getSensorInfo({id: id});

    if (target.name === 'lcd') {
      grovePiLcd.doCommand(target.name, cmd, options);
      return;
    } else if (target.name === 'stringActuator') { 
      stringActuator.doCommand(target.name, cmd, options); 
    } else {
      grovePiSensors.doCommand(target.name, cmd, options);
    }

    if (target.name === 'relay') {
      result(null, 'ok');
    } else {
      result(null, 'success');
    }
  }
```
The string entered in stringActuator is assigned to `options`.

- string-actuator.js   
```javascript
  'use strict';

  function StringActuator() {
  }

  StringActuator.prototype.doCommand = function(name, options) {
    if (options.text) {
      console.log('YOUR TEXT IS');
      console.log(options.text);
    }
  };

  StringActuator.prototype.getValue = function (name) {
    return {status: 'on'};
  };

  module.exports = StringActuator;
```
`options` are handled by functions defined in string-actuator.js. `options.text` shows the contents of the string. Now let's directly coded to execute commands received from 'StringAcutator.doCommand'.

---

2) Executing Commands with the exec API
<br>
> In this example, we used the exec API to execute the command, and only proceeded to playback the music file. If you want to develop a media player utilizing a variety of additional features of omxplayer, it seems to be nice to see the [node-omxplayer](https://www.npmjs.com/package/node-omxplayer).
<br>

[Nodejs DOCS : exec API reference](https://nodejs.org/api/child_process.html#child_process_child_process_exec_command_options_callback)

```javascript
var exec = require('child_process').exec;

StringActuator.prototype.doCommand = function(name, options) {
  if (options.text) {
    console.log('YOUR TEXT IS');
    console.log(options.text);

    var cmd = options.text;//Command to execute

    exec(cmd, function(err, stdout, stderr) {
        
        if (err) {
          logger.error('exec(%s) failed', cmd, err);
          return;
        }

        return;
    });    
  }
};
```
Now, send the omxplayer command by using stringActuator and omxplayer will be executed.

---

3) Read list of music files
- We used npm to read the files in the folder where the music files are stored.<br/>
[[read-dir-files reference]](https://www.npmjs.com/package/read-dir-files)
```javascript
readDirFiles.list(auth, function (err, filenames) {
  if (err) {
    return console.dir(err);
  }
  console.log(filenames);
});
```
If you check `filenames` above, you will see the filenames as an array type.
```bash
[ '/home/pi/Music/',
  '/home/pi/Music/Imagine - Avril Lavigne lyrics.mp3',
  '/home/pi/Music/Jessie J - Flashlight (Lyrics).mp3',
  '/home/pi/Music/Joe Hisaishi-Spring-1.mp3',
  '/home/pi/Music/Kelly Clarkson - Because of You (lyrics).mp3',
  '/home/pi/Music/[mix][피키라이브] 혁오 - isn\`t She Lovely (Stevie Wonder).mp3' ]
```

---

4) Modify to omxplayer command form
- Music filenames stored in RaspberryPi will not work if used as they are.
```bash
# Unexecuted example
omxplayer [Music files path][mix][피키라이브] 혁 오 - isn\'t She Lovely (Stevie Wonder).mp3 
```
```bash
# Executed example
omxplayer [Music files path]\[mix\]\[피키라이브\]\ 혁 오\ -\ isn\'t\ She\ Lovely\ \(Stevie\ Wonder\).mp3 
```
If the file name contains spaces and special characters as shown above, you must add `\` in front.

- To filter out non-mp3 files and process whitespace and special characters, we have coded something like this:
```javascript
  var songArr = new Array();
  var songCnt = 0;

  //find mp3 file and edit filename
  _.forEach(filenames, function (filename, key) {
    if (filename.split('.')[1] == 'mp3') {
      songArr[songCnt] = filename.replace(/[!@#$%^&*()\s+=\[\]\\';,{}|":<>?~_]/g, '\\' + '$&');
      songCnt++;
    } 
    console.log(songArr);
  });
```
- If you check the `songArr` above, you can see the following modification.
```bash
[ '/home/pi/Music/Imagine\\ -\\ Avril\\ Lavigne\\ lyrics.mp3',
  '/home/pi/Music/Jessie\\ J\\ -\\ Flashlight\\ \\(Lyrics\\).mp3',
  '/home/pi/Music/Joe\\ Hisaishi-Spring-1.mp3',
  '/home/pi/Music/Kelly\\ Clarkson\\ -\\ Because\\ of\\ You\\ \\(lyrics\\).mp3',
  '/home/pi/Music/\\[mix\\]\\[피키라이브\\]\\ 혁오\\ -\\ isn\\\`t\\ She\\ Lovely\\ \\(Stevie\\ Wonder\\).mp3' ]
```

---

5) Processing string-Actuator commands
- We used stringActuator to send commands like `play, #`, and split `play` and` # `based on`, `.
- We decided to use `play => omxplayer`,`# => corresponding music filename` and finally cmd = `omxplayer music filename`.
- Let's run the following command.
<br>
![stringActuator2](/assets/(en)tutorial-stringActuator-2.png)
- When `play, 5` is sent by using stringActuator, you can see that the command actually executed is modified as below, and the playback of the music file can be confirmed by connecting speaker or earphone to RaspberryPi.
```bash
omxplayer /home/pi/Music/\[mix\]\[피키라이브\]\ 혁오\ -\ isn\'t\ She\ Lovely\ \(Stevie\ Wonder\).mp3
```

---



<div class='scrolltop'>
    <div class='scroll icon'><i class="fa fa-arrow-circle-up"></i></div>
</div>