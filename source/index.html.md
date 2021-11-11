---
title: Fund Transfer API

language_tabs: # must be one of https://git.io/vQNgJ
  - plaintext

includes:

search: true

code_clipboard: true

meta:
  - name: Fund Transfer API
    content: Fund Transfer API documentation
---

# Create Player 创建玩家帐号接口

# Get Balance 获取余额接口

# Make Transfer 资金转账接口

# Launch Games 启动游戏接口

# Launch DEMO Games 启动试玩游戏接口

# Update Player Password 更新玩家密码接口

# Check Agent Credit (KIOSK BALANCE) 查询代理余额接口 (集成系统余额)

# Check Product Username 查询玩家游戏平台帐号接口

# Launch DeepLink App(beta) 深层链接

# Check TransactionStatus(beta)

# Get Betting History Start From 2021-01-01 (GMT+0) 捞取投注历史记录接口(fetchbykey以版本号捞取) 2021-01-01 (GMT+0) 开始 *standardized/固定

# Get Betting History_Archieve 捞取投注历史记录接口(fetchArchieve以版本号捞取) 

# Mark Betting History Start From 2021-01-01 (GMT+0) 标记投注历史记录接口(mark标记) 2021-01-01 (GMT+0) 开始

# Mark Betting History_Archieve 标记投注历史记录接口(mark标记)

# Get Betting History获取投注历史记录接口(datetime或versionkey) *dynamic/变动

# Get Game List 获取游戏列表

# Game Type Code 游戏类型列表

# Provider Code 供应商列表

# Error Code 报错码列表

# Service URL 接口链接

# Appendix 附件

## A - Special request on bet history / 投注记录的特殊接口请求

Product code 供应商代号: PG

> Example 例子:
```plaintext
<LOG_URL>/repullBettingHistoryApiClient.ashx?providercode=PG&keyOrdate=key&versionkey=C_0&operatorcode=DEMO
```

Fields 参数 | Type 资料型态 | Required 必要 | Description 参数说明
------------|--------------|---------------|--------------------
versionkey | String 字串 | N 否 | For pgsoft, there are two type<br/>PGSoft支持两种类型<br/>- C_ + {versionkey} (cash/现金)<br/>- T_ + {versionkey} (tournament/红利)


## B - Callback related / 回调网址解说

**AIO will send request to below file, your side will need to process the data and send a response to AIO.  
集成系统将发送请求至以下文档，贵方需自行核实，处理该数据内容，并回传一个(成功/失败)响应给集成系统。**

**Normally only Provider code that have/use APP will need this. 一般支持手机应用APP的供应商会需要预设此回调。**

Function Class接口: Not Applicable
Request请求类型 : GET
Response回传格式 : text/html; charset=utf-8

Example范例:
Request请求:
**AIO will send data to the callback url (your side), process it. 集成系统将发送验证请求至贵司的回调网址，贵司系统接收后需要进行必要的处理。**

Callback request sample 回调请求例子：
<code>http://apiclient_path/ch3ckM3mb3r.ashx?username=jordan&password=123456&provider=1S</code>

Response回传:
After process, return the result to AIO. 处理并核实完成后，请响应以下内容至集成系统。
<code>“false”</code>

<aside class="notice">
Important note重要备注:<br/>
please remember to provide this callback url to AIO team, for further integration purpose 请提供回调网址给集成系统团队，以便进一步的对接进行使用<br/>
</aside>
Eg: <code>http://apiclient_path/ch3ckM3mb3r.ashx</code>


> Code sample代码样本:

```plaintext
#get the data in query parameter from AIO接收并解析集成系统传送的数据串
string username = context.Request.QueryString["username"];
string password = context.Request.QueryString["password"];
string provider = context.Request.QueryString["provider"];
string resp = “false”;

#process and check the data from AIO核实与处理
#check the member exist检查玩家帐号是否存在
#check the password is correct检查玩家登入密码是否正确
#checking C检查项目C
#checking D检查项目D
If(valid)
{ resp = “true”;}
Else
{ resp = “false”;}

#return message to AIO回传至集成系统的响应内容
context.Response.Write(resp);
```

**Remark备注:**  
Currently the below provider are advised to prepare this method.  
若有申请以下供应商的游戏平台，请按照步骤并开发这个程序

* CS
* EB
* GP
* ME
* N2
* P8
* XP
* SA
* L4
* VT

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


Example | 范例

Player bet banker with amount=5, at the same time bet player with amount=5. Turnover will be 0  
当玩家以投注金额=5同时在庄与闲进行下注，{turnover有效投注金额}将会是0. 

## D - Dynamic betting history attribute / 变动式投注历史记录回传参数

<aside class="notice">
Attributes are NOT fixed and WILL change according to provider code.<br/>
回传参数内容将依据供应商的需求随时更改。
</aside>

Please refer to respective document.  
For example:  
provider code: WM , world match  
Please refer to WM-PRODUCT WORLD MATCH.docx

请参阅个别供应商的对接文档。  
例如：  
供应商代号：WM代表world match平台  
请参阅WM-PRODUCT WORLD MATCH.docx文档 

## E - QnA / 常问疑问

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

### Question 2

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

<hr class="solid">

### Question 3
Any suggestion on password?

### Answer 3

* at least one big letter.
* at least one small letter.
* do not have continuous such as（123 ，234，456).
* larger than 6 character.

Example:

* password = Qwer124

if did not utilize this suggestion, you might facing password issue if you took PU,KS.

### 疑问 3
密码格式推荐

### 答案 3

* 至少一个大写.
* 至少一个小写.
* 然后不要有连续的数目比如（123 ，234，456).
* 大于6个字.

例子:

* password = Qwer124

若选择不根据要求，可能在KS,PU 会发生密码api问题.

<hr class="solid">

### Question 4

What will happen if i do not convert username and operatorcode to small letter before sending API request to GSC ?

### Answer 4

* GSC system will convert username and operatorcode to small letter.
* Please remember that some of the API is using username and operatorcode to create signature. MD5 is case sensitive.

### 疑问 4

若没把operatorcode和username转换成小写就 发送API请求给GSC，会发生什么事。

### 答案 4 

* GSC 会自行转换去小写。
* username 和 operatorcode 是会用于 制作签名。 MD5 是区分大小写 


## F - Special request on launch game / 开启游戏的特殊接口请求

> Example 例子:

```plaintext
<API_URL>/launchGames.aspx?operatorcode=d8kr&providercode=IG&username=dv69000XXX&password=kJiCDDX7&type=LK&lang=ko-KR&gameid=2&signature=1281A073C04822BB5838DD861EC15C40
```

**Product code 供应商代号: IG**

Fields 参数 | Type 资料型态 | Required 必要 | Description 参数说明
------------|--------------|---------------|--------------------
gameid | String 字串 ||1 - HK 香港彩<br/>2 - SSC 时时彩 













