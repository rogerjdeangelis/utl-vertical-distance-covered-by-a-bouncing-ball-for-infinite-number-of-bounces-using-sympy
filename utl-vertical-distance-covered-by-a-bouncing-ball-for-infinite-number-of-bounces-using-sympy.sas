%let pgm=utl-vertical-distance-covered-by-a-bouncing-ball-for-infinite-number-of-bounces-using-sympy;

Vertical distance covered by a bouncing ball for infinite number of bounces using sympy

Note sympy can solve for more complex cases, more general solution

     Two Solutions

       1 manual
       2 sympy
/*                                     _
/ |  _ __ ___   __ _ _ __  _   _  __ _| |
| | | `_ ` _ \ / _` | `_ \| | | |/ _` | |
| | | | | | | | (_| | | | | |_| | (_| | |
|_| |_| |_| |_|\__,_|_| |_|\__,_|\__,_|_|

*/

Lets solve for 2 bounces, manually

  initial height     = 100 meters
  Ball rebound ratio = 0.5 ball returns to half its height

  Number of bounces 2  (down-up then down-up again)

  Sequence (after 100 all numbers are doubled where up distance = down distance)

       1 100 meters down  First bounce  iter=0
       2  50 meters up                          100/2**n [0,1] = 150

       3  50 meters down  Second bounce  iter=1
       4  25 meters up                          1/2*h/2**n [0,1] = 75
         ===
         225 meters

  Careful examination yeilds (note the seies start n=0 istead of n-1)

       DOWNS
       =====

      ___n
     \
      \   1
   h   . ---
      /  2**n
     /____
         0


         UPS
        ====

         ___n
        \
   1     \   1
   -  h   . ---
   2     /  2**n
        /____
            0

 Solving for n=1 (two bounces)

 Downs = 100/2**0       + 100/2**1         = 150     = 150
 Ups   = (1/2)*100/2**0 + (1/2)*100/2**1   = 50 + 25 = 75
                                                      125 agrees with manual soltion

 The sum of the power series 1/2**n from 0 to oo is 2 ( 1/2**n from 1 to oo is 1)
 This is easy to prove by induction

 Thus the distance for infinite bounces is

 Total Distance100 *2 + 100 * 1 = 300

/*___
|___ \   ___ _   _ _ __ ___  _ __  _   _
  __) | / __| | | | `_ ` _ \| `_ \| | | |
 / __/  \__ \ |_| | | | | | | |_) | |_| |
|_____| |___/\__, |_| |_| |_| .__/ \__, |
             |___/          |_|    |___/
*/

%utl_submit_py64_310("
import pyperclip;
from sympy import symbols, solve, Rational, oo, summation, pprint;
h = symbols('h');  # Initial height;
e = Rational(1, 2);  # Coefficient of restitution (1/2 in this case);
n = symbols('n');  # Number of bounces;
downward_distance = h * summation(e**n, (n, 0, oo));
upward_distance = h * e * summation(e**n, (n, 0, oo));
total_distance = downward_distance + upward_distance;
total_distance = total_distance.doit().simplify();
print(total_distance);
result = total_distance.subs(h, 100);
print(result);
tosas='Equation=' + str(total_distance) + ' For n=oo ' + str(result);
print(tosas);
pyperclip.copy(tosas);
",return=tosas);

%put &=tosas;

/**************************************************************************************************************************/
/*                                                                                                                        */
/*  4516  %put &=tosas;                                                                                                   */
/*                                                                                                                        */
/*  TOSAS = Equation=3*h For n=oo 300                                                                                     */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
