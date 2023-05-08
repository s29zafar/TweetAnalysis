# Tweet Analysis

Understanding when users access a website is an important goal for many online platforms. Knowing when users are online and 
engaging with content can help developers manage resources, improve the overall user experience, and better optimize mechanisms of 
user interaction, such as the placement and timing of advertisements. Understanding the patterns of site activity is also useful 
for users of the website, such as knowing the best times to publish content to maximize engagement.

## Analysis 1

In this Analysis we will be taking a first look at our datasets using some of the ideas explored in Chapter 1 of the course. In 
particular, we will be analyzing when users publish their tweets, and whether this is associated with how much engagement those 
tweets receive from other users.

I will be using graphs and plots to confirm my analysis, examples of these are as follows:

<img width="804" alt="Screen Shot 2022-09-21 at 5 09 24 PM" src="https://user-images.githubusercontent.com/69566994/236864457-a33ef811-d727-4a46-b79d-9ed7a35ec22d.png">
<img width="634" alt="Screen Shot 2022-09-21 at 8 41 45 PM" src="https://user-images.githubusercontent.com/69566994/236864475-f0fad87f-7c55-499d-9145-de8141f0f22a.png">
<img width="633" alt="Screen Shot 2022-09-22 at 1 50 06 PM" src="https://user-images.githubusercontent.com/69566994/236864485-750a750a-9406-45dd-a531-30f324454df6.png">


## Analysis 2

In Analysis 1, we explored when Twitter users published their tweets. In this Analysis, we’ll be exploring two features of the 
tweets themselves: their length, and their use of media (such as photos or videos).

Understanding not just when, but how users are interacting with a platform is important for various reasons. For developers, it is 
useful to know what features their users are - and aren’t - taking advantage of, or look for clues that new features may be 
desirable. For example, in 2017 Twitter increased the maximum length of tweets from 140 characters to 280 characters in a response 
to how users were using - and wanted to use - the service.

I will be using graphs and plots to confirm my analysis, examples of these are as follows:

<img width="647" alt="Screen Shot 2022-10-20 at 2 16 43 PM" src="https://user-images.githubusercontent.com/69566994/236864585-b50add39-6328-4223-9bcf-6d718fe0b738.png">
<img width="644" alt="Screen Shot 2022-10-20 at 4 22 27 PM" src="https://user-images.githubusercontent.com/69566994/236864602-aa7bab1c-faed-4736-8bab-530a59905b7b.png">
<img width="651" alt="Screen Shot 2022-10-21 at 2 03 41 AM" src="https://user-images.githubusercontent.com/69566994/236864629-784ed06f-fd9e-4dfd-9fc0-42c0cef54a0b.png">


## Analysis 3

This Analysis focuses on interval estimation techniques. We will seek to model the tweet.gap variate, which measures the time (or 
‘gap’) between the publication of tweets. More precisely, for a particular tweet, tweet.gap gives the number of seconds since the 
user’s previous tweet was published.

Data about how often a user is interfacing with a website, service, or product, are valuable for a variety of reasons. The 
regularity, and reliability, with which users return (sometimes referred to as ‘stickiness’) is a key metric to assess product 
performance, as well as for testing the effectiveness of new features and initiatives.

In addition to providing insights into how often users post tweets, the variate tweet.gap also provides an opportunity to explore 
some challenges commonly encountered in real-world data analysis. Many of you will find that tweet.gap contains some particularly 
large values, as a result of users not tweeting for several days, or even weeks. When working with real-world data it is common to 
encounter unusual behaviour such as this, which can make finding a suitable statistical model difficult.

In this Analysis, we will explore two approaches for modelling data with unusual distributions. One of these is to consider a 
subset of the data, narrowing the focus of our research question in order to facilitate meaningful analysis. The other is data 
transformation, which we have used previously (such as in taking logs of the likes variate) and will now extend to other, more 
complex transformation procedures.

I will be using graphs and plots to confirm my analysis, examples of these are as follows:

<img width="923" alt="Screen Shot 2022-11-02 at 7 45 26 PM" src="https://user-images.githubusercontent.com/69566994/236864747-9bf68b5c-7789-4722-83c0-f5fe32e8598f.png">

## Analysis 4

In our final Analysis, we will be exploring some of new methods. In particular, we will see how we can extend some of the sub-
analyses we carried out on previous Analysis, now that we have learned new statistical concepts and analysis techniques. In real- 
world data analysis we are always looking for ways to improve and further our analyses, and we hope this Analysis will help you 
appreciate how many ideas in the statistics are related.

This Analysis begins with hypothesis testing, looking first at a new variate: the use of hashtags. We’ll see how often users are 
employing this feature, and compare that with past data to see if behaviours have changed. Understanding how user behaviour 
changes over time (or even if it changes at all) is of key interest to product developers (and newly-installed CEOs), and can 
inform whether to keep, add, or remove features. This is an opportunity for us to explore that very important principle.

We will then extend the sub-analyses of Analysis 3, where we explored how often users are tweeting. Whereas in Analysis 3 we 
explored this using confidence intervals, we will now deepen our understanding using hypothesis testing.

Our third analysis extends our investigation into the relationship between tweet length and number of likes received, which we 
began in Analysis 2. Whereas then we were limited to inspecting scatterplots and sample correlation, we are now able to employ 
the extremely powerful technique of linear regression!

We’ll finish off with a final analysis that explores what variates affect the number of likes a tweet receives. This will build on 
analyses conducted in Analysis 1 and 2, and you’ll get to decide which analysis you’re most interested in extending!

I will be using graphs and plots to confirm my analysis, examples of these are as follows:


![3E](https://user-images.githubusercontent.com/69566994/236724259-f7746571-e0c1-4a68-a3ac-bd471035c1e9.png)
![3f(1)](https://user-images.githubusercontent.com/69566994/236724281-7b998f26-7291-4718-86fd-f1d1529f08f2.png)
![3f(2)](https://user-images.githubusercontent.com/69566994/236724286-60393da7-e775-4d8d-bccf-b2e38de901c0.png)
