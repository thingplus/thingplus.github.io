---
title: Rule Creation and Control
tags: "user-guide"
published: true
img: ic-rule.png
permalink: /en/user-guide/rule.html
---

Guide for rule creation and management. 

1. [About Rules](#id-rule-about)
2. [Rule Management](#id-rule-management)
3. [Rule Creation](#id-rule-creation)
4. [Rule Informaton](#id-rule-info)
5. [Editing/Removing Rules](#id-rule-edit)
6. [Example Usage Tutorial](#id-rule-tutorial)

---
<div id='id-rule-about'></div>

### About Rules
<br>

#### What are Rules?
* Rules are required for performing an action based on specific conditions. An example rule would be, simply: {In case of fire -> send message "we are on fire, uh oh"}.
* Through rules, monitoring systems can perform various tasks and automate a wide variety of functions and actions.
* Automation is one of the pillars of the IoT, and we have designed rules to make it as easy as possible for you to take advantage of this power.

#### What are Agents?
* Agents are pre-defined Trigger Types that describe the type of input value (eg. temperature, moisture, etc..) that will be used for a trigger.
  
#### The Trigger-Condition-Action Structure
* All rules are based on a similar structure.
* Triggers: The first condition upon which the rule is executed. If the rule is never triggered, no action will be performed.
  - Ex. If temperature moves over 15 degree celcius, do something. In this case, the trigger is using the "temperature" agent.
  - There are many different agents, and thus, types of input, that can be used to trigger a rule.

* Conditions: Additional conditions required for the trigger to fire.
  - Ex. Temperature moves past 15 celcius and humidity > 50%. When *all* conditions are met, the trigger will fire.
  - Types. Power consumption, battery gate, time condition and so on. 

* Actions: Upon the trigger executing, actions added here will be performed. 
  - Ex. if temperature > 100 degrees celcius, send a message and initiate an alarm.
  - Action types are very diverse and malleable, they include: Web push, power regulation, turning a RGB LED on/off, taking a screenshot/image, e-mail, report, SMS and so on.

#### Parameters
*  Parameters can be used to modify triggers, conditions and actions.
  - Ex. Temperature sensor -> over or under range/ in range/ over a value / under a value. 
* Parameters allow for more precise rule creation using very specific conditions.

#### Rule Action Blockers
* Specifically, actions can be blocked from firing too frequently. 
   - Eg. A temperature sensor could be set to ignore additional rule triggers for a 5 minute period after having been first triggered. 
* Rules can also be selectively ignored for periods of time to help create rules related to irregular action **such as fire alarms, specific doors being opened, etc..**. 
   - Rule triggering that continues past the selective time period will then immediately fire.

<br>

---
<div id='id-rule-management'></div>

### Rule Management
Used to display and manage existing rules.

![](/assets/en_4_m_rule.png)

#### Rule Managment 
* ① Display the existing rule list.
* ② Rule icon for triggers, conditions, and actions.
* ③ Name and the description of a rule, ④ the most recent edit date. 
* ⑤ Switch to turn rules on and off. 

<br>

#### The Rule Icon
Rule icons are visualized through the Trigger -> Condition -> Action structure. All rules have a three-division visual style that allows you to quickly see an idea of the rule's components. 
![](/assets/4_ruleicon.png)

* In this case, Trigger = Run, Condition = CO2 amount, and Action = alert.
* These icons can be set on a per rule basis.

<br>
---
<div id='id-rule-creation'></div>

### Creating a Rule
Rules can be set up manually on a customer by customer basis using specific sensors. Additionally, rule templates can be used that come with preset options. 

<br>

#### Creating a Rule from Scratch
1. Click the rule menu <i class="fa fd-menu_ruleManagement"></i> on the right part of the <i class="fa fd-menu_setting"></i> setting. Create a new rule <i class="fa fd-rule_creation"></i> from the <i class="fa fa-plus-circle"></i> button on top of the menu. 
2. For this example rule, we will be creating something that looks like: “If temperatures move over 30 degree celcius, send a message to mobile”.
3. Select ![](/assets/en_4_rule_trigger.png) to begin Trigger creation.
4. Select the trigger type for rule initiation. For example, in this case, we will use a temperature sensor <i class="fa fd-rule_trigger_temperature fa-2x" style="color: #e04937"></i>. 
5. Next we will set up the range to be checked. Use the <i class="fa fd-rule_method_over fa-2x"></i> icon to select a range denoting all values above a certain value.
6. Set the range by clicking next.
7. Add a temperature of 30 degrees as the limit. Any value above this will trigger this rule.
8. Select a gateway (tags can also be selected). 
9. Select a gateway that has a temperature sensor.  
10. Set the specific temperature sensor(s) to be used for the trigger.  
11. After the above is done, select an action.  In the action screen, check your selected trigger. Use the ![](/assets/en_4_rule_action.png) to initialize.  
12. Select <i class="fa fd-rule_action_sms fa-2x"  style="color: #53ae55"></i> SMS on the selection screen.
13. Select <i class="fa fd-rule_method_send fa-2x"></i>“SEND” as your option.
14. Write in a default message (that will be sent upon this rule being triggered). Click <i class="fa fa-eye"></i> to check your message or click <i class="fa fa-edit"></i> to write HTML tags and content from scratch. You can also use the pre-filled default message to build upon. Finish rule creation by clicking ![](/assets/en_4_rule_create.png).
15. Set the severity level and click the finish button.

<br>

#### Rule Templates 
1. After clicking on <i class="fa fd-menu_setting"></i> from the menu to the right side, click <i class="fa fd-menu_ruleManagement"></i> rule management. Push the <i class="fa fa-plus-circle"></i> button at the top of the rule management page and click the <i class="fa fa-copy fa-lg"></i> template button.
2. Select from the templates provided and click the <i class="fa fa-plus-circle"></i> Add button.
3. Edit the rule if needed.
4. Save it and the rule has been created. 

<br>

---
<div id='id-rule-info'></div>

### Rule Details Panel
Here you can edit rules that have already been made.  This can be accessed by both the rule management page as well as the timeline page.  
![](/assets/en_4_m_ruleinfo.png)

* ① Name of the rule 
* ② Agent used
* ③ Trigger method
* ④ Exact trigger limit
* ⑤ Rule Settings
* ⑥ Rule deletion
* ⑦ Rule Activation/Deactivation

<br>

<div id='id-rule-edit'></div>

#### Editing and Removing Rules
* **Rule Editing**
  * Rules can be edited at any time.
  * Click the <i class="fa fa-cog"></i> button in the rule information page.  
  * All rule values can be directly edited here.
* **Removing a rule**
  * **WARNING** Rules cannot be recovered after being deleted. Please delete responsibily.
  * Click the <i class="fa fa-cog"></i> button on the rule information page.  
  * A pop up screen will ask you confirm if you would like to delete or not.

<br>

---
<div id='id-rule-tutorial'></div>

### Rule Tutorial
(To be added)

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
