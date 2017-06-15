---
title: String-Actuator 활용 예제
tags: "tutorial"
published: true
img : ic_codeshare.png
permalink: /ko/help/stringActuator.html
---
### 예제 목차 

1. [String-Actuator를 이용한 라즈베리파이 음악 재생](#tutorial-music-player)


---
<div id='tutorial-music-player'></div>
### String-Actuator를 이용한 라즈베리파이 음악 재생

- String-Actuator란?
<br/>
![stringActuator](/assets/tutorial-stringActuator-1.png)
<br/>
Led, Lcd와 같은 엑츄에이터입니다. Led에서 불이 켜지고 Lcd에서 문자열이 출력되듯이 stringActuator는 문자열을 보낼 수 있는 엑츄에이터입니다. 엑츄에이터가 보낸 문자열은 어디로 갈까요? 그건 개발자가 정하기 나름입니다. stringActuator를 이용해서 여러분이 원하는 위치로 문자열(또는 명령어)을 보내보세요.

- 시나리오 
<br/>
본 예제에서는 stringActuator를 이용해서 라즈베리파이로 음악파일을 재생하려고 합니다. 먼저 stringActuator로 `play,#`과 같은 명령어를 보낼 것 입니다.(#은 몇번째 음악파일을 재생할 것인지 정합니다.) 보내진 명령어는 라즈베리파이를 제어하는 명령어로 변환되어 음악을 재생하게 됩니다.

- 준비물
  
  - [라즈베리파이](http://www.icbanq.com/P007115245/?LType=B)
  - [라즈베리파이 연동하기](http://support.thingplus.net/ko/open-hardware/raspberry-pi-user-guide.html)
  - [게이트웨이 등록](http://support.thingplus.net/ko/user-guide/registration.html#id-gateway) 
  - Media player 설치
  ```bash
  # 본 예제에서는 omxplayer 설치
  sudo apt-get install omxplayer
  ```
  ```bash
  # ex)음악파일 재생
  omxplayer [음악파일 경로]\[mix\]\[피키라이브\]\ 혁 오\ -\ isn\'t\ She\ Lovely\ \(Stevie\ Wonder\).mp3
  ```
  [omxplayer 참고](http://www.raspberry-projects.com/pi/software_utilities/media-players/omxplayer)

---
1) string-actuator 작동원리
- Thing+ Embedded 패키지 설치하였다면 `/opt/thingplus/raspberrypi/grovePi-starter-kit/`에서 `app.js`와 `string-actuator.js`를 확인할 수 있습니다. 
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
stringActuator에서 입력한 문자열은 `options`에 할당됩니다.

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
string-actuator.js에서 `options`를 받아서 `options.text`를 확인하면 문자열 내용을 보여줍니다. 이제는 직접 코딩하여 StringAcutator.doCommand에서 받은 명령어 문자열을 실행시켜보겠습니다. 

---

2) exec API로 명령어 실행하기
<br>
> 본 예제에서는 명령어를 실행하는 exec API를 이용하여 음악파일을 재생하기위한 예제로만 진행하였습니다. omxplayer의 좀 더 다양한 기능을 활용한 media player를 개발하고 싶다면 [node-omxplayer](https://www.npmjs.com/package/node-omxplayer)를 참고하면 좋을 것 같습니다.
<br>

[Nodejs DOCS : exec API 참고](https://nodejs.org/api/child_process.html#child_process_child_process_exec_command_options_callback)

```javascript
var exec = require('child_process').exec;

StringActuator.prototype.doCommand = function(name, options) {
  if (options.text) {
    console.log('YOUR TEXT IS');
    console.log(options.text);

    var cmd = options.text;//실행할 명령어 

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
이제 stringActuator에 omxplayer 명령어를 입력하여 보내면 실행이 됩니다.

---

3) 음악파일 불러오기
- 음악파일이 저장되어 있는 폴더의 파일을 읽어오는 npm을 사용하였습니다.<br/>
[[read-dir-files 참고]](https://www.npmjs.com/package/read-dir-files)
```javascript
readDirFiles.list(auth, function (err, filenames) {
  if (err) {
    return console.dir(err);
  }
  console.log(filenames);
});
```
위에 `filenames`를 확인하면 배열로 음악파일명이 나오는 것을 확인할 수 있습니다.
```bash
[ '/home/pi/Music/',
  '/home/pi/Music/Imagine - Avril Lavigne lyrics.mp3',
  '/home/pi/Music/Jessie J - Flashlight (Lyrics).mp3',
  '/home/pi/Music/Joe Hisaishi-Spring-1.mp3',
  '/home/pi/Music/Kelly Clarkson - Because of You (lyrics).mp3',
  '/home/pi/Music/[mix][피키라이브] 혁오 - isn\`t She Lovely (Stevie Wonder).mp3' ]
```

---

4) omxplayer 명령어 양식에 맞게 수정하기
- 라즈베리파이에 저장되어 있는 음악파일명을 그대로 사용하면 실행되지 않습니다.
```bash
# 실행되지 않은 예
omxplayer [음악파일 경로][mix][피키라이브] 혁 오 - isn\'t She Lovely (Stevie Wonder).mp3 
```
```bash
# 실행되는 예
omxplayer [음악파일 경로]\[mix\]\[피키라이브\]\ 혁 오\ -\ isn\'t\ She\ Lovely\ \(Stevie\ Wonder\).mp3 
```
다음과 같이 공백과 특수문자에 대해 `\`로 처리를 해야합니다. 그렇기 때문에 음악파일 리스트를 읽어와 수정할 필요가 있습니다. 

- mp3파일이 아닌 파일은 걸러내고 공백과 기호에 대한 처리를 위해 다음과 같이 코딩하였습니다.
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
- 위에서의 `songArr`를 확인하면 아래와 같이 수정된 것을 볼 수 있습니다.
```bash
[ '/home/pi/Music/Imagine\\ -\\ Avril\\ Lavigne\\ lyrics.mp3',
  '/home/pi/Music/Jessie\\ J\\ -\\ Flashlight\\ \\(Lyrics\\).mp3',
  '/home/pi/Music/Joe\\ Hisaishi-Spring-1.mp3',
  '/home/pi/Music/Kelly\\ Clarkson\\ -\\ Because\\ of\\ You\\ \\(lyrics\\).mp3',
  '/home/pi/Music/\\[mix\\]\\[피키라이브\\]\\ 혁오\\ -\\ isn\\\`t\\ She\\ Lovely\\ \\(Stevie\\ Wonder\\).mp3' ]
```

---

5) string-Actuator 명령어 처리
- stringActuator로 `play,#`과 같이 명령어를 보내기로 가정을 하고, `,`를 기준으로 `play`와 `#`을 나누었습니다. 
- 각각 `play => omxplayer`, `# => 해당 음악파일명`으로 하여 최종적으로 cmd = `omxplayer 음악파일명`으로 나타내고자 하였습니다. 
- 다음과 같은 명령어를 실행해보겠습니다.
<br>
![stringActuator2](/assets/tutorial-stringActuator-2.png)
- `play,5`를 stringActuator로 보냈을 때, 실제로 실행된 명령어는 아래와 같이 수정됨을 볼 수 있고 음악파일이 재생되는 것은 라즈베리파이에 스피커나 이어폰 연결을 통해 확인 할 수 있습니다.
```bash
omxplayer /home/pi/Music/\[mix\]\[피키라이브\]\ 혁오\ -\ isn\'t\ She\ Lovely\ \(Stevie\ Wonder\).mp3
```

---



<div class='scrolltop'>
    <div class='scroll icon'><i class="fa fa-arrow-circle-up"></i></div>
</div>