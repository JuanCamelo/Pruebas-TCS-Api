€
tC:\Users\JUAN\source\repos\Proyecto.JuanPC.Pruebas.TCS\JuanPC.Pruebas.TCS.Gateway.Api\Controllers\LoginController.cs
	namespace 	
JuanPC
 
. 
Pruebas 
. 
TCS 
. 
Gateway $
.$ %
Api% (
.( )
Controllers) 4
{ 
[		 
Route		 

(		
 
$str		 
)		 
]		 
[

 
ApiController

 
]

 
public 

class 
LoginController  
:! "
ControllerBase# 1
{ 
private 
readonly 
	ILoginApp "

_loginUser# -
;- .
public 
LoginController 
( 
	ILoginApp (
	loginUser) 2
)2 3
{ 	

_loginUser 
= 
	loginUser "
;" #
} 	
[   	
HttpGet  	 
]   
[!! 	
Route!!	 
(!! 
nameof!! 
(!! 
LoginController!! %
.!!% &
	LoginUser!!& /
)!!/ 0
)!!0 1
]!!1 2
public"" 
RequestResult"" 
<"" 
UserDto"" $
>""$ %
	LoginUser""& /
(""/ 0
string""0 6
user""7 ;
,""; <
string""= C
password""D L
)""L M
=>## 

_loginUser## 
.## 
	LoginUser## $
(##$ %
user##% )
,##) *
password##+ 3
)##3 4
;##4 5
}%% 
}&& Ã
xC:\Users\JUAN\source\repos\Proyecto.JuanPC.Pruebas.TCS\JuanPC.Pruebas.TCS.Gateway.Api\Controllers\WordCountController.cs
	namespace 	
JuanPC
 
. 
Pruebas 
. 
TCS 
. 
Gateway $
.$ %
Api% (
.( )
Controllers) 4
{ 
[		 
Route		 

(		
 
$str		 
)		 
]		 
[

 
ApiController

 
]

 
public 

class 
WordCountController $
:% &
ControllerBase' 5
{ 
private 
readonly 

IWordCount #

_wordCount$ .
;. /
public 
WordCountController "
(" #

IWordCount# -
	wordCount. 7
)7 8
{ 	

_wordCount 
= 
	wordCount "
;" #
} 	
[ 	
HttpGet	 
] 
[   	
Route  	 
(   
nameof   
(   
WordCountController   )
.  ) *
ValidWordCount  * 8
)  8 9
)  9 :
]  : ;
public!! 
RequestResult!! 
<!! 
dynamic!! $
>!!$ %
ValidWordCount!!& 4
(!!4 5
string!!5 ;
text!!< @
)!!@ A
=>"" 

_wordCount"" 
."" 
ValidWordCount"" (
(""( )
text"") -
)""- .
;"". /
}&& 
}'' ·
†C:\Users\JUAN\source\repos\Proyecto.JuanPC.Pruebas.TCS\JuanPC.Pruebas.TCS.Gateway.Api\Core\DependencyInjection\AppBuilderExtensions.cs
	namespace 	
JuanPC
 
. 
Pruebas 
. 
TCS 
. 
Gateway $
.$ %
Api% (
.( )
Core) -
.- .
DependencyInjection. A
{ 
public		 

static		 
class		  
AppBuilderExtensions		 ,
{

 
public 
static 
IApplicationBuilder ) 
AddSwaggerCollection* >
(> ?
this? C
IApplicationBuilderD W
appX [
)[ \
{ 	
app 
. 

UseSwagger 
( 
) 
; 
app 
. 
UseSwaggerUI 
( 
c 
=> !
c" #
.# $
SwaggerEndpoint$ 3
(3 4
$str4 N
,N O
$strP l
)l m
)m n
;n o
return 
app 
; 
} 	
public 
static 
void %
ConfigureExceptionHandler 4
(4 5
this5 9
IApplicationBuilder: M
appN Q
)Q R
{ 	
app 
. 
UseExceptionHandler #
(# $
appError$ ,
=>- /
{ 
appError 
. 
Run 
( 
async "
context# *
=>+ -
{ 
context 
. 
Response $
.$ %

StatusCode% /
=0 1
(2 3
int3 6
)6 7
HttpStatusCode7 E
.E F
InternalServerErrorF Y
;Y Z
context 
. 
Response $
.$ %
ContentType% 0
=1 2
$str3 E
;E F
var 
contextFeature &
=' (
context) 0
.0 1
Features1 9
.9 :
Get: =
<= >$
IExceptionHandlerFeature> V
>V W
(W X
)X Y
;Y Z
if 
( 
contextFeature &
!=' )
null* .
). /
{ 
await 
context %
.% &
Response& .
.. /

WriteAsync/ 9
(9 :
new: =
ErrorDetails> J
(J K
)K L
{ 

StatusCode &
=' (
context) 0
.0 1
Response1 9
.9 :

StatusCode: D
,D E
Message #
=$ %
$str& >
}   
.   
ToString   "
(  " #
)  # $
)  $ %
;  % &
}!! 
}"" 
)"" 
;"" 
}## 
)## 
;## 
}$$ 	
}%% 
}&& ø
€C:\Users\JUAN\source\repos\Proyecto.JuanPC.Pruebas.TCS\JuanPC.Pruebas.TCS.Gateway.Api\Core\DependencyInjection\Authentication.cs
	namespace 	
JuanPC
 
. 
Pruebas 
. 
TCS 
. 
Gateway $
.$ %
Api% (
.( )
Core) -
.- .
DependencyInjection. A
{		 
public

 

static

 
class

 
Authentication

 &
{ 
public 
static 
IServiceCollection (
AddAuthentication) :
(: ;
this; ?
IServiceCollection@ R
servicesS [
,[ \
IConfiguration] k
configurationl y
)y z
{ 	
var 
appSettingSection !
=" #
configuration$ 1
.1 2

GetSection2 <
(< =
$str= J
)J K
;K L
services 
. 
	Configure 
< 
AppSettings *
>* +
(+ ,
appSettingSection, =
)= >
;> ?
var 
appSettings 
= 
appSettingSection /
./ 0
Get0 3
<3 4
AppSettings4 ?
>? @
(@ A
)A B
;B C
var 
llave 
= 
Encoding  
.  !
ASCII! &
.& '
GetBytes' /
(/ 0
appSettings0 ;
.; <
Token< A
)A B
;B C
services 
. 
AddAuthentication &
(& '
o' (
=>) +
{ 
o 
. %
DefaultAuthenticateScheme +
=, -
JwtBearerDefaults. ?
.? @ 
AuthenticationScheme@ T
;T U
o 
. "
DefaultChallengeScheme (
=) *
JwtBearerDefaults+ <
.< = 
AuthenticationScheme= Q
;Q R
} 
) 
. 
AddJwtBearer 
( 
x 
=>  
{ 
x 
.  
RequireHttpsMetadata &
=' (
false) .
;. /
x 
. 
	SaveToken 
= 
true "
;" #
x 
. %
TokenValidationParameters +
=, -
new. 1%
TokenValidationParameters2 K
{ $
ValidateIssuerSigningKey ,
=- .
true/ 3
,3 4
IssuerSigningKey $
=% &
new' * 
SymmetricSecurityKey+ ?
(? @
llave@ E
)E F
,F G
ValidateIssuer   "
=  # $
false  % *
,  * +
ValidateAudience!! $
=!!% &
false!!' ,
}"" 
;"" 
}## 
)## 
;## 
return$$ 
services$$ 
;$$ 
}%% 	
}&& 
}'' è
šC:\Users\JUAN\source\repos\Proyecto.JuanPC.Pruebas.TCS\JuanPC.Pruebas.TCS.Gateway.Api\Core\DependencyInjection\ConfigurationServiceCollectionExtensions.cs
	namespace		 	
JuanPC		
 
.		 
Pruebas		 
.		 
TCS		 
.		 
Gateway		 $
.		$ %
Api		% (
.		( )
Core		) -
.		- .
DependencyInjection		. A
{

 
public 

static 
class 4
(ConfigurationServiceCollectionExtensions @
{ 
public 
static 
IServiceCollection ($
AddConfigurationServices) A
(A B
thisB F
IServiceCollectionG Y
servicesZ b
)b c
{ 	
services 
. 
AddSingleton !
<! "!
IAuthorizationHandler" 7
,7 8
ScopeHandler9 E
>E F
(F G
)G H
;H I
services 
. 
AddTransient !
<! "

IWordCount" ,
,, -
WordCountAppService. A
>A B
(B C
)C D
;D E
services 
. 
AddTransient !
<! "
	ILoginApp" +
,+ ,
LoginAppService- <
>< =
(= >
)> ?
;? @
return 
services 
; 
} 	
} 
} ƒ
C:\Users\JUAN\source\repos\Proyecto.JuanPC.Pruebas.TCS\JuanPC.Pruebas.TCS.Gateway.Api\Core\DependencyInjection\SwaggerCollectionExtensions.cs
	namespace 	
JuanPC
 
. 
Pruebas 
. 
TCS 
. 
Gateway $
.$ %
Api% (
.( )
Core) -
.- .
DependencyInjection. A
{ 
public		 

static		 
class		 '
SwaggerCollectionExtensions		 3
{

 
public 
static 
IServiceCollection (

AddSwagger) 3
(3 4
this4 8
IServiceCollection9 K
servicesL T
)T U
{ 	
services 
. 
AddSwaggerGen "
(" #
c# $
=>% '
{ 
c 
. 

SwaggerDoc 
( 
$str !
,! "
new# &
OpenApiInfo' 2
{ 
Title 
= 
$str <
,< =
Version 
= 
$str "
,# $
Description 
=  !
$str" /
} 
) 
; 
} 
) 
; 
return 
services 
; 
} 	
} 
} ™
lC:\Users\JUAN\source\repos\Proyecto.JuanPC.Pruebas.TCS\JuanPC.Pruebas.TCS.Gateway.Api\Models\ErrorDetails.cs
	namespace 	
JuanPC
 
. 
Pruebas 
. 
TCS 
. 
Gateway $
.$ %
Api% (
.( )
Models) /
{ 
public 

class 
ErrorDetails 
{ 
public 
int 

StatusCode 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Message 
{ 
get  #
;# $
set% (
;( )
}* +
public		 
override		 
string		 
ToString		 '
(		' (
)		( )
{

 	
return 
JsonConvert 
. 
SerializeObject .
(. /
this/ 3
)3 4
;4 5
} 	
} 
} ¸
mC:\Users\JUAN\source\repos\Proyecto.JuanPC.Pruebas.TCS\JuanPC.Pruebas.TCS.Gateway.Api\Polices\ScopeHandler.cs
	namespace 	
JuanPC
 
. 
Pruebas 
. 
TCS 
. 
Gateway $
.$ %
Api% (
.( )
Polices) 0
{ 
public 

class 
ScopeHandler 
:  
AuthorizationHandler  4
<4 5
ScopeRequirement5 E
>E F
{ 
	protected		 
override		 
Task		 "
HandleRequirementAsync		  6
(		6 7'
AuthorizationHandlerContext		7 R
context		S Z
,		Z [
ScopeRequirement		\ l
requirement		m x
)		x y
{

 	
if 
( 
context 
. 
User 
. 
HasClaim %
(% &
x& '
=>( *
x+ ,
., -
Type- 1
==2 4
$str5 7
&&8 :
x; <
.< =
Issuer= C
==D F
requirementG R
.R S
IssuerS Y
)Y Z
)Z [
{ 
string 
[ 
] 
Scope 
=  
context! (
.( )
User) -
.- .
	FindFirst. 7
(7 8
c8 9
=>: <
c= >
.> ?
Type? C
==D F
$strG I
&&J L
c= >
.> ?
Issuer? E
==F H
requirementI T
.T U
IssuerU [
)[ \
.\ ]
Value] b
.b c
Splitc h
(h i
$chari l
)l m
;m n
if 
( 
Scope 
. 
Any 
( 
c 
=>  "
c# $
==% '
requirement( 3
.3 4
Scope4 9
)9 :
): ;
context 
. 
Succeed #
(# $
requirement$ /
)/ 0
;0 1
} 
return 
Task 
. 
CompletedTask %
;% &
} 	
} 
} ù
qC:\Users\JUAN\source\repos\Proyecto.JuanPC.Pruebas.TCS\JuanPC.Pruebas.TCS.Gateway.Api\Polices\ScopeRequirement.cs
	namespace 	
JuanPC
 
. 
Pruebas 
. 
TCS 
. 
Gateway $
.$ %
Api% (
.( )
Polices) 0
{ 
public		 

class		 
ScopeRequirement		 !
:		" #%
IAuthorizationRequirement		# <
{

 
public 
string 
Issuer 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Scope 
{ 
get !
;! "
set# &
;& '
}( )
public 
ScopeRequirement 
(  
string! '
scope( -
,- .
string/ 5
issuer6 <
)< =
{ 	
Issuer 
= 
issuer 
?? 
throw $
new% (!
ArgumentNullException) >
(> ?
nameof? E
(E F
issuerF L
)L M
)M N
;N O
Scope 
= 
scope 
?? 
throw "
new# &!
ArgumentNullException' <
(< =
nameof= C
(C D
scopeD I
)I J
)J K
;K L
} 	
} 
} Ð
`C:\Users\JUAN\source\repos\Proyecto.JuanPC.Pruebas.TCS\JuanPC.Pruebas.TCS.Gateway.Api\Program.cs
	namespace

 	
JuanPC


 
.

 
Pruebas

 
.

 
TCS

 
.

 
Gateway

 $
.

$ %
Api

% (
{ 
public 

static 
class 
Program 
{ 
public 
static 
void 
Main  
(  !
string! '
[' (
]( )
args* .
). /
{ 	
CreateHostBuilder 
( 
args "
)" #
.# $
Build$ )
() *
)* +
.+ ,
Run, /
(/ 0
)0 1
;1 2
} 	
public 
static 
IHostBuilder #
CreateHostBuilder$ 5
(5 6
string6 <
[< =
]= >
args? C
)C D
=>E G
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{ 

webBuilder 
. 

UseStartup )
<) *
Startup* 1
>1 2
(2 3
)3 4
;4 5
} 
) 
; 
} 
} ›
`C:\Users\JUAN\source\repos\Proyecto.JuanPC.Pruebas.TCS\JuanPC.Pruebas.TCS.Gateway.Api\Startup.cs
	namespace 	
JuanPC
 
. 
Pruebas 
. 
TCS 
. 
Gateway $
.$ %
Api% (
{		 
public

 

class

 
Startup

 
{ 
public 
IConfiguration 
_configuration ,
{- .
get/ 2
;2 3
}4 5
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
_configuration 
= 
configuration *
;* +
} 	
public 
void 
ConfigureServices %
(% &
IServiceCollection& 8
services9 A
)A B
{ 	
services 
. 
AddControllers #
(# $
)$ %
;% &4
(ConfigurationServiceCollectionExtensions 4
.4 5$
AddConfigurationServices5 M
(M N
servicesN V
)V W
;W X'
SwaggerCollectionExtensions '
.' (

AddSwagger( 2
(2 3
services3 ;
); <
;< =
Authentication 
. 
AddAuthentication ,
(, -
services- 5
,5 6
_configuration7 E
)E F
;F G
}!! 	
public$$ 
void$$ 
	Configure$$ 
($$ 
IApplicationBuilder$$ 1
app$$2 5
,$$5 6
IWebHostEnvironment$$7 J
env$$K N
)$$N O
{%% 	
if&& 
(&& 
env&& 
.&& 
IsDevelopment&& !
(&&! "
)&&" #
)&&# $
{'' 
app(( 
.(( %
UseDeveloperExceptionPage(( -
(((- .
)((. /
;((/ 0
})) 
else** 
{++ 
app,, 
.,, %
ConfigureExceptionHandler,, -
(,,- .
),,. /
;,,/ 0
}--  
AppBuilderExtensions//  
.//  ! 
AddSwaggerCollection//! 5
(//5 6
app//6 9
)//9 :
;//: ;
app11 
.11 
UseCors11 
(11 
option11 
=>11 !
{22 
option33 
.33 
AllowAnyHeader33 %
(33% &
)33& '
;33' (
option44 
.44 
AllowAnyMethod44 %
(44% &
)44& '
;44' (
}55 
)55 
;55 
app77 
.77 
UseHttpsRedirection77 #
(77# $
)77$ %
;77% &
app99 
.99 

UseRouting99 
(99 
)99 
;99 
app;; 
.;; 
UseAuthentication;; !
(;;! "
);;" #
;;;# $
app<< 
.<< 
UseAuthorization<<  
(<<  !
)<<! "
;<<" #
app>> 
.>> 
UseEndpoints>> 
(>> 
	endpoints>> &
=>>>' )
{?? 
	endpoints@@ 
.@@ 
MapControllers@@ (
(@@( )
)@@) *
;@@* +
}AA 
)AA 
;AA 
}BB 	
}EE 
}FF 