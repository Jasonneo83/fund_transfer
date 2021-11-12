---
title: Fund Transfer API

language_tabs: # must be one of https://git.io/vQNgJ
  - csharp

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

Error Code 报错码 | Description 报错说明
------------------|--------------------
0 |SUCCESS 请求成功
61 |CURRENCY_NOT_SUPPORT 货币不兼容
70 |INSUFFICIENT_KIOSK_BALANCE 集成系统余额不足
71 |INVALID_REFERENCE_ID 单据号不正确
72 |INSUFFICIENT_BALANCE 余额不足
73 |INVALID_TRANSFER_AMOUNT 转账金额不正确
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
-998 |API_KIOSK_INSUFFICIENT_BALANCE 集成系统接口余额不足
-999 |API_ERROR 接口错误



# Service URL 接口链接

<table>
<tr>
  <td>For API related API ONLY (DO NOT USE this when getting bet report)<br/>调用端:</td>
  <td>(API_URL)</td>
</tr>
<tr>
  <td>For Report/betting history related<br/>捞取投历史记录端:</td>
  <td>(LOG_URL)</td>
</tr>
</table>

# Appendix 附件

## A - Special request on bet history / 投注记录的特殊接口请求

> Example 例子:  
> (LOG_URL)/repullBettingHistoryApiClient.ashx?providercode=PG&keyOrdate=key&versionkey=C_0&operatorcode=DEMO

**Product code 供应商代号: PG**

Fields 参数 | Type 资料型态 | Req 必要 | Description 参数说明
------------|--------------|---------------|--------------------
versionkey | String 字串 | N 否 | For pgsoft, there are two type<br/>PGSoft支持两种类型<br/>- C_ + {versionkey} (cash/现金)<br/>- T_ + {versionkey} (tournament/红利)

<hr class="solid">

> Example 例子:  
> (LOG_URL)/repullBettingHistoryApiClient.ashx?providercode=FG&keyOrdate=key&type=fish&versionkey=vhbgjk26456&operatorcode=DEMO

**Product code 供应商代号: FG**

Fields 参数 | Type 资料型态 | Req 必要 | Description 参数说明
------------|--------------|---------------|--------------------
type | String 字串 | N 否 | For fungaming, there are four type<br/>Fun Gaming支持四种类型<br/>- fish<br/>- fruit<br/>- poker<br/>- slot 

<hr class="solid">

> Example 例子:  
> (LOG_URL)/repullBettingHistoryApiClient.ashx?providercode=BI&keyOrdate=key&type=FH&versionkey=154565646&operatorcode=DEMO

**Product code 供应商代号: BI**

Fields 参数 | Type 资料型态 | Req 必要 | Description 参数说明
------------|--------------|---------------|--------------------
type | String 字串 | N 否 | For Big Gaming, there are four type<br/>Big Gaming 支持四种类型<br/>- FH<br/>- LK<br/>- LC<br/>- SL 

<hr class="solid">

> Example 例子:  
> (LOG_URL)/repullBettingHistoryApiClient.ashx?providercode=IG&from=2019-08-22T14%3A09%3A19&to=2019-08-22T14%3A19%3A19&operatorcode=igcn&keyOrdate=date&type=SC&etc=ewoJImdhbWVub2lkIjogIjEiLAoJImJlZ2luaWQiOiAiMCIsCiJyZXBvcnRkYXRlaWQiOiIwIgp9&Signature=D197C1EDD962D6942B7CF43D3CC0828B

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

**Product code 供应商代号: IG**

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
Request 请求类型 : GET  
Response 回传格式 : text/html; charset=utf-8

Example 范例:  
Request 请求:  
**<span class='red'>AIO will send data to the callback url (your side), process it.  
集成系统将发送验证请求至贵司的回调网址，贵司系统接收后需要进行必要的处理。<span>**

Callback request sample 回调请求例子：  
<code><span class='red'>http://apiclient_path/ch3ckM3mb3r.ashx?username=jordan&password=123456&provider=1S</span></code>

Response 回传:  
<span class='red'>After process, return the result to AIO. 处理并核实完成后，请响应以下内容至集成系统。</span>  
<code>“false”</code>

<aside class="notice">
Please remember to provide this callback url to AIO team, for further integration purpose<br/>
请提供回调网址给集成系统团队，以便进一步的对接进行使用
</aside>
<code><span class='red'>http://apiclient_path/ch3ckM3mb3r.ashx</span></code>

**Remark 备注:**  
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


Example 范例

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
> (API_URL)/launchGames.aspx?operatorcode=d8kr&providercode=IG&username=dv69000XXX&password=kJiCDDX7&type=LK&lang=ko-KR&gameid=2&signature=1281A073C04822BB5838DD861EC15C40

**Product code 供应商代号: IG**

Fields 参数 | Type 资料型态 | Required 必要 | Description 参数说明
------------|--------------|---------------|--------------------
gameid | String 字串 ||1 - HK 香港彩<br/>2 - SSC 时时彩 














