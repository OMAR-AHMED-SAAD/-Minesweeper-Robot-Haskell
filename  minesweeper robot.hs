type Cell = (Int,Int)
data MyState = Null | S Int Int Cell [Cell] String MyState deriving  (Show,Eq)

up:: MyState -> MyState
up (S i j (x,y) l string state) | x==0 =Null
	| otherwise = S i j (x-1,y) l "up"(S i j (x,y) l string state)

down:: MyState -> MyState
down (S i j (x,y) l string state) | x==i =Null
	| otherwise = S i j (x+1,y) l "down"(S i j (x,y) l string state) 	
	
right:: MyState -> MyState
right (S i j (x,y) l string state) | y==j =Null
	| otherwise = S i j (x,y+1) l "right"(S i j (x,y) l string state) 	

left:: MyState -> MyState
left (S i j (x,y) l string state) | y==0 =Null
	| otherwise = S i j (x,y-1) l "left"(S i j (x,y) l string state) 

collectHelper:: Cell->[Cell]->[Cell]
collectHelper c l =  filter (/=c) l

collect:: MyState -> MyState
collect (S i j c l string state) | l==collectHelper c l =Null
	|otherwise = S i j c l1 "collect" (S i j c l string state) where(l1)=(collectHelper c l)
	
nextMyStates::MyState->[MyState]
nextMyStates state= filter (/=Null) l1 where(l1)= [up state,down state,left state , right state, collect state]

isGoal::MyState->Bool
isGoal (S i j c l string state)| l==[]=True
	|otherwise=False

search::[MyState]->MyState
search (h:t)| isGoal h ==True =h
	|otherwise= search (filtersearch(t)++nextMyStates h)

filtersearch:: [MyState]->[MyState]
filtersearch []=[]
filtersearch l = filter (helperSearch (minimumLength l)) l 

helperSearch:: Int->MyState->Bool
helperSearch x (S i j c l string state)| x>=length l= True
	| otherwise=False

minimumLength::[MyState]->Int
minimumLength [(S i j c l string state)] =length l	
minimumLength ((S i j c l string state):(S i1 j1 c1 l1 string1 state1):t)| (length l)< (length l1) =minimumLength ((S i j c l string state):t)
	| otherwise=minimumLength ((S i1 j1 c1 l1 string1 state1):t) 

constructSolution:: MyState ->[String]
constructSolution (S i j c l "" state)=[]
constructSolution (S i j c l string state)=constructSolution state ++ [string]

getX:: [Cell]->Int
getX [(x,y)] =x
getX ((x,y):(x1,y1):t)| x>x1 =getX ((x,y):t)
	|otherwise =getX ((x1,y1):t)

getY:: [Cell]->Int
getY [(x,y)] =y
getY ((x,y):(x1,y1):t)| y>y1 =getY ((x,y):t)
	|otherwise =getY ((x1,y1):t)

solve :: Cell->[Cell]->[String]
solve c l = constructSolution (search [state])where (state)=S (getX (c:l)) (getY (c:l)) c l "" Null