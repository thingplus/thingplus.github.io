---
title: "Instruction"
tags: "user-guide"
published: true
img : ic-instruction.png
video: "yes"
permalink: /en/user-guide/preparation.html
---

Guide for Thing+ service.

1. [Before you start ](#id-starting)
2. [Terminology ](#id-term) 


---
<div id='id-starting'></div>

### Before you start
<br>

<div align="center" class="embed-responsive embed-responsive-16by9">
  <iframe src="http://www.youtube.com/embed/PrgJZpohSQA?hl=en_US&loop=1&autoplay=0&playlist=PrgJZpohSQA"></iframe>
</div>

![](/assets/thingplus_overview.png)
<br>

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

<div class='scrolltop'>
    <div class='scroll icon'><i class="fa fa-arrow-circle-up"></i></div>
</div>