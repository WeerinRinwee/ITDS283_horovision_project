create database horovision;
use horovision;
SHOW VARIABLES WHERE Variable_name = 'hostname';

CREATE table ChineseZodiac (
  CZName varchar(50),
  Picture varchar(1000),
  Details varchar(5000)
);

INSERT INTO ChineseZodiac values 
('Rat', 'https://drive.google.com/file/d/11XRPnFxWPiYUWpGq29WLRUVDXm6hZBBk/view?usp=sharing', 'When entering the Year of the Rabbit, it can be said that the lives of people born in the Year of the Rat will change differently. Your luck has the opportunity to meet new things. especially about work Have the opportunity to take on new responsibilities, new projects, which will make you tired. But it will be good later for sure. Your luck must be tired first and be comfortable later. Especially those who do business or make an extra career will have the opportunity to advance Tired but lucky!'),
('Cow', 'https://drive.google.com/file/d/1hgYg9h2hh_gP4fbLteJ3O36Pbp028lzG/view?usp=sharing', 'When entering the year 2023, people born in the year of the Ox are tired! It was a year that required a lot of energy to drive life. Because of a lot of workload But let me tell you that your work will be successful. Successful results of work will appear in abundance. As a result, your financial position is better. plus there is a chance to have a large piece of property in possession'),
('Tiger', 'https://drive.google.com/file/d/1X2ZcjsHhsh3sFdpfC0czr7IqlNUZtG9X/view?usp=sharing', 'When entering the new zodiac year The life of people born in the year of the Tiger is better. Anything heavy will be resolved. fewer obstacles But the work is still hard. There are still many responsibilities for you to take on, but good things will happen. People born in the year of the Tiger have the opportunity to be successful in both work and finances. Prepare to wait for good news.'),
('Rabbit', 'https://drive.google.com/file/d/14sZtyVBuwOs2NQXcbXDWaXhVZfH_jBHU/view?usp=sharing', 'Year of the Rabbit 2023, even if it is your own zodiac year. But let me tell you that you have to prepare well. This year has been heavy, heavy work, heavy burden, and rarely depend on anyone. Just dont care! Tell me that you yourself have the ability. You will surely reach the stars you dreamed of. I just want you to try a little more. Although tired, but succeeded. especially those who work with positions Whether its a regular or government job will have the opportunity to advance, get promoted, promoted'),
('Dragon', 'https://drive.google.com/file/d/12PoSvIw0ySlNI03yh1Qj4mTv5cKPPiqB/view?usp=sharing', 'When people born in the Year of the Snake come together with the Year of the Rabbit Let me tell you that in this event, luck has arrived. If in the past, a person born in the Year of the Dragon had an idea, had a plan in mind, but had not yet done it. Lets start doing it from this year. Because it is a very good year for you, like the merit points that you have accumulated for a long time will appear during this period. Good luck, luck and riches will definitely come in this year 2023.'),
('Snake', 'https://drive.google.com/file/d/1eQXaWPQ-X4PrgyLblyLN6uBA4Ih7g23v/view?usp=sharing', 'Work is money, money is work, inspiring happiness! Surf it. Because this sentence will make you rich and lucky. Let me tell you that 2023 is the year that the fortune of people born in the Year of the Snake is very prosperous. His luck turned from bad to good. that bad things will change into luck Achievements are constantly lined up. If you have been discouraged in the past because of obstacles, ask you to keep your eyes on it and keep fighting. Guaranteed that this time the fight is good, you wii not be disappointed for sure.'),
('Horse', 'https://drive.google.com/file/d/1GCaYLydNmwNg0nATrzD0L08buGO-JaW5/view?usp=share_link', 'The horoscope of people born in the Year of the Pig like a dark horse running towards the finish line Plus it is a finish line of wealth as well. If we look only at financial matters Tell me that people born in the Year of the Pig Good fortune in finance is the most among the 12 zodiac signs. The financial position has greatly improved. If stuck, it will be solved. From bad to very rich'),
('Goat', 'https://drive.google.com/file/d/1DkQXLaDpiqyd6GlJn_oH9toBJUYuowz4/view?usp=sharing', 'Basically, people born in the year of the Goat are diligent people. You must be tired first to feel better later. Many years ago, you were very tired, but the results may not yet appear. But this time it was very lucky. Both work and financial success will come. Good fortune that Work and earn a lot of money. Work until you are blindfolded. Good work, good money, but you have to be careful about your health.'),
('Monkey', 'https://drive.google.com/file/d/1GCaYLydNmwNg0nATrzD0L08buGO-JaW5/view?usp=share_link', 'Break free from the whirlpool of problems conquered for people born in the Year of the Monkey! After going through the year of the tiger, let me tell you, the year is over because of the past Your life is heavy There are things that cause you to be stressed out with a throbbing headache. But when entering the year of the golden rabbit I can tell that it is very good. People born in the Year of the Monkey have great opportunities for success. You will become a rising star. Whether working full time or a business owner have the opportunity to win success without difficulty'),
('Rooster', 'https://drive.google.com/file/d/1368dzEZsWtFLLFi5XR01Cf5vElSqPa4l/view?usp=sharing', 'Your life is like a car that stops at a three-way crossroads. You have to make some decisions. Life will change. which will make you tired and troubling But it was only for one period. It will definitely get better after a while. I just want people born in the Year of the Rooster not to give up. because of the first There will be some obstacles to measure your heart. If you endure, fight, and do not give up, you will have a chance to succeed. But do not work so hard that it destroys your health.'),
('Dog', 'https://drive.google.com/file/d/1hlsv21UY4djmrs2JbcaoNaR6B9c7vD5o/view?usp=sharing', 'for people born Let me tell you, this year is the year of birth for you. Your horoscope rose 200% in the past. Your horoscope is lonely, depressed. I cam not do anything. Even though I worked hard, my work did not hit me. But when entering the year of the rabbit Let me tell you that it is the year of the rabbit that brings good luck to people born in the year of the dog. Good fortune is better and there is a chance to turn bad to become rich. what you think is impossible there is a chance There is an opportunity to move up the status from an ordinary person to become a millionaire this year.'),
('Pig', 'https://drive.google.com/file/d/1MaJcf-xu7hVUluOhH4DdcN4rRKHxMZic/view?usp=sharing', 'Year of fulfillment! The life of people born in the Year of the Pig is considered good. There will be many happy things to happen. If a regular worker have the opportunity to advance has changed in a better direction As for business owners, they will have the opportunity to expand their business. Expand the branch to be far and wide. just not good because there will be a joyful thing happening in the family as well Considered that this rabbit is a good year, a year of success for people born in the year of the pig that has it all.');

SELECT * FROM chinesezodiac;

-- DROP TABLE `ChineseZodiac`;