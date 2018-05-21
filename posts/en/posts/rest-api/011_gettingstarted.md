---
title: Getting Started
tags: "rest-api"
published: false
img: ic-tutorial.png
permalink: /en/rest-api/getting-started.html
---

1. [How to use the Thing+ API](#id-introduction)
  - [Introduction](#id-introduction)
  - [Possible Scopes](#id-scope)
  - [Requirements](#id-requrements)
  - [Preparation Required to Set Up a Token](#id-setup-Token)
  - [Notice](#id-notice)
  - [How to use](#id-how-to-use)
2. [How to get OAuth Access Token](#id-how-to-get-oauth-access-token-api-key)
  - [Process to Create an Access Token](#id-how-to-get-oauth-access-token-api-key)
  - [Scopes](#id-auth-scope)
  - [Setting an Authentication Format](#id-authentication-format)
3. [Query String](#id-query-string)
  - [General](#id-general)
  - [Series](#id-series)
  - [Statistics](#id-statistics)
  - [Notes](#id-notes)
4. [API Response](#id-api-responses)
  - [Thing+ API Response Structure](#id-api-response-structure)
  - [Meta data](#id-meta-data)
  - [Status Codes](#id-status-code)
  - [Error Codes](#id-error-code)


---


<div id='id-introduction'></div>
<br/><br/>

## How to use the Thing+ API

### Introduction

---


Here we explain the APIs provided by `Thing+`.

We provide `Thing+ APIs` for `3rd parties` who want to use Thing+'s various functionality directly. We are currently expanding the scope of the functionality of our API and expect that nearly all functionality seen on the standard platform webapp (located at thingplus.net) can also be accessed via API.

<div id='id-scope'></div>
<br/><br/>

### Possible Scopes

---

The resources accessible with the `Thing+ API` are decided by the `scope` used.

You can refer to `Scope` at [How to get OAuth Access Token](#id-how-to-get-oauth-access-token-api-key) for a detailed intro.

<div id='id-requrements'></div>
<br/><br/>

### Requirements

--- 

You need the `authority` for each resource to use the `Thing+ API` - authority can be obtained via `OAuth2`.

The detailed guide to `OAuth2` is located [here](./oauth2.html).

The authorities for each resource can be enabled with a `token`.

You need to prepare in advance to obtain a `Token`


<div id='id-setup-Token'></div>
<br/><br/>

### Preparation Required to Set Up a Token

---

You need to create an `authClient` in advance.

You create an `authClient` with [Create authClients](https://thingplus.api-docs.io/2.0/oauth2/create-authclients) and obtain a `token` using `authClient`.

We offer two ways to obtain OAuth tokens.

> url 수정 필요
1.  [OAuth2Token - Authorization Code Grant](./oauth2.html#id-oauth-author)
2.  [OAuth2Token - Resource Owner Password Credentials Grant](https://thingplus.api-docs.io/2.0/oauth2/oauth2token-1)

You may then use the obtained token by inputting it into a `Request Header`.

If you want to delegate resource privileges to specific users, use the `1\. Authorization Code grant` method.

If you want to access resources of with a management scope that requires the authority of an administrator (Admin), please use the `2\. Resource owner password credentials grant` method.

You can find more datails [here](https://github.com/daliworks/thingplus-guide/blob/master/doc/README_en.md#22-for-utilizing-oauthapp)

At our API Document Site, we use the `2\. Resource owner password Credentials grant` method for convenience.


<div id='id-notice'></div>
<br/><br/>

### Notice

---

> url 수정 필요
At [https://thingplus.api-docs.io](https://thingplus.api-docs.io/), you can not do [Create authClients](https://thingplus.api-docs.io/2.0/oauth2/create-authclients), which is a preparation-only process.

Create an `authClient` using a separate application.

Go [here](http://support.thingplus.net/en/rest-api/getting-started.html#id-step1), to create an `AuthClient`, where the process is explained in detail.

If you have successfully created an `authClient`, you can now make a real request using `request try` in [https://thingplus.api-docs.io](https://thingplus.api-docs.io/).

Go to [OAuth2Token - Resource Owner Password Credentials Grant](https://thingplus.api-docs.io/2.0/oauth2/oauth2token-1) and use the `authClient` you created to get your `OAuth Token`


<div id='id-how-to-use'></div>
<br/><br/>

### How to use

---

Use the obtained `Token` in `Request Header`.

Use `token_type` and the `access_token` of your Token API `response`.

Add an `Authorization` field to `Header` and input your wanted value in the form of `{token_type} {access_token}`.

> ex) Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.ezcxfQ.BfgfVvKhvTOwlYHSzcFPQl-0c

Finally, you can check the information of the user who acquired the privilege through the [Get My Account](https://thingplus.api-docs.io/2.0/users/get-my-account) API.

If you have successfully received a `Response`, everything is ready to go.

Next step - explore and test our other APIs.


<div id='id-how-to-get-oauth-access-token-api-key'></div>
<br/><br/>

## How to get OAuth Access Token

### Process to Create an Access Token

---

In order to use the apis in this document, you will need to get an OAuth2 access token.

Please follow the following process to do so: [Process to Create an Access Token](http://support.thingplus.net/en/rest-api/getting-started.html#id-step1)

After acquiring the access token, set the access token string into your `Authentication` field in the Headers section of the `Try it out` tab located on every API.


<div id='id-auth-scope'></div>
<br/><br/>

### Scopes

---

Scopes let you specify exactly what type of access you need. Scopes limit access when using OAuth tokens. They do not grant any additional permission beyond that which the user already has.

For the Authorization Code Grant, requested scopes will be displayed to the user on the authorize form.

| Scope | Name | resources (API) | Description |
| --- | --- | --- | --- |
| (no scope) |  |  | Cannot access any scopes |
| user-profile | User Profile Read and Update | users/me, /changePassword | ***TBD*** Read and update the profile of the user |
| user-profile-read | User Profile Read | users/me | Read the profile of the user |
| gateway | Gateway Ceate/Read/Update/Delete | /gateways, /registerGateway, /registerGatewayKey, /manageGateway, /controlActuator, /sensorTypes, /sensorDrivers, /gatewayModels | Register a gateway/device/sensor and read, update, delete gateways/devices/sensors for which the user has permissions |
| gateway-read | Gateway Read | /gateways, /controlActuator | Read gateways/devices/sensors and control actuator for which the user has permissions |
| gateway-update | Gateway Read/Update | /gateways, /manageGateway, /controlActuator | Read and update gateways/devices/sensors, control actuator, and manage the gateways for which the user has permissions |
| timeline-read | Timeline Read | /timelines | Read timelines of the user |
| tag | Tag Ceate/Read/Update/Delete | /tags | Create, read, update and delete tags of the user |
| tag-read | Tag Read | /tags | Read tags of the user |
| rule | Rule Read/Update/Delete | /rules, /pushDevices | ***TBD*** Read, update and delete rules of the user |
| rule-read | Rule Read | /rules | Read rules of the user |
| service-read | Service Read | /services | Read service for which the user is registered |
| site-read | Site Read | /site | Read site in which the user is registered |
| billing-read | Billing Read | /billings | ***TBD*** Read billing information of the user |

***TBD*** : Not available now


<div id='id-authentication-format'></div>
<br/><br/>

### Setting an Authentication Format

---

Setting an `Authentication` format is done via the following:

```
'Bearer {your access token}'
```

Real example looks like this.

```
Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VySWQiOiIwIiwiY2xpZWiLCJpYXQiOjEG9vm5V9bZZBOAwQElq1pCZ1Q
```

<div id='id-query-string'></div>
<br/><br/>

## Query String

### Queries

---

Collection queries can be used with retrieving collection of resources such as gateways, sensors, rules, etc.

queries can be used with embed or series of sensors.

We provide three kinds of queries.

1.  General (every collections API)
2.  for Series Data (using [Get Gateway-status](https://thingplus.api-docs.io/2.0/gateway-status/get-gateway-status), [Get Sensor-series](https://thingplus.api-docs.io/2.0/sensor-series/get-sensor-series))
3.  for Statistics Data (using [Get Sensor-series](https://thingplus.api-docs.io/2.0/sensor-series/get-sensor-series))


<div id='id-general'></div>
<br/><br/>

### General

---

| Name | Type | Description |
| --- | --- | --- |
| count | integer | The number of gateways to retrieve (maximum 4000) |
| page | integer | The pagination number (default 0) |
| orderBy | string | Field name to sort with |
| orderDir | string | Sorting direction. asc(ascending, default) or desc(descending) |
| fields | string | Fields to retrieve only |
| filter | string | Filter conditions. 'and' for all the given conditions with different key. e.g. filter[owner]=sungil&filter[type]=humidity, 'or' with the same key; e.g. filter[id]=node1&filter[id]=node2 |
| embed | string | Embedding other resouces - sensors, devices, status |
| start | string | The start date of data to retrieve. Inclusive. ISO String format ("2015-08-12T01:19:08.315Z") |
| end | string | The end date of data to retrieve. Exclusive. ISO String format |

#### Example

```
GET /gateways
GET /gateways?count=2&page=1&orderBy=id&orderDir=desc&fields=ctime&fields=virtual&filter[virtual]=y

```


<div id='id-series'></div>
<br/><br/>

### Series

---

You can using series API or status API.

- We don't ready for provide a list of sensor status. (already provide a list of gateway status)

| Name | Type | Description |
| --- | --- | --- |
| dataStart | string | **Required** The start date of series data to retrieve. Inclusive. ISO String format ("2015-08-12T01:19:08.315Z") |
| dataEnd | string | The end date of series data to retrieve. Exclusive. ISO String format |
| count | integer | The number of series data to retieve when the interval is 0(raw data). This is ignored when the interval is not 0. (maximum 10080) |
| interval | string | **Series only** The interval unit of sereis data in minutes(m), hours(h), or days(d). e.g. 0(raw data), 1m(default), 15m, 1h, 6h, 1d, etc. |
| intervalFunc | string | **Series only** Function to apply for the data in each interval. Functions are average(default), sum, count. This is ignored when the interval is 0. |

#### Example

```
GET /gateways/:owner/sensors/:id/series?dataStart=XXXX&dataEnd=YYYY....
GET /gateways/:owner/sensors/:id?embed=series&series[dataStart]=XXXX&series[dataEnd]=YYYY...
GET /gateways/:id?embed=sensors&sensors[embed]=series&sensors[series][dataStart]=XXXX&sensors[series][dataEnd]=YYYY...

GET /gateways/gateway-id-1/sensors/sensor-id-1/series?dataStart=2015-08-12T01:14:00.000Z&dataEnd=2015-08-12T02:14:00.000Z&interval=3m&intervalFunc=sum

```


<div id='id-statistics'></div>
<br/><br/>

### Statistics

---

| Name | Type | Description |
| --- | --- | --- |
| dataStart | string | **Required** The start date of series data to retrieve. Inclusive. ISO String format ("2015-08-12T01:19:08.315Z") |
| dataEnd | string | The end date of series data to retrieve. Exclusive. ISO String format |
| statFunc | string | **Required** For statistics data for the series data, you must set statFunc and sub parameters. |

**Sub Parameters of statFunc**

| Name | Type | Description |
| --- | --- | --- |
| id | string | **Required** Statistics function id. Now only "seriesStat" is available. |
| subFunc | string | Function to apply for the data in each time unit. Functions are count, min, max, sum, avg, range, diff, first, last. |
| timeUnit | string | Time unit of statistics data - hour, day(default), week, month, year |
| timeInerval | string | Time interval of statistics data. Now only for "hour" timeUnit. 2, 3, 4, 6, 8, 12 are available. If you enter other numbers which is not included in the numbers, you will receive a result of 1hour interval. |

#### Example

```
GET /gateways/gateway-id-1/sensors/sensor-id-1/series?dataStart=2015-08-12T01:14:00.000Z&dataEnd=2015-08-12T02:14:00.000Z&interval=3m&intervalFunc=sum

GET /gateways/gateway-id-1/sensors/sensor-id-1?embed=series&series[dataStart]=2015-08-12T01:14:00.000Z&series[dataEnd]=2015-08-12T02:14:00.000Z&series[interval]=3m&series[intervalFunc]=sum

GET /gateways/gateway-id-1/sensors?embed=series&series[dataStart]=2015-08-12T01:14:00.000Z&series[dataEnd]=2015-08-12T02:14:00.000Z&series[interval]=3m&series[intervalFunc]=sum

GET /gateways/gateway-id-1?embed=sensors&sensors[embed]=series&sensors[series][dataStart]=2015-08-12T01:14:00.000Z&sensors[series][dataEnd]=2015-08-12T02:14:00.000Z&sensors[series][interval]=3m&sensors[series][intervalFunc]=sum

GET /gateways?embed=sensors&sensors[embed]=series&sensors[series][dataStart]=2015-08-12T01:14:00.000Z&sensors[series][dataEnd]=2015-08-12T02:14:00.000Z&sensors[series][interval]=3m&sensors[series][intervalFunc]=sum

```


<div id='id-notes'></div>
<br/><br/>

### Notes

---

- Query format follows [node querystring](https://github.com/visionmedia/node-querystring)

- Queries must be url encoded. [URL encoding](https://en.wikipedia.org/wiki/Percent-encoding)

- Date format (dataStart and dataEnd)

    -   ISO 8610 <https://en.wikipedia.org/wiki/ISO_8601>
    -   Time offsets from UTC is appended to the time in the same way that 'Z' is located, in the form ±[hh]:[mm] or ±[hh][mm]
        -   9 hours ahead of UTC (such as the time in Seoul), the zone designator would be "+09:00" or "+0900" (2015-08-25T15:00:00.000+09:00)
        -   8 hours behind of UTC (such as Pacific Time Zone), the zone designator would be "-08:00" or "-0800" (2015-08-24T22:00:00.000-08:00)


<div id='id-api-responses'></div>
<br/><br/>

## API Response

### API Responses

---

The following includes responses you might see from the API And The maximum number to retrieve is 4000 when get Collection


<div id='id-api-response-structure'></div>
<br/><br/>

### Thing+ API Response Structure

---


```
{
  "statusCode": 200
  "message": "OK",
  "data": {
    //Data. It will be object when your response is single. Or it will be array when your response is not a single
  },
  "_meta": {
    //optional. You can get a _meta object when you use query or exceed count of result data
  },
  "errors": [
    //An error of some sort
  ]
}

```

| field | Type | Description |
| --- | --- | --- |
| statusCode | number | http response status code |
| message | string |  |
| data | object or array | api result when successful |
| _meta | object | metadata of result data |
| errors | array | api error result during a failure |


<div id='id-meta-data'></div>
<br/><br/>

### Meta data

---

```
"_meta": {
  // flexible
}

```

Some Response has _meta with data.

Metadata is included on Response Object when Collection API or using querystring. Meta Object has `information of retrieved data`.

|  field |  Type |  Description |
| --- | ---- | --- |
| count | number | the number of retrieved data |
| page | number | The pagination number. total page is result of [total/count] |
| total | number | the number of total data |
| maxCount | number | limited count of retrieved |
| start | number |  |
| end | number |  |
| dataStart | number | the start date of retrieved series(or statistics) data (this could be different from the requested dataStart) |
| dataEnd | Number | the end date of retrieved series(or statistics) data (this could be different from the requested dataEnd) |
| stat | string | the statistics function(or subFunc) which is applied for the series data in each duration |
| interval | string | the interval unit of retrieved series data |
| timeUnit | string | the time unit of retrieved statistics data |
| gmt | number | GMT information. 0 is GMT 0 timezone (UTC+00:00) (only for statistics data) |

<div id='id-status-code'></div>
<br/><br/>

### Status Codes

---

The http response status code is the same as listed here.

| StatusCode | Description | example |
| --- | --- | --- |
| 200 | OK |  |
| 201 | Created |  |
| 204 | No Content |  |
| 207 | Multi-Status | Gateway was created successfully, but sensor creation failed when using 'registerGateway' |
| 400 | Bad Request |  |
| 401 | Unauthorized |  |
| 403 | Forbidden | Happens when you try to access a resource that you do not have permissions for |
| 404 | Not Found |  |
| 409 | Conflict | The resource already exists when you attempt to create it |
| 429 | Too Many Requests |  |
| 444 | Unknown |  |
| 471 | Billing (Temporary) | Your current billing plan is preventing you from adding the gateway, sensor, device, etc.. - see the "billing" UI for an overview of your current settings |
| 500 | Internal Server Error |  |
| 504 | Gateway Time-out | The gateway timed out - usually occurs when attempting to use `controlActuator` |
| 600 | Gateway Error |  |


<div id='id-error-code'></div>
<br/><br/>

### Error Codes

---

Thing+ API Error Categories & Codes are `strings`

| Category | Code | Description |
| --- | --- | --- |
| REQUEST_ERROR | SCHEMA_VALIDATE | schema validation failed |
|  | NOT_FOUND | resource was not found |
|  | MISMATCH_ERROR | request value is not equal to the value in the DB |
|  | CONFLICT | resource already exists |
|  | JSON_PARSING | there was a json parsing exception |
|  | INVALID_INPUT | wrong parameter used |
| AUTHENTICATION_ERROR | NEED_LOGIN | a correct login is required |
| AUTHORIZATION_ERROR | ACCESSGROUP_DENY | ACL denied access |
|  | ACL_DENY | ACL denied access |
| SERVER_ERROR | USER_ERROR | internal error |
|  | AUTH_ERROR | internal error |
|  | ACL_ERROR | internal error |
|  | LIBRARY_ERROR | internal error |
|  | INTERNAL_ERROR | internal error |
| DB_ERROR | RELATION_ERROR | internal error |
|  | QUERY_RESULT_EMPTY | internal error |
|  | NOT_FOUND_IN_ITEM | internal error |
|  | DB_INTERNAL_ERROR | internal error |
| BILLING_ERROR | BILLING | need increase billing |
| GATEWAY_ERROR | PROCESS_COMMAND_RESULT | unknown error when receiving a result from the gateway |
| UNKNOWN | - |  |

<div class='scrolltop'>
    <div class='scroll icon'><i class="fa fa-arrow-circle-up"></i></div>
</div>