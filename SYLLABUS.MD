# USAFA ENGR 201:

## Technology Skills and Communication for Engineers
_Alternative to Astro 201 or Aero 206_

Welcome to Engineering 201! In this class you will learn technical and communication skills and tools you will use as an engineering major and perhaps beyond. 

- version control and collaboration
- computer programming
- 3D modeling and manufacturing
- microcontroller programming
- data analysis 
- experimentation/test/validation
- orbital mechanics (*astro)
- specific excess power (*aero)
- standard atmospheric model (*aero)
- engineering communication



## tools

Follow the instructions in [tools.md](./tools.md).



## policies

[DFAS policy 2025-2026](DFAS%20policy%202025-2026.pdf)

The default AI policy for this course is Level 2: Use of GenAI for brainstorming or idea generation. Exceptions to this policy require written instructor direction. 
>Level 2:
>Cadets can consult GenAI as a tool for initial brainstorming or idea generation, but are expected to create their own, original work without the use of GenAI. Use of GenAI in this manner should be acknowledged as part of documentation statements.

In general, we're trying to train *you*, not an AI system how to think and how to do fundamental things effectively and efficiently. 

Do not record audio or video during routine parts of class. This is not intended to prohibit recordings of unique events such as rocket launch or altimeter testing. 

Assignments will be due at the start of class. You may earn up to 50% credit if you submit a late assignment within 24 hours of its due date. You will receive no credit after that but must still complete the assignment.



## grading

This course is contract graded using the following grade lines. 

| A    | A-   | B+   | B    | B-   | C+   | C    | C-   | D    | F    |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 90   | 87   | 83   | 80   | 77   | 73   | 70   | 67   | 60   | <60  |

Assignment points are listed in [assignments.csv](assignments.csv). 

The file [grade_calculator.xlsx](grade_calculator.xlsx) is available for your own use. 


## instructors

Lt Col Jordan Firth 6H147 (course director)

Col James Gresham



## course material

Most course material will be available in your personal course github repository. 

Updates may be posted during the semester to the course repository: https://github.com/usafa-dfas/engr-495



## submission instructions

Most assignments will be submitted via a pull request in your assignment repository on github. 

[assignments/submission instructions.md](assignments/submission_instructions.md)



## textbook

*[Fundamentals of Astrodynamics](https://www.amazon.com/Fundamentals-Astrodynamics-Second-Dover-Physics-dp-0486497046/dp/0486497046)* by Bate, Mueller, and White **(Astro students)**

*[Introduction to Aeronautics](https://www.amazon.com/Introduction-Aeronautics-Third-AIAA-Education/dp/1624103278)* (Core Aero Textbook) by Dr. Steven Brandt **OPTIONAL**
	- Same textbook used for AE210 & AE315



## references

[Astro 310 equation sheet](resources/Astro%20310%20Fall%202024%20Equation%20Sheet.pdf)

[Astro 321 equation sheet](resources/A321%20Equation%20Sheet.pdf)

*[The Visual Display of Quantitative Information](https://www.amazon.com/Visual-Display-Quantitative-Information/dp/1930824130)* by Tufte



## schedule
topic
due before
due after/major project due dates

|lesson |	 topic     | 		 due before class   |	points	|read/recommended progress	|
|	 ------ 	|	 ------ 	|	 -------- 	|	 ----	|	 ----	|
|	1	|	 [course overview](./notes/01%20course%20overview.md)                                                                                              	|		|		|	 [pre-course instructions](assignments/homework/ASSIGNMENT_INSTRUCTIONS.md#H0%20pre-course%20instructions)                                                                                                                                                                                                                                                                                                                                                               	|
|	2	|	 [communication](./notes/02%20communication.md)<br>                                                                                                	|		|		|	 (\~15 min) "get started" section of [submission instructions](assignments/submission_instructions.md#get%20started)<br> (11:07) watch "Dance Your PhD" [https://www.youtube.com/watch?v=UlDWRZ7IYqw](https://www.youtube.com/watch?v=UlDWRZ7IYqw)<br> (\~5 min) read [Who cares? And why engaging reports are not always important or even necessary](https://freshspectrum.com/who-cares-and-why-engaging-reports-are-not-always-important-or-even-necessary/) 	|
|	3	|	 [tool intro](notes/03%20tool%20intro.md), <br><br>[matlab basics](notes/03%20matlab%20basics.md)                                                  	|	 [H1 student info](./assignments/homework/ASSIGNMENT_INSTRUCTIONS.md#H1%20student%20info)                                                                                                                                                                                                                                                                                                                                                                                	|	10	|		|
|	4	|	 [matlab basics 2](notes/04%20matlab%20basics%202.md)<br><br>[04 code debugging and validation](notes/04%20code%20debugging%20and%20validation.md) 	|	 [H4 review papers](./assignments/homework/ASSIGNMENT_INSTRUCTIONS.md#H4%20review%20papers)                                                                                                                                                                                                                                                                                                                                                                              	|	10	|		|
|	5	|	 [atmosphere project](assignments/atmosphere_model/ASSIGNMENT_INSTRUCTIONS.md)                                                                     	|	 [H2 matlab practice](assignments/homework/ASSIGNMENT_INSTRUCTIONS.md#H2%20matlab%20practice)                                                                                                                                                                                                                                                                                                                                                                            	|	10	|		|
|	6	|	 [standards, report basics](notes/06%20standards.md)                                                                                               	|	 [AM1 model function](assignments/atmosphere_model/ASSIGNMENT_INSTRUCTIONS.md#AM1%20model)                                                                                                                                                                                                                                                                                                                                                                               	|		|	atm project function	|
|	7	|	 [plotting](notes/good%20and%20bad%20graphs.pdf)                                                                                                   	|	 [H3 badintro](assignments/homework/ASSIGNMENT_INSTRUCTIONS.md#H3%20badintro)                                                                                                                                                                                                                                                                                                                                                                                            	|	20	|		|
|	8	|	 [modeling and validation](notes/06%20modeling.md), <br>[numerical integration](notes/07%20numerical%20integration.md)                             	|	 [RP1 drag algorithm](../assignments/rocket_prediction/ASSIGNMENT_INSTRUCTIONS.md#RP1%20drag%20algorithm)                                                                                                                                                                                                                                                                                                                                                                	|	10	|		|
|	9	|	 rocket prediction project, <br>function validation                                                                                                	|	 [AM2 atmosphere model report](./assignments/atmosphere_model/ASSIGNMENT_INSTRUCTIONS.md#AM2%20atmosphere%20model%20report)                                                                                                                                                                                                                                                                                                                                              	|	40	|		|
|	10	|	 wind tunnel day                                                                                                                                   	|		|		|		|
|	11	|	 report writing, <br />overleaf/latex                                                                                                              	|	                                                                                                                                                                                                                                                                                                                                                                                                                                                                         	|		|		|
|	12	|	 workday                                                                                                                                           	|	 [RP3 wind tunnel Cd](assignments/rocket_prediction/ASSIGNMENT_INSTRUCTIONS.md#RP3%20wind%20tunnel%20Cd)                                                                                                                                                                                                                                                                                                                                                                 	|	20	|		|
|	13	|	 [simulink](notes/10%20simulink.md)                                                                                                                	|		|		|	 [RP4 matlab prediction](assignments/rocket_prediction/ASSIGNMENT_INSTRUCTIONS.md#RP4%20matlab%20prediction)                                                                                                                                                                                                                                                                                                                                                             	|
|	14	|	 [arduino intro](./notes/14%20arduino%20intro.md)                                                                                                  	|	                                                                                                                                                                                                                                                                                                                                                                                                                                                                         	|		|		|
|	15	|	                                                                                                                                                   	|	 [RP6 simulink model](assignments/rocket_prediction/ASSIGNMENT_INSTRUCTIONS.md#RP6%20simulink%20model)                                                                                                                                                                                                                                                                                                                                                                   	|	20	|		|
|	16	|	 [3D modeling](notes/13%203D%20modeling.md)                                                                                                        	|	 [RP5 paper sections](assignments/rocket_prediction/ASSIGNMENT_INSTRUCTIONS.md#RP5%20paper%20sections)                                                                                                                                                                                                                                                                                                                                                                   	|	100	|		|
|	17	|	 [3D printing](notes/14%203D%20slicing%20and%20printing.md)                                                                                        	|	 [H5 procedure](assignments/homework/ASSIGNMENT_INSTRUCTIONS.md#H5%20procedure)                                                                                                                                                                                                                                                                                                                                                                                          	|	10	|		|
|	18	|	 altimeter project                                                                                                                                 	|	                                                                                                                                                                                                                                                                                                                                                                                                                                                                         	|		|		|
|	19	|	 [matlab import and analysis](notes/17%20matlab%20import%20and%20analysis.md)                                                                      	|	 [K1 keychain](assignments/keychain/ASSIGNMENT_INSTRUCTIONS.md)                                                                                                                                                                                                                                                                                                                                                                                                          	|	40	|		|
|	20	|	 procedure writing                                                                                                                                 	|		|		|	 [RA1 flight-like test](assignments/rocket_altimeter/ASSIGNMENT_INSTRUCTIONS.md#RA1%20flight-like%20test)                                                                                                                                                                                                                                                                                                                                                                	|
|	21	|	 test readiness reviews                                                                                                                            	|		|		|		|
|	22	|	 presentation lecture                                                                                                                              	|	 [RL1 launch procedure](assignments/rocket_launch/ASSIGNMENT_INSTRUCTIONS.md#RL1%20launch%20procedure)<br>[RA3 peer review](assignments/rocket_altimeter/ASSIGNMENT_INSTRUCTIONS.md#RA3%20peer%20review)                                                                                                                                                                                                                                                                 	|	20	|		|
|	23	|	 assemble rocket                                                                                                                                   	|		|	10	|		|
|	24	|	 student TRRs                                                                                                                                      	|	 [RL2 test readiness report](assignments/rocket_launch/ASSIGNMENT_INSTRUCTIONS.md#RL2%20test%20readiness%20report)                                                                                                                                                                                                                                                                                                                                                       	|	40	|		|
|	25	|	 [AERO overview](notes/21%20(Aero)%20Overview%20of%20Aero%20Projects.md)<br>[ASTRO overview](notes/24%20Astro%20project%20overview.md)             	|	                                                                                                                                                                                                                                                                                                                                                                                                                                                                         	|		|		|
|	31	|	 rocket launch\*                                                                                                                                   	|	 [RL3 quick-look email](assignments/rocket_launch/ASSIGNMENT_INSTRUCTIONS.md#RL3%20quick-look%20email) (after class)                                                                                                                                                                                                                                                                                                                                                     	|	10	|		|
|	36	|	 Aero/Astro 10                                                                                                                                     	|	                                                                                                                                                                                                                                                                                                                                                                                                                                                                         	|		|		|
|	37	|	 launch data analysis                                                                                                                              	|	 [RL4 report sections](assignments/rocket_launch/ASSIGNMENT_INSTRUCTIONS.md#RL4%20report%20sections)                                                                                                                                                                                                                                                                                                                         	|	50	|		|
|	38	|	 student presentations                                                                                                                             	|	 PP3 presentation                                                                                                                                                                                                                                                                                                                                                                                                                                                        	|	40	|		|
|	39	|	 student presentations                                                                                                                             	|	                                                                                                                                                                                                                                                                                                                                                                                                                                                                         	|		|		|
|	40	|		|	 PP2 final paper        	|	200	|		|
|	 ⋮      	|	 ⋮                                                                                                                                                 	|	 See [Aero](#Aero%20lessons)/[Astro](#Astro%20lessons) section below                                                                                                                                                                                                                                                                                                                                                                                                     	|		|		|
|	 ⋮      	|	 ⋮                                                                                                                                                 	|	 See [Aero](#Aero%20lessons)/[Astro](#Astro%20lessons) sections below                                                                                                                                                                                                                                                                                                                                                                                                    	|		|		|
|		|		|	PP1 draft paper                       	|	40	|		|
|		|		|	 [RA4 paper sections](assignments/rocket_altimeter/ASSIGNMENT_INSTRUCTIONS.md#RA4%20paper%20sections)                                                                                                                                                                                                                                                                                                                                                                    	|	100	|		|
|		|		|	aero/astro	|	200	|		|




### Astro lessons

| lesson |               | due before class                                                                                                                                                                       | topic                                 |
| ------ | ------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------- |
| 25     | Aero/Astro 1  |                                                                                                                                                                                        | overview of Aero/Astro projects       |
| 26     | Astro 2       |                                                                                                                                                                                        | file IO                               |
| 27     | Astro 3       |                                                                                                                                                                                        |                                       |
| 28     | Astro 4       | [ASTRO1 input/output](assignments/ASTRO/ASSIGNMENT_INSTRUCTIONS.md#ASTRO1%20input/output)                                                                                              |                                       |
| 29     | Astro 5       |                                                                                                                                                                                        | Kepler's problem                      |
| 30     | Astro 6       | [ASTRO2 RV to COE](assignments/ASTRO/ASSIGNMENT_INSTRUCTIONS.md#ASTRO2%20RV%20to%20COE)                                                                                                |                                       |
| 31\*   | rocket launch | RL3 (after class)                                                                                                                                                                      | \*date/lesson is floating for weather |
| 32*    | launch review |                                                                                                                                                                                        | \*date/lesson is floating for weather |
| 33     | Astro 7       |                                                                                                                                                                                        | COE to RV                             |
| 34     | Astro 8       | [ASTRO3 COE to COE](assignments/ASTRO/ASSIGNMENT_INSTRUCTIONS.md#ASTRO3%20COE%20to%20COE)                                                                                              | axis rotations                        |
| 35     | Astro 9       |                                                                                                                                                                                        |                                       |
| 36     | Astro 10      | [ASTRO 4 COE to RV](assignments/ASTRO/ASSIGNMENT_INSTRUCTIONS.md#ASTRO4%20COE%20to%20RV)<br>[ASTRO 5 presentation](assignments/ASTRO/ASSIGNMENT_INSTRUCTIONS.md#ASTRO5%20presentation) | presentation                          |

