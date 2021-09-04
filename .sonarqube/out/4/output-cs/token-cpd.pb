…
vC:\Users\JUAN\source\repos\Proyecto.JuanPC.Pruebas.TCS\JuanPC.Pruebas.TCS.Core\Aplication\Login\Contracts\ILoginApp.cs
	namespace		 	
JuanPC		
 
.		 
Pruebas		 
.		 
TCS		 
.		 
Core		 !
.		! "

Aplication		" ,
.		, -
Commands		- 5
.		5 6
Login		6 ;
.		; <
	Contracts		< E
{

 
public 

	interface 
	ILoginApp 
{ 
RequestResult 
< 
UserDto 
> 
	LoginUser (
(( )
string) /
user0 4
,4 5
string6 <
password= E
)E F
;F G
} 
} í7
rC:\Users\JUAN\source\repos\Proyecto.JuanPC.Pruebas.TCS\JuanPC.Pruebas.TCS.Core\Aplication\Login\LoginAppService.cs
	namespace 	
JuanPC
 
. 
Pruebas 
. 
TCS 
. 
Core !
.! "

Aplication" ,
., -
Commands- 5
.5 6
Login6 ;
{ 
public 

class 
LoginAppService  
:! "
	ILoginApp# ,
{ 
private 
readonly 
AppSettings $
_appSettings% 1
;1 2
public 
LoginAppService 
( 
IOptions '
<' (
AppSettings( 3
>3 4
appSettings5 @
)@ A
{ 	
_appSettings 
= 
appSettings &
.& '
Value' ,
;, -
} 	
private%% 
string%% 
GetToken%% 
(%%  
Users%%  %
user%%& *
)%%* +
{&& 	
var'' 
tokenHandler'' 
='' 
new'' "#
JwtSecurityTokenHandler''# :
('': ;
)''; <
;''< =
var(( 
llave(( 
=(( 
Encoding((  
.((  !
ASCII((! &
.((& '
GetBytes((' /
(((/ 0
_appSettings((0 <
.((< =
Token((= B
)((B C
;((C D
var)) 
tokenDescriptor)) 
=))  !
new))" %#
SecurityTokenDescriptor))& =
{** 
Subject++ 
=++ 
new++ 
ClaimsIdentity++ ,
(++, -
new,, 
Claim,, 
[,, 
],, 
{-- 
new.. 
Claim.. !
(..! "

ClaimTypes.." ,
..., -
NameIdentifier..- ;
,..; <
user..< @
...@ A
gmail..A F
)..F G
,..G H
new// 
Claim// !
(//! "

ClaimTypes//" ,
.//, -
NameIdentifier//- ;
,//; <
user//< @
.//@ A
numeroDocumento//A P
.//P Q
ToString//Q Y
(//Y Z
)//Z [
)//[ \
}00 
)11 
,11 
Expires22 
=22 
DateTime22 "
.22" #
UtcNow22# )
.22) *
AddDays22* 1
(221 2
$num222 3
)223 4
,224 5
SigningCredentials33 "
=33# $
new33% (
SigningCredentials33) ;
(33; <
new33< ? 
SymmetricSecurityKey33@ T
(33T U
llave33U Z
)33Z [
,33[ \
SecurityAlgorithms33] o
.33o p

HmacSha25633p z
)33z {
}44 
;44 
var66 
token66 
=66 
tokenHandler66 $
.66$ %
CreateToken66% 0
(660 1
tokenDescriptor661 @
)66@ A
;66A B
return77 
tokenHandler77 
.77  

WriteToken77  *
(77* +
token77+ 0
)770 1
;771 2
}88 	
private@@ 
static@@ 
Users@@ 
getUserLogin@@ )
(@@) *
string@@* 0
name@@1 5
,@@5 6
string@@7 =
password@@> F
)@@F G
{AA 	
UsersBB 
_userBB 
=BB 
newBB 
UsersBB #
(BB# $
)BB$ %
;BB% &
ifDD 
(DD 
!DD 
(DD 
_userDD 
.DD 
nameDD 
.DD 
EqualsDD #
(DD# $
nameDD$ (
)DD( )
&&DD* ,
_userDD- 2
.DD2 3
passwordDD3 ;
.DD; <
EqualsDD< B
(DDB C
passwordDDC K
)DDK L
)DDL M
)DDM N
returnEE 
nullEE 
;EE 
returnFF 
_userFF 
;FF 
}GG 	
publicQQ 
RequestResultQQ 
<QQ 
UserDtoQQ $
>QQ$ %
	LoginUserQQ& /
(QQ/ 0
stringQQ0 6
userQQ7 ;
,QQ; <
stringQQ= C
passwordQQD L
)QQL M
{RR 	
trySS 
{TT 
UserDtoUU 
	resulUserUU !
=UU" #
newUU$ '
UserDtoUU( /
(UU/ 0
)UU0 1
;UU1 2
ifWW 
(WW 
stringWW 
.WW 
IsNullOrEmptyWW (
(WW( )
userWW) -
)WW- .
)WW. /
returnXX 
RequestResultXX (
<XX( )
UserDtoXX) 0
>XX0 1
.XX1 2
CreateUnsuccessfulXX2 D
(XXD E
newXXE H
stringXXI O
[XXO P
]XXP Q
{XXR S
$str	XXT ‡
}
XXˆ ‰
)
XX‰ Š
;
XXŠ ‹
ifZZ 
(ZZ 
stringZZ 
.ZZ 
IsNullOrEmptyZZ (
(ZZ( )
passwordZZ) 1
)ZZ1 2
)ZZ2 3
return[[ 
RequestResult[[ (
<[[( )
UserDto[[) 0
>[[0 1
.[[1 2
CreateUnsuccessful[[2 D
([[D E
new[[E H
string[[I O
[[[O P
][[P Q
{[[R S
$str	[[S †
}
[[‡ ˆ
)
[[ˆ ‰
;
[[‰ Š
Users^^ 
responseUser^^ "
=^^# $
getUserLogin^^% 1
(^^1 2
user^^2 6
,^^6 7
password^^8 @
)^^@ A
;^^A B
if__ 
(__ 
responseUser__  
==__! #
null__$ (
)__( )
return`` 
RequestResult`` (
<``( )
UserDto``) 0
>``0 1
.``1 2
CreateUnsuccessful``2 D
(``D E
new``E H
string``I O
[``O P
]``P Q
{``R S
$str``T u
}``v w
)``w x
;``x y
	resulUserbb 
.bb 
usernamebb "
=bb# $
responseUserbb% 1
.bb1 2
namebb2 6
;bb6 7
	resulUsercc 
.cc 
gmailcc 
=cc  !
responseUsercc" .
.cc. /
gmailcc/ 4
;cc4 5
	resulUserdd 
.dd 
tokendd 
=dd  !
GetTokendd" *
(dd* +
responseUserdd+ 7
)dd7 8
;dd8 9
returnff 
RequestResultff $
<ff$ %
UserDtoff% ,
>ff, -
.ff- .
CreateSuccessfulff. >
(ff> ?
	resulUserff? H
)ffH I
;ffI J
}gg 
catchhh 
(hh 
	Exceptionhh 
errorhh "
)hh" #
{ii 
returnjj 
RequestResultjj $
<jj$ %
UserDtojj% ,
>jj, -
.jj- .
CreateErrorjj. 9
(jj9 :
errorjj: ?
.jj? @
Messagejj@ G
)jjG H
;jjH I
}kk 
}ll 	
}nn 
}oo ¨
tC:\Users\JUAN\source\repos\Proyecto.JuanPC.Pruebas.TCS\JuanPC.Pruebas.TCS.Core\Aplication\Login\Model\AppSettings.cs
	namespace 	
JuanPC
 
. 
Pruebas 
. 
TCS 
. 
Core !
.! "

Aplication" ,
., -
Commands- 5
.5 6
Login6 ;
.; <
ModelDTO< D
{ 
public		 

class		 
AppSettings		 
{

 
public 
string 
Token 
{ 
get !
;! "
set# &
;& '
}( )
} 
} æ
pC:\Users\JUAN\source\repos\Proyecto.JuanPC.Pruebas.TCS\JuanPC.Pruebas.TCS.Core\Aplication\Login\Model\UserDTO.cs
	namespace 	
JuanPC
 
. 
Pruebas 
. 
TCS 
. 
Core !
.! "

Aplication" ,
., -
Commands- 5
.5 6
Login6 ;
.; <
ModelDTO< D
{ 
public		 

class		 
UserDto		 
{

 
public 
UserDto 
( 
) 
{ 	
this 
. 
username 
= 
null  
;  !
this 
. 
gmail 
= 
null 
; 
this 
. 
token 
= 
null 
; 
this 
. 
error 
= 
null 
; 
} 	
public 
string 
username 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
gmail 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
token 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
error 
{ 
get !
;! "
set# &
;& '
}( )
} 
} é
{C:\Users\JUAN\source\repos\Proyecto.JuanPC.Pruebas.TCS\JuanPC.Pruebas.TCS.Core\Aplication\WordCount\Contracts\IWordCount.cs
	namespace 	
JuanPC
 
. 
Pruebas 
. 
TCS 
. 
Core !
.! "
	NewFolder" +
{		 
public

 

	interface

 

IWordCount

 
{ 
RequestResult 
< 
dynamic 
> 
ValidWordCount -
(- .
string/ 5
text6 :
): ;
;; <
} 
} —
…C:\Users\JUAN\source\repos\Proyecto.JuanPC.Pruebas.TCS\JuanPC.Pruebas.TCS.Core\Aplication\WordCount\Models\RequesValidWordCountDTO.cs
	namespace 	
JuanPC
 
. 
Pruebas 
. 
TCS 
. 
Core !
.! "
Domain" (
.( )
Models) /
{ 
public		 

class		 #
RequesValidWordCountDto		 (
{

 
public 
int 
	countChar 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
	chararter 
{  !
get" %
;% &
set' *
;* +
}, -
} 
} •*
zC:\Users\JUAN\source\repos\Proyecto.JuanPC.Pruebas.TCS\JuanPC.Pruebas.TCS.Core\Aplication\WordCount\WordCountAppService.cs
	namespace		 	
JuanPC		
 
.		 
Pruebas		 
.		 
TCS		 
.		 
Core		 !
{

 
public 

class 
WordCountAppService $
:% &
	DbContext' 0
,0 1

IWordCount2 <
{ 
public 
RequestResult 
< 
dynamic $
>$ %
ValidWordCount& 4
(4 5
string5 ;
text< @
)@ A
{ 	
try 
{ 
int!! 
contador!! 
=!! 
$num!!  
;!!  !
int"" 
indexPosition"" !
=""" #
$num""$ %
;""% &
List## 
<## #
RequesValidWordCountDto## ,
>##, -
addRequestDTO##. ;
=##< =
new##> A
List##B F
<##F G#
RequesValidWordCountDto##G ^
>##^ _
(##_ `
)##` a
;##a b
if&& 
(&& 
text&& 
==&& 
null&&  
)&&  !
return'' 
RequestResult'' '
<''' (
dynamic''( /
>''/ 0
.''0 1
CreateUnsuccessful''1 C
(''C D
new''D G
string''H N
[''N O
]''O P
{''Q R
$str''S w
}''x y
)''y z
;''z {
string** 
	resultext**  
=**! "#
RemoveCharacterSpecials**$ ;
(**; <
text**< @
)**@ A
;**A B
for,, 
(,, 
int,, 
i,, 
=,, 
$num,, 
;,, 
i,,  !
<=,," $
	resultext,,% .
.,,. /
Length,,/ 5
;,,5 6
i,,7 8
++,,8 :
),,: ;
{-- 
string.. 
	validChar.. $
=..% &
	resultext..' 0
...0 1
	Substring..1 :
(..: ;
$num..; <
,..< =
$num..> ?
)..? @
;..@ A
contador// 
=// 
$num//  
;//  !
indexPosition00 !
=00" #
$num00$ %
;00% &
while11 
(11 
indexPosition11 (
!=11) +
-11, -
$num11- .
)11. /
{22 
indexPosition33 %
=33& '
text33( ,
.33, -
IndexOf33- 4
(334 5
	validChar335 >
,33> ?
indexPosition33@ M
)33M N
;33N O
if44 
(44 
indexPosition44 )
>=44* ,
$num44- .
)44. /
{55 
contador66 $
++66$ &
;66& '
indexPosition77 )
++77) +
;77+ ,
}88 
}99 
addRequestDTO:: !
.::! "
Add::" %
(::% &
new::& )#
RequesValidWordCountDto::+ B
{;; 
	countChar<< !
=<<" #
contador<<$ ,
,<<, -
	chararter== !
===" #
	validChar==$ -
}>> 
)>> 
;>> 
	resultext?? 
=?? 
	resultext??  )
.??) *
Replace??* 1
(??1 2
	validChar??2 ;
,??; <
$str??= ?
)??? @
;??@ A
i@@ 
=@@ 
$num@@ 
;@@ 
}AA 
returnBB 
RequestResultBB $
<BB$ %
dynamicBB% ,
>BB, -
.BB- .
CreateSuccessfulBB. >
(BB> ?
addRequestDTOBB? L
)BBL M
;BBM N
}CC 
catchDD 
(DD 
	ExceptionDD 
errorDD "
)DD" #
{EE 
returnGG 
RequestResultGG #
<GG# $
dynamicGG$ +
>GG+ ,
.GG, -
CreateErrorGG- 8
(GG8 9
errorGG9 >
.GG> ?
MessageGG? F
)GGF G
;GGG H
}HH 
}II 	
privateSS 
staticSS 
stringSS #
RemoveCharacterSpecialsSS 5
(SS5 6
stringSS6 <
descripcionSS= H
=SSI J
$strSSK M
)SSM N
{TT 	
stringUU 
outputUU 
=UU 
$strUU 
;UU 
ifVV 
(VV 
descripcionVV 
!=VV 
nullVV #
)VV# $
{WW 
stringXX 
trimXX 
=XX 
descripcionXX )
.XX) *
ReplaceXX* 1
(XX1 2
$strXX2 5
,XX5 6
$strXX7 9
)XX9 :
;XX: ;
trimYY 
=YY 
trimYY 
.YY 
ReplaceYY #
(YY# $
$strYY$ '
,YY' (
$strYY) +
)YY+ ,
;YY, -
trimZZ 
=ZZ 
trimZZ 
.ZZ 
ReplaceZZ #
(ZZ# $
$strZZ$ '
,ZZ' (
$strZZ) +
)ZZ+ ,
;ZZ, -
output[[ 
=[[ 
trim[[ 
;[[ 
}\\ 
return^^ 
output^^ 
.^^ 
Trim^^ 
(^^ 
)^^  
;^^  !
}__ 	
}aa 
}bb ï
dC:\Users\JUAN\source\repos\Proyecto.JuanPC.Pruebas.TCS\JuanPC.Pruebas.TCS.Core\Domain\Models\User.cs
	namespace 	
JuanPC
 
. 
Pruebas 
. 
TCS 
. 
Core !
.! "
Domain" (
.( )
Models) /
{ 
public		 

class		 
User		 
{

 
public 
class 
Users 
{ 	
public 
Users 
( 
) 
{ 
this 
. 
name 
= 
$str #
;# $
this 
. 
gmail 
= 
$str .
;. /
this 
. 
numeroDocumento $
=% &
$num' 0
;0 1
this 
. 
password 
= 
$str  *
;* +
} 
public 
string 
name 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
gmail 
{  !
get" %
;% &
set' *
;* +
}, -
public 
int 
numeroDocumento &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
string 
password "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 	
} 
} 