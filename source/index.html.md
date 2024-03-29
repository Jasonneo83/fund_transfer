---
title: Fund Transfer API

language_tabs: # must be one of https://git.io/vQNgJ
  - csharp

includes:
  - verification

search: true

code_clipboard: true

meta:
  - name: Fund Transfer API
    content: Fund Transfer API documentation
---

# API Calls

## Create Player 创建玩家帐号接口

 | | 
-|-|-
Function Class 接口: | `createMember.aspx`
Request 请求类型: | `GET`
Response 回传格式: | `application/json`

**Input Data Type 请求资料型态**

> Example 范例:  
> `<API_URL>/createMember.aspx?operatorcode=xxx&username=xxx&signature=xxx`

Fields 参数 |	Type 资料型态 | Req 必要 | Description 参数说明
------------|--------------|----------|---------------------
operatorcode |String 字串 |Y 是 |Operator code 代理号
username<br/><span class='red'><b>* Use lowercase<br/>*小写</b></span> |String 字串 |Y 是 |Player user name 会员账号<br/><br/>Min Length : 3 character 最短长度：3位<br/>Max Length : 12 character 最大长度：12位
signature |String 字串 |Y 是 |MD5 encryption string MD5 加密字符串


**Response Data Type 回传资料型态**

Fields 参数  |	Type 资料型态 	| Description 参数说明
------------|--------------|---------------------
errCode |String 字串 |Error Code 报错码
errMsg |String 字串 |Error Message 报错内容

**Signature Formula 加密字符串:  
<span class='red'>Signature = MD5(operatorcode + username +secret_key), then convert to uppercase 加密后转大写.</span>**

**Remark 备注:
refer to <a class='red' href='#e-special-request-on-launch-game'>Appendix E</a> QnA, question 1 请参考<a class='red' href='#e-special-request-on-launch-game'>Appendix附件 E</a> 常见疑问, 问题 1**


## Get Balance 获取余额接口

 | | 
-|-|-
Function Class 接口: | `getBalance.aspx`
Request 请求类型: | `GET`
Response 回传格式: | `application/json`

**Input Data Type 请求资料型态**

> Example 范例:  
> `<API_URL>/getBalance.aspx?operatorcode=xxx&providercode=xxx&username=xxx&password=xxx&signature=xxx`

Fields 参数 |	Type 资料型态 | Req 必要 | Description 参数说明
------------|--------------|----------|---------------------
operatorcode |String 字串 |Y 是 |Operator code 代理号
providercode |String 字串 |Y 是 |Provider code 供应商号
username<br/><span class='red'><b>* Use lowercase<br/>* 小写</b></span> |String 字串 |Y 是 |Player user name 会员账号<br/><br/>Min<br/>Length : 3 character 最短长度：3位<br/>Max Length : 12 character 最大长度：12位
password |String 字串 |Y 是 |User password 账号密码<br/><br/>Max Length : 12 character 最大长度：12位
signature |String 字串 |Y 是 |MD5 encryption string MD5 加密字符串


**Response Data Type 回传资料型态**

Fields 参数  |	Type 资料型态 	| Description 参数说明
------------|--------------|---------------------
errCode |String 字串 |Error Code 报错码
balance |Double 小数点 |Player Balance 所查询游戏账号余额
errMsg |String 字串 |Error Message 报错内容

**Signature Formula 加密字符串:  
<span class='red'>Signature = MD5(operatorcode + password + providercode + username + secret_key), then convert to uppercase 加密后转大写.</span>**



## Make Transfer 资金转账接口

 | | 
-|-|-
Function Class 接口: | `makeTransfer.aspx`
Request 请求类型: | `GET`
Response 回传格式: | `application/json`

**Input Data Type 请求资料型态**

> Example 范例:  
> `<API_URL>/makeTransfer.aspx?operatorcode=xxx&providercode=xxx&username=xxx&password=xxx&referenceid=xxx&type=xxx&amount=xxx&signature=xxx`

Fields 参数 |	Type 资料型态 | Req 必要 | Description 参数说明
------------|--------------|----------|---------------------
operatorcode |String 字串 |Y 是 |Operator code 代理号
providercode |String 字串 |Y 是 |Provider code 供应商号
username |String 字串 |Y 是 |Player user name 会员账号<br/><br/>Min Length : 3 character 最短长度：3位<br/>Max Length : 12 character 最大长度：12位
password |String 字串 |Y 是 |User password 账号密码<br/><br/>Max Length : 12 character 最大长度：12位
referenceid |String 字串 |Y 是 |Reference ID 转账单据号<br/><br/>Max Length : 20 character 最大长度：20位
type |String 字串 |Y 是 |1 withdraw 提出<br/>0 deposit 存入
amount |Double小数点 |Y 是 |Please take note some provider unable to transfer decimal, more info please refer to technical<br/>请留意某些供应商并不支持带小数的转账金额，请咨询技术了解详情<br/><br/>ALWAYS send TRUE VALUE(ratio 1:1) across all currency<br/>所有货币皆以(1:1比率)发送请求
signature |String 字串 |Y 是 |MD5 encryption string MD5 加密字符串

**Response Data Type 回传资料型态**

Fields 参数  |	Type 资料型态 	| Description 参数说明
------------|--------------|---------------------
errCode |String 字串 |Error Code 报错码
errMsg |String 字串 |Error Message 报错内容

**Signature Formula 加密字符串:  
<span class='red'>Signature = MD5(amount + operatorcode + password + providercode + referenceid + type + username + secret_key), then convert to uppercase 加密后转大写. </span>**




## Launch Games 启动游戏接口

 | | 
-|-|-
Function Class 接口: | `launchGames.aspx`
Request 请求类型: | `GET`
Response 回传格式: | `application/json`

**Input Data Type 请求资料型态**

> Example 范例:  
> `<API_URL>/launchGames.aspx?operatorcode=xxx&providercode=xxx&username=xxx&password=xxx&type=xxx&gameid=xxx&lang=xxx&html5=xxx&signature=xxx&blimit=xx`

Fields 参数 |	Type 资料型态 | Req 必要 | Description 参数说明
------------|--------------|----------|---------------------
operatorcode |String 字串 |Y 是 |Operator code 代理号
providercode |String 字串 |Y 是 |Provider code 供应商号<br/><br/><b>* Provider Code below please refer to </b><a class='red' href='#e-special-request-on-launch-game'>Appendix E</a><br/>1) S2<br/>2) P3
username<br/><span class='red'><b>\* Use lowercase<br/>\* 小写</b></span> |String 字串 |Y 是 |Player user name 会员账号<br/><br/>Min Length : 3 character 最短长度：3位<br/>Max Length : 12 character 最大长度：12位
password |String 字串 |Y 是 |User password 账号密码<br/><br/>Max Length : 12 character 最大长度：12位
type |String 字串 |Y 是 |Please refer to<br/>1. Game Type Code for the categories<br/>For example: SL = slot<br/><br/>and<br/>2. SUPPORTED GAME TYPE CODE in Provider Code table 各自供应商所支持的游戏类型<br/>For example: GS only support SL games
gameid |String 字串 |N 否 |Game ID<br/>游戏代号<br/><br/>Ignore this field/0 will go to game lobby<br/>可以忽略此参数，预设为‘0’即可直接进入相关游戏厅
lang |String 字串 |N 否 |ISO 639-1, default language en-US<br/>ISO 639-1, 默认语言为en-US
html5 |String 字串 |N 否 |html5=0, for flash(not mobile friendly)<br/>html5=1, for html5(mobile friendly)<br/>html5=0, 使用flash;<br/>html5=1, 使用html5(手机优化页面)
signature |String 字串 |Y 是 |MD5 encryption string MD5 加密字符串
blimit |String 字串 |N 否 |Bet limit id/group (currently only support product/provider code GA,AG,GE)<br/>投注限额 id/group (目前只有GA,AG,GE 供应商号能使用)

**Response Data Type 回传资料型态**

Fields 参数  |	Type 资料型态 	| Description 参数说明
------------|--------------|---------------------
errCode |String 字串 |Error Code 报错码
gameUrl |String 字串 |Launch Game Url 游戏链接
errMsg |String 字串 |Error Message 报错内容

**Signature Formula 加密字符串:  
<span class='red'>Signature = MD5(operatorcode + password + providercode + type + username + secret_key), then convert to uppercase 加密后转大写. </span>**



## Launch DEMO Games 启动试玩游戏接口

 | | 
-|-|-
Function Class 接口: | `launchDGames.ashx`
Request 请求类型: | `GET`
Response 回传格式: | `application/json`

**Input Data Type 请求资料型态**

> Example 范例:  
> `<API_URL>/launchDGames.ashx?providercode=xxx&type=xxx`

Fields 参数 |	Type 资料型态 | Req 必要 | Description 参数说明
------------|--------------|----------|---------------------
operatorcode |String 字串 |Y 是 |Operator code 代理号
providercode |String 字串 |Y 是 |Provider code 供应商号
type |String 字串 |Y 是 |Please refer to Game Type Code Below<br/>请参考附录{游戏类型}列表
gameid |String 字串 |N 否 |Game ID<br/>游戏代号<br/><br/>Ignore this field/0 will go to game lobby<br/>可以忽略此参数，预设为‘0’即可直接进入相关游戏厅
lang |String 字串 |N 否 |ISO 639-1, default language en-US<br/>ISO 639-1, 默认语言为en-US
html5 |String 字串 |N 否 |html5=1, for html5(mobile friendly)<br/>html5=1, 使用html5(手机优化页面)

**Response Data Type 回传资料型态**

Fields 参数  |	Type 资料型态 	| Description 参数说明
------------|--------------|---------------------
errCode |String 字串 |Error Code 报错码
gameUrl |String 字串 |Launch Game Url 游戏链接
errMsg |String 字串 |Error Message 报错内容

**Remark 备注:  
Currently only 3 providercode support demo game. 获取游戏测试链接目前只支持以下3个供应商 WF, GT, IB.**



## Update Player Password 更新玩家密码接口

 | | 
-|-|-
Function Class 接口: | `changePassword.aspx`
Request 请求类型: | `GET`
Response 回传格式: | `application/json`

**Input Data Type 请求资料型态**

> Example 范例:  
> `<API_URL>/changePassword.aspx?operatorcode=xxx&providercode=xxx&username=xxx&password=xxx&opassword=xxx&signature=xxx`

Fields 参数 |	Type 资料型态 | Req 必要 | Description 参数说明
------------|--------------|----------|---------------------
operatorcode |String 字串 |Y 是 |Operator code 代理号
providercode |String 字串 |Y 是 |Provider code 供应商号
username |String 字串 |Y 是 |Player user name 会员账号<br/><br/>Min Length : 3 character 最短长度：3位<br/>Max Length : 12 character 最大长度：12位
password |String 字串 |Y 是 |New user password 新账号密码<br/><br/>Max Length : 12 character 最大长度：12位
opassword |String 字串 |Y 是 |Old user password 旧账号密码<br/><br/>Max Length : 12 character 最大长度：12位
signature |String 字串 |Y 是 |MD5 encryption string MD5 加密字符串


**Response Data Type 回传资料型态**

Fields 参数  |	Type 资料型态 	| Description 参数说明
------------|--------------|---------------------
errCode |String 字串 |Error Code 报错码
errMsg |String 字串 |Error Message 报错内容

**Signature Formula 加密字符串:  
<span class='red'>Signature = MD5(opassword + operatorcode + password + providercode + username + secret_key), then convert to uppercase 加密后转大写. </span>**





## Check Agent Credit (KIOSK BALANCE) 查询代理余额接口 (集成系统余额)

 | | 
-|-|-
Function Class 接口: | `checkAgentCredit.aspx`
Request 请求类型: | `GET`
Response 回传格式: | `application/json`

**Input Data Type 请求资料型态**

> Example 范例:  
> `<API_URL>/checkAgentCredit.aspx?operatorcode=xxx&signature=xxx`

Fields 参数 |	Type 资料型态 | Req 必要 | Description 参数说明
------------|--------------|----------|---------------------
operatorcode |String 字串 |Y 是 |Operator code 代理号
signature |String 字串 |Y 是 |MD5 encryption string MD5 加密字符串


**Response Data Type 回传资料型态**

Fields 参数  |	Type 资料型态 	| Description 参数说明
------------|--------------|---------------------
errCode |String 字串 |Error Code 报错码
data |Double 小数点 |KIOSK BALANCE集成系统最新代理余额
errMsg |String 字串 |Error Message 报错内容

**Signature Formula 加密字符串:  
<span class='red'>Signature = MD5(operatorcode + secret_key), then convert to uppercase 加密后转大写. </span>**


## Check Product Username 查询玩家游戏平台帐号接口

 | | 
-|-|-
Function Class 接口: | `checkMemberProductUsername.aspx`
Request 请求类型: | `GET`
Response 回传格式: | `application/json`

**Input Data Type 请求资料型态**

> Example 范例:  
> `<API_URL>/checkMemberProductUsername.ashx?operatorcode=xxx&providercode=xxx&username=xxx&signature=xxx`

Fields 参数 |	Type 资料型态 | Req 必要 | Description 参数说明
------------|--------------|----------|---------------------
operatorcode |String 字串 |Y 是 |Operator code 代理号
providercode |String 字串 |Y 是 |Provider code 供应商号
username |String 字串 |Y 是 |Player user name 会员账号<br/><br/>Min Length : 3 character 最短长度：3位<br/>Max Length : 12 character 最大长度：12位
signature |String 字串 |Y 是 |MD5 encryption string MD5 加密字符串

**Response Data Type 回传资料型态**

Fields 参数  |	Type 资料型态 	| Description 参数说明
------------|--------------|---------------------
errCode |String 字串 |Error Code 报错码
data |Double 小数点 |Product Username 玩家游戏平台账号
errMsg |String 字串 |Error Message 报错内容

**Signature Formula 加密字符串:  
<span class='red'>Signature = MD5(operatorcode + providercode + username + secret_key), then convert to uppercase 加密后转大写. </span>**

## Launch DeepLink App (beta) 深层链接

 | | 
-|-|-
Function Class 接口: | `launchAPP.ashx`
Request 请求类型: | `GET`
Response 回传格式: | `application/json`

**Input Data Type 请求资料型态**

> Example 范例:  
> `<API_URL>/launchAPP.ashx?operatorcode=xxx&providercode=JK&username=xxx&password=xxx&signature=xxx`

Fields 参数 |	Type 资料型态 | Req 必要 | Description 参数说明
------------|--------------|----------|---------------------
operatorcode |String 字串 |Y 是 |Operator code 代理号
providercode |String 字串 |Y 是 |Provider code 供应商代号
username |String 字串 |Y 是 |Player user name 会员账号<br/><br/>Min Length : 3 character 最短长度：3位<br/>Max Length : 12 character 最大长度：12位
password |String 字串 |Y 是 |
signature |String 字串 |Y 是 |MD5 encryption string MD5 加密字符串

**Response Data Type 回传资料型态**

Fields 参数  |	Type 资料型态 	| Description 参数说明
------------|--------------|---------------------
errCode |String 字串 |Error Code 报错码
gameUrl |String 字串 |Deeplink url
errMsg |String 字串 |Error Message 报错内容

**Signature Formula 加密字符串:  
<span class='red'>Signature = MD5(operatorcode + providercode + secret_key), then convert to uppercase 加密后转大写. </span>**


## Check TransactionStatus(beta)

 | | 
-|-|-
Function Class 接口: | `checkTransaction.ashx`
Request 请求类型: | `GET`
Response 回传格式: | `application/json`

**Input Data Type 请求资料型态**

> Example 范例:  
> `<LOG_URL>/checkTransaction.ashx?operatorcode=xxxxreferenceid=10842293&signature=5603493CC36D59064E432B83BBDEC4F7`

Fields 参数 |	Type 资料型态 | Req 必要 | Description 参数说明
------------|--------------|----------|---------------------
operatorcode |String 字串 |Y 是 |Operator code 代理号
referenceid |String 字串 |Y 是 |Referenceid used at makeTransfer 资金转账接口所用的referenceid
signature |String 字串 |Y 是 |MD5 encryption string MD5 加密字符串

**Response Data Type 回传资料型态**

<table>
<tr>
<td>errCode</td><td>String 字串</td><td>Error Code of this API request(for full Error Code please refer at Appendix) 报错码</td>
</tr>
<tr>
<td>gameUrl</td><td>String 字串</td><td><code>{<br/>"trans_id": "39861348",<br/>"trans_time": "2021-04-01T05:14:23.63",<br/>"username": "josh1212",<br/>"type": "1",<br/>"provider": "WB",<br/>"amount": 500.1,<br/>"ref_id": "10842293",<br/>"status": "FAILED",<br/>"operator": "m777"<br/>}</code>
<table>
<tr>
<td>trans_id</td>
<td>GSC generated transID</td>
</tr>
<tr>
<td>trans_time</td>
<td>Time of this transaction, GMT+0</td>
</tr>
<tr>
<td>username</td>
<td>Playername of this transaction</td>
</tr>
<tr>
<td>type</td>
<td>Transaction type<br/>0 = deposit<br/>1= withdrawal</td>
</tr>
<tr>
<td>provider</td>
<td>Provider of this transaction</td>
</tr>
<tr>
<td>amount</td>
<td>Amount of this transaction</td>
</tr>
<tr>
<td>ref_id</td>
<td>Operator’s ReferenceID used at maketransfer.API</td>
</tr>
<tr>
<td>status</td>
<td>Status of this transactionID 此单号的转账状态。<br/><br/>SUCCESS 成功<br/>PROCESSING 进行中，请稍后再确认<br/>FAILED 失败 </td>
</tr>
<tr>
<td>operator</td>
<td>GSC opcode, operatorcode of this transaction</td>
</tr>
</table>
</td>
</tr>
<tr>
<td>errMsg</td><td>String 字串</td><td>Error Message 报错内容</td>
</tr>
</table>

**Signature Formula 加密字符串:  
<span class='red'>Signature = MD5(operatorcode + secret_key), then convert to uppercase 加密后转大写. </span>**

**Supported product code（目前支持的产品）: WB, AG, CF, SU, PG ,SO, WC, RE, DG, GE, JK, GB, PR, IB, TF, S2, IA, MP, HB, AT**

## Get Betting History *standardized/固定

 | | 
-|-|-
Function Class 接口: | `fetchbykey.aspx`
Request 请求类型: | `GET`
Response 回传格式: | `application/json`

**Input Data Type 请求资料型态**

> Example 范例:  
> `<LOG_URL>/fetchbykey.aspx?operatorcode=xxx&versionkey=0&signature=D653B0F33F893D6F327DD7BB9D8DDAAA`

Fields 参数 |	Type 资料型态 | Req 必要 | Description 参数说明
------------|--------------|----------|---------------------
operatorcode |String 字串 |Y 是 |Operator code 代理号
versionkey |String 字串 |Y 是 |Last {versionkey} from previous request.<br/>从最后的API请求中回传的记录版本号{versionkey}<br/><br/>If first time, use versionkey=0<br/>第一次调用，请使用versionkey=0
signature |String 字串 |Y 是 |MD5 encryption string MD5 加密字符串

**Response Data Type 回传资料型态**

Fields 参数  |	Type 资料型态 	| Description 参数说明
------------|--------------|---------------------
errCode |String 字串 |Error Code 报错码
result |String 字串 |Json string (betting history record)<br/>Json字符串格式(投注历史记录)<br/><br/>refer <a class='red' href='#c-standardized-betting-history-attribute'>Appendix C</a> for attribute<br/>详细的回传参数说明请参阅 <a class='red' href='#c-standardized-betting-history-attribute'>Appendix附件C</a>
errMsg |String 字串 |Error Message 报错内容

**Signature Formula 加密字符串:  
<span class='red'>Signature = MD5(operatorcode + secret_key), then convert to uppercase 加密后转大写. </span>**

**Remark 1 备注 1:  
<span class='red'>Per call will get 150 latest betting records, if without mark, same 150 records will be given.  
每次的呼叫将获得150个最新的投注记录，如果没有进行标记，将拿到相同的150个记录。</span>**

**Remark 2 备注 2:  
<span class='red'>Please UPDATE records for same ID.  
请更新相同ID的记录 </span>**


## Get Betting History_Archieve 捞取投注历史记录接口(fetchArchieve以版本号捞取)

 | | 
-|-|-
Function Class 接口: | `fetchArchieve.aspx`
Request 请求类型: | `GET`
Response 回传格式: | `application/json`

**Input Data Type 请求资料型态**

> Example 范例:  
> `<LOG_URL>/fetchArchieve.aspx?operatorcode=xxxx&versionkey=0&signature=D653B0F33F893D6F327DD7BB9D8DDAAA`

Fields 参数 |	Type 资料型态 | Req 必要 | Description 参数说明
------------|--------------|----------|---------------------
operatorcode |String 字串 |Y 是 |Operator code 代理号
versionkey |String 字串 |Y 是 |Last {versionkey} from previous request.<br/>从最后的API请求中回传的记录版本号{versionkey}<br/><br/>If first time, use versionkey=0<br/>第一次调用，请使用versionkey=0
signature |String 字串 |Y 是 |MD5 encryption string MD5 加密字符串

**Response Data Type 回传资料型态**

Fields 参数  |	Type 资料型态 	| Description 参数说明
------------|--------------|---------------------
errCode |String 字串 |Error Code 报错码
result |String 字串 |Json string (betting history record)<br/>Json字符串格式(投注历史记录)<br/><br/>refer <a class='red' href='#c-standardized-betting-history-attribute'>Appendix C</a> for attribute<br/>详细的回传参数说明请参阅 <a class='red' href='#c-standardized-betting-history-attribute'>Appendix附件C</a>
errMsg |String 字串 |Error Message 报错内容

**Signature Formula 加密字符串:  
<span class='red'>Signature = MD5(operatorcode + secret_key), then convert to uppercase 加密后转大写. </span>**

**Remark 备注:  
<span class='red'>this function is used for grab betdata that is archived. 此接口用来获取备用档案。 </span>**


## Mark Betting History Start From 2021-01-01 (GMT+0) 标记投注历史记录接口(mark标记) 2021-01-01 (GMT+0) 开始

 | | 
-|-|-
Function Class 接口: | `markbyjson.aspx`
Request 请求类型: | `POST`
Response 回传格式: | `application/json`

**Input Data Type 请求资料型态**

> Example 范例:  
> `<LOG_URL>/markbyjson.aspx`

Fields 参数 |	Type 资料型态 | Req 必要 | Description 参数说明
------------|--------------|----------|---------------------
operatorcode |String 字串 |Y 是 |Operator code 代理号
ticket |String 字串 |Y 是 |Ticket id get in Get Betting History(fetchbykey). Pass in format eg. 1,2,3,4,5,6,7,8<br/><br/>捞取投注历史记录接口(以版本号捞取) 回传的Ticket id 传入格式 ，例如：1,2,3,4,5,6,7,
signature |String 字串 |Y 是 |MD5 encryption string MD5 加密字符串

**Response Data Type 回传资料型态**

>Method: `POST`  
>URL: `<LOG_URL>/markbyjson.ashx`  
>Body:

```csharp
{
  "ticket" : "1,2,3,4,5,6,7,8",
  "operatorcode" : "xxxx",
  "signature" : "xxxxxxxxxxx"
}
```

>Response Body

```csharp
{
  "errCode" : "0",
  "errMsg" : "SUCCESS"
}
```

Fields 参数  |	Type 资料型态 	| Description 参数说明
------------|--------------|---------------------
errCode |String 字串 |Error Code 报错码
errMsg |String 字串 |Error Message 报错内容

**Signature Formula 加密字符串:  
<span class='red'>Signature = MD5(operatorcode + secret_key), then convert to uppercase 加密后转大写.  </span>**


## Mark Betting History_Archieve 标记投注历史记录接口(mark标记)

 | | 
-|-|-
Function Class 接口: | ` markArchieve.ashx`
Request 请求类型: | `POST`
Response 回传格式: | `application/json`

**Input Data Type 请求资料型态**

> Example 范例:  
> `<LOG_URL>/markArchieve.ashx?operatorcode=xxx&ticket=xxx&signature=xxx`

Fields 参数 |	Type 资料型态 | Req 必要 | Description 参数说明
------------|--------------|----------|---------------------
operatorcode |String 字串 |Y 是 |Operator code 代理号
ticket |String 字串 |Y 是 |Ticket id get in Get Betting History(fetchbykey). Pass in format eg. 1,2,3,4,5,6,7,8<br/><br/>捞取投注历史记录接口(以版本号捞取) 回传的Ticket id 传入格式 ，例如：1,2,3,4,5,6,7,
signature |String 字串 |Y 是 |MD5 encryption string MD5 加密字符串

**Response Data Type 回传资料型态**

>Method: `POST`  
>URL: `<LOG_URL>/markArchieve.ashx`  
>Body:

```csharp
{
  "operatorcode" : "xxxx",
  "signature" : "xxxxxxxxxxx"
  "ticket" : "4098362429,1010,2040"
}
```

>Response Body: 

```csharp
{
  "errCode" : "0",
  "errMsg" : "SUCCESS"
}
```

Fields 参数  |	Type 资料型态 	| Description 参数说明
------------|--------------|---------------------
errCode |String 字串 |Error Code 报错码
errMsg |String 字串 |Error Message 报错内容

**Signature Formula 加密字符串:  
<span class='red'>Signature = MD5(operatorcode + secret_key), then convert to uppercase 加密后转大写. </span>**


<!--## Get Betting History 获取投注历史记录接口(datetime或versionkey) *dynamic/变动

 | | 
-|-|-
Function Class 接口: | `repullBettingHistoryApiClient.ashx`
Request 请求类型: | `GET`
Response 回传格式: | `application/json`

**Input Data Type 请求资料型态**

> Example 范例:  
> a) <keyOrdate=date> mode模式  
> `<LOG_URL>/repullBettingHistoryApiClient.ashx?providercode=WM&keyOrdate=date&from=2019-05-16T11:00:00&to=2019-05-16T22:00:00&operatorcode=dcmm&signature=6749F170C968A7B76681C0B6EEDA8052`

> b) <keyOrdate=key> mode模式  
> `<LOG_URL>/repullBettingHistoryApiClient.ashx?providercode=MP&keyOrdate=key&versionkey=0&operatorcode=dcmm&signature=6749F170C968A7B76681C0B6EEDA8052`

Fields 参数 |	Type 资料型态 | Req 必要 | Description 参数说明
------------|--------------|----------|---------------------
providercode |String 字串 |Y 是 |Provider code 供应商代号
from |String 字串 |N 否 |Start from 开始时间<br/><br/>Format: <code>yyyy-MM-ddTHH:mm:ss</code><br/>时间格式：<code>yyyy-MM-ddTHH:mm:ss</code><br/><br/>Use when {keyOrdate}=date only<br/>当 {keyOrdate}=date 才会生效
to |String 字串 |N 否 |End from 结束时间<br/><br/>Format: <code>yyyy-MM-ddTHH:mm:ss</code><br/>时间格式：<code>yyyy-MM-ddTHH:mm:ss</code><br/><br/>Use when {keyOrdate}=date only<br/>当 {keyOrdate}=date 才会生效
versionkey |String 字串 |N 否 |Version key 版本号<br/><br/>Use when {keyOrdate}= key only<br/>当 {keyOrdate}= key 才会生效<br/>*for provider code PG, refer <a  class='red' href='#a-special-request-on-bet-history'>Appendix A</a><br/>*当供应商为PG时，请参阅 <a class='red' href='#a-special-request-on-bet-history'>附件A</a>
type |String 字串 |Y 是 |*for provider code BI,FG, refer <a class='red' href='#a-special-request-on-bet-history'>Appendix A</a><br/>*当供应商为BI,FG,IG时，请参阅 <a class='red' href='#a-special-request-on-bet-history'>附件A</a>
operatorcode |String 字串 |Y 是 |Operator code 代理号
keyOrdate |String 字串 |Y 是 |Enquiry by key Or date<br/>查询方式: key 或 date<br/><br/>Possible value: 有效值:<br/><br/>a) keyOrdate=date<br/>b) keyOrdate=key
signature |String 字串 |Y 是 |MD5 encryption string MD5 加密字符串

**Response Data Type 回传资料型态**

Fields 参数  |	Type 资料型态 	| Description 参数说明
------------|--------------|---------------------
errCode |String 字串 |Error Code 报错码
record |String 字串 |IF have data : string (betting history record)<br/>有投注记录时，会返回投注记录串<br/><br/>IF no data: string “0”<br/>无投注记录时，会返回“0”<br/><br/>refer <a class='red' href='#d-dynamic-betting-history-attribute'>Appendix D</a> for attribute<br/>详细的回传参数说明请参阅 <a class='red' href='#d-dynamic-betting-history-attribute'>Appendix附件D</a>
errMsg |String 字串 |Error Message 报错内容

**Signature Formula 加密字符串:  
<span class='red'>Signature = MD5(providercode + operatorcode + keyOrDate + secret_key), then convert to uppercase 加密后转大写. </span>**

**Remark 1 备注 1:  
<span class='red'>As of 15 August 2019, only this provider code CANNOT use this function: DG , WF , UF  
即2019年8月15日起，仅这几个供应商不支持调用此接口：DG , WF , UF。</span>**

**Remark 2 备注 2:  
<span class='red'>This API will return the un-process raw data from game provider, the content include bet and winlose amount will be based on game provider ratio (eg: 1:1 or 1:1000)  
此API接口将返回游戏商未经处理的原始数据，内容包括投注和输赢金额将根据游戏商的比例 (例如 1:1或1:1000) </span>**-->


## Get Game List 获取游戏列表

 | | 
-|-|-
Function Class 接口: | `getGameList.aspx`
Request 请求类型: | `GET`
Response 回传格式: | `application/json`

**Input Data Type 请求资料型态**

> Example 范例:  
> `<API_URL>/getGameList.ashx?operatorcode=dcmm&providercode=GP&lang=en&html=0&reformatjson=yes&signature=F92ED5A3066B4AB6BFF54970D135D1AE`

Fields 参数 |	Type 资料型态 | Req 必要 | Description 参数说明
------------|--------------|----------|---------------------
operatorcode |String 字串 |Y 是 |Operator code 代理号
providercode |String 字串 |Y 是 |Provider code 供应商代号
Lang |String 字串 |N 否 |ISO 639-1, default language en-US<br/>ISO 639-1, 默认语言为en-US<br/><br/>*default:en<br/>*attribute not fully established
html5 |String 字串 |N 否 |html5=1, for html5(mobile friendly)<br/>html5=1, 使用html5(手机优化页面)<br/><br/>*default:all type<br/>*attribute not fully established
reformatJson |String 字串 |N 否 |yes = GSC standardized gamelist pattern<br/>no= providercode custom gamelist pattern
signature |String 字串 |Y 是 |MD5 encryption string MD5 加密字符串

**Response Data Type 回传资料型态**

Fields 参数  |	Type 资料型态 	| Description 参数说明
------------|--------------|---------------------
errCode |String 字串 |Error Code 报错码
gamelist |String 字串 |Gamelist 游戏列表
errMsg |String 字串 |Error Message 报错内容

**Signature Formula 加密字符串:  
<span class='red'>Signature = MD5(operatorcode + providercode + secret_key), then convert to uppercase 加密后转大写.</span>**

# Game Type Code 游戏类型列表
Code 代号 	| Description 游戏类型说明 
----------|------------------------
CB |CARD & BOARDGAME 棋牌游戏
ES |E-GAMES 电子游戏
SB |SPORTBOOK 体育游戏
LC |LIVE-CASINO 真人视讯游戏
SL |SLOTS 老虎机游戏
LK |LOTTO 彩票游戏
FH |FISH HUNTER 捕鱼游戏
PK |POKER 扑克游戏
MG |MINI GAME 迷你游戏
OT |OTHERS 其他游戏

# Provider Code 供应商列表

Provider Code 供应商代号 | Description 供应商说明 | Supported Game Type Code 支持的游戏类型
------------------------|-----------------------|---------------------------------------
A0|ACEWIN|SL,FH
A1|MD998_BG|LC
A2|MD998_CF|LC
A3|MD998_CT855|LK,LC
A4|MD998_DG|LC
A5|MD998_EVO|LC
A6|MD998_EZUGI|LC
A7|MD998_FGG|LC
A8|MD998_GD|LC
A9|MD998_LS|LC
AA|API2ALL998|SL,SB,LK,PK,FH,CB,ES,MG,LC
AB|ALLBET|FH,LC
AC|ACE333|SL,APP
AD|ADVANT PLAY|SL
AG|ASIAGAMING|SL,SB,FH,LC
AL|ALT Sport|SB
AM|AMEBA|SL
AP|AMB_POKER|PK
AR|GAME ART|SL,LC
AT|ALLBET2.0|LC, FH
AV|AVIA GAMING|OT
AW|ACEWIN|SL,FH
AX|AMB_SLOTXO|SL
B1|MD998_PragmaticPlayLive|LC
B2|MD998_SA|LC
B3|MD998_SexyBaccarat|LC
B4|MD998_WM|LC
B5|MD998_93connect|LK
B6|MD998_KenoLoterry|LK
B7|MD998_MalaysiaLottery|LK
B8|MD998_ACE333|SL,APP
B9|MD998_BGEgame|SL
BC|BC_SPORT|SB
BF|BEEFEE|SL
BG|BINGO|LK
BI|BIG GAMING|SL,LK,FH,LC
BL|BOLE GAMING|CB
BP|Pinnacle 平博|SB,ES
C7|棋乐游(cb761)|SL,CB
CB|CITIBET|OT
CC|CLUBSUNCITY|APP
CE|93CONNECT|LK
CF|COCK FIGHTING SV388|OT
CG|Creative Gaming|
CM|CMD SPORTSBOOK|SB
CQ|CQ9|SL,FH,CB
CV|CMD VIRTUAL SPORTSBOOK|SB
CY|CITIBET_[E] Gaming Soft Technical|OT
D0|DS88|OT
D1|MD998_Betsoft|SL
D2|MD998_Cq9|SL
D3|MD998_playtechDigital|SL
D4|MD998_GlobalGaming|SL
D5|MD998_IconicGame_Egame|SL
D6|MD998_joker|SL
D7|MD998_pragmatic|SL
D8|MD998_Skywind|SL
D9|MD998_SagamingEgames|SL
DC|DEMACAO|SL
DE|Discovery Gaming 帝駒棋牌|
DF|大富翁|APP
DG|DREAM GAMING|APP,LC
DI|Gold Diamond Gaming|SL,LC
DL|28win( Grand Dragon Lotto )|LK
DM|Digmaan/CockFTNew|OT
DO|DIRECT SBO|SL,SB,LC
DS|Dragoon Soft|SL,FH,CB
DT|DREAM TECH|SL
DV|DISCOVERY GAMING|
E1|MD998_VirtualTech|SL
E2|MD998_Legaming|CB
E3|MD998_OGPoker|CB
E4|Blockchain (EC Lotto 4D)|LK
E8|EVO888(creditline)|
EA|EA Game|LC
EB|EBET|LC
EE|Meta|
EG|Evolution Gaming|LC
EK|GSeSport|ES
EM|euwin GS Minigame|
EO|EVO888|APP
EP|EVOPLAY|SL
EW|ENTWINE|
EZ|EZUGI|LC
F2|FLOWGAMING_PLAYSON|
F3|FLOWGAMING_QUICKSPIN|
F4|FLOWGAMING_NETENT|
F5|FLOWGAMING_MAVERICK|
F6|FLOWGAMING_OTHER|
F7|FLOWGAMING_BLUEPRINT|
FG|FUN GAMING|SL,PK
FI|FLOWGAMING_OLD|SL
FK|FUNKYGAME|SL
G2|GAMINGSOFT 7E SUNCITY|APP
G8|GAMINGSOFT GAMEPLAY|SL,LK,APP,LC
G9|GAMINGSOFT TANGKAS|LK
GA|GAMINGSOFT ASIAGAMING|SL,SB,FH,LC
GB|GAMINGSOFT BBIN|SL,SB,LK,FH,APP,LC
GE|GAMINGSOFT EVO GAMING|LC
GF|GAMINGSOFT 7E KENZO|APP
GH|GAMINGSOFT 7E PLAYGIRL|APP
GI|GAMEINTACT|SL,FH,CB
GJ|Hub88_GREEN JADE_SPRIBE|SL
GK|GAMINGSOFT 7E 918KISS|APP
GM|GAMATRON|SL
GN|GENESIS|SL
GP|GAMEPLAY|SL,LK,CB,APP,LC
GQ|GAMINGSOFT 7E GCLUB|APP
GS|GAMINGSOFTSLOT|SL,APP
GU|GAMINGSOFT 7E PUSSY|APP
GV|GAMINGSOFT 7E MEGA888|APP
GW|GAMINGSOFT 7E GREATWALL|APP
GY|GAMINGSOFT 7E PLAYBOY|APP
GZ|GAMINGSOFT 7E NEWTOWN|APP
H0|HBO|
H1|H1_no1using|
H2|HC SLOT (HC 电子)|SL
HB|HABANERO|SL
HC|HC电竞|OT
HG|HOGAMING|LC
HL|欢乐棋牌|CB
HR|Happy Race Rummy|
HS|HS4D|LK
HW|HUAWEI88(GrandDragonLotto)|LK
HY|HYDAKO|SL
i8|i8Games|
IA|小艾电竞 IA ESPORT |ES
IB|GAMINGSOFT IBC SPORTSBOOK (onework/saba)|SB,ES
IC|iconic(ICG必贏電子)|SL,FH,
IE|小艾电竞 IA ESPORT[Common Wallet] |ES
IG|IGLOTTO|LK
II|Infinity Gaming|
IM|IM SPORTBOOK|SB
IN|Incentive Game|
IS|ISIN4D|LK
IT|ISOFTBET|SL
J1|MD998_M8sport|SB
J2|MD998_ALLBET|LC
J3|MD998_DT|SL
J4|MD998_IAESPORT|SB
J5|MD998_MAXBET|SB
J6|MD998_SBO|SB
J7|MD998_SBOVS|SB
J8|MD998_SSPORT|SB
J9|MD998_AG|LC
JB|金霸|OT
JC|JCLUB777|APP
JD|JDB - JUST DO THE BEST|SL,FH
JK|JOKER|SL,FH,APP
JL|JiLi|SL,FH,CB
K9|KING855/CT855|LC
KA|KK Gaming|
KG|KG 棋牌|
KK|KISS918KAYA|APP
KM|KMG - Keep More G|SL
KO|KING KONG|SL
KS|KISS918|APP
KY|开元棋牌|CB
L2|LIVE22|APP
L4|LIVE22NEW|SL,APP,LC
L9|97 Lotto|LK
LC|LONG CHENG|CB
LG|Legaming 乐游棋牌|CB
LI|LIVE GAMING|
LL|LPE|
LN|LION KING|APP
LO|TY LOTTO (GS LOTTO)|LK
LP|LUCKY PALACE|
LS|LuckyStreak|LC
LV|LIVE VIDEO|OT
LW|Lotto Instant Win|
M3|Mio Seamless Main|
M8|M8Sport/Mbet|SB
MA|MARK 6 LOTTO|LK
MC|MICROGAMING NEW|SL
ME|MEGA888|APP
MG|MICRO GAMING|SL,LC
ML|slotmill|
MN|DREAMLAND|MG,OT
MO|MUCHO ORIENTAL GAMING(OG+)|LC
MP|MICRO GAMING PLUS|SLLC
MQ|MG棋牌|CB
MT|MuayThai2 FT|SB
MX|maxproMG|SL,LK,PK,FH,CB,OT,LC
N2|N2LIVE|LC
N4|PERDANA 4D(ABS333)|LK
NN|NEWTOWN|
NS|NextSpin|SL
NT|NETENT|SL
O1|OB Sportbook|SB
OP|OPUS GAMING|SL
OS|ONESLOT|APP
OT|ONE TOUCH|SL
P1|ONEPOKER|
P2|Skywind|LC, SL
P3|PS9 GAMING|SL, LC
P4|PSBET 4D|LK
P5|58 POKER|PK
P9|918PLUS(CREDITLINE)|
PA|APOLLO|
PB|PLAY8OY|APP
PD|PlayTechDirect|SL,APP,LC
PG|PGSOFT|SL
PH|PG Soft|SL
PL|100Plus|
PM|Pretty Gaming (FT)|LC
PN|PLAY N GO|SL
PR|PRAGMATIC|SL,CB,LC
PS|PLAYSTAR|SL
PU|PUSSY888|APP
PX|PlayTechTCG|SL,LC
PZ|playtechTCL|SL,LC
QK|QQ KENO|LK
QT|QTECH|SL
R1|ROLLEX11|
RE|Red Tiger/Queen Maker/King Maker|SL
RG|RTG GAMING|SL
S2|AWC68 SEXY|OT,LC,FH
S3|SBO|SB,LC,SL,VS
S5|[Common Wallet] SBO|
S8|SUPER8|SL
SA|SAGAMING|APP,LC
SB|SBTECH SPORTSBOOK|SB
SG|SPADE GAMING|SL,FH
SL|Siam Lotto (SLotto)|LK
SN|Sabong Network|OT
SO|SBO SPORTSBOOK|SB
SP|SUPERSPORT|SB
SQ|SUPERLOTTO|LK
ST|NEW THREE STAR|SB
SU|Super Spade Games|
SX|SEXY BACCARAT|LC
SY|SIMPLE PLAY|SL,FH
TB|TBS SPORT|SB,LK
TC|TCG LOTTO|LK
TF|TFgaming|SB
TG|TcgSeaLotto|LK
TH|天豪棋牌|CB
TL|THAI LOTTO|LK
TP|TOP PLAYER SLOT|
TT|TTG|SL
UC|UC8 (spinomenal)|SL
UF|UFA SPORTBOOK|SB
V8|V8POKER|CB
VG|VG|CB
VP|Vpower|
VR|VIDEO RACING / VR LOTTO|LK
VT|VIRTUAL TECH|SL
VV|VIVO GAMING|SL,LC
W2|TWOWIN|SL,FH
W3|3WIN8|
WB|WBET|SB
WC|WM CASINO|LC
WF|WINNINGFT|SB
WG|王牌|
WI|9WICKETS|SB
WM|WORLDMATCH|SL
X5|X500|SL
XA|Xin Bao|SB
XE|XE88|SL
XO|SLOTXO|SL
XP|XPRO (betsoft)|SL,LC
XY|Xin Xing SportBook|
YB|YeeBet|LC
YD|YGGdrasil|SL
YG|YEE GAMING|CB
YL|YLGaming|SL,FH
Z7|joseph_test_product|
Z8|yeoh_test_product|
Z9|demo GSS for API client|SL
ZB|FGG|
ZS|ZEUS|SL,OT

# Error Code 报错码列表

Error Code 报错码 | Description 报错说明
------------------|--------------------
0 |SUCCESS 请求成功
61 |CURRENCY_NOT_SUPPORT 货币不兼容
70 |INSUFFICIENT_KIOSK_BALANCE 集成系统余额不足
71 |INVALID_REFERENCE_ID 单据号不正确
72 |INSUFFICIENT_BALANCE 余额不足
73 |INVALID_TRANSFER_AMOUNT 转账金额不正确
74 |INVALID_TRANSFER_AMOUNT_TWO_DECIMAL_ONLY 转账金额不能多过两个小数点 0.00
81 |MEMBER_NOT_FOUND 会员账号不存在
82 |MEMBER_EXISTED 会员账号已存在
83 |OPERATOR_EXISTED 代理号已存在
90 |INVALID_PARAMETER 请求参数不正确
91 |INVALID_OPERATOR 代理号不正确
92 |INVALID_PROVIDERCODE 供应商代号不正确
93 |INVALID_PARAMETER_TYPE 请求参数类型不正确
94 |INVALID_PARAMETER_USERNAME 账号不正确
95 |INVALID_PARAMETER_PASSWORD 密码不正确
96 |INVALID_PARAMETER_OPASSWORD 旧密码不正确
97 |INVALID_PARAMETER_EMPTY_DOMAINNAME 请求链接/域名不正确
98 |INVALID_USERNAME_OR_PASSWORD 账号/密码错误
99 |INVALID_SIGNATURE 加密错误
600 |pre-check stage FAILED, deposit/withdraw transaction IGNORED 前期检验失败。 存款/取款 操作已被无视
601 |DEPO_APIREQ_BLOCKED_FOR_THIS_PRODUCT_TILL_FURTHER_NOTICE 此产品的存款 功能暂时停用维修
602 |WITH_APIREQ_BLOCKED_FOR_THIS_PRODUCT_TILL_FURTHER_NOTICE 此产品的取款 功能暂时停用维修
603 |Going to perform an online maintenance, Deposit/Withdraw API is DISABLED temporarily (disabled duration 5~ 10 minutes, will release earlier when done earlier). 即将执行在线系统维护，为了避免维护时导致的系统不稳定，转账API暂时停止（暂停时间大约5～10分钟，若提早完毕会提早解放）
992 |INVALID_PARAMETER_PRODUCT_NOT_SUPPORTED_GAMETYPE 平台不兼容请求的游戏类型
991 |OPERATOR_STATUS_INACTIVE 代理号已冻结
994 |ACCESS_PROHIBITED 接口访问被禁止
995 |PRODUCT_NOT_ACTIVATED 平台未开通
996 |PRODUCT_NOT_AVAILABLE 平台不支持
998 |PLEASE_CONTACT_CSD 请联系客服
999 |UNDER_MAINTENENCE 系统维护中
9999 |UNKNOWN_ERROR 未知错误
-987 |RECORD_NOT_FOUND 交易单号不存在；产品不支持
-997 |SYS_EXCEPTION, Please contact CS. 系统错误，请联络客服。
-998 |INSUFFICIENT_APIKIOSK_BALANCE 集成系统接口余额不足
-999 |API_ERROR 接口错误



# Service URL 接口链接

 | | 
-|-|-
For API related API ONLY (DO NOT USE this when getting bet report)<br/>调用端: | `<API_URL>`
For Report/betting history related<br/>捞取投历史记录端: | `<LOG_URL>`

# Appendix 附件

## A - Special request on bet history / 投注记录的特殊接口请求

**Product code 供应商代号: PG**

<!-- Example 例子:  
 `<LOG_URL>/repullBettingHistoryApiClient.ashx?providercode=PG&keyOrdate=key&versionkey=C_0&operatorcode=DEMO`-->

Fields 参数 | Type 资料型态 | Req 必要 | Description 参数说明
------------|--------------|---------------|--------------------
versionkey | String 字串 | N 否 | For pgsoft, there are two type<br/>PGSoft支持两种类型<br/>- C_ + {versionkey} (cash/现金)<br/>- T_ + {versionkey} (tournament/红利)

<hr class="solid">

**Product code 供应商代号: FG**

<!-- Example 例子:  
 `<LOG_URL>/repullBettingHistoryApiClient.ashx?providercode=FG&keyOrdate=key&type=fish&versionkey=vhbgjk26456&operatorcode=DEMO`-->

Fields 参数 | Type 资料型态 | Req 必要 | Description 参数说明
------------|--------------|---------------|--------------------
type | String 字串 | N 否 | For fungaming, there are four type<br/>Fun Gaming支持四种类型<br/>- fish<br/>- fruit<br/>- poker<br/>- slot 

<hr class="solid">

**Product code 供应商代号: BI**

<!-- Example 例子:  
 `<LOG_URL>/repullBettingHistoryApiClient.ashx?providercode=BI&keyOrdate=key&type=FH&versionkey=154565646&operatorcode=DEMO`-->

Fields 参数 | Type 资料型态 | Req 必要 | Description 参数说明
------------|--------------|---------------|--------------------
type | String 字串 | N 否 | For Big Gaming, there are four type<br/>Big Gaming 支持四种类型<br/>- FH<br/>- LK<br/>- LC<br/>- SL 

<hr class="solid">

**Product code 供应商代号: IG**

<!-- Example 例子:  
 `<LOG_URL>/repullBettingHistoryApiClient.ashx?providercode=IG&from=2019-08-22T14%3A09%3A19&to=2019-08-22T14%3A19%3A19&operatorcode=igcn&keyOrdate=date&type=SC&etc=ewoJImdhbWVub2lkIjogIjEiLAoJImJlZ2luaWQiOiAiMCIsCiJyZXBvcnRkYXRlaWQiOiIwIgp9&Signature=D197C1EDD962D6942B7CF43D3CC0828B`-->

```csharp
//Remark 备注:
//How to generate value for etc 如何制作etc参数?
//Answer 答案:
//extra_parameter_HK (in json):
{
"gamenoid":"1",
"beginid":"0",
}

//extra_parameter_SC (in json):
{
"gamenoid":"1",
"beginid":"0",
"reportdateid":"0"
}

urlencode(base64encode(extra_parameter))
```

Fields 参数 | Type 资料型态 | Req 必要 | Description 参数说明
------------|--------------|---------------|--------------------
type | String 字串 | N 否 | For IG Lotto, there are two type<br/>IG Lotto 支持两种类型<br/>- SC 时时彩<br/>- HK 香港彩 
etc | String 字串 | | 


## B - Callback related / 回调网址解说

> Code sample 代码样本:

```csharp
//get the data in query parameter from AIO 接收并解析集成系统传送的数据串
string username = context.Request.QueryString["username"];
string password = context.Request.QueryString["password"];
string provider = context.Request.QueryString["provider"];
string resp = “false”;

//process and check the data from AIO 核实与处理
//check the member exist 检查玩家帐号是否存在
//check the password is correct 检查玩家登入密码是否正确
//checking C 检查项目C
//checking D 检查项目D
If(valid)
{ resp = “true”;}
Else
{ resp = “false”;}

//return message to AIO回传至集成系统的响应内容
context.Response.Write(resp);
```

**<span class='red'>AIO will send request to below file, your side will need to process the data and send a <u>response</u> to AIO.  
集成系统将<u>发送请求</u>至以下文档，贵方需自行核实，处理该数据内容，并回传一个(成功/失败)<u>响应</u>给集成系统。</span>**

**<span class='red'>Normally only Provider code that have/use APP will need this.  
一般支持手机应用APP的供应商会需要预设此回调。</span>**

Function Class接口: Not Applicable  
Request 请求类型 : `GET`  
Response 回传格式 : `text/html; charset=utf-8`

Example 范例:  
Request 请求:  
**<span class='red'>AIO will send data to the callback url (your side), process it.  
集成系统将发送验证请求至贵司的回调网址，贵司系统接收后需要进行必要的处理。<span>**

Callback request sample 回调请求例子：  
`http://apiclient_path/ch3ckM3mb3r.ashx?username=jordan&password=123456&provider=1S`

Response 回传:  
**<span class='red'>After process, return the result to AIO. 处理并核实完成后，请响应以下内容至集成系统。</span>**  
`“false”`

<aside class="notice">
Please remember to provide this callback url to AIO team, for further integration purpose<br/>
请提供回调网址给集成系统团队，以便进一步的对接进行使用
</aside>
`http://apiclient_path/ch3ckM3mb3r.ashx`

**Remark 备注:**  
Currently the below provider are advised to prepare this method.  
若有申请以下供应商的游戏平台，请按照步骤并开发这个程序

* CS
* GP
* ME
* N2
* P8
* XP
* SA
* L4
* VT
* GS
* SG
* AC
* NS

## C - Standardized betting history attribute / 固定式投注历史记录回传参数

<aside class="notice">
Attributes are fixed and will not change according to provider code  <br/>
回传参数内容将保持不变
</aside>

Fields 参数 | Type 资料型态 | Req 必要	| Description 参数说明
------------|--------------|--------------|---------------------
id | Int 整数字 	| Y是 | AIO Bet id (unique) AIO 注单号 (唯一值)
ref_no | Int 整数字 | Y是 | Provider Bet id 供应商注单号
site | String字串 | Y是 | Provider code 供应商代号
product | String字串 | Y是 | Game type code 游戏类型代号
member | String字串 | Y是 | Username 玩家帐号
gameid | String字串 | Y是 | Game id 游戏代号
start_time | String字串 | Y是 | bet time (the moment player submit/place the bet) GMT/UTC +0 下注时间(玩家实际的投注时间)，依据 GMT/UTC +0 时区
end_time | String字串 | Y是 | settlement time GMT/UTC +0 结算时间，依据 GMT/UTC +0 时区
match_time | String字串 | Y是 | match start time GMT/UTC +0 开赛时间，依据 GMT/UTC +0 时区
bet_detail | String字串 | Y是 | Bet details 投注明细
turnover | Double小数点 | Y是 | Valid bet amount 有效投注金额
bet | Double小数点 | Y是 | Bet amount 投注金额
payout | Double小数点 | Y是 | Payout 派彩金额
commission | Double小数点 |Y是 | Commission 佣金
p_share | Double小数点 | Y是 | Jackpot bet amount 彩池投注金额
p_win | Double小数点 | Y是 | Jackpot payout 彩池派彩金额 
status |Int 整数字 |Y是 |Status of this record 注单状态<br/>1 (valid bet record 有效注单)<br/>0 (running/ongoing match 赛事进行中)<br/>-1 (invalid bet record 无效注单 e.g. voided 作废, canceled 取消)


**Example 范例**

**Player bet banker with amount=5, at the same time bet player with amount=5. Turnover will be 0  
当玩家以投注金额=5同时在庄与闲进行下注，{turnover有效投注金额}将会是0.**

## D - QnA / 常问疑问

### Question 1

From API Document, createMember only require {username} and without {password} But others API like getBalance and changePassword required to pass in the {password} value. May I know how do I set the initial {password}?

### Answer 1

When createMember,

* It only create member account on AIO system.
* Member account will not created on game provider side.

When you request any API with {providercode} and {username},

* API example : getBalance, makeTransfer, launchGames, changePassword and others
* If member not exists on related {providercode}, member account will auto created and {password} will be stored in provider side and your API request will return like usual.
* If member exists on related {providercode}, your API request will return like usual.
* AIO system not store your member {password}, please store your member {password} carefully.
* Each member will have different {password} for different {providercode}.

### 疑问 1

API 文件中, createMember 只需要提供 {username} , 不需要密码{password}. 但其他API，如 getBalance 和 changePassword 需要提供 {password} . 请问需要如何设置 {password} ?

### 答案 1

当 createMember 时,

* createMember 只在 AIO 系统中创建会员.
* 游戏供应商 {providercode} 不会创建会员.

当您请求任何需要 {providercode} 和 {username} 的 API ,

* API 样本: getBalance, makeTransfer, launchGames, changePassword 或其他
* 如该 {providercode} 会员不存在, 会员将会自动创建， {password} 密码将保存在供应商服务器, 您的API请求将正常返回.
* 如该 {providercode} 会员已经存在, 您的API请求将正常返回.
* AIO 系统不会保存您的 {password}, 请妥善保存您的 {password}.
* 每个会员中的{providercode} , 可以使用不同的 {password}.

<hr class="solid">

<!--### Question 2

What is the difference between repullBettingHistoryApiClient and fetchbykey?

### Answer 2

repullBettingHistoryApiClient

* pro1: EXACT data from provider (apiclient can self-customize the data according to their own.

* con1: datetime's timezone in api request and api response is dependent on provider
* con2: since bet data is dependent on provider, apiclient need to do extra coding to handle every provider differently.

fetchbykey

* pro1: integrate code once, able to get all providercode's bet data
* pro2: standardized bet data across all providercode's bet record (which mean all bet data will be in GMT +0)
* pro3: does not need to handle timezone in api request (since it is using key).

* con1: possibly some bet details in a bet record is removed/ignored by AIO, which deem to be useless.
* con2: possibly missing bet record due to network between AIO and provider is unstable (AIO will repull data from provider again every 12 hour to resolve this).


### 疑问 2

repullBettingHistoryApiClient 和 fetchbykey 有什么区别

### 答案 2

repullBettingHistoryApiClient

* pro1: 来自提供商的确切数据 (apiclient 可以根据自己的需要自定义数据.

* con1: api 请求和 api 响应中的 datetime 时区取决于提供者
* con2: 由于下注数据取决于提供商，因此 apiclient 需要做额外的编码才能以不同方式处理每个提供商.

fetchbykey

* pro1: 一次集成代码，能够获取所有 providercode 的下注数据
* pro2: 所有提供商代码的赌注记录中的标准化赌注数据（这意味着所有赌注数据将在 GMT +0 中）
* pro3: 不需要在api请求中处理时区（因为它使用的是键.

* con1: AIO 可能删除/忽略了投注记录中的某些投注详细信息，这被认为是无用的.
* con2: 由于 AIO 和提供商之间的网络不稳定，可能会丢失投注记录（AIO 将每12小时重新刷新提供商的数据以解决此问题）.

<hr class="solid">-->

### Question 2
Any suggestion on password?

### Answer 2

* at least one big letter.
* at least one small letter.
* do not have continuous such as（123 ，234，456).
* larger than 6 character.

Example:

* password = Qwer124

if did not utilize this suggestion, you might facing password issue if you took PU,KS.

### 疑问 2
密码格式推荐

### 答案 2

* 至少一个大写.
* 至少一个小写.
* 然后不要有连续的数目比如（123 ，234，456).
* 大于6个字.

例子:

* password = Qwer124

若选择不根据要求，可能在KS,PU 会发生密码api问题.

<hr class="solid">

### Question 3

What will happen if i do not convert username and operatorcode to small letter before sending API request to GSC ?

### Answer 3

* GSC system will convert username and operatorcode to small letter.
* Please remember that some of the API is using username and operatorcode to create signature. MD5 is case sensitive.

### 疑问 3

若没把operatorcode和username转换成小写就 发送API请求给GSC，会发生什么事。

### 答案 3 

* GSC 会自行转换去小写。
* username 和 operatorcode 是会用于 制作签名。 MD5 是区分大小写 


## E - Special request on launch game / 开启游戏的特殊接口请求

**Product code 供应商代号: IG**

> Example 例子:  
> `<API_URL>/launchGames.aspx?operatorcode=d8kr&providercode=IG&username=dv69000XXX&password=kJiCDDX7&type=LK&lang=ko-KR&gameid=2&signature=1281A073C04822BB5838DD861EC15C40`

Fields 参数 | Type 资料型态 | Required 必要 | Description 参数说明
------------|--------------|---------------|--------------------
gameid | String 字串 ||1 - HK 香港彩<br/>2 - SSC 时时彩 

**Product code 供应商代号: S2**

> Example 例子:  
> `<API_URL>/launchGames.aspx?operatorcode=d8kr&providercode=S2&username=dv69000XXX&password=kJiCDDX7&type=SL&lang=ko-KR&gameid=S2_FC&signature=1281A073C04822BB5838DD861EC15C40`  
>
> `<API_URL>/launchGames.aspx?operatorcode=d8kr&providercode=S2&username=dv69000XXX&password=kJiCDDX7&type=LC&lang=ko-KR&gameid=S2_VENUS&signature=1281A073C04822BB5838DD861EC15C40`

Fields 参数 | Type 资料型态 | Required 必要 | Description 参数说明
------------|--------------|---------------|--------------------
type | String 字串 | Y 是| <b>SL</b> – Slot<br/><b>LC</b> – Live Casino<br/><b>FH</b> – Fishing Game<br/><b>OT</b> - Other 
gameid | String 字串 | Y 是 | Type <b>SL</b> Supported Game ID<br/>1.) <b>S2_FC</b> : Fa Chai <br/><br/>Type <b>LC</b> Supported Game ID<br/>1.) <b>S2_VENUS</b> : Venus<br/>2.) <b>0</b> : Sexy Baccarat<br/><br/>Type <b>FH</b> Supported Game ID<br/>1.) <b>S2_FC</b> : Fa Chai<br/><br/>Type <b>OT</b> Supported Game ID<br/>1.) <b>0</b> : SV388

**Product code 供应商代号: P3**

> Example 例子:  
> `<API_URL>/launchGames.aspx?operatorcode=d8kr&providercode=P3&username=dv69000XXX&password=kJiCDDX7&type=LC&lang=ko-KR&gameid=1_0&signature=1281A073C04822BB5838DD861EC15C40`

Fields 参数 | Type 资料型态 | Required 必要 | Description 参数说明
------------|--------------|---------------|--------------------
type | String 字串 | Y 是| <b>SL</b> – Slot<br/><b>LC</b> – Live Casino 
gameid | String 字串 | Y 是 | Type <b>SL</b> Supported Game ID<br/>1.) <b>0</b><br/><br/>Type <b>LC</b> Supported Game ID<br/>1.) <b>1_0</b> : Evolution









