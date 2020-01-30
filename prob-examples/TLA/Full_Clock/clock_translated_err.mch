
MACHINE clock_translated
VARIABLES hours, minutes, seconds
INVARIANT
(hours : INTEGER & minutes : INTEGER) & seconds : INTEGER
INITIALISATION
/* hours, minutes, seconds:((hours : 0 .. 23 & minutes : 0 .. 59) & seconds : 0 .. 59) */
 hours,minutes,seconds := 0,0,0
OPERATIONS
 Next = BEGIN
 hours,minutes,seconds :=
 (%(t_).(t_ = 0 & minutes /= 59 | hours) \/
  %(t_).(t_ = 0 & not(minutes /= 59) | (hours + 1) - 23 * ((hours + 1) / 23)))(0),
(%(t_).(t_ = 0 & seconds /= 59 | minutes) \/ 
 %(t_).(t_ = 0 & not(seconds /= 59) | (minutes + 1) - 59 * ((minutes + 1) / 59)))(0),
 (seconds + 1) - 59 * ((seconds + 1) / 59)
END
END