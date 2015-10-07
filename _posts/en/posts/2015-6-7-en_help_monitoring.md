---
title: "Guide for functions"
tags: help
published: true
permalink: /en/monitoring.html
---

Guide for dashboard, rule and timeline, data analysis. 

* [Dashboard](#id-dashbaord)
* [Timeline](#id-timeline)
* [Sensor list](#id-sensorlist)
* [sensor Analysis](#id-analysis)
* [Tag management](#id-tag)
* [rule Management](#id-rule)


---
<div id='id-dashboard'></div>
### **Dashboard**
Dashboard can monitor information structured by widget. 
![](/assets/en_3_dashboard.png)

#### Learn about Dashboard 
* Check real time data by adding various widgets.  
* Provide various widgets such as <i class="fa fd-widget_sensor"></i> sensor, <i class="fa fd-widget_actuator"></i> actuator, <i class="fa fd-menu_deviceManagement"></i> device, <i class="fa fd-widget_gateway"></i> gateway, <i class="fa fa-tags"></i> tag, <i class="fa fd-widget_lineChart"></i> line chart, <i class="fa fd-widget_eventChart"></i> event chart,<i class="fa fd-widget_cumulativeChart"></i> cumulative chart, <i class="fa fd-widget_stackedChart"></i> stacked chart, <i class="fa fd-widget_energyChart"></i> energy chart, <i class="fa fa-laptop"></i> gateway monitor, <i class="fa fd-menu_timeline"></i> timeline and so on.  

<br>

#### About Widget
![](/assets/en_3_widget.png)

* ①Widget icon/name, ②refresh, ③set, ④sensor data, ⑤sensor icon/name, ⑥gateway, ⑦last updated time. 
* Can define units for your own by dashboard on widget. 
* Each Widget provide <i class="fa fa-refresh"></i> refresh, <i class="fa fa-cog"></i> configuration icon on top. Check update if icon turn <i class="fa fa-refresh"></i> green, turn <i class="fa fa-refresh"></i> red if disconnected, and turn gray <i class="fa fa-refresh"></i> to make manually update.

<br>

#### Add Widget
* Click <i class="fa fa-plus-circle"></i> button on right top of dashboard.  
* For example, add ![](/assets/en_3_sensorwidget.png) sensor widget on widget list.  
* After adding sensor widget on dashboard, Click ![](/assets/en_3_selectsensor.png) select sensor in the middle of widget option screen. 
* Put 1.name of widget. And select 2.gateway 3.sensor.
* Push save button and sensor widget will be displayed.  

<br>

#### Order change of widget
* Move widget for your own priority. Drag by clicking name area of widget. 
![](/assets/en_3_widgetdrag.png)

<br>

#### Set Widget
* <i class="fa fa-cog"></i> setting ico on widget. 
* Size 
  - Edit size of widget for types. 
  - Edit area for line chart, event chart, variation chart, accumulation chart and energy chart.  
  - Edit height of actuator, device, timeline, and gateway monitor.  
  - Cannot edit any of sensor widget.  
* Delete widget 
  - Can delete widget. 

<br>

---
<div id='id-timeline'></div>
### **Timeline**
![](/assets/en_3_timeline.png)

#### Use Timeline 
* Event will be displayed if user can set the rule. If not, move to rule management to set new rule.  
* Display detail condition on top of event time line. Select ![](/assets/en_3_fatalbtn.png) ![](/assets/en_3_warningbtn.png) ![](/assets/en_3_infobtn.png) bottun to edit.  
* Each event alarm will be set by selected. Click the name of rule. Then move to detail information page.  

<br>

#### Messate on timeline 
![](/assets/en_3_timeline_rule.png)

  - ①Rule of previous events (Icon and name will be displayed)
  - ②Event condition(Color configuration on Fatal/Warning/Notification)
  - ③Time of event
  - ④Event message
    - Message will be displayed by user or provided.  

<br>

---
<div id='id-sensorlist'></div>
### **Sensor list**
Dispaly sensor list of your own. Click the tap menu on the top. Then display gateway, tag, and location on map.  
![](/assets/en_3_sensorlist.png)

<br>

#### List of gateway
Select for gateway and sensor of dedicated site. 
![](/assets/en_3_viewgateway.png)

* ①Gateway selection screen : Select for gateway and sensor of dedicated site.  
* ②Name of gateway
* ③Detail chart on gateway : move to dispaly sensors that on dedicated gateway. 
* ④Sensor list on gateway
* ⑤Updated data on sensor
* ⑥Display time to update : Display time that has been received latestly. (Green: normal, Red : Sensor error)
* ⑦Updated time of gateway

<br>

#### Location list on map
Check map view for gateway if have location information.  Put location in [Gateway management](/help_management/#id-gateway-management) page.
![](/assets/en_3_viewmap.png)
 
* Display location on gateway by select ①gateway on map. 
* Display updated time of gateway and device and sensor units by click ②icon. 
* Control map interface by select ③ icon on top of map. 

<br>

#### Tag List
![](/assets/en_3_viewtag.png)

* ①Tag selection : select a tag.
* ②Device information icon : Displa devices on tag. 
* ③Chart analysis icon : move a page to display detail graph on tag. 
* ④Tag setting : Move to tag management page.  
* ⑤Sensor information : Click the sensor name to move and display rough sensor graph.  
* Event timeline : Check timeline on tap.  

<br>

---
<div id='id-analysis'></div>
### **Sensor Aanlysis**
Sensor analysis page provide chart and statistics. 
![](/assets/en_3_sensoranalysis.png)

<br>

#### Chart
![](/assets/en_3_analysis_chart.png)

* Provide timeline chart for selected sensors. Set a term for ①analysis on sensor to gateway and tag. Select ②sensor list, ④time zone. Provide screen to ⑦Size up/down, ⑧Area selection/move, ⑨recovery to initial setting. Download sensor data by ⑩export function. 

#### Chart Analysis
1. Select Gateway. 
- Select service. 
- Select gateway that has sensor to display on chart. 
- Select sensor.  
- Select timze zone to display data.  
- Can download detail chart.  
- Click sensor on chart. 
- If size up or down,click left/right arrow to move forward and backward. Click on the middle to return back to initial screen.  
- Click and drag to stretch out.  
- Overall chart for graph. Click and drag for specific area to stretch.  
- Button to move graph area. Move graph position to check.  

<br>

#### Statistics
![](/assets/en_3_analysis_statics.png)

* Provide statistics on selected gateway. Select ②gateway, and click search button. Compare others to add ③sensors. Check ④time zone and ⑤date (month/year).  

#### Statistic tutorial
1. Select Gateway. 
- select service.

<br>

---
<div id='id-tag'></div>
### **Tag Management**
![](/assets/en-3_m_tag0.png)

#### Screen Information
![](/assets/en_3_m_tag_desc.png)

* Manage new rule by create own tag with sensors.  

#### Tag selection
* Select ①tag name on top. Selected senssor will be display. 

#### Tag List
* Dislapy ②each tag types.  
* Dispaly ③Tag name, ④Senors in tag ⑤gateway, ⑥sensor type, ⑦sensor name, ⑧Sensor ID in tag list.


#### Tag creation
1. Create new tag by click <i class="widget-add-button fa fa-plus-circle"></i>Add button on top.  
- Put new name of tag.  For example, we build “all temperature sensors” .
- Check sensor.
- Click creation button on bottom of page.  

<br>


---
<div id='id-rule'></div>
### **Rule Management**
Can create and manage the rule.  Detail rule description is on  [Rule creation and control](/en/rule.html). 
![](/assets/en_3_m_rule0.png)



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
