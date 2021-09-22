% Global variables to store the elements
clear Resistors Isources Vsources Csources;
global Resistors Isources Vsources Csources;

%Global variables to store the circuit matrix, right-hand side
clear Matrix RHS x;
global Matrix RHS x;

%Global counters for number of nodes and number of nodes with sources
clear Nodes  sourcenodes; 
global Nodes  sourcenodes; 

%Global counters for number of branches
clear Branches;
global Branches; 

fid = fopen('test2.ckt', 'r');

% Global vector to store the resistors.
Resistors = []; 

% Global vector to store current sources.
Isources = [];

% Global vector to store voltage sources.
Vsources = [];

% Global vector to store voltage-controlled current sources.
Csources = []; 

Capacitors =[];
InitialNV =[];


% Counter which keeps track of the maximum node number in the circuit
maxnode = 0;

% Read the file, line by line, and dispatch based on first character on line.
while 1
  line = fgetl(fid);
  if ~isstr(line), break, end
  if length(line) ~= 0, 
    if(strcmp(line(1),'r') > 0) 
      [Resistors,maxnode] = readelement(line, Resistors, 2, maxnode);
    elseif(strcmp(line(1),'i') > 0) 
      [Isources,maxnode] = readelement(line, Isources, 2, maxnode);
    elseif(strcmp(line(1),'v') > 0) 
      [Vsources,maxnode] = readelement(line, Vsources, 2, maxnode);
    elseif(strcmp(line(1),'x') > 0) 
      [Csources,maxnode] = readelement(line, Csources, 4, maxnode);
    elseif(strcmp(line(1),'c') > 0) 
      [Capacitors,maxnode] = readelement(line, Capacitors, 2, maxnode);  
    elseif(strcmp(line(1),'z') > 0) 
      [InitialNV,maxnode] = readelement(line, InitialNV, 1, maxnode);
    end
  end
end

% Force allocate matrix of size NxN, where N is equal to the maximum node
% number.
Matrix(maxnode,maxnode) = 0;
RHS(maxnode) = 0;
x(maxnode) = 0;
sourcenodes(maxnode) = 0;

% Create an array of indicating voltage source nodes and values (zero means the
% node is not a voltage source node).
for i = 1:size(Vsources,1)
 n1 = Vsources(i,2);
 n2 = Vsources(i,3);
 if ((n1 == 0) & (n2 ~= 0))
   sourcenodes(n2) = -Vsources(i,1);
 elseif (n1 ~= 0) & (n2 == 0) 
   sourcenodes(n1) = Vsources(i,1);
 end
end


% Global Circuit Description

Branches = size(Resistors,1) + size(Isources,1)+size(Vsources,1)+2*size(Csources,1)+ size(Capacitors,1)+size(InitialNV,1); 














