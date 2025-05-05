+++
title = 'Intake Goes Bye Bye'
date = 2024-06-21T21:45:21+01:00
+++

Another Late at the grammar story.  

We stored student files in a way similar to this.  

```text  
\\DC1\Studnet\2018
\\DC1\Studnet\2020
\\DC2\Studnet\2017
\\DC2\Studnet\2019
```  

The year represents the year the student would be if they started at our school at Year 7 (11 years old by Aug 31st).  
At the time our retention policy was 7/8 years (the math is confusing as will be shown in this post).  
We went to Year 13, so it effectively it would be the August of year 14 if they stayed in school for the extra year (trying to explain the context rather than what happened).  

Now i'm not sure what i was doing, weather it was archiving redundant Y7 User areas that were on OneDrive, or archiving old accounts.  
Given this only effected user aras i think it was the former.  

In any case I Did the maths wrong and decided that "2018" was the accounts i wanted to do something with. Wether by script or manually i ended up removing all the file permissions and then moving the files to the archive.  
An Amount of time later a student came in and said they couldn't find their work.  

I Had move the wrong files...  

Went and told the IT Teacher who had that class next i'd f***ed up and started to fix the problem. Some file moving and a quick powershell script later (it was quicker to write a powershell script than manually fix the perms - per user perms on the home directories)  and it was fixed before causing any major issues.  
  
i'd not told the boss about this, i broke and fixed it without being able to see him.  
I Popped into the office to talk about something else, and he said something tro the effective of 'am i not telling him something'. I said i was going to but was getting it fixed first...

---  

> i know i learnt something from this but have no recollection of what.  
> "Be more careful" Isn't really a useful learning point
> Although i am a big fan of keeping people in the loop, from a personal point of view i find it more prudent to get stuff being fixed then communicate. i do know its a bit of both. and which is more important will depend on the environment.  
> Some people will want 5 minute updates, other want to know that its being fixed and when its fixed.  
> I Think this made me have better plans and backups when doing mass updates on things though  