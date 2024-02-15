+++
title = 'HTTPS Does Not Mean Safe'
date = 2024-02-15T21:08:02Z
+++

APR 16, 2019

![image](../../TechGuyBlog/images/ssl.png)

This post was Spurred on by a discussion on website safety and how to teach young people how to tell if a website is safe. I Somewhat hyperbolically said no website is safe and that the green padlock / HTTPs basically means nothing.
The longer version is a bit more complex than this and i will go into it in this post.

## What are the types of SSL Certificates?  

This article (External Link) gives a more in depth explanation of each type of SSL Cert### DV – Domain Validation  

This is the most common certificate for sites such as this one, they’re usually shared certificates meaning that many sites can be using the same one and it means that the person who controls the webserver and the domain are the same person.  

### OV – Organisation Validation  

The second most common, they are usually used by bigger corporations who have no need for EV, However they would like an extra amount of trust. The BBC Is an example of this. This shows that a specific company controls the server and the domain.  

### EV – Extended Validation  

This is the least common type, usually only use on sites where money or sensitive data is transmitted. Such as the natwest website. This is a significantly harder certificate to acquire as it requires a physical address among many other requirements for this to be issued. These are as secure as you can get.  

---

## So what does the green padlock mean?  

It usually means you are connected to a web server controlled by the same entity that controls the domain.  

---

So it’s secure right?
Yes and no, Its secure in the sense of your web traffic between your device and the web server is encrypted and secure* but this does not mean that the website in itself is safe.  

*Many Corporate networks use their own trusted root certificate installed on the device which gets used to encrypt the network traffic, which then gets decrypted, filtered then re encrypted using the correct certificate sent to whatever server it should be going to then the reverse happens for everything returning. This also means that (in theory) anything that gets sent via the network (passwords. usernames, bank details etc) can be viewed in plain text. And an end user would not be able to tell the difference even when browsing a EV Site. – Important note! No IT person cares or has the time to go snooping on your data packets.  
VPNS Also do this to hide and protect your web traffic.  

{{< youtube 7_-J_McbfbQ >}}  

Note; The time changes due to the server not accounting for daylight savings

---

### How easy is it to get the green padlock  

Less than the time to make a good coffee, see the video bellow. – Site used is totallypaypal.notreal.co.uk
Interestingly it took me longer to write the paragraph above than give my fake site the green padlock (ignoring a weird glitch i had)

---

### What does this actually mean for me?  

If you are one a website such as online banking and it has the green bar / EV Cert, you are probably connected to your banks server and are as safe as the site is.
And for everything else with the green padlock, you are probably connected to the server of the domain owner.

### So Why did i say it was unsafe  

It gives a false sense of security, there has been millions of green padlocked sites that have been hacked. From sites similar to mine, to huge organisations such as Foxy Bingo and verifications.IO both of which had green padlocks.  

## TLDR;  

A Green padlock only shows that your connection between your device and the server is secure. Not that the site is secure or legitimate. Avoiding (most) sites that do not use SSL (Especially those that you login to) is a good step in staying safe/er online. But is a tiny step in the greater scheme of things.  