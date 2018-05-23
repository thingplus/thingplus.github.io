---
title: Advanced User and permission 'x'
published: true
image: "http://support.thingplus.net/assets/ogp/ogp_notice.png"
permalink: /en/notice/20180511.html
---


# Upcoming New Release
## Release date
- Sandbox server: Test server for daliwork partners, used to test equipment before creating a service on production. 
  - URL format `https://*.sandbox.thingplus.net`. 
  - Sandbox will be released on 2018-5-23
- Production server: 
  - URL format `https://*.thingplus.net` or `https://*.thingplus.eu`. 
  - Release date: TBD

## Advanced User added
- Currently Thingplus has 4 user groups `system admin`, `service admin`, `site admin` and `user`. If a `user` wasn't given permission for each device by `site admin` or `service admin` , they can't even view sensors.
- We received a lot of feedback that the `admin` permissions are too permissive for most use cases, while `user` is too restrictive, so we added a new group `advanced user`, positioned between `site admin` and `user` permission-wise.
- `advanced user` group has permission to read and execute commands on all sensors on a site
  - The picture below shows an `advanced user` having `read` and `execute` permission, but not `update` permission, which would allow them to modify the sensors's information.
![image](https://user-images.githubusercontent.com/15882679/39864491-ad1fca0a-5484-11e8-80c9-9d549d273aaf.png)
  - Difference from `site admin`: `advanced user` doesn't give permission to update or post to the sensors.
- After release, you can change the user's group
![image](https://user-images.githubusercontent.com/15882679/39864316-2a7c2954-5484-11e8-90d3-760af26e9a29.png)


## 'x' (execute) permission added to devices
- Currently devices have four permission: `c`, `r`, `u` and `d`. (for create, read, update and delete).
- Before, if a user want to trigger an actuator, they had to have `c` permission. Also, the user must also give the `device` auth-scope, which entails much more freedom.
- So, we added `x` (execute) permission together with `advanced user` permission group mentioned above. You can now only give the user the `r` and `x` permissions, allowing them to see and trigger actuators, but not make changes to them.

## Changing `auth scope`
- Before, we only have one `auth scope`: `gateway` covering all operations (read, update).
- Due to user demands we separated *update* and *manage* permission from *read*. There is now 3 `auth scope` you can select from:
  - `gateway`: Allow registering of a gateway
    - `gateway-update`: Allow changing the information of a gateway
    - `gateway-read`: Allow reading of device status and value
  - `gateway-management`: Allow changing the gateway's reporting interval, issue restart or update commands to the gateway
  - `actuator-command`: Allow triggering of actuators
- For already registered clients, if they have the `gateway` `auth scope`, they will be updated to have `gateway`, `gateway-command`, `gateway-management` , `gateway-update` and `gateway-read` so they can still be used normally without any action.
- We will also give the `x` permission to users who previously have `u` permission so you can continue using Thingplus portal normally.

<br>
<br>
<br>
<br>

<div class='scrolltop'>
    <div class='scroll icon'><i class="fa fa-arrow-circle-up"></i></div>
</div>