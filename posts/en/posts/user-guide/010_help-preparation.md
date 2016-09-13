---
title: Overview
tags: "user-guide"
published: true
img : ic-instruction.png
video: "yes"
permalink: /en/user-guide/preparation.html
---

Overview for usage of Thing+ services

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
  * ThingPlus is a cloud-based IoT service for your Things
  * Sign into Thing+ to begin using the service
  * The service is installed through synchronization between Thing+ and qualified hardware
  * Usage examples:
    - Smart Home
    - Smart Farming
    - Energy conservation & measurement
    - Etc..

#### What can I do with Thing+?
* Simple, cost effective installation and instant access to a powerful API that allows you to create IoT solutions for real world problems
* See here for detailed use cases: [Click](http://www.daliworks.net/?page_id=94&lang=en)

#### Thing+ Simple Startup
  *	Sign into the Thing+ portal
  *	Connect compatible hardware to Thing+
  *	Monitor and analyze data generated from sensors
  *	Control sensors via rule design/API following customer needs
  *	Note: Thing+ use is not limited in any way
 
<br>

---
<div id='id-term'></div>

### Terminology
<br>

#### Service, Site
* Thing+ can be managed separately as either a service or a site.
  - For	example, consider monitoring the ambient temperature in a school classroom:
    - Deploy a the school as a "service" on Thing+ 
    - Set each classroom as a "site"
    - Install and register a temperature sensor at each site
    - Teachers from each classroom can sign in using the Thing+ portal
    - Each teacher could directly get temperature data about their class using the Thing+ portal, and rules could be set up to perform actions based on a class's temperature
* Services can also be provided directly as a package to companies.
* Services will have separated URLs where they can be directly accessed - {service name}.thingplus.net.  
  Eg. smarthome.thingplus.net, hello.thingplus.net and so on.
* Services can also create and manage internal sites.  
  - For exmaple, a smart-home service owner could control each building on it's own divided by building number - #101, #102, #103.  
* Sites cannot authorize or share information with other sites.
* Sites can authorize users and gateways. 

#### Managers & Users
* Managers can be separated into a service manager and a site manager.  
  - Service managers have total authorization for internal services. 
  - Site managers can get authorization for specific internal sites. 
  - Users refer to those registered on the thingplus site, where a manager will allow users access to specific information and specific gateways.

#### Gateway, Device, Sensor 
* Hardware can be divided into three categories: Gateways > Devices > Sensors.
    Eg. Rasberrypie > Aduido > temperature sensor
    Eg. Smartphone > Bluetooth > 3-Axis sensor 
* Gateways have Thing+ Embedded(Gateway or Device) and can connect directly with the Thing+ Cloud.
* Gateways can send and receive signals from connected devices.
* Devices have sensors and connect directly to a gateway via wired or a wireless network.
* Sensors consist of 'Sensors' that receive data and 'Actuators' that can control switchs, cameras and so on.
    Eg. Sensor - temperature, humidity, illumination and so on 
    Eg. Actuator – light switch, Power switch, Camera and so on. 

#### Tags
* Tags allow grouping for logical sensors. 
  - For example, a smart-home groups 3 CO2 sensors for each apartment from #101, #102, #103 via tagging

#### Rules
* Rules are used to automatically create action or limit data based on customer needs. 
    Eg. Receive an SNS message from a fire alarm. Run an air cleaner on detection of high CO2 levels

#### Timeline
* The timeline records all events that generate rules and is a central location to access time-sensitive data.  

<br>

<div class='scrolltop'>
    <div class='scroll icon'><i class="fa fa-arrow-circle-up"></i></div>
</div>