# Bank Analysis

I was thinking on opening a new bank account and in the way i thought "damn, I could analyse the sentiment in news related to each bank available in Spain and make an automated dashboard". So this is the project.

**Tools:**
- Source:   The Gdelt Project.
- Data warehouse:   BigQuery
- Dashboard:    Data Studio.


**Candidate keywords:**

- abanca
- activobank
- bankia
- bankinter
- barclays
- bbva
- caja rural
- caixa
- evo
- ibercaja
- ing
- imaginbank
- kutxabank
- liberbank
- mediolanum
- n26
- openbank
- santander
- triodos
- unicaja
- wizink


**Sentiment analysis metrics:**

- Tone = Average tone [-100,+100]. Common values between -10 and 10

- ARF = Activity reference density. % of words that that were active words. How active is the text compared with a clinically descriptive text.

- Polarity = % of words that had matches in the tonal dictionary as an indicator of how emotionally polarized or charged the text is. If Polarity is high but Tone neutral, this suggests the text was highly emotionally charged, but had roughly equivalent numbers of positively and negatively charged emotional words

- fg_rf = self/group reference density. % of all words in the article that are pronouns, capturing a combination of self-references and group-based discurse. EGO stuff. In news media it tends to have a very low ARF

- pos_score = % of all words in the article found to have a positive emotional connotation [0,+100]

- neg_score = % of all words in the article found to have a negative emotional connotation [-100,0]

Let's try just for once to make a cute dashboard without overdose of information. Choose between tone or pos&neg_score. Maybe just the 1st one.