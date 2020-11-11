# Video - Key to SRE



## Excerpt (WIP)
* define written SLAs, SLOs for every service (and measure it!)
* Use error budgets as your launch criterea
* teams are self-policing - because they are not monolithic
* put a 50% cap on Ops work (tickets, maintanence, ...)
  * usually ~30%
* on call also for devs
* SRE Portability (https://youtu.be/n4Wf14e2jxQ?t=2387)
  * no requirement to stick with any project
  * no requirement to stick with SRE
  * build it and they will come
  * bust it, and they will leave
* availability <100%! -> there will be outages!
  * minimize damage
  * practice, practice, practice (wheel of misfortune)
  * do post mortems
* 

## Prevent recurrenence of outages
1. Handle the event
2. Write post-mortems
3. Reset

### Consequence
* max of 2 events per oncall shift
* minimum group size 8(people)x1(locations) or 6x2


## Post Mortem philosophy
* PMs are blameless
* Assure people are intelligent, well-intentioned ("it's not the person - it's the environment")
* Focus on process & tech
* create a timeline
* get all the facts
* Create bugs for all followup work

...


## Links
* https://www.youtube.com/watch?v=n4Wf14e2jxQ