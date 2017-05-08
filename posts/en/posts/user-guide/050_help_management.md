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
**This is for the Service Administrator.**

<br/>

#### General Settings
You can set up service management related settings here.

* `Name`: Display name of the service. Service name will be displayed on left upper side of the portal. Please email(contact@thingplus.net) us to reflect the logo.
* `Contact`: mail for web push alarms and related information. Contact information will be displayed as a contact link at the bottom of the portal page.
* `Detailed Explanation`: Detailed explanation of the service. Will be displayed at the Log-in screen and Sign up screen.
* `Service logo`: Put the url of your own logo which will be displayed at both the Log-in screen and Sign up screen, if they exist. If not, service name will be displayed.
* `Service Hompage`: Include the url of your own homepage or help page which will be displayed at both the Log-in screen and Sign up screen.

<br/>

#### Dashboard Settings
* From here, you can Add/Change the list of widgets that will be displayed on your dashboard
* This widget list will also be displayed at the bottom of your dashboard page

<br/>

#### Rule Settings
* Add/change the `trigger and action list` for site-wide rules
* Via the rule creation page, you can display selected actions and triggers

<br/>

#### Gateway Model Settings
* You can Add/Change gateways to choose from. 
* The selected gateway model is displayed when registering in the gateway management page.

<br/>

---
<div id='id-site-management'></div>

### Site Mangement
**This is for the Service Administrator.**

* You can create and manage sites.
* Here, you can display a full list of sites
* Via clicking on an item, you can display the site's name and code

<br/>

#### Selecting a Site
* You can search and select site by site name. When you select a site, only that site appears on the screen.

<br/>

#### Regisiter a Site  
* You can move directly to the site registration page by clicking the <i class="fa fa-plus-circle"></i> button on the right upper side of page
* Can register a site by entering a unique site name and code pair 
* When you register your site, you can select a plan for the site you created.
* If you select a plan, the plan for that site is saved.

<br>

---
<div id='id-user-management'></div>

### User Management
**This is for the services and the site Administrator.**

<br/>

#### Overview
![](/assets/en_5_user_m.png)

* You can drill down to a list of users on a per-site basis

<br/>

#### Selecting a Site
* ① You can select a site. When you select a site, only the users who belong to the site are listed.

<br/>

#### User Search 
* ② You can search for users by userID or email.

<br/>

#### User List
* It shows a list of corresponding users.
* You can directly edit or view ③Authorized sites ④ User IDs, ⑤ E-mail, ⑥ Authorizations via the User list. (If authorized to do so)
* ⑦ Site Administrator: The service administrator can grant permissions and site administrator can manage the site.
* ⑧ Unauthorized user: It is a state before the user is authenticated after signing up. Unauthorized users will not be able to login.
* ⑨ User: A user who has been authenticated by admin.

<br/>

#### Permission
* When you select a user's permission, the following screen appears. 
![](/assets/en_5_userAuth.png)
* ① You can select sites to which you want to grant permissions to users.
* ② Service administrators can select site administrators/users, and site administrators can not modify user role.
* The permissions granted by the administrator determine how accessible they are to the user.
  - ex) ③ permission to view, ④ permission to setting
* ⑤ Press + to set permissions for each device and sensor.
* ⑥ Reset Password: The password-change-link will be sent to the email registered by the user. You can modify it with the password you want.
* ⑦ Authorize/Unauthorize User: Administrator can approve/cancel user authentication.
* ⑧ Delete User: Delete user information.

<br>

---
<div id='id-gateway-management'></div>

### Gateway management
**This is for the services and the site Administrator.**
![](/assets/en_5_m_gateway0.png)

<br/>

#### Overview
![](/assets/en_5_m_gateway.png)

<br/>

#### Gateway
* ① Select site
* ② Search by gateway ID and name

<br/>

#### Gateway List Overview
* Basic information related to each gateway 
  - ③ Gateway ID
  - ④ Gateway Model
  - ⑤ Registration Data
  - ⑥ Last updated
  - ⑦ Name : Name of gateway
  - ⑧ Data update interval : It will be rebooted automatically when changed.
  - ⑨ Discoverable On
    - Automatically creates a list of sensors within range of the gateway that you may potentially wish to attach to the gateway 
* ⑩ More Options.
  - Location : There are two methods of input: manual input and registration of the location sensor. <br>
  The registered location can be checked in the Sensor List -> Map View.
  - Email
  - Mobile 
  - Description
* Device Information
  - ⑪ ID : Device ID
  - ⑫ Device Model :
  - ⑬ Name : Name of device
  - ⑭ Sensor list : The sensors registered in the device - Click on the sensor ID to go to [Sensor](/ko/user-guide/monitoring.html#id-sensorinfo) page.
* ⑮ Add : Directly add a sensor and device
* ⑯ Delete : Remove gateways/devices/sensors
* ⑰ Software Version - It may not be available depending on the gateway
  - Version info for currently installed software
  - Potential versions of software that can be updated to
* ⑱ Reboot a gateway - It may not be available depending on the gateway

<br>

#### Gateway Registration Process 
* ⑲ To begin the registration process click the <i class="fa fa-plus-circle"></i> button on the right top side to add a new gateway
![](/assets/en_5_m_gateway2.png)

* ① Select Gateway/Device model
* Enter a ② gateway ID, and ③ name
* Check sensors you would like to immediately attach to the gateway
* ④ The service administrator can specify which sites to register.

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
