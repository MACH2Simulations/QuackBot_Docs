+++
title = '8 AM Server updates'
date = 2024-02-11T16:58:05Z
Weight = 1
+++

Relatively early into my IT Career, say a year / 18 months, I rebuilt the WSUS server at my work.  
Those who know the pain of WSUS know that to keep it working it needs to be rebuilt every now and then so it keeps working, and it hadn't been working for a while so I took it on as a project.  
"Money" is why were didn't user SCCM/Intune  

I Read the docs several times, and got to work following them were I needed to. I Selected what update packs we needed at the time, Windows Server 2012, Windows 10 etc.  
I Put the computers into groups; Student desktops, Teacher Desktops, Laptops, Servers. As would make sense for our network at the time.
I Did a bit of testing on a couple of machines, Waited for all of the required update packages to download, and it worked as expected.  

Now it was time to push some updates out, I think I was doing this over the summer holidays, or just before a short holiday.  

So, I selected all of the computers and released all of the updates.  
I then Deselected the servers, and then set a deadline for the updates of 7am Monday, thinking come in Monday morning and everything will be nicely updated.  

Came in Monday, got coffee started doing whatever, to get a call from a member of staff to say XYZ wasn't working, if I am remembering correctly it was emails, so the exchange server as we had an onsite on at the time.  
Dear reader, it was not just exchange, but all of the servers.  

Some of the servers were mid update, so I could do nothing about those, and a few were waiting to restart.  
I Denied the updates in WSUS and that didn't help.  

Eventually the midway through servers got to desktop, and I killed the WSUS Server until I could manually fix things, which took a few days.  

What I think happened here was the enforced update approval applied to the update package itself, rather than the computers that had the deadline, at least that was my understanding of what happened at the time.  
(The update was approved on all machines, with a deadline on some of them).  
Or now, as I write this out many years after the fact, it may have just been the server going "ooh I can update now as it had approved updates it could install"  

Following on from that, I Managed a proper update policy and kept WSUS running as well as it could whilst I was there.  No more accidental Server updates.
