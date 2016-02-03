---
title: Rule creation and control
tags: "user-guide"
published: true
permalink: /en/user-guide/rule.html
---

Guide for rule creation and management. 

1. [About Rule](#id-rule-about)
2. [Rule Management](#id-rule-management)
3. [Rule Creation](#id-rule-creation)
4. [Rule Informaton](#id-rule-info)
5. [Edit/Remove Rule](#id-rule-edit)
6. [Totorial for Rule](#id-rule-tutorial)

---
<div id='id-rule-about'></div>

### About Rule
<br>

#### Rule?
* Activate an action for specific condition of rule. make a rule as {In case of fire, receive message service.}.
* By rule, can be available to make automation monitoring system, can adjust data of sensors by one rule.
* Make your own rule for proper condition, and make efficient experience IoT. 

#### Agent?
* Items to make trigger and condtion.  
  
#### Trigger-Condition-Action?
* Trigger? Condition of rule. Trigger to act rule.  
  - Ex. If temperature move over 15 degree celcius. 
  - Types. Gateway condition, sensor condition, temperature, humidity, illumination and so on.  
* Condition? Add another trigger, Then, names condition.
  - Ex. Temperature move over 15 celcious and humidity go over 50%.
  - Types. Power consumption, battery gate, time condition and so on. 
* Action? Contol units for satisfied trigger or trigger and condition.  
  - Ex. if ~, send message alarm.
  - Types. Web push, power switch, turn on/off RGB LED ,snapshot, e-mail, report, SMS and so on.

#### Method-parameter?
*  Call method to set range of term. Have three types of mothod called Trigger-Method, Conditon-Method, Action-Method. 
  - Ex. Temperature sensor -> over or under range/ in range/ over/ under. 
* Parameter is the option of detail numbers and selection of each method.  
  - Ex. Parament will be the number for over of temperature sensor method. 

#### Activate Action too frequently?
* For action that made by **Rule that have short term activating trigger like temperature sensor**, **ignore frequently activation in 5 minutues**. 
   - Will ignore action that made in same sensor and rule in 5 minutes.  
* Ignore action **in 15 Seconds** for **irregular action such as any fire alarm, door open**. 
   - Will ignore action that made in same sensor and rule in 15 seconds.Then do action after 15 seconds. 

<br>

---
<div id='id-rule-management'></div>

### Rule Managemenet
Display existing rules.

![](/assets/en_4_m_rule.png)

#### Rule Managment 
* Display ①Existing rule list.
* ②Rule icon for trigger, condition, and action.
* ③Name and description of rule, ④time to edit rule. 
* ⑤Switch to activate/disactivate existing rule condtion.  

<br>

#### Description of rule icon
Make visualization of action of event. 
![](/assets/4_ruleicon.png)

* As order, means trigger, condition, and action.  

<br>
---
<div id='id-rule-creation'></div>

### Create Rule
Set the rule by customer own sensor. In addition, make a rule by rule templetes provided. 

<br>

#### Make own rule creation
1. Click rule menu <i class="fa fd-menu_ruleManagement"></i> on right part of <i class="fa fd-menu_setting"></i> setting. Create own rule <i class="fa fd-rule_creation"></i> on <i class="fa fa-plus-circle"></i> buttom on top of menu. 
2. Make rule as “If temperature move over 30 degree celcius, send message on mobile”.
3. Select ![](/assets/en_4_rule_trigger.png) Trigger creation.
4. Select trigger type for rule initiation. For example, select temperature sensor <i class="fa fd-rule_trigger_temperature fa-2x" style="color: #e04937"></i>. 
5. Set the range of temperature sensor. Set 30 for temperature sensor as select <i class="fa fd-rule_method_over fa-2x"></i>“over”.
6. Set trigger for detail setting.
7. Put limit on rule. For example, put 30 for temeperature. 
8. Select gateway. 
9. Select gateway that have temperature sensor.  
10. Set temperature sensor for trigger.  
11. After done above, select action.  In action screen, check selected trigger.   ![](/assets/en_4_rule_action.png) Action initiation to activate.  
12. Select <i class="fa fd-rule_action_sms fa-2x"  style="color: #53ae55"></i> SMS for selection screen.
13. Select <i class="fa fd-rule_method_send fa-2x"></i>“SEND” for options.
14. Put message on your own for last. Click <i class="fa fa-eye"></i> to check your message or click <i class="fa fa-edit"></i> to write HTML tags and contnets by yourself. Can apply standard message that has been provided. For example, use a provied mesage. Finish rule creation by clicking ![](/assets/en_4_rule_create.png).
15. Set the serious level and put finish button.

<br>

#### Rule Templetes 
1. After click right side menu on <i class="fa fd-menu_setting"></i>, click <i class="fa fd-menu_ruleManagement"></i>rule management. Push add button on top of <i class="fa fa-plus-circle"></i> rule management page, select the <i class="fa fa-copy fa-lg"></i>templete button.
2. Select any templete provided, and click <i class="fa fa-plus-circle"></i> Add button.
3. Edit rule for your demand.
4. Save it and rule has been created. 

<br>

---
<div id='id-rule-info'></div>

### Rule Information
Edit rule information that made.  Rule information can find rule managment page, timeline page.  
![](/assets/en_4_m_ruleinfo.png)

* Rule information page display ①name of rule ②detail agents ③method, ④parameter.
* ⑤Edit rule edition, ⑥remove, ⑦Activation/disactivation.

<br>

<div id='id-rule-edit'></div>

#### Edit and remove rule
* **Rule Edit**
  * Can edit rule for anytime. 
  * Click <i class="fa fa-cog"></i> button on rule information page.  
  * Edit serious level of rule.
  * Edit name and description of rule. 
  * Edit method and parameter of each agent.  
* **Remove rule**
  * Rule will not be recovred if remove. Create the rule again for set.
  * Click <i class="fa fa-cog"></i> button on rule informatino page.  
  * Check pop up screen of removal information and delete. 

<br>

---
<div id='id-rule-tutorial'></div>

### Rule Tutorial
(Will be open shortly.)

<br>


<div class='scrolltop'>
    <div class='scroll icon'><i class="fa fa-arrow-circle-up"></i></div>
</div>

<!---
1. About Rule
* Rule Management
* Rule Creation
* Rule information
* Edit Rule
* Remove Rule
-->
