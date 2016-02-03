---
title: 튜토리얼
tags: "rest-api"
published: true
permalink: /ko/rest-api/getting-started.html
---

Getting Started with the Thing+ REST API
<div id='id-step0'></div>

1. [Thing+ Service registration & Hardware installation](#id-step0)
2. [Prerequisite](#id-step1)
3. [Using the Thing+ REST API with an OAuth Access token](#id-step2)
4. [Try some APIs](#id-step3)
5. [Code Samples](#id-step4)
6. [Thing+ REST API Quick Reference](#id-api)

---

## Step 1. Thing+ Service registration & Hardware installation
  - <a href="https://www.thingplus.net" target="_blank">Thing+ 포털</a>

### Step 1-1
  - Thing+ service registration is required
    - <a href="http://support.thingplus.net/ko/user-guide/registration.html" target="_blank">Thing+ service registration</a>

### Step 1-2
  - Hardware installation is required
    - [오픈하드웨어 지원 리스트](/ko/open-hardware/openhardware-list.html)

<div id='id-step1'></div>

## Step 2. Prerequisite

### Step 2-1. Postman for getting started with the Thing+ REST API
  - Install <a href="http://www.google.com/chrome" target="_blank">Google Chrome</a>
  - Install <a href="https://www.getpostman.com/docs/introduction" target="_blank">Postman</a>
    - <a href="https://chrome.google.com/webstore/detail/postman/fhbjgbiflinjbdggehcddcbncdddomop" target="_blank">Direct link for Chrome browser user</a>
    - You don't need to sign up, click the 'Go to the app' button
      <br> ![import](/assets/postman-first-launch.png)
    - Postman guide
      - <a href="https://www.getpostman.com/docs/launch" target="_blank">Launch Postman</a> and <a href="https://www.getpostman.com/docs/requests" target="_blank">Sending requests</a>

### Step 2-2. Import a Postman collection
  1. Click the 'Import' button
<br> ![import](/assets/import.png)
<br><br>
  2. Select the 'Download from link'
<br>![import link](/assets/import-link.png)
    - Add a below link
      - https://www.getpostman.com/collections/f1c2d8efb311d579eff6
    - Click the 'Import' button
<br><br>
  3. Close the modal

### Step 2-3. Check the imported collection

  1. Select 'Collections' tab and select 'Getting Started with the Thing+ REST API' collection

<br/>
<div id='id-step1-4'></div>
<br> 
![collection](/assets/collection.png)


### Step 2-4. Creating a Thing+ OAuth Client ID & Client Secret

1. Open Chrome browser on Chrome browser of a compute and <a href="https://www.thingplus.net/#/login" target="_blank">Sign in </a> to Thing+ Portal
<br> ![interceptor enable](/assets/sign-in.png)
<br><br>
2. Launch Postman
<br><br>
3. Enable interceptor
<br> ![interceptor enable](/assets/interceptor-enable.png)
<br><br>
4. Install interceptor
<br> https://chrome.google.com/webstore/detail/postman-interceptor/aicmkgpgakddgnaphhhpliifpcfhicfo
<br> ![interceptor enable](/assets/interceptor-install.png)
<br><br>
5. Getting a Client ID and Secret
<br> - HTTP Method: POST
<br> ![interceptor enable](/assets/oauth-client-id-secret.png)
<br> 1) Select a **_Getting a client ID and secret_** on the collection
<br> 2) Select a 'Body' tab
<br> 3) Select a 'raw'
<br> 4) Add a "reqId" for OAuth2.0 client credentials
<br>&nbsp;&nbsp;&nbsp;&nbsp;• Client ID is used to identify the application using Thing+ Rest API
<br>  5) Add a "clientSecret" for OAuth2.0 client credentials
<br>&nbsp;&nbsp;&nbsp;&nbsp;• Client Secret is used to authenticate the identity of the application using Thing+ Rest API
<br>  6) Add a "name"
<br>&nbsp;&nbsp;&nbsp;&nbsp;• This name is used to request access a user's account
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ex) your company or service name
<br> 7) You can change <a href="./oauth2.html#scopes" target="_blank">"Scopes"</a> if you need any change
       Scopes limit access for OAuth tokens
<br> 8) Click the 'Send' button
<br><br>
6. Check the '201 Created' result status
<br> ![interceptor enable](/assets/oauth-client-id-secret-success.png)
<br><br>
7. Disable interceptor
<br> ![interceptor disable](/assets/interceptor-disable.png)


### Step 2-5. Obtaining an OAuth Access token with <a href="./oauth2.html#authorization-code-grant-or-web-server" target="_blank">Authorization Code Grant</a> type

___An Access token Expires in 15 days (possibly can be changed without advance notification)___

1. Launch Chrome browser with below URL
  - replace **{CLIENT_ID}** and **{REDIRECT_URI}** to your Client ID and your Service URI
  - https://api.thingplus.net/v1/oauth2/authorize?response_type=code&client_id={CLIENT_ID}&redirect_uri={REDIRECT_URI}
    - **{CLIENT_ID}** : Thing+ OAuth Client ID to received at Step 1-4
    - **{REDIRECT_URI}** : The URL in your app where users will be sent after authorization
      - Ex) http://www.daliworks.net
  ![interceptor enable](/assets/oauth-authorize.png)
<br><br>
2. Click the 'Allow' button
<br><br>
3. Then Thing+ redirects back to your {redirect_uri} with "code" in url
  ![interceptor enable](/assets/oauth-code.png)
<br><br>
4. Exchange code for an OAuth Access token
<br> - HTTP Method: POST
<br> ![interceptor enable](/assets/oauth-exchange-code.png)
<br> 1) Select a **_Exchange code for an OAuth Access token_** on the collection
<br> 2) Select a 'Body' tab
<br> 3) Select a 'x-www-form-urlencoded' (application/x-www-form-urlencoded)
<br> 4) Add a "code" in url above
<br>&nbsp;&nbsp;&nbsp;&nbsp;• The code you received as a response in url above
<br> 5) Add a your "client_id"
<br>&nbsp;&nbsp;&nbsp;• The client ID you received from Thing+ when you registered your application
<br> 6) Add a your "client_secret"
<br>&nbsp;&nbsp;&nbsp;• The client secret you received from Thing+ when you registered your application
<br> 7) Add a your "redirect_uri"
<br>&nbsp;&nbsp;&nbsp;• The redirect URL when you registered your application
<br> 8) Click the 'Send' button
<br><br>
5. Check the '200 OK' result status and Access token

  ![interceptor enable](/assets/oauth-access-token.png)

<div id='id-step2'></div>

## Step 3. Using the Thing+ REST API with an OAuth Access token

### Step 3-1. Create a <a href="https://www.getpostman.com/docs/environments" target="_blank">Postman Environments</a>

1. Launch Postman

2. Select the 'Manage environments'
![environment](/assets/environment.png)

3. Click the 'Add' button
![environment add](/assets/environment-add.png)

4. Add a 'Key' and 'Value' and Click the 'Submit' button
![environment submit](/assets/environment-submit.png)
- Add a 'Thing+ Access Token' to 'New environment' field.
- Add a **AccessToken** (Case Sensitive) to 'Key' field.
- Add a your OAuth Access Token to 'Value' field.
- Close the modal

5. Select a 'Thing+ Access Token'
![import](/assets/environment-select.png)

**Now you are ready to use the Thing+ REST API with an OAuth Access token**

- 'Getting Started with the Thing+ REST API' collection uses {{AccessToken}} variable for the 'Authorization' http header
![environment variable](/assets/environment-variable.png)

<div id='id-step3'></div>

## Step 4. Try some APIs

#### **_Useful tip before trying some APIs with postman_**
  - Postman lets you generate code snippets in more than 15 languages.
  - <a href="http://blog.getpostman.com/2015/08/31/writing-front-end-api-code-with-postman" target="_blank">Writing front-end API code with Postman</a>
  ![environment variable](/assets/postman-code.png)

### Gateway
  - Reading gateways
    - Select a **_Reading gateways_** on the collection and Click the 'Send' button.
      - You can get your gateways's ID
    - Request URL
      - [GET] https://api.thingplus.net/v1/gateways
      - The response type is <a href="./rest-api.html#array" target="_blank">Array</a>

    ![http header](/assets/reading-gateways.png)

  - Reading gateways with queries
    - Select a **_Reading gateways_** on the collection and Click the 'Send' button.
    - Request URL
      - [GET] https://api.thingplus.net/v1/gateways?count=10
      - <a href="./rest-api.html#collection-queries" target="_blank">Table for Query Parameters</a>
      - The response type is <a href="./rest-api.html#object" target="_blank">Object</a>

  - Reading a specific gateway

    > To be updated

### Sensor
  - Reading sensors

    > To be updated

  - Reading sensors with queries

    > To be updated

  - Reading a specific sensor

    > To be updated


### Timeline
  - Reading Collection

    > To be updated

  - Reading Collection with queries

    > To be updated

<div id='id-step4'></div>
  - Reading a Item

    > To be updated



## Step 5. Code Samples

- [Sample apps](/ko/rest-api/api-samples.html)


<div id='id-api'></div>
---

## Thing+ REST API Quick Reference

|  Resource            |    Request URL
| -------------------- | ----------------------------------------------------------------------------
| gateways             | [GET] https://api.thingplus.net/v1/gateways
|                      | [GET] https://api.thingplus.net/v1/gateways?embed=sensors
| gateway              | [GET] https://api.thingplus.net/v1/gateways/{gatewayId}
|                      | [GET] https://api.thingplus.net/v1/gateways/{gatewayId}?embed=sensors
| gateway status       | [GET] https://api.thingplus.net/v1/gateways?embed=status
|                      | [GET] https://api.thingplus.net/v1/gateways/{gatewayId}?embed=status
|                      | [GET] https://api.thingplus.net/v1/gateways/{gatewayId}/status
| sensors              | [GET] https://api.thingplus.net/v1/gateways/{gatewayId}/sensors
| sensor               | [GET] https://api.thingplus.net/v1/gateways/{gatewayId}/sensors/{sensorId}
| sensor status        | [GET] https://api.thingplus.net/v1/gateways?embed=sensors&sensors[embed]=status
|                      | [GET] https://api.thingplus.net/v1/gateways/{gatewayId}?embed=sensors&sensors[embed]=status
|                      | [GET] https://api.thingplus.net/v1/gateways/{gatewayId}/sensors?embed=status
|                      | [GET] https://api.thingplus.net/v1/gateways/{gatewayId}/sensors/{sensorId}?embed=status
|                      | [GET] https://api.thingplus.net/v1/gateways/{gatewayId}/sensors/{sensorId}/status
| sensor value(latest) | [GET] https://api.thingplus.net/v1/gateways?embed=sensors&sensors[embed]=series
|                      | [GET] https://api.thingplus.net/v1/gateways/{gatewayId}?embed=sensors&sensors[embed]=series
|                      | [GET] https://api.thingplus.net/v1/gateways/{gatewayId}/sensors?embed=series
|                      | [GET] https://api.thingplus.net/v1/gateways/{gatewayId}/sensors/{sensorId}?embed=series
|                      | [GET] https://api.thingplus.net/v1/gateways/{gatewayId}/sensors/{sensorId}/series
| sensor value(series) | [GET] https://api.thingplus.net/v1/gateways/{gatewayId}?embed=sensors&sensors[embed]=series&sensors[series][dataStart]={startDate}&sensors[series][dataEnd]={endDate}&sensors[series][interval]=1m
|                      | [GET] https://api.thingplus.net/v1/gateways/{gatewayId}/sensors?embed=series&series[dataStart]={startDate}&series[dataEnd]={endDate}&series[interval]=1m
|                      | [GET] https://api.thingplus.net/v1/gateways/{gatewayId}/sensors/{sensorId}?embed=series&series[dataStart]={startDate}&series[dataEnd]={endDate}&series[interval]=1m
|                      | [GET] https://api.thingplus.net/v1/gateways/{gatewayId}/sensors/{sensorId}/series?dataStart={startDate}&dataEnd={endDate}&series[interval]=1m
| timelines            | [GET] https://api.thingplus.net/v1/timelines
| timeline             | [GET] https://api.thingplus.net/v1/timelines/{timelineId}

<div class='scrolltop'>
    <div class='scroll icon'><i class="fa fa-arrow-circle-up"></i></div>
</div>
