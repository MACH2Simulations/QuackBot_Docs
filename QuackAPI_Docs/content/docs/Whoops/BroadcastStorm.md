+++
title = 'Broadcast Storm & Missing Switch'
date = 2024-06-21T19:57:16+01:00
+++

Oct/Nov 2017  

> Important context, this was a week or two into my first job.  
> Looking back I knew nothing.  
> i'd been reading ***a lot*** of random stuff on Reddit, Stack etc to try and gain knowledge.  

Due to its weird shape, and its size, the grammar school had many networking switches across the site. Some where up in nice cabs, others were shoved on the top of a shelf.  

Get a call about a classroom computer not logging in, naturally an 'important' users.  
Go up to the PC, yup doesn't log in.  
Tried the local admin account, that works.  
The dreaded no network icon showing in the bottom right, but the link lights were showing on the Nic.  
Couple of restarts, pretty sure a new cable and some blowing later its still not working.  

I Can't remember what the next bits were, but it ended in me starting to re-image the PC.  

Set it off, head back to the office.  Then i get a call, Several of the computers on that switch had started to have internet / network issues.  

At this point i had no idea and was far out of my depth so i went to speak to my boss.  

Me: I think its a broadcast storm.  
Boss: Why?  
(Paraphrasing)

I Don't know why i thought that. Looking back i think i probably meant some sort of network loop.  

It sort of made sense in my head at the time, was messing with a network issue and broke the network.  

I Was wrong.  

I don't know how much i did from this point, Almost 7 years ago as writing this, so i can't remember who did the log diving.  

But it turns out our Core switch had an error that amounted to "too many connections", the number in the log was big!  
Filling in the blanks in my head, what i think may have happened is over the years between restarts, it had been counting every time something had connected to it or it just decided to be weird that day. But a restart of the core switch fixed it.  

Then i had to image the PC i had broke in the first place for such a weird issue.  

> This is not something i learnt from straight away, but now i look back at it and go "Look what you thought here and what the actual issue was". Granted this was a higher level network issue, but i jumped to a very specific one far to early.  
> I Still sometimes overthink problems, but am getting much better at the simpler solutions.  

---

This reminds me of another story with the core switch, which isn't big enough for its own story.  

For whatever reason lost to time, i had been looking through the logs on the core switch, and noticed that it was giving a fan error.  
Went to check on it, at least one of the fans was still working, but there was one not blowing air.  
Told my boss, Raised it with HP after a slightly painful support call and some log sending, they over-nighted a new chassis.  

But UPS* Lost it.  
We'd planned downtime for just before site opened the day after it should have been delivered, but then couldn't.  

We had to wait (5?) days for them to declare it lost and then send us a new one out.  
Second one came, and a day later the original one was delivered.  

A Couple of days later we scheduled downtime and the boss replaced it just before i got to work that day...  

The one with the dead fan and one of the replacements got sent back.  
