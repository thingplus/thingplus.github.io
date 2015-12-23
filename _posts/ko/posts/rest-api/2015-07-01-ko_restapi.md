---
title: REST-API
tags: "rest-api"
published: true
permalink: /ko/rest-api/rest-api.html
---
<div id='id-schema'></div>
REST APIs

1. [Schema](#id-schema)
2. [Base url](#id-url)
3. [Collection(Listing) response types](#id-types)
4. [Collection Queries](#id-queries)
5. [Series Queries for the sensor values](#id-series)
6. [Gateways](#id-gateways)
7. [Sensors](#id-sensors)
8. [Tags](#id-tags)
9. [Collection](#id-collection)


<div id='id-url'></div>
<br>
## Schema
  * All API access is over HTTPS
  * All data is sent and received as JSON

<br>
## Base url

    https://api.thingplus.net/v1

<div id='id-types'></div>
<br>
## Collection(Listing) response types
### Array

 - Default response type of collection for listing
 - The max to retrieve is 4000

```js
[
  {
    "key1": "value1",
    "key2": "value2",
    ...
  },
  {
    "key1": "value3",
    "key2": "value4",
    ...
  },
  ...
]
```

### Object

 - Object response type of collection for listing when URL parameters are used such as count, page, maxId, etc.
 - The maximum number to retrieve is 4000

```js
{
  "data": {
    {
      "key1": "value1",
      "key2": "value2",
      ...
    },
    {
      "key1": "value3",
      "key2": "value4",
      ...
    },
    ...
  },
  "_meta": {
    "count" : n,
    "page": m
  }
}
```

<div id='id-queries'></div>
<br>
## Collection Queries

Collection queries can be used with retrieving collection of resources such as gateways, tags, rules, etc.

__URL Parameters__

|      Name     |      Type     |                         Description                          
| ------------- | ------------- | ------------------------------------------------------------
| count         | integer       | The number of gateways to retrieve (default 4000)
| page          | integer       | The pagination number (default 0)
| orderBy       | string        | Field name to sort with
| orderDir      | string        | Sorting direction. asc(ascending, default) or desc(descending)
| fields        | string        | Fields to retrieve only
| filter        | string        | Filter conditions. 'and' for all the given conditions with different key. e.g. filter[owner]=sungil&filter[type]=humidity, 'or' with the same key; e.g. filter[id]=node1&filter[id]=node2
| embed         | string        | Embedding other resouces - sensors, devices, status

__Request URL__

```js
GET /gateways
GET /gateways?count=2&page=1&orderBy=id&orderDir=desc&fields=ctime&fields=virtual&filter[virtual]=y
```

__Response__

```js
{
  "data": [
    {
      "ctime": "1438781687866",
      "id": "ed13070a32dc4462aa13f70aa0891f39",
      "virtual": "y"
    },
    {
      "ctime": "1438781525642",
      "id": "ea04924f670a46ee988f5f7a5fc92731",
      "virtual": "y"
    }
  ],
  "_meta": {
    "count": 2,
    "page": 1
  }
}
```

<div id='id-series'></div>
<br>
## Series Queries for the sensor values

Series queries can be used with embed or series of sensors.

```js
GET /gateways/:owner/sensors/:id/series?dataStart=XXXX&dataEnd=YYYY....
GET /gateways/:owner/sensors/:id?embed=series&series[dataStart]=XXXX&series[dataEnd]=YYYY...
GET /gateways/:id?embed=sensors&sensors[embed]=series&sensors[series][dataStart]=XXXX&sensors[series][dataEnd]=YYYY...
```

Notes
* Query format follows [node querystring](https://github.com/visionmedia/node-querystring)
* Queries must be url encoded. [URL encoding](https://en.wikipedia.org/wiki/Percent-encoding)

* Date format (dataStart and dataEnd)
  - ISO 8610 (https://en.wikipedia.org/wiki/ISO_8601)
  - Time offsets from UTC is appended to the time in the same way that 'Z' is located, in the form ±[hh]:[mm] or ±[hh][mm]
    - 9 hours ahead of UTC (such as the time in Seoul), the zone designator would be "+09:00" or "+0900" (2015-08-25T15:00:00.000+09:00)
    - 8 hours behind of UTC (such as Pacific Time Zone), the zone designator would be "-08:00" or "-0800" (2015-08-24T22:00:00.000-08:00)

### Series Data

__URL Parameters__

|      Name     |      Type     |                         Description                          
| ------------- | ------------- | ------------------------------------------------------------
| dataStart     | string        | __Required__ The start date of series data to retrieve. Inclusive. ISO String format ("2015-08-12T01:19:08.315Z")
| dataEnd       | string        | The end date of series data to retrieve. Exclusive. ISO String format
| interval      | string        | The interval unit of sereis data in minutes(m), hours(h), or days(d). e.g. 0(raw data), 1m(default), 15m, 1h, 6h, 1d, etc.
| intervalFunc  | string        | Function to apply for the data in each interval. Functions are average(default), sum, count. This is ignored when the interval is 0.
| count         | integer       | The number of series data to retieve when the interval is 0(raw data). This is ignored when the interval is not 0.

__Request URL__

```js
GET /gateways/gateway-id-1/sensors/sensor-id-1/series?dataStart=2015-08-12T01:14:00.000Z&dataEnd=2015-08-12T02:14:00.000Z&interval=3m&intervalFunc=sum
```

__Response__

Response has series and the series has data and _meta.

    data: Array with repeating pair of value and date. Date is milliseconds since midnight Jan 1, 1970.

    _meta: Information about the retrieved series data
        - count: the number of series data
        - dataStart: the start date of retrieved series data (this could be different from the requested dataStart)
        - dataEnd: the end date of retrieved series data (this could be different from the requested dataEnd)
        - stat: the statistics function which is applied for the series data in each duration
        - interval: the interval unit of retrieved series data


```js
{
  "id": "sensor-id-1",
  "name": "Sensor Name 1",
  ...
  "series": {
    "sensor": "sensor-id-1",
    "time": "1439357435000",
    "type": "series",
    "series": "sensor-id-1",
    "owner": "gateway-id-1",
    "mtime": "1439357449914",
    "ctime": "1437556487697",
    "value": "33.25",
    "id": "series.sensor.-krKlN",
    "data": [
      297,
      1439341920000,
      924,
      1439342100000,
      924,
      1439342280000,
      ...
    ],
    "_meta": {
      "count": 21,
      "dataEnd": 1439345640000,
      "dataStart": 1439342040000,
      "stat": "sum",
      "interval": "3m"
    }
  },
}
```

__More examples for Queries__

```js

GET /gateways/gateway-id-1/sensors/sensor-id-1/series?dataStart=2015-08-12T01:14:00.000Z&dataEnd=2015-08-12T02:14:00.000Z&interval=3m&intervalFunc=sum

GET /gateways/gateway-id-1/sensors/sensor-id-1?embed=series&series[dataStart]=2015-08-12T01:14:00.000Z&series[dataEnd]=2015-08-12T02:14:00.000Z&series[interval]=3m&series[intervalFunc]=sum

GET /gateways/gateway-id-1/sensors?embed=series&series[dataStart]=2015-08-12T01:14:00.000Z&series[dataEnd]=2015-08-12T02:14:00.000Z&series[interval]=3m&series[intervalFunc]=sum

GET /gateways/gateway-id-1?embed=sensors&sensors[embed]=series&sensors[series][dataStart]=2015-08-12T01:14:00.000Z&sensors[series][dataEnd]=2015-08-12T02:14:00.000Z&sensors[series][interval]=3m&sensors[series][intervalFunc]=sum

GET /gateways?embed=sensors&sensors[embed]=series&sensors[series][dataStart]=2015-08-12T01:14:00.000Z&sensors[series][dataEnd]=2015-08-12T02:14:00.000Z&sensors[series][interval]=3m&sensors[series][intervalFunc]=sum
```


### Statistics Data

__URL Parameters__

|      Name     |      Type     |                         Description                          
| ------------- | ------------- | ------------------------------------------------------------
| dataStart     | string        | __Required__ The start date of series data to retrieve. Inclusive. ISO String format ("2015-08-12T01:19:08.315Z")
| dataEnd       | string        | The end date of series data to retrieve. Exclusive. ISO String format
| statFunc      | string        | __Required__ For statistics data for the series data, you must set statFunc and sub parameters.

__Sub Parameters of statFunc__

|      Name     |      Type     |                         Description                          
| ------------- | ------------- | ------------------------------------------------------------
| id            | string        | __Required__ Statistics function id. Now only "seriesStat" is available.
| timeUnit      | string        | Time unit of statistics data - hour, day(default), week, month, year
| subFunc       | string        | Function to apply for the data in each time unit. Functions are count, min, max, sum, avg, range, diff, first, last.


__Request URL__

```js
GET /gateways/gateway-id-1/sensors/sensor-id-1/series?dataStart=2015-08-11T02:00:00.000Z&dataEnd=2015-08-12T02:30:00.000Z&statFunc[id]=seriesStat&statFunc[timeUnit]=day&statFunc[subFunc]=count
```

__Response__

Response has series and the series has data and _meta.

    data: Array with repeating pair of value and time
        - value: key is represented as subFunc name
        - time: btime (base time)

    _meta: Information about the retrieved series data
        - gmt: GMT information. 0 is GMT 0 timezone (UTC+00:00).
        - count: the number of statistics data
        - dataStart: the start date of retrieved statistics data (this could be different from the requested dataStart)
        - dataEnd: the end date of retrieved statistics data (this could be different from the requested dataEnd)
        - stats: the statistics sub function(subFunc) which is applied for the series data in time unit
        - timeUnit: the time unit of retrieved statistics data


```js
{
  "id": "sensor-id-1",
  "name": "Sensor Name 1",
  ...
  "series": {
    "sensor": "sensor-id-1",
    "time": "1439359958000",
    "type": "series",
    "series": "sensor-id-1",
    "owner": "gateway-id-1",
    "mtime": "1439359970919",
    "ctime": "1437556487697",
    "value": "33.00",
    "id": "series.sensor.-krKlN",
    "data": [
      {
        "_id": {
          "year": 2015,
          "month": 8,
          "day": 11
        },
        "count": 12035,
        "btime": {
          "year": 2015,
          "month": 8,
          "day": 11
        }
      },
      {
        "_id": {
          "year": 2015,
          "month": 8,
          "day": 12
        },
        "count": 1665,
        "btime": {
          "year": 2015,
          "month": 8,
          "day": 12
        }
      }
    ],
    "_meta": {
      "gmt": 0,
      "timeUnit": "day",
      "stats": [
        "count"
      ],
      "count": 2,
      "dataEnd": 1439346600000,
      "dataStart": 1439258400000
      }
    },
  },
}
```

<div id='id-gateways'></div>
<br>
## Gateways

### List gateways

```js
GET /gateways
```

__URL Parameters__

`Reference Collection Queries`

__Response Fields__

|           Name         |      Type     |                         Description
| ---------------------- | ------------- | ------------------------------------------------------------
| id                     | string        | The ID of this gateway
| name                   | string        | The name of this gateway
| ctime                  | string        | The time this gateway was installed
| mtime                  | string        | The time this gateway was modified
| sensors                | array         | The list of IDs of installed sensors on this gateway
| devices                | array         | The list of IDs of installed devices on this gateway
| _site                  | string        | The ID of a site has this gateway
| _service               | string        | The ID of a service has this gateway
| status                 | string        | The status of this gateway
| reportInterval         | string        | The report interval of this gateway (ms)
| virtual                | string        | If this gateway is a virtual gateway, 'y', if not, "n"
| location               | string        | The location of this gateway (longitude, latitude and address)
| autoCreateDiscoverable | string        | determine to create devices and sensors which are discovered at a gateway automatically. 'y' or 'n'


__Response__

```js

[
  {
    "id": "gateway-id-1",
    "name": "Gateway Name 1",      
    "ctime": "1395923404888"
    "mtime": "1402639230552",        
    "sensors": [
      "sensor-id-1",
      "sensor-id-2"
    ],
    "devices": [
      "device-id-1",
      "device-id-2"
    ],  
    "_site": "site-id-1",
    "_service": "service-id-1",
    "status": "status.gateway.5F36S1",
    "reportInterval": "60000",
    "tree": "gateway-id-1",
    "model": 6,
    "deviceModels": [
      {
        "id": "device-id-1",
        "model": "deviceModelA"
      },
      {
        "model" "OneWire"
      }
    ],
    "virtual": "n",
    "autoCreateDiscoverable": "y",
    "location": {
      "longitude": 126.9919419,
      "latitude": 37.5608228,
      "address": "대한민국 서울특별시 중구 퇴계로 182"
    }  
  },
  {
    "id": "gateway-id-2",
    "name": "Gateway Name 2",      
    "ctime": "1395923404999"
    "mtime": "1402639230876",        
    "sensors": [
      "sensor-id-3",
      "sensor-id-4"
    ],
    "devices": [
      "device-id-4",
      "device-id-5"
    ],  
    "_site": "site-id-2",
    "_service": "service-id-2",
    "status": "status.gateway.tf365t",
    "reportInterval": "30000",
    "tree": "gateway-id-2",
    "model": 7,
    "deviceModels": [
      {
        "id": "device-id-3",
        "model": "deviceModelB"
      },
      {
        "model" "discoverableModelA"
      }
    ],      
    "virtual": "y",
    "autoCreateDiscoverable": "n",
    "location": {
      "longitude": 112.9919419,
      "latitude": 36.5608228,
      "address": "대한민국 대구 중구 반월당"
    }
  },
  ...    
]

```


### Create a gateway

> To be supported

### Read a gateway

```js
GET /gateways/:id
```

__URL Parameters__

|      Name     |      Type     |                         Description                          
| ------------- | ------------- | ------------------------------------------------------------
| fields        | string        | Fields to retrieve only
| embed         | string        | Embedding other resouces - sensors, devices, status

__Response__

```js
{
  "id": "gateway-id-1",
  "name": "Gateway Name 1",      
  "ctime": "1395923404888"
  "mtime": "1402639230552",        
  "sensors": [
    "sensor-id-1",
    "sensor-id-2"
  ],
  "devices": [
    "device-id-1",
    "device-id-2"
  ],  
  "_site": "site-id-1",
  "_service": "service-id-1",
  "status": "status.gateway.5F36S1",
  "reportInterval": "60000",
  "tree": "gateway-id-1",
  "model": 6,
  "deviceModels": [
    {
      "id": "device-id-1",
      "model": "deviceModelA"
    },
    {
      "model" "OneWire"
    }
  ],  
  "virtual": "n",
  "autoCreateDiscoverable": "y",
  "location": {
    "longitude": 126.9919419,
    "latitude": 37.5608228,
    "address": "대한민국 서울특별시 중구 퇴계로 182"
  }    
}
```

### Update a gateway

```js
PUT /gateways/:id
```

__Data parameters__

|      Name     |      Type     |                         Description                          
| ------------- | ------------- | ------------------------------------------------------------
| name          | string        | name of the gateway
| virtual       | string        | determine whether the gateway is a physical gateway or not. 'y' or 'n'
| autoCreateDiscoverable | string | determine to create devices and sensors which are discovered at a gateway automatically. 'y' or 'n'
| model         | string        | the model id of the gateway
| deviceModels  | array         | array of device models with device id and device model

__Request body__

```js
{
  "name": "Gateway New Name",
  "virtual": "y",
  "autoCreateDiscoverable": "n",
  "model": "6",
  "deviceModels":[
    {
      "id": "device-id-1",
      "model": "deviceModelA"
    },
    {
      "model": "OneWire"
    },
    ...
  ]
}
```

__Response__

```js
{
  "id": "gateway-id-1",
  "name": "Gateway New Name",      
  "ctime": "1395923404888"
  "mtime": "1422639230552",        
  "sensors": [
    "sensor-id-1",
    "sensor-id-2"
  ],
  "devices": [
    "device-id-1",
    "device-id-2"
  ],  
  "_site": "site-id-1",
  "_service": "service-id-1",
  "status": "status.gateway.5F36S1",
  "reportInterval": "60000",
  "tree": "gateway-id-1",
  "model": 6,
  "deviceModels": [
    {
      "id": "device-id-1",
      "model": "deviceModelA"
    },
    {
      "model" "OneWire"
    }
  ],  
  "virtual": "y",
  "autoCreateDiscoverable": "n",
  "location": {
    "longitude": 126.9919419,
    "latitude": 37.5608228,
    "address": "대한민국 서울특별시 중구 퇴계로 182"
  }    
}
```

### Delete a gateway

```js
DELETE /gateways/:id
```


### Get the status of a gateway

```js
GET /gateways/:id/status
GET /gateways/:id?embed=status
```

__Response Fields__

|      Name     |      Type     |                         Description
| ------------- | ------------- | ------------------------------------------------------------
| value         | string        | The status of this gateway, if gateway is alive, 'on', if not, 'off', and an error occurs, 'err'.
| exipreAt      | string        | After this time, this gateway will be considered as a broken gateway.
| gateway       | string        | The ID of a gateway has this status
| vtime         | string        | The time value of status was modified


__Response__

```js
{
  "id": "gateway-id-1",
  "name": "Gateway Name 1",
  ...
  "status": {
    "type": "status",
    "value": "off",
    "expireAt": "1402988413658",
    "vtime": "1402639230547",
    "owner": "gateway-id-1",
    "gateway": "gateway-id-1",
    "mtime": "1402988323660",
    "ctime": "1402639230549",
    "id": "status.gateway.5F36S1"
  }
}
```

### Set the status of a gateway


```js
PUT /gateways/:id/status
```

__Data parameters__

|      Name     |      Type     |                         Description                          
| ------------- | ------------- | ------------------------------------------------------------
| value         | string        | status code - on, off
| timeout       | integer       | timeout duration in seconds (valid duration of the last status)

__Request Body__

```js

{
  "value": "on",
  "timeout": 90
}
```


__Response__

```js

{
  "type": "status",
  "value": "on",
  "expireAt": "1402988503658",
  "vtime": "1439281782528",
  "owner": "gateway-id-1",
  "gateway": "gateway-id-1",
  "mtime": "1439281794060",
  "ctime": "1427295005363",
  "id": "status.gateway.5F36S1"
}
```
<div id='id-sensors'></div>

<br>
## Sensors

### List sensors of a gateway

```js
GET /gateways/:owner/sensors

:owner - gateway id
```

__URL Parameters__

|      Name     |      Type     |                         Description                          
| ------------- | ------------- | ------------------------------------------------------------
| fields        | string        | Fields to retrieve only
| embed         | string        | Embedding other resouces - series, status

__Response Fields__

|      Name     |      Type     |                         Description
| ------------- | ------------- | ------------------------------------------------------------
| id            | string        | The ID of this sensor
| name          | string        | The name of this sensor
| category      | string        | The category of this sensor ('sensor' or 'actuator')
| type          | string        | The type of this sensor (temperature, camera, etc...)
| deviceId      | string        | The ID of a device has this sensor
| virtual       | string        | If this sensor is installed on a virtual gateway, 'y', if not, 'n'
| owner         | string        | The ID of a gateway has this sensor


__Response__

```js
[
  {
    "network": "daliworks",
    "driverName": "daliworksEmulator",
    "model": "temperatureEmulator",
    "sequence": "1",
    "type": "temperature",
    "category": "sensor",
    "name": "temperature_1",
    "deviceId": "device-id-1",
    "virtual": "y",
    "owner": "gateway-id-1",
    "mtime": "1439177399477",
    "ctime": "1439177399315",
    "series": "series.sensor.au80VT",
    "status": "status.sensor.n6Dl-o",
    "id": "sensor-id-1"
  },
  ...    
]
```

### Create a sensor

```js
POST /gateways/:owner/sensors

:owner - gateway id
```

__Data parameters__

|      Name     |      Type     |                         Description                          
| ------------- | ------------- | ------------------------------------------------------------
| reqId         | string        | __Required__, __Unique__ id of the sensor.
| name          | string        | __Required__ name of the sensor
| deviceId      | string        | id of the device which the sensor belongs to
| type          | string        | __Required__ type of the sensor (temperature, humidity, etc.)
| network       | string        | __Required__ network of the device (sensorjs)
| address       | string        | address of the device (sensorjs)
| driverName    | string        | __Required__ driver name of the sensor (sensorjs)
| model         | string        | __Required__ model of the sensor (sensorjs)
| sequence      | string        | sequence of the sensor (sensorjs)
| category      | string        | category of the sensor (sensorjs) - sensor or actuator
| virtual       | string        | 'y' or 'n'

> Detail information about the sensorjs is [here](https://github.com/daliworks/sensorjs)

__Request body__

```js
{
  "reqId": "sensor-id-new",
  "name": "Sensor Name New",  
  "deviceId": "device-id-new",
  "type": "temperature",  
  "network": "daliworks",
  "address": "12",
  "driverName": "daliworksEmulator",
  "model": "temperatureEmulator",
  "sequence": "1",  
  "category": "sensor",      
  "virtual": "y"
}
```

__Response__

```js
{
  "id": "sensor-id-new",
  "name": "Sensor Name New",  
  "owner": "gateway-id-new",
  "deviceId": "device-id-new",
  "type": "temperature",  
  "network": "daliworks",
  "address": "12",
  "driverName": "daliworksEmulator",
  "model": "temperatureEmulator",
  "sequence": "1",  
  "category": "sensor",      
  "virtual": "y"
  "mtime": "1439177399477",
  "ctime": "1439177399315"
}
```

### Read a sensor

```js
GET /gateways/:owner/sensors/:id
```

__URL Parameters__

|      Name     |      Type     |                         Description                          
| ------------- | ------------- | ------------------------------------------------------------
| fields        | string        | Fields to retrieve only
| embed         | string        | Embedding other resouces - series, status

__Response__

```js
{
  "id": "sensor-id-3",
  "name": "Sensor Name New",  
  "owner": "gateway-id-3",
  "deviceId": "device-id-3",
  "type": "temperature",  
  "network": "daliworks",
  "address": "12",
  "driverName": "daliworksEmulator",
  "model": "temperatureEmulator",
  "sequence": "1",  
  "category": "sensor",      
  "virtual": "y"
  "mtime": "1439177399477",
  "ctime": "1439177399315",
  "series": "series.sensor.au80VT",
  "status": "status.sensor.n6Dl-o"  
}
```

### Update a sensor

```js
POST /gateways/:owner/sensors/:id

:owner - gateway id
```

__Data parameters__

|      Name     |      Type     |                         Description                          
| ------------- | ------------- | ------------------------------------------------------------
| name          | string        | name of the sensor
| deviceId      | string        | id of the device which the sensor belongs to
| type          | string        | __Required__ type of the sensor (temperature, humidity, etc.)
| network       | string        | __Required__ network of the device (sensorjs)
| address       | string        | address of the device (sensorjs)
| driverName    | string        | __Required__ driver name of the sensor (sensorjs)
| model         | string        | __Required__ model of the sensor (sensorjs)
| sequence      | string        | sequence of the sensor (sensorjs)
| category      | string        | category of the sensor (sensorjs) - sensor or actuator
| virtual       | string        | 'y' or 'n'

> Detail information about the sensorjs is [here](https://github.com/daliworks/sensorjs)

__Request body__

```js
{
  "name": "Sensor Name Update",  
  "deviceId": "device-id-update",
  "type": "temperature",  
  "network": "daliworks",
  "address": "12",
  "driverName": "daliworksEmulator",
  "model": "temperatureEmulator",
  "sequence": "1",  
  "category": "sensor",      
  "virtual": "y"
}
```

__Response__

```js
{
  "id": "sensor-id-new",
  "name": "Sensor Name Update",  
  "owner": "gateway-id-new",
  "deviceId": "device-id-update",
  "type": "temperature",  
  "network": "daliworks",
  "address": "12",
  "driverName": "daliworksEmulator",
  "model": "temperatureEmulator",
  "sequence": "1",  
  "category": "sensor",      
  "virtual": "y"
  "mtime": "1439177399477",
  "ctime": "1439177399315"
}
```

### Delete a sensor

```js
DELETE /gateways/:owner/sensors/:id

:owner - gateway id
```

### Get the status of a sensor

```js
GET /gateways/:owner/sensors/:id/status
GET /gateways/:owner/sensors/:id?embed=status

:owner - gateway id
```

__Response Fields__

|      Name     |      Type     |                         Description
| ------------- | ------------- | ------------------------------------------------------------
| value         | string        | The status of this sensor, if sensor is alive, 'on', if not, 'off', and an error occurs, 'err'.
| owner         | string        | The ID of a gateway has this sensor
| sensor        | string        | The ID of this sensor
| vtime         | string        | The time value of status was modified

__Response__

```js
{
  "id": "sensor-id-1",
  "name": "Sensor Name 1",
  ...
  "status": {
    "type": "status",
    "value": "on",
    "expireAt": "1439299922267",
    "vtime": "1439177399386",
    "owner": "gateway-id-1",
    "sensor": "sensor-id-1",
    "mtime": "1439299742268",
    "ctime": "1439177399443",
    "id": "status.sensor.n6Dl-o"
  }
}
```

### Set the status of a sensor

```js
PUT /gateways/:owner/sensors/:id/status

:owner - gateway id
```

__Data parameters__

|      Name     |      Type     |                         Description                          
| ------------- | ------------- | ------------------------------------------------------------
| value         | string        | status code - on, off
| timeout       | integer       | timeout duration in seconds (valid duration of the last status)

__Request Body__

```js
{
  "value": "on",
  "timeout": 90
}
```

__Response__

```js

{
  "type": "status",
  "value": "on",
  "expireAt": "1439300271037",
  "vtime": "1439300181037",
  "owner": "gateway-id-1",
  "sensor": "sensor-id-1",
  "mtime": "1439300181038",
  "ctime": "1439177400793",
  "id": "status.sensor.oS8azD"
}
```


### Get the value of a sensor

```js
GET /gateways/:owner/sensors/:id/series
GET /gateways/:owner/sensors/:id?embed=series

:owner - gateway id
```

__URL parameters__

`Reference Series Queries`

__Response Fields__

|      Name     |      Type     |                         Description
| ------------- | ------------- | ------------------------------------------------------------
| value         | string        | The value of this sensor
| time          | string        | The time value of this sensor is updated
| owner         | string        | The ID of a gateway has this sensor
| sensor        | string        | The ID of this sensor

__Response__

latest data (single value)

```js
{
  "id": "sensor-id-1",
  "name": "Sensor Name 1",
  ...
  "series": {
    "type": "series",
    "time": "1439300221649",
    "value": "14.83112687477842",
    "series": "sensor-id-1",
    "owner": "gateway-id-1",
    "sensor": "sensor-id-1",
    "mtime": "1439300222270",
    "ctime": "1439177399406",
    "id": "series.sensor.au80VT"
  }
}
```


series data (multiple values)

```js
{
  "id": "sensor-id-1",
  "name": "Sensor Name 1",
  ...
  "series": {
    "type": "series",
    "time": "1439300221649",
    "value": "14.83112687477842",
    "series": "sensor-id-1",
    "owner": "gateway-id-1",
    "sensor": "sensor-id-1",
    "mtime": "1439300222270",
    "ctime": "1439177399406",
    "id": "series.sensor.au80VT",
    "data": [
      "19.237424393650144",
      1439299381592,
      "13.001624119933695",
      1439299501596,
      ...    
    ],
    "_meta": {
      "count": 258,
      "dataEnd": 1439300772689,
      "dataStart": 1439270040000
    }  
  }
}
```


### Set the value of a sensor

```js
PUT /gateways/:owner/sensors/:id/series

:owner - gateway id
```

__Data parameters_

Arrary of time and value object

|      Name     |      Type     |                         Description                          
| ------------- | ------------- | ------------------------------------------------------------
| time          | long          | number of milliseconds since midnight Jan 1, 1970
| value         | string        | value of the sensor at the time

__Request body__

```js
[
  { time: 1402986075957, value: 30.34 },
  { time: 1402986135957, value: 32.56 },
  ...
]
```

<div id='id-tags'></div>
<br>
## Tags

### List tags

```js
GET /tags
```

__URL Parameters__

`Reference Collection Queries`


__Response__

```js
[
  {
    "id": "55",
    "ctime": "1439351528201",
    "_service": "1",
    "_user": "1",
    "name": "Tag Name 1",
    "_site": "1",    
    "mtime": "1439351528201",
    "sensors": [
      "sensor-id-1",
      "sensor-id-2"      
    ]
  },
  ...    
]

```


### Create a tag

```js
POST /tags
```

__Data parameters__

|      Name     |      Type     |                         Description                          
| ------------- | ------------- | ------------------------------------------------------------
| name          | string        | __Required__ name of the tag
| sensors       | array         | __Required__ array of sensor IDs

__Request body__

```js
{
  "name": "Tag Name 2",  
  "sensors": [
    "sensor-id-3",
    "sensor-id-4"    
  ]
}
```

### Read a tag

```js
GET /tags/:id
```

__URL Parameters__

|      Name     |      Type     |                         Description                          
| ------------- | ------------- | ------------------------------------------------------------
| fields        | string        | Fields to retrieve only
| embed         | string        | Embedding other resouces - sensors

__Response__

```js
{
  "id": "56",
  "name": "Tag Name 2",  
  "sensors": [
    "sensor-id-3",
    "sensor-id-4"    
  ],
  "ctime": "1439351528201",
  "mtime": "1439351528201",
  "_site": "1",
  "_service": "1",
  "_user": "1"
}
```

### Update a tag

```js
PUT /tags/:id
```

__Data parameters__

|      Name     |      Type     |                         Description                          
| ------------- | ------------- | ------------------------------------------------------------
| name          | string        | __Required__ name of the tag
| sensors       | array         | __Required__ array of sensor IDs

__Request body__

```js
{
  "name": "Tag Name 2 - Update",  
  "sensors": [
    "sensor-id-3",
    "sensor-id-4",
    "sensor-id-5"
  ]
}
```

__Response__

```js
{
  "id": "56",
  "name": "Tag Name 2 - Update",  
  "sensors": [
    "sensor-id-3",
    "sensor-id-4",
    "sensor-id-5"   
  ],
  "ctime": "1439351528201",
  "mtime": "1439351928201",
  "_site": "1",
  "_service": "1",
  "_user": "1"
}
```

### Delete a tag

```js
DELETE /tags/:id
```

<div id='id-collection'></div>
<br>
## Collection

### /{collection}

e.g. devices, rules, timelines, services, sites and etc.

```
Device
  /gateways/:owner/devices
  /gateways/:owner/devices/:id

  * :owner = gateway ID

Rule
  /rules
  /rules/:id

Timeline
  /timelines
  /timelines/:id

Service
  /services
  /services/:id

Site
  /sites
  /sites/:id
```

Note: query format follows [node querystring](https://github.com/visionmedia/node-querystring)


__URL Parameters__

`Reference Collection Queries`
`Reference Series Queries`

### /{collection}/{id}


### /timelines/{id}

__URL Parameters__

`Reference Collection Queries`

__Additional Parameters for timelines__

|      Name     |      Type     |                         Description                          
| ------------- | ------------- | ------------------------------------------------------------
| maxId         | long          | Max ID of timelines to retrieve
| sinceId       | long          | Since ID of timelines to retrieve

* maxId : reference [twitter api](https://dev.twitter.com/docs/working-with-timelines)
    * there’s no matching one : returns empty array.
    * inclusive
* sinceId : reference [twitter api](https://dev.twitter.com/docs/working-with-timelines)
    * exclusive

__Response__


```json
#> curl 'https://api.thingplus.net/v1/timelines?maxId=813837&sinceId=813800&filter[severity]=warning'

{
  "data": [
    {
      "node": [
        {
          "type": "sensor",
          "id": "temperature-1c7303085029433f974d0b4ce04fada8-1"
        }
      ],
      "type": "sensorValue",
      "rule": {
        "what": "email",
        "when": "temperature",
        "name": "1",
        "id": "65"
      },
      "checked": "n",
      "success": "y",
      "message": "<span><img src=\"images/icon-temperature-small.png\" width=\"16px\" height=\"16px\">&nbsp;18.62</span> <a href=\"#/gateways/1c7303085029433f974d0b4ce04fada8/sensors/temperature-1c7303085029433f974d0b4ce04fada8-1\">temperature_1</a>@<a href=\"#/asset?resourceType=gateway&itemId=1c7303085029433f974d0b4ce04fada8\">kkkk gw</a> (<span>Over: 2</span>)",
      "severity": "warning",
      "time": "1432115443465",
      "event": "temperature-1c7303085029433f974d0b4ce04fada8-1:1432115443465",
      "id": "813837"
    },
    ...
  ],
  "_meta": {
    "count": 3,
    "maxId": "813837",
    "sinceId": "813800"
  }
}
```

### /{users}/{id}/me

Get user information who is logined.

__Response__

```json
> curl 'https://api.thingplus.net/v1/users/me'

{
  "loginId": "user1",
  "email": "user1@example.com",
  "locale": "ko",
  "timezone": "+9.00",
  "country": "kr",
  "accessApproval": "allow",
  "_service": "1",
  "_site": "1",
  "roles": [
    "serviceAdmin",
    "user:1"
  ],
  "mtime": "1432626556979",
  "ctime": "1418189336791",
  "billing": "user:1",
  "verifiedEmail": "user1@example.com",
  "billingLimit": "user:1:limit",
  "billingCurrent": "user:1:current",
  "billingMeter": "user:1:meter",
  "mobile": "010-11111111",
  "id": "1"
}
```


<div class='scrolltop'>
    <div class='scroll icon'><i class="fa fa-arrow-circle-up"></i></div>
</div>
