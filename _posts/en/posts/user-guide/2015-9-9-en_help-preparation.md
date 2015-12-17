---
title: "Instruction"
tags: "user-guide"
published: true
permalink: /en/user-guide/preparation.html
---

Guide for Thing+ service.

* [Before you start ](#id-starting)
* [Terminology ](#id-term) 
* [Main feature](#id-feature)
* [Access](#id-anytime)
* [User case](#id-usecase)

---
<div id='id-starting'></div>
### Before you start
<br>
![](/assets/1_thingplus.png)
#### What is Thing+?
  * ThingPlus provide user own IoT(Internet of Things) service by cloud.
  * User own IoT service by sign in Thing+. 
  * Install IoT service by synchronization between Thing+ and qualified hardware.  
  * Cloud Eco environment such as smart home, smart farm, smart energy and so on.

#### How useful tool named Thing+?
* User can experience IoT eco environment by simple installation with cost competitiveness.
* Check detail case to use various applications.  [Click](http://www.daliworks.net/?page_id=94&lang=en)

#### Start Thing+ by simple progress.
  *	Sign in Thing+ portal.
  *	Connect Thing+ by purchasing accessible hardware.
  *	Monitor and analyze data generated from sensors.
  *	Control sensors by rule design for customer needs.
  *	Access to Thing+ without physical limitation.
 
<br>

---
<div id='id-term'></div>
### Terminology
<br>
#### Service, Site
* Thing+ can manage separately by service and site.
  - For	example, Monitor ambient temperature in classrooms for school.
    - Deploy a school as service. 
    - Set each classroom as a site.
    - Install and register temperature sensor for each site. 
    - Students from each classroom sign in Thing+ portal. 
    - Each student can get temperature data from each class by access Thing+ portal.
* Service also can be provided for company.
* Service will have separated URL such as {service name}.thingplus.net.  
  - For exmaple, smarthome.thingplus.net, hello.thingplus.net and so on.
* Service can create and manage internal sites.  
  - For exmaple, smart-home service owner can control its own sites from each building setting such as #101, #102, #103.  
* Site cannot authorize or share information for other site.
* Site can authorize users and gateway.  

#### Manager, User
* Manager can be separated between service manager and site manager.  
  - Service manager can get all authorization for internal service. 
  - Site manager can get all authorization for internal site. 
  - User means registered in site, manager will allow user for access to specific gateway.

#### Gateway, device, sensor 
* Hardware has three property as gateway > Device > sensor.
    - For exmaple, Rasberrypie > Aduido > temperature sensor
    - For exmaple, Smartphone > Bluetooth > 3-Axes sensor 
* Gateway has Thing+ Embedded(Gateway or Device) and connects Thing+ Cloud.
* Gateway can send and receive signals from connected devices.
* Device has sensors and connects gateway for wire or wireless network.
* Sensor consists of 'Sensor' receives data and 'Actuator' controls switchs, camera and so on.
  - For example, Sensor - temperature, humidity, illumination and so on 
  - For exmaple, Actuator – light switch, Power switch, Camera and so on. 

#### Tag
* Tag allows grouping for logical sensors. 
  - For example, smart-home groups 3 CO2 sensors for each apartment from #101, #102, #103 by our apartment tagging. 

#### Rule
* Rule will run for customer need by setting limit on data.  
  - For exaple, Receive SNS message for fire alarm. Run air cleaner for high CO2 level.  

#### Timeline
* Timeline records all events that generated rule.  

<br>

---
<div id='id-feature'></div>
### Feature
<br>
#### Dashboard management
* Can get own dashboard by various widgets provided from Thing+. 
* Can monitor data in anytime and anywhere for accessing PC, Table PC, and mobile.

<!---
* [Detail description]()
-->

#### Rule management
* Set your own rule from data provided by sensors. 

<!---
* [Detail description]()
-->

#### Event Timeline 
* Any event by justified rule will be exposed by timeline like twitter's one.
* Event will be defined as detail setting (Fatal/Warning/notification) and each device can has its own time line.  

<!---
* [Detail description]()
-->

#### Sensor List
* Check condition of connected sensors on gateway/map/tag.

<!---
* [Detail description]()
-->

#### Chart Analysis
* Analyze and monitor sensor by chart. 

<!---
* [Detail description]()
-->

<br>

---
<div id='id-anytime'></div>
### Access
<br>
Any web based devices such as desk top, Tablet PC, and smartphone can access system.

1. Run web application and set address as {Service name}.thingplus.net. 
* After long in, your dashboard in service main. 
* Set frequently used or home address will easily access system. 

<br>

---
<div id='id-usecase'></div>
### User Case
<br>
####Humidity monitoring for Smart-home
  * By use of humidity sensor, check real time humidity. By setting rule, out of range humidity can do further activity. 

1. Preparation
  * _Will provide hardware store in Daliworks._
2. Hardware registration
  * Register hardware in Thing+.
3. Rule Creation
  * Click setting rule button on right upper side on menu. Select + button on upper side on setting page.  
  * Rule should access from trigger, condition, and action. For example, set a rule as “send mobile message when humidity turn below 30%.”
  * Select trigger type. For example, we set humidity sensor as trigger.  
  * Set 2nd step as range of humidity. For example, we set humidity range as over 30%. Means abnormal when humidity go below 30%.  
  * Set 3rd step as detail selection as trigger.  
    - Set point as rule. For example, we set 30 for humidity. 
    - Set humidity sensor for trigger. 
  * After set above, select “action”. Check selected trigger in action initiation page. Push action button to initiates.
  * Check mobile message for action screen. 
  * Set “send” for mobile message.  
  * You can put message for action. Put HTML in double quotes.  For example, we do not have any message so that we put “”.
  * As final, you can set the name of rule and detail description. Then set detail setting (means Fatal/Warning/notification) and press finish button.  


<div class='scrolltop'>
    <div class='scroll icon'><i class="fa fa-arrow-circle-up"></i></div>
</div>
<!---
  * Other cases

#### Air ventilation in office 
1. preparation
  - Hardware

2. Register Hardware 

3. Make rule
* If high CO2 level, open the windows.  

#### Contorl
-->

<!---
1. Before you start
* Terminalogy
* Features
* Aceess
* User case
-->
