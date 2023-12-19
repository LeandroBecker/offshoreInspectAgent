/* Initial beliefs and rules */
// The location belief contains the location and the X,Y,angle coordinates
// Positions of the tables are with respect of the initial position of the screen when the simulation starts
// station1 = table bottom right, station2 = table top right, station4 = table top left, station3 = table bottom left
location(station1,  -5.0,  3.75, 0.0).   
location(station2, -10.8,  3.75, 0.0).   
location(station4, -10.8, -3.75, 0.0).  
location(station3,  -5.0, -3.75, 0.0). 

// Determine the first station to be visited
firstStation(station4).   

// Determine the last station to be visited
lastStation(station1).

// Determine the next location to work (second parameter) based on the current one (first parameter)
next_location(station1,station2).
next_location(station2,station4).
next_location(station4,station3).
next_location(station3,station1).
//previous_location(station1,station3).
//previous_location(station2,station1).
//previous_location(station4,station2).
//previous_location(station3,station4).

/* Initial goals */
!standby.

/* Plans */
//+!standby: true <- .wait("+human_start"); +counterClock; !start.
+!standby: true <- !start.   // used for tests

+!start : firstStation(ST) <- .print("Manager agent started"); !work(ST).

// Work pattern plans
+!work(Location) : location(Location, X, Y, Z) 
	<- 
		-working(_);
		+working(Location);
		.print("Now moving to: ", Location);
		move(X, Y, Z).


+work_completed(_) : working(Location) & next_location(Location,Next) & lastStation(LastLoc) & Location \== LastLoc
	<-
		.print("Passed over ", Location);
		!work(Next).

+work_completed(_) : working(Location) & next_location(Location,Next) & lastStation(LastLoc) & Location == LastLoc
	<-
		.print("Work completed! Finished at ", Location).
