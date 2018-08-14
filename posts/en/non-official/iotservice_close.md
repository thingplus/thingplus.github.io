---
title: iot.thingplus.net will be transferred
published: true
permalink: en/notifRelatediotService.html
---


>1st Email (26.July, GMT+9, KST)

Hi,

This is Daliworks(`Thing+`)

This is a notification of importing upcoming changes to the Thing+ platform.

`iot.thingplus.net` will be transferred to `trial.sandbox.thingplus.net` (8/14)

**Reasons:**
- When creating iot.thingplus.net services, we worried it would be confusing for developers that their trial/demo account resided on the same domain as many of our commercial services (thingplus.net)
- The `Sandbox` server cluster has been a recent event (was set up in the last year or so), and we eventually wanted to update the system to have all demos and trialing done on it.

We have decided to finally move all demo/trial accounts currently existing on iot.thingplus.net, to `trial.sandbox.thingplus.net`.

This makes more sense logically, and will also allow us to provide better stability and reliability to all commercial services on thingplus.net.

There are no functional differences between the sandbox and thingplus commercial server clusters.

Rather, we release updates to sandbox on a much more aggressive schedule, and this fits with our intention to provide trial and demo accounts with the latest and greatest.

**Limitations for dev services on `trial.sandbox.thingplus.net`:**

1. You can use 2 gateways, 20 sensors, 5 rules as before.
2. The period of use is 90 days maximum.
3. Data transmission cycle on sensors and other data sources is recommended to be set at 5 minutes, with an enforced minimum of 1 minute.
4. If you use the API or mqtt abnormally, we reserve the right to disable your token or gateway key without notification.
5. If you use email as the action of a rule, there is a limit of 200 emails sent per month. If you exceed this limit, the rule will stop functioning.
6. Rules will be deactivated without notification if a black-listed, or non-existent email address is set as the destination of your rules. We also enforce anti-spam measures and reserve the right to immediately terminate your demo account if misused.

As you can see, the major difference from before is that we not enforce a 90 day use period maximum. After these 90 days are complete, you may get in touch with us to upgrade to a paid service account via our contact email.

**Schedule**
1. In early August, you will be able to join trial.sandbox.thingplus.net.
2. On August 14, existing iot.thingplus.net services will be closed.

We will send you an e-mail notification in early August.  If you would like to continue using Thing+ for free at this time, please go to trial.sandbox.thingplus.net and register your device(s).

Unfortunately, data cannot be directly migrated to the new server cluster, and will need to be manually rebuilt. (sorry about that..)

We appreciate your understanding as we move through this update, and thank you for your interest in using our platform for your IOT projects.

Thank you.


---

>2nd email (2.August, GMT+9, KST)

Hi,
This is Daliworks (Thing+)

Related to the iot.thingplus.net service transfer, `iot.thingplus.net` will be closed on `8/14` as per our first notification.

All accounts and devices currently registered on `iot.thingplus.net` will become unavailable at this time.

If you would like to continue using Thing+ for free, please sign up to [here](https://trial.sandbox.thingplus.net/#/register) after `August 14`.

If you would like to delete your account, please reply with your account ID and we will delete your account information.

Thanks.

---


> 3rd Email (14.August, GMT+9, KST)

Hello,

This is the Thing+ dev team.

<br>

`iot.thingplus.net` was closed today.

<br>

This means that you can no longer login and use iot.thingplus.net.

If you would like to continue to use Thing+ with a free account, please register a new account and re-register your devices at the following [link](https://trial.sandbox.thingplus.net/#/register)

The data of the devices used in previous iot.thingplus.net services has not been transferred.

<br>

Free accounts on the new Thing+ Trial Sandbox are allowed to use up to 20 sensors and 2 gateways free for up to 3 months.

After this period, you may upgrade to a paid commercial account.

Please note that trial accounts which have gone over this three month limit will not be accessible after that time period.

<br>

Please see more details below:

1. You may use up to 2 gateways, 20 sensors, and 5 rules for free as before.
2. The maximum period of use is 90 days.
3. Data transmission cycles on sensors and other data sources4. If you use our API or MQTT abnormally, we reserve the right to disable your token or gateway key without notification.
5. If you use email as the action of a rule, there is a limit of 200 emails sent per month. If you exceed this limit, the rule will stop functioning.
6. Rules will be deactivated without notification if a black-listed, or non-existent email address is set as the destination of your rules. We also enforce anti-spam measures and reserve the right to immediately terminate your trial account if misused.

<br>

Please refer to Section 12.7 of [the Terms and Conditions](https://trial.sandbox.thingplus.net/#/about/terms)

<br>

If you have any questions or feedback, please feel free to directly reply to this email.

<br>

Thank you for your continued interest in our platform.


<br>
<br>
<br>