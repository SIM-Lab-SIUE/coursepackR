# Unified Music Dataset

A curated dataset combining Billboard chart performance, Spotify audio
features, and Genius metadata for 1,792 songs. Used throughout "From
Vibes to Variables" for teaching data analysis and research methods.

## Usage

``` r
unified_music
```

## Format

A data frame with 1,792 rows and 36 variables:

- Song:

  Song title

- Artist:

  Artist name

- Average_Rank:

  Average Billboard chart position

- Max_Rank:

  Highest Billboard chart position achieved (1 = top)

- First_Week_on_Board:

  Date of first chart appearance

- First_Rank_on_Board:

  Chart position on first appearance

- Last_Week_on_Board:

  Date of last chart appearance

- Last_Rank_on_Board:

  Chart position on last appearance

- Weeks_on_Board:

  Number of weeks on the Billboard chart

- track_id:

  Spotify track identifier

- track_popularity:

  Spotify popularity score (0-100)

- track_album_id:

  Spotify album identifier

- track_album_name:

  Album title

- track_album_release_date:

  Album release date

- playlist_name:

  Source Spotify playlist

- playlist_id:

  Spotify playlist identifier

- playlist_genre:

  Genre category

- playlist_subgenre:

  Subgenre category

- danceability:

  Spotify danceability score (0-1)

- energy:

  Spotify energy score (0-1)

- key:

  Musical key (0-11, where 0 = C)

- loudness:

  Overall loudness in decibels

- mode:

  Modality (0 = minor, 1 = major)

- speechiness:

  Spotify speechiness score (0-1)

- acousticness:

  Spotify acousticness score (0-1)

- instrumentalness:

  Spotify instrumentalness score (0-1)

- liveness:

  Spotify liveness score (0-1)

- valence:

  Spotify positivity/happiness score (0-1)

- tempo:

  Tempo in beats per minute

- duration_ms:

  Track duration in milliseconds

- tag:

  Content tag or label

- year:

  Release year

- views:

  Genius page view count

- features:

  Featured artists

- lyrics:

  Song lyrics text

- id:

  Genius song identifier

## Source

Compiled from Billboard, Spotify Web API, and Genius API data. See the
textbook for full methodology.

## Examples

``` r
data(unified_music)
head(unified_music)
#>                    Song         Artist Average_Rank Max_Rank
#> 1 ...Baby One More Time Britney Spears     37.07767        1
#> 2                  1999         Prince     71.15951        7
#> 3             24K Magic     Bruno Mars     88.48731        2
#> 4           400 Degreez       Juvenile     62.02000        9
#> 5             8 Letters   Why Don't We    103.75000        9
#> 6        99 Luftballons           Nena     73.14286       27
#>   First_Week_on_Board First_Rank_on_Board Last_Week_on_Board Last_Rank_on_Board
#> 1          1999-01-27                   1         2001-01-10                143
#> 2          1982-11-17                  56         2019-12-11                 45
#> 3          2016-12-07                   2         2025-01-29                198
#> 4          1998-11-18                  36         2000-10-11                198
#> 5          2018-09-12                   9         2018-10-03                197
#> 6          1984-03-21                  58         1984-06-20                199
#>   Weeks_on_Board               track_id track_popularity         track_album_id
#> 1            103 3MjUtNVVq3C8Fn0MP3zhXa               75 3WNxdumkSMGMJRhEgK80qx
#> 2            163 2H7PHVdQ3mXqEHXcvclTB0               68 3U1ht9EdWEI9nMvaqdQI67
#> 3            197 6b8Be6ljOzmkOmFslEb23P               78 4PgleR09JVnm3zY1fW3XBA
#> 4            100 5nXQHx4yYKsZqrm7y4bj03               45 6wpqS71CJr3I0dLguYiZdJ
#> 5              4 4zRZAmBQP8vhNPf9i9opXt               77 2qIbHfs93z6eDwGoAdCkXA
#> 6             14 4ZhPLoMzZwewHLLjV1J15c               73 78hVLZZJhaXgrnfXKc6yxF
#>                                 track_album_name track_album_release_date
#> 1 ...Baby One More Time (Digital Deluxe Version)               1999-01-12
#> 2                                           1999               1982-10-27
#> 3                                      24K Magic               2016-11-17
#> 4                                    400 Degreez               1998-01-01
#> 5                                      8 Letters               2018-08-31
#> 6                                           Nena               1983-09-23
#>                                        playlist_name            playlist_id
#> 1                                     90s Dance Hits 50cXvxgMGrvoUeLhkzCyIO
#> 2 80s-90s R&B / New Jack Swing / Funk / Dance / Soul 3X4HmijjKdwwLonCrOOEAZ
#> 3                                      10er Playlist 1kEczIkZH8IgaWT2BiApxZ
#> 4            Dirty South Rap Classics by DJ HOTSAUCE 0tLHH1C4HkWEUCXXSSjbOe
#> 5                                       Hip Pop 2019 3tmx4p5RGlOV1AapXOt1Ze
#> 6                                Permanent Wave CHDB 2foj4ZYVHRGqSd1aMqNPBj
#>   playlist_genre playlist_subgenre danceability energy key loudness mode
#> 1            pop         dance pop        0.759  0.699   0   -5.745    0
#> 2            r&b    new jack swing        0.866  0.730   5   -8.201    1
#> 3            pop        electropop        0.818  0.803   1   -4.282    1
#> 4            rap  southern hip hop        0.856  0.472   3   -9.452    1
#> 5            r&b           hip pop        0.607  0.478   1   -5.702    0
#> 6           rock    permanent wave        0.575  0.555   4   -7.495    1
#>   speechiness acousticness instrumentalness liveness valence   tempo
#> 1      0.0307        0.202         1.31e-04   0.4430   0.907  92.960
#> 2      0.0767        0.137         0.00e+00   0.0843   0.625 118.523
#> 3      0.0797        0.034         0.00e+00   0.1530   0.632 106.970
#> 4      0.0641        0.140         0.00e+00   0.1230   0.642  96.957
#> 5      0.0310        0.649         0.00e+00   0.0928   0.255  88.979
#> 6      0.0453        0.103         1.30e-06   0.1110   0.504  95.361
#>   duration_ms  tag year   views             features
#> 1      211067  pop 1998  967940                   {}
#> 2      379267 rock 1982  254603                   {}
#> 3      225983  pop 2016 1573750                   {}
#> 4      249133  rap 1998   52269                   {}
#> 5      190027  pop 2018  520383 {"Why Don\\\\'t We"}
#> 6      232467  pop 1983  624448                   {}
#>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           lyrics
#> 1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         [Intro]\nOh, baby, baby\nOh, baby, baby\n\n[Verse 1]\nOh, baby, baby\nHow was I supposed to know\nThat something wasn't right here?\nOh, baby, baby\nI shouldn't have let you go\nAnd now you're out of sight, yeah\n\n[Pre-Chorus]\nShow me how you want it to be\nTell me, baby, 'cause I need to know now\nOh, because\n\n[Chorus]\nMy loneliness is killing me (And I)\nI must confess, I still believe (Still believe)\nWhen I'm not with you, I lose my mind\nGive me a sign\nHit me, baby, one more time\n[Verse 2]\nOh, baby, baby\nThe reason I breathe is you (Oh, yeah)\nBoy, you got me blinded\nOh, pretty, baby\nThere's nothing that I wouldn't do\nIt's not the way I planned it\n\n[Pre-Chorus]\nShow me how you want it to be\nTell me, baby, 'cause I need to know now\nOh, because\n\n[Chorus]\nMy loneliness is killing me (And I)\nI must confess, I still believe (Still believe)\nWhen I'm not with you, I lose my mind\nGive me a sign\nHit me, baby, one more time\n\n[Post-Chorus]\nOh, baby, baby (Oh)\nOh, baby, baby (Yeah)\n\n[Bridge]\nOh, baby, baby\nHow was I supposed to know?\nOh, pretty, baby\nI shouldn't have let you go\nI must confess that my loneliness is killing me now\nDon't you know I still believe\nThat you will be here and give me a sign\nHit me, baby, one more time\n[Chorus]\nMy loneliness is killing me (And I)\nI must confess, I still believe (Still believe)\nWhen I'm not with you, I lose my mind\nGive me a sign\nHit me, baby, one more time\n\n[Outro]\nI must confess (My loneliness)\nThat my loneliness (Is killing me)\nIs killing me now (I must confess, I still believe)\nDon't you know I still believe (When I'm not with you)\nThat you will be here (I lose my mind)\nAnd give me a sign\nHit me, baby, one more time
#> 2 [Intro: Prince]\nDon't worry, I won't hurt you\nI only want you to have some fun\n\n[Verse 1: Prince, Lisa, Dez, All]\nI was dreamin' when I wrote this\nForgive me if it goes astray\nBut when I woke up this morning\nCould have sworn it was judgement day\nThe sky was all purple\nThere were people runnin' everywhere\nTryin' to run from the destruction\nYou know I didn't even care\n\n[Chorus: Prince and All]\n'Cause they say\n2000, zero-zero, party over, oops, out of time\nSo tonight I'm gonna party like it's 1999\n\n[Verse 2: Prince, Lisa, Dez, All]\nI was dreamin' when I wrote this\nSo sue me if I go too fast\nBut life is just a party\nAnd parties weren't meant to last\nWar is all around us\nMy mind says, "Prepare to fight"\nSo if I gotta die\nI'm gonna listen to my body tonight\nYeah\n[Chorus: Prince and All]\nThey say\n2000, zero-zero, party over, oops, out of time\nSo tonight I'm gonna party like it's 1999\nYeah, yeah, shh\n\n[Verse 3: Prince, Lisa, Dez, All]\nLemme tell ya somethin'\nIf you didn't come to party\nDon't bother knockin' on my door, oh\nI got a lion in my pocket\nAnd baby he's ready to roar, yeah, yeah\nEverybody's got a bomb\nWe could all die any day, oh\nBut before I'll let that happen\nI'll dance my life away\nOh\n\n[Chorus: Prince and All]\nThey say\n2000, zero-zero, party over, oops, out of time\n(We're runnin' outta time)\nSo tonight I'm gonna party like it's 1999\nSo tonight we gonna, we gonna, oh\nSay it one more time\n2000, zero-zero, party over, oops, out of time\nNo, no\nTonight I'm gonna party like it's 1999\nSo tonight we gonna, we gonna, woo\n[Bridge: Prince and All]\nAlright, 1999\nYou say it, 1999\nOoh, 1999, oh, 1999\nDon't stop, don't stop, say it one more time\n2000, zero-zero, party over, oops, out of time\nYeah, yeah\nTonight I'm gonna party like it's 1999\nSo tonight we're gonna, we're gonna, woo\n\n[Outro: Prince, Lisa, Prince and Lisa, All]\nYeah, 1999\nDon'tcha wanna go? (1999)\nDon'tcha wanna go? (1999)\nWe could all die any day (1999)\nI don't wanna die\nI'd rather dance my life away 1999\nListen to what I'm tryin' to say\nEverybody, everybody say, "Party"\nC'mon now, you say, "Party"\nThat's right, everybody say "Party"\nCan't run from the revelation, no (Party)\nSing it for your nation y'all, "Party"\nTell me what you're singin', baby say, "Party"\nTelephone's a-ringin', mama (Party)\nC'mon, c'mon, you say, "Party"\nEverybody, two times, "Party"\nWoo, work it down to the ground, say, "Party"\nOoh, ooh, ooh, ooh (Party)\nCome on, oh, take my body, baby (Party)\nThat's right, c'mon, sing the song (Party)\n(Oh) (Party)\nThat's right (Party)\nGot a lion in my pocket mama, say, "Party"\nOh, and he's ready to roar (Party)\nAh\n[Spoken Outro: Lisa]\nMommy, why does everybody have a bomb?\nMommy, why does everybody have a bomb?
#> 3                                                                                                                                                                                                                                                                                     [Intro]\nTonight\nI just want to take you higher\nThrow your hands up in the sky\nLet's set this party off right\n\n[Chorus]\nPlayers, put yo' pinky rings up to the moon\nGirls, what y'all trying to do?\n24 karat magic in the air\nHead to toe so player\nUh, look out!\n\n[Verse 1]\nPop pop, it's show time (Show time)\nShow time (Show time)\nGuess who's back again?\nOh they don't know? (Go on tell 'em)\nOh they don't know? (Go on tell 'em)\nI bet they know soon as we walk in (Showin' up)\nWearing Cuban links (ya)\nDesigner minks (ya)\nInglewood's finest shoes (Whoop, whoop)\nDon't look too hard\nMight hurt ya'self\nKnown to give the color red the blues\n[Pre-Chorus]\nOoh shit, I'm a dangerous man with some money in my pocket\n(Keep up)\nSo many pretty girls around me and they waking up the rocket\n(Keep up)\nWhy you mad? Fix ya face\nAin't my fault y'all be jocking\n(Keep up)\n\n[Chorus]\nPlayers only, come on\nPut your pinky rings up to the moon\nGirls, what y'all trying to do?\n24 karat magic in the air\nHead to toe so player\nUh, look out!\n\n[Verse 2]\nSecond verse for the hustlas (hustlas)\nGangstas (gangstas)\nBad bitches and ya ugly ass friends (Haha)\nCan I preach? (Uh oh) Can I preach? (Uh oh)\nI gotta show 'em how a pimp get it in\nFirst, take your sip (sip), do your dip (dip)\nSpend your money like money ain't shit (Whoop, whoop)\nWe too fresh\nGot to blame it on Jesus\nHashtag blessed\nThey ain't ready for me\n[Pre-Chorus]\nI'm a dangerous man with some money in my pocket\n(Keep up)\nSo many pretty girls around me and they waking up the rocket\n(Keep up)\nWhy you mad? Fix ya face\nAin't my fault y'all be jocking\n(Keep up)\n\n[Chorus]\nPlayers only, come on\nPut your pinky rings up to the moon\nHey girls\nWhat y'all trying to do?\n24 karat magic in the air\nHead to toe so player\nUh, look out!\n\n[Bridge]\n(Wooh)\nEverywhere I go they be like\nOoh, so player ooh\nEverywhere I go they be like\nOoh, so player ooh\nEverywhere I go they be like\nOoh, so player ooh\nNow, now, now\nWatch me break it down like (Uh)\n24 karat, 24 karat magic\nWhat's that sound?\n24 karat, 24 karat magic\nCome on now\n24 karat, 24 karat magic\nDon't fight the feeling\nInvite the feeling\n[Chorus]\nJust put your pinky rings up to the moon\nGirls, what y'all trying to do?\n24 karat magic in the air\nHead to toe so player\nPut your pinky rings up to the moon\nGirls, what y'all trying to do? (Do)\n24 karat magic in the air\nHead to toe so player\n(24 karat)\nUh, look out\n\n[Outro]\n(24 karat magic, magic, magic)
#> 4                                                                                                                                                                                                [Intro]\n400 Degreez\n\n[Verse 1]\nYa see, me, I eat, sleep, shit and talk rap\nYa seen that '98 Mercedes on TV? I bought that\nI had some felony charges, I fought that\nBeen sent to no return, but still was brought back\nNigga threw some slangs at me wodie, I caught that\nAnd punished them lil' bitches before they could carjack\nNow I'm lookin' for they family and partners to war back\nIf I ain't a Hot Boy, then what do you call that?\nNigga disrespect me, I'ma be in all black\nAccompanied by some niggas 'bout killin' and all that\nMe, Cory and Rusty getting ducked off\nRide top down so we let the trucks park\nIn the jeep ridin' four-deep\nI'm booted up at these nigga claimin' they know me\n\n[Chorus]\nYou don't want to fuck with me\n[Verse 2]\nBitch, what? I'll bust your ass up\nDon't even go there, wodie, 'cause I'm ready to mask up\nI heard about the money, that's some nice change\nFor the right price, I'll bust the right brain\nWhy must a nigga try? I can't do the right thing\nOnly God knows what the future might bring\nNigga might be shy, nigga might be triflin'\nNigga might survive if he 'bout that rifling\nWith somethin' that'll stop a nigga from playin'\nSomethin' like a chopper or a grenade in his hand\nBoy, look, nigga don't play no games no more\nNigga'll bust ya head if you bang his ho\nAttitude adjustments they all need\nDon't call in those enforcements, nigga, call me\nI bet ya I'll get them niggas off your block\nI bet ya I'll show them niggas this boy hot\n\n[Chorus]\nYou don't want to fuck with me\nHot Boy, hot, hot, Hot Boy, hot, hot\nHot Boy, hot, hot, Hot Boy\n\n[Verse 3]\nAlright, stop it, 'cause I done had enough\nWhen it comes to my pockets, I'm ready to bust\nBaby, let me get the keys to the Rover truck\nMan, let me get this beef shit over, bruh\nAin't no bitches here, I'm from the 'Nolia, bruh\nBust your beef head is what was told to us\nHow I'ma be runnin' with these killas and backin' down?\nHow I'ma look in front of my people like a clown?\nThe G code what we live by and we die by\nThe book is what we will never abide by\nNiggas drive by, gettin' loose\nBeefing with each other like the Checker Board and Goose\nUp in Compton or the Watts, nigga\nUp in New York ya keep' 'em open, watch, nigga\n'Fore ya played by a bit' or battalion\nAll fine young Black females stallions\nGive me the keys to ya car and ya medallion\nYou far away from ya home, you's an alien\n[Chorus]\nYou don't want to fuck with me\nYou don't want to fuck with me\nYou don't want to fuck with me\nYou don't want to fuck with me, with me\n\n[Outro]\n400 Degreez\n400 Degreez\n400 Degreez
#> 5                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         [Verse 1: Jonah Marais]\nYou know me the best\nYou know my worst, see me hurt, but you don't judge\nThat, right there, is the scariest feeling\nOpening and closing up again\nI've been hurt so I don't trust\nNow here we are, staring at the ceiling\n\n[Pre-Chorus: Zach Herron]\nI've said those words before but it was a lie\nAnd you deserve to hear them a thousand times\n\n[Chorus: Jack Avery & Corbyn Besson]\nIf all it is is eight letters\nWhy is it so hard to say?\nIf all it is is eight letters\nWhy am I in my own way?\nWhy do I pull you close\nAnd then ask you for space\nIf all it is is eight letters\nWhy is it so hard to say?\n[Verse 2: Daniel Seavey]\nIsn't it amazing\nHow almost every line\nOn our hands align\nWhen your hand's in mine\nIt's like I'm whole again\nIsn't that a sign?\nI should speak my mind\n\n[Pre-Chorus: Zach Herron]\nI've said those words before but it was a lie\nAnd you deserve to hear them a thousand times\n\n[Chorus: Jack Avery & Corbyn Besson]\nIf all it is is eight letters\nWhy is it so hard to say?\nIf all it is is eight letters\nWhy am I in my own way?\nWhy do I pull you close\nAnd then ask you for space\nIf all it is is eight letters\nWhy is it so hard to say? (Woah, oh, yeah)\n\n[Bridge: Jack Avery]\nWhen I close my eyes\nIt's you there in my mind\nWhen I close my eyes\n[Chorus: Corbyn Besson & Jack Avery]\nIf all it is is eight letters\nWhy is it so hard to say?\nIf all it is is eight letters\nWhy am I in my own way?\nWhy do I pull you close\nAnd then ask you for space\nIf all it is is eight letters\nWhy is it so hard to say?\n\n[Outro: Corbyn Besson & Jack Avery & Daniel Seavey]\nIf all it is is eight letters\nWhen I close my eyes\nIt's you there in my mind  (It's only you)\nWhen I close my eyes\nIf all it is is eight letters\nWhen I close my eyes\nIt's you there in my mind (You)\nWhen I close my eyes\nIf all it is is eight letters
#> 6                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             [Songtext zu „99 Luftballons“]\n\n[Strophe 1]\nHast du etwas Zeit für mich?\nDann singe ich ein Lied für dich\nVon 99 Luftballons\nAuf ihrem Weg zum Horizont\nDenkst du vielleicht grad an mich?\nDann singe ich ein Lied für dich\nVon 99 Luftballons\nUnd, dass sowas von sowas kommt\n\n[Strophe 2]\n99 Luftballons\nAuf ihrem Weg zum Horizont\nHielt man für Ufos aus dem All\nDarum schickte ein General\n'ne Fliegerstaffel hinterher\nAlarm zu geben, wenn's so wär\nDabei war'n dort am Horizont\nNur 99 Luftballons\n[Strophe 3]\n99 Düsenflieger\nJeder war ein großer Krieger\nHielten sich für Captain Kirk\nEs gab ein großes Feuerwerk\nDie Nachbarn haben nichts gerafft\nUnd fühlten sich gleich angemacht\nDabei schoss man am Horizont\nAuf 99 Luftballons\n\n[Strophe 4]\n99 Kriegsminister\nStreichholz und Benzinkanister\nHielten sich für schlaue Leute\nWitterten schon fette Beute\nRiefen, „Krieg!“, und wollten Macht\nMann, wer hätte das gedacht?\nDass es einmal so weit kommt\nWegen 99 Luftballons\n\n[Bridge]\nWegen 99 Luftballons\n99 Luftballons\n\n[Outro]\n99 Jahre Krieg\nLießen keinen Platz für Sieger\nKriegsminister gibt's nicht mehr\nUnd auch keine Düsenflieger\nHeute zieh' ich meine Runden\nSeh' die Welt in Trümmern liegen\nHab' 'n Luftballon gefunden\nDenk' an dich und lass' ihn fliegen
#>        id
#> 1   78169
#> 2    2770
#> 3 2872960
#> 4   24993
#> 5 3888124
#> 6 1145735
summary(unified_music$Max_Rank)
#>    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#>    1.00    4.00   15.00   28.94   48.00  180.00 
```
