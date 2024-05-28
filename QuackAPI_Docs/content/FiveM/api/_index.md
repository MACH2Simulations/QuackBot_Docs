+++
archetype = "chapter"
title = "Char API (Stream)"
weight = 1
+++

We offer a free API to allow people to add there own Chat commands to a stream to pull info.  

> NB; !Commands are suggestions / what (Mach) Uses,  
It doesn't really matter how it gets fired, aslong as the right thing gets sent to the API  
This is NOT a chatbot, this is the baseline for a command that can be run from a chatbot...  

## !rp  

The Default repose is the help text  
 
> {{% include "/fivem/api/help.txt" %}}  

### !rp people Slater  

Example of a user short bio  
> {{% include "/fivem/fivemlore/people/slater_short.txt" %}}  

### !rp Place PHI  

Example of a Company Short Bio  
> {{% include "/fivem/fivemlore/places/phi_short.txt" %}}  

### !rp thing  

Example of a 'Things' Short Bio  
> {{% include "/fivem/fivemlore/things/kraken_short.txt" %}}  

### API 


### API Key  

Contact the team for an API Key  

### Stream Chatbot Syntax  
Please make sure "hide command from public pages" is selected where possible, to protect YOUR API Key.  

***Stream Elements***

```text
${customapi https://apiv3.m2s.bz/api/machrp?code=<APIKEY>&type=${1:1|'help'}&name=${2:2|'help'}}

```  
Timers

```text
${customapi https://apiv3.m2s.bz/api/machrp?code=<APIKEY>&type=timers&name=<TimerName>}
```

***Nightbot***

Might be broken  

```text
$(urlfetch https://apiv3.m2s.bz/api/machrp?code=<APIKEY>&name=$(2)&type=$(1))
```

***Streamlabs***  

Untested Recently  

```text
{readapi.https://apiv3.m2s.bz/api/dotrp?code=<APIKEY>&name={2}&type={1}}
=======
```  

***Nightbot***
```
$(urlfetch https://apiv3.m2s.bz/api/machrp?code=<APIKEY>&name=$(2)&type=$(1))
```
