---
title: "Main Features"
tags: "user-guide"
published: true
img: ic-guideforfunction.png
permalink: /en/user-guide/monitoring.html
---

A guide on using the dashboard, rules, data timeline, and data analysis features. 

1. [Dashboard](#id-dashbaord)
2. [Timeline](#id-timeline)
3. [Sensor list](#id-sensorlist)
4. [Sensor Analysis](#id-analysis)
5. [Tag management](#id-tag)
6. [Rule Management](#id-rule)


---
<div id='id-dashboard'></div>

### **The Dashboard Tab**
On the dashboard, by default, incoming data and information is processed and displayed via "widgets" (small modules each handling a specific set of data or information - eg. a temperature tracking widget). 
![](/assets/en_3_dashboard.png)

#### Learning about The Dashboard 
* You can check real time data by adding various widgets corrosponding with the type of data you would like to display.  
* By default, some widgets available for use include: <i class="fa fd-widget_sensor"></i> sensor, <i class="fa fd-widget_actuator"></i> actuator, <i class="fa fd-menu_deviceManagement"></i> device, <i class="fa fd-widget_gateway"></i> gateway, <i class="fa fa-tags"></i> tag, <i class="fa fd-widget_lineChart"></i> line chart, <i class="fa fd-widget_eventChart"></i> event chart,<i class="fa fd-widget_cumulativeChart"></i> cumulative chart, <i class="fa fd-widget_stackedChart"></i> stacked chart, <i class="fa fd-widget_energyChart"></i> energy chart, <i class="fa fa-laptop"></i> gateway monitor, <i class="fa fd-menu_timeline"></i> timeline and more.  

<br>

#### About Widgets
![](/assets/en_3_widget.png)

* ① The Widget's icon/name, ② Manually refresh data, ③ Settings, ④ Processed Sensor Data, ⑤ Sensor icon/name, ⑥ Gateway, ⑦ Last update time. 
* The measurement units used for each widget can also be defined. 
* Each Widget provides by default a <i class="fa fa-refresh"></i> refresh, <i class="fa fa-cog"></i> and configuration icon on top. The refresh/update icon will be displayed as green if connected, red if disconnected, and gray if set to not automatically update/refresh. 

<br>

#### Adding Widgets
* Click the <i class="fa fa-plus-circle"></i> button on the right top of the dashboard.  
* As an example, try adding a ![](/assets/en_3_sensorwidget.png) sensor widget in this widget list.  
* After adding the sensor widget to the dashboard, Click ![](/assets/en_3_selectsensor.png) select the sensor in the middle of the widget option screen. 
* Add a name for your widget and select a gateway and sensor.
* Push save and the sensor widget will be displayed.

<br>

#### Changing the order of widgets
* You can order widgets around based on the priority you want to see them in. Drag by clicking the name area of the widget. 
![](/assets/en_3_widgetdrag.png)

<br>

#### Widget Settings
* Click the <i class="fa fa-cog"></i> setting icon widget.
* Size 
  - Edit size of widget for types. 
  - Edit width for line chart, event chart, variation chart, accumulation chart and energy chart.
  - Edit height for actuator, device, timeline, and gateway monitor.
  - At the current time, you cannot edit any sensor widgets.  
* Delete widget
  - Deletes the widget

<br>

---
<div id='id-timeline'></div>

### **The Timeline Tab**
![](/assets/en_3_timeline.png)

#### Usage Timeline 
* Events will be displayed based on any user set rules. If no rules are set, you can move to rule management to set a new rule.
* You can filter events based on the severity level of the alert at the top right of the event timeline. Select the ![](/assets/en_3_fatalbtn.png) ![](/assets/en_3_warningbtn.png) ![](/assets/en_3_infobtn.png) buttons to see specific levels.
* You can also click on the name of each rule to drill down directly to the detailed information page.

<br>

#### Viewing the Timeline
![](/assets/en_3_timeline_rule.png)

  - ① The current rule this event is created from (Icon and name will be displayed)
  - ② Severity level of this event (Colors can be configured for Fatal/Warning/Information)
  - ③ Time of this event
  - ④ Event message
    - Message will be displayed manually from a user or can be otherwise provided.  

<br>

---
<div id='id-sensorlist'></div>

### **The Sensor Tab**
The sensor list displays a full, sortable list of sensors in your network. The tag and tab menus on top can be used to display gateways, tags, and physical locations of things on the map. 
![](/assets/en_3_sensorlist.png)

<br>

#### List of gateways
For each site, there is a list dedicated to gateways and the sensors they are connected to.
![](/assets/en_3_viewgateway.png)

* ① Gateway selection screen : This dropdown allows you to select specific gateways and sensors in this site. 
* ② Name of gateway.
* ③ Detailed charts for this gateway : click this to move to a display of sensors and charts related to this gateway. 
* ④ List of sensors attached to this gateway.
* ⑤ Data update settings for this sensor.
* ⑥ Display time to update : Time since last update. (Green: Normal, Red : Sensor error)
* ⑦ Last time this gateway's information was updated.

<br>

#### The Map Tab
If gateways and sensors have geographical/physical positioning data, they will be displayed here.  You can manually add location data via the [Gateway management](/en/user-guide/management.html#id-gateway-management) page.
![](/assets/en_3_viewmap.png)
 
* Using the dropdown at ① will allow you to show specific gateways and sensors on the map.
* Display updated time of gateway and device and sensor units by clicking the ② icon. 
* Control the map interface by selecting the ③ icon on top of the map. 

<br>

#### Tag List Tab
![](/assets/en_3_viewtag.png)

* ① Tag selection : select a tag.
* ② Device information icon : Display devices related to the tag.
* ③ Chart analysis icon : move a page to display detail graphs using data from tagged items. 
* ④ Tag settings : Move to tag management page.  
* ⑤ Sensor information : Click the sensor name to move to and display the sensors graphs & data.  
* Event timeline : Check the event timeline utilizing all devices related to this tag.

<br>

---
<div id='id-analysis'></div>

### **The Analysis Tab**
The analysis tab includes tools to analyze and create actionable data from your Things'.
![](/assets/en_3_sensoranalysis.png)

<br>

#### Chart Tab
![](/assets/en_3_analysis_chart.png)

* Provides a timeline based chart for the selected sensors. ① and ② can be used to select from either tags or sensor/gateway lists. ④ is used to select a range of time to display. ⑦ is the primary, detailed data viewing area, and ⑧ is the selection area, which can be used to select an area of data as well as to move the region of time selected. ⑨ resets to initial settings. All data can be directly downloaded via the ⑩ export function. 

#### Ways to use Charts
- Select a gateway - get an overview of a gateway's specific data and details.
- Select a service - get a broad overview of service-related data.
- Select a gateway that has sensors attached - get a overview of broad portions of your service.
- Select a specific sensor - for drilling down to detailed, specific information.  
- Select a specific period time - if you are interested in dividing data by time.
- Export a detailed chart - can be used for presentations, infographics, etc..
- Use a tag group - Display values of groupings of sensors to compare similar sensors and performance.

<br>

#### Statistics Tab
![](/assets/en_3_analysis_statics.png)

* Provides detailed statistics for a selected gateway. Select the ② gateway, and click the search button. For comparisons, you can ③ add more sensors. Check ④ time range and ⑤ starting date (month/year).  

#### Statistic tutorial
1. Select Gateway. 
- Select a service.

<br>

---
<div id='id-tag'></div>

### **Settings - Tag Management**
![](/assets/en-3_m_tag0.png)
* Tags can be added, edited and managed in this settings panel. Tags are excellent for creating logical groupings of sensors and gateways used for reporting and other purposes later on.

#### Tag Screen in Detail
![](/assets/en_3_m_tag_desc.png)

* You can create new rules based on tags. In this way, large logical groupings of sensors can have specifically set rules.

#### Tag selection
* Select the ① tag name on top. Sensors falling under this tag will now be displayed. 

#### Tag List
* Display ② each tag.
* Display ③ Tag name, ④ Sensors attached to the tag, ⑤ gateway, ⑥ sensor type, ⑦ sensor name, ⑧ sensor ID in the tag list.


#### Tag creation
- Create a new tag by clicking the <i class="widget-add-button fa fa-plus-circle"></i> Add button on top.  
  - First, create a new name for the tag. In this example, we use "all temperature sensors".
  - Check the sensor.
  - Click the creation button on the bottom of the page.  

<br>


---
<div id='id-rule'></div>

### **Settings - Rule Management**
Here you can create and manage rules. Detailed rule descriptions can be found in [rule creation and control](/en/user-guide/rule.html).
![](/assets/en_3_m_rule0.png)

<div class='scrolltop'>
    <div class='scroll icon'><i class="fa fa-arrow-circle-up"></i></div>
</div>

<!---
Experience real time data analysis by connecting devices on Thing+. 
Check for mainfunctions as below.  

1. Dashboard
  - Dashboard
  - Standard Widget
  - Add Widget
  - Order change of widget
  - Widget setting
2. Timeline
  - Use timeline
  - About Rule
3. Sensor list
  - Gateway list
  - Map list
  - Tag list
4. Sensor analysis
  - Chart
  - Staticistics
-->

<br>
