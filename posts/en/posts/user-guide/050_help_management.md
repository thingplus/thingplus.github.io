---
title: "Management Guide"
tags: "user-guide"
published: true
img : ic-management.png
permalink: /en/user-guide/management.html
---

Guides covering service, site, user and gateway management.  

1. [Service Management](#id-service-management)
2. [Site Managment](#id-site-management)
3. [User Management](#id-user-management)
4. [Gateway Management](#id-gateway-management)

---
<div id='id-service-management'></div>

### Service Management
**Functions for managing an entire service.**

#### Overview
You can set up service management related settings here.

#### General Settings

* `Name`: Display name of the service. Service name will be displayed on right upper side of the portal.
* `Contact`: mail for web push alarms and related information. Contact information will be displayed as a contact link at the bottom of the portal page.
* `Detailed Explanation`: Detailed explanation of the service. Will be displayed at the Log-in screen and Sign up screen.
* `Service logo`: Put the url of your own logo which will be displayed at both the Log-in screen and Sign up screen, if they exist. If not, service name will be displayed.
* `Service Hompage`: Include the url of your own homepage or help page which will be displayed at both the Log-in screen and Sign up screen.

#### Dashboard Settings
* From here, you can Add/change the list of widgets that will be displayed on your dashboard
* This widget list will also be displayed at the bottom of your dashboard page

#### Rule Settings
* Add/change the `trigger and action list` for site-wide rules
* Via the rule creation page, you can display selected actions and triggers


---
<div id='id-site-management'></div>

### Site Mangement
**Management options for site managers.**

#### Overview

* Here, you can display a full list of sites
* Via clicking on an item, you can display the site's name and code

#### Selecting a Site
* By selecting a specific site, you can drill down to a more detailed view

#### Regisiter a Site  
* You can move directly to the site registration page by clicking the <i class="fa fa-plus-circle"></i> button on the right upper side of page
* Can register a site by entering a unique site name and code pair 
* Select your desired service options

<br>

---
<div id='id-user-management'></div>

### User Management
**Functions created to support the management of end users.**
![](/assets/en_5_m_user0.png)

#### Overview
![](/assets/en_5_user_m.png)

* You can drill down to a list of users on a per-site basis

#### Selecting a Site
* Select a via it's ① site name

#### User List
* ② each site contains it's own user list, which can be accessed here
* You can directly edit or view ④ User IDs, ⑤ E-mail, ⑥ Authorizations via the ③User list. (If authorized to do so)

#### Editing Users
* Managers can edit authorization to limit the access of each user
  -  EX. You want to allow user(s) to view a gateway... in this case you would need to enable authorization for gateway viewing
* Reset user passwords
* User authoriziation/de-athorization
* Removing users

<br>

---
<div id='id-gateway-management'></div>

### Gateway management
**Fuctions related to usage and editing of gateways.**
![](/assets/en_5_m_gateway0.png)

#### Overview
![](/assets/en_5_m_gateway.png)

#### Gateway
* Site name - the site that a given gateway is attached to
* Gateway name - the unique name for each gateway

#### Gateway List Overview
* Basic information related to each gateway 
  - ID
  - Registration data
  - Name
  - Data update interval 
  - Discovery / Neighborhood search list
    - Automatically creates a list of sensors within range of the gateway that you may potentially wish to attach to the gateway 
* Additional Options.
  - Location
  - E-mail
  - Mobile #
  - Detailed information
* Directly add a sensor and device
* Remove gateways/devices/sensors
* Software Management 
  - Version info for currently installed software
  - Potential versions of software that can be updated to
* Restart a gateway

<br>

#### Gateway Registration Process 
![](/assets/en_5_m_gateway2.png)

* To begin the registration process click the <i class="fa fa-plus-circle"></i> button on the right top side to add a new gateway
* Select ① Gateway/Device model
* Enter a ② gateway ID, and ③ name
* Check sensors you would like to immediately attach to the gateway
* Select the ④ site of registration

<br>

---

<div class='scrolltop'>
    <div class='scroll icon'><i class="fa fa-arrow-circle-up"></i></div>
</div>

<!---
1. Service management
* Site management
* User management
* Gateway management 
* Tag Mangement
* Rule Management
-->
