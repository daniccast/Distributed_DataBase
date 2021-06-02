rem  Regular expressions 
set pagesize 99
set linesize 130
set colsep '|=|'
set null s/Dato
rem manual de Oracle

rem Matching Character List
rem You use the matching character list
rem  to search for an occurrence of
rem  any character in a list
/*
[abc]

datos 
at
bet
cot
rem no cumple
rem The expression does not match:
def
---

a.c

datos
abc
adc
a1c
a&c
rem no cumple
rem The expression does not match:
abb


One or More--Plus
a+
a
aa
aaa
rem The expression does not match:
bbb

rem Zero or One--Question Mark Operator
ab?c
This expression matches:
abc
ac
rem The expression does not match:

adc
abbc

rem Zero or More--Star
ab*c

ac
abc
abbc
abbbbc

rem The expression does not match:

adc


rem Interval--Exact Count
The exact-count interval 
operator is specified 
with a single digit enclosed in braces
a{5}
aaaaa

The expression does not match:

aaaa
Interval--At Least Count
a{3,}
This expression matches all of the following:

aaa
aaaaa

The expression does not match:

aa
Interval--Between Count


a{3,5}
aaa
aaaa
aaaaa

The expression does not match:

aa

Matching Character List
You use the matching character list to search 
for an occurrence of any character in a list.

[abc]

at
bet
cot

The expression does not match:

def


The following regular expression operators are allowed within the character list, any other metacharacters included in a character list lose their special meaning (are treated as literals):

Range operator '-'
POSIX character class [::]
POSIX collating sequence [. .]
POSIX character equivalence class [= =]



*/

Non-Matching Character List

[^abc]


This expression matches characters 'd' and 'g' in the following strings:

abcdef
ghi

The expression does not match:

abc

rem
[^a-i]


This expression matches the characters 'j' and 'l' in the following strings:

hijk
lmn

The expression does not match the characters:

abcdefghi


Or

a|b

Subexpression

For example, to find the optional string 'abc', followed by 'def', use the following regular expression:

(abc)?def


This expression matches strings 'abcdef' and 'def' in the following strings:

abcdefghi
defghi

ghi

Backreference
The backreference 
lets you search for a repeated expression. You specify a backreference with '\n',

For example, to find a repeated occurrence of either string 'abc' or 'def', use the following regular expression:

(abc|def)\1

This expression matches the following strings:

abcabc
defdef

The expression does not match the following strings:

abcdef
abc


The backreference lets you search for a repeated string without knowing the actual string ahead of time. For example, the regular expression:

^(.*)\1$ 

matches a line consisting of two adjacent appearances of the same string

Escape Character
Use the escape character '\' 
to search for a character that is normally treated as a metacharacter.

\+

This expression matches the plus character '+' in the following string:

abc+def

The expression does not match any characters in the string
abcdef



POSIX Character Class
The POSIX character class operator lets you search for an expression within a character list that is a member of a specific POSIX Character Class
 
 
 spool off; 