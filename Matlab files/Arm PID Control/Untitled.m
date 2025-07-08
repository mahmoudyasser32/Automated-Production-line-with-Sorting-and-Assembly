% Simscape(TM) Multibody(TM) version: 7.3

% This is a model data file derived from a Simscape Multibody Import XML file using the smimport function.
% The data in this file sets the block parameter values in an imported Simscape Multibody model.
% For more information on this file, see the smimport function help page in the Simscape Multibody documentation.
% You can modify numerical values, but avoid any other changes to this file.
% Do not add code to this file. Do not edit the physical units shown in comments.

%%%VariableName:smiData


%============= RigidTransform =============%

%Initialize the RigidTransform structure array by filling in null values.
smiData.RigidTransform(9).translation = [0.0 0.0 0.0];
smiData.RigidTransform(9).angle = 0.0;
smiData.RigidTransform(9).axis = [0.0 0.0 0.0];
smiData.RigidTransform(9).ID = '';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(1).translation = [35.000000000052168 -180.85125026519557 -5.0000000000043396];  % mm
smiData.RigidTransform(1).angle = 2.094395102393189;  % rad
smiData.RigidTransform(1).axis = [0.57735026918962351 -0.57735026918962529 0.57735026918962851];
smiData.RigidTransform(1).ID = 'B[4444444444444444444444-1:-:555555555555555-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(2).translation = [35.000000000005763 -180.85125026519549 -5.0000000000019273];  % mm
smiData.RigidTransform(2).angle = 2.0943951023931962;  % rad
smiData.RigidTransform(2).axis = [0.57735026918962606 -0.57735026918962429 0.57735026918962706];
smiData.RigidTransform(2).ID = 'F[4444444444444444444444-1:-:555555555555555-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(3).translation = [34.764201163659777 259.17774407264119 -20.93773453559044];  % mm
smiData.RigidTransform(3).angle = 2.0943951023931899;  % rad
smiData.RigidTransform(3).axis = [0.57735026918962384 -0.57735026918962529 0.57735026918962817];
smiData.RigidTransform(3).ID = 'B[3333333333333333333333-1:-:4444444444444444444444-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(4).translation = [35.000000000052715 138.41791628104383 -5.0000000000071623];  % mm
smiData.RigidTransform(4).angle = 2.0943619347341125;  % rad
smiData.RigidTransform(4).axis = [0.57737238117405998 -0.57733921287982415 0.57733921287982948];
smiData.RigidTransform(4).ID = 'F[3333333333333333333333-1:-:4444444444444444444444-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(5).translation = [275.00005379270959 1005.8490705283323 -5.000595954524262];  % mm
smiData.RigidTransform(5).angle = 2.094395102393201;  % rad
smiData.RigidTransform(5).axis = [-0.57735026918962762 -0.57735026918962629 -0.57735026918962351];
smiData.RigidTransform(5).ID = 'B[1111111111111-1:-:2222222222222-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(6).translation = [274.99999999874029 1005.8490705283322 -5.00059595451782];  % mm
smiData.RigidTransform(6).angle = 2.0943951023931957;  % rad
smiData.RigidTransform(6).axis = [-0.57735026918962573 -0.57735026918962584 -0.57735026918962573];
smiData.RigidTransform(6).ID = 'F[1111111111111-1:-:2222222222222-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(7).translation = [174.9999999987408 284.12699209689987 -5.0005959545189604];  % mm
smiData.RigidTransform(7).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(7).axis = [0.57735026918962584 -0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(7).ID = 'B[2222222222222-1:-:3333333333333333333333-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(8).translation = [174.76425485253907 289.17774407264091 -20.932310085905328];  % mm
smiData.RigidTransform(8).angle = 2.0943951023931904;  % rad
smiData.RigidTransform(8).axis = [0.57735026918962395 -0.57735026918962629 0.57735026918962706];
smiData.RigidTransform(8).ID = 'F[2222222222222-1:-:3333333333333333333333-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(9).translation = [-35.000000000005187 0 5.0000000000022613];  % mm
smiData.RigidTransform(9).angle = 0;  % rad
smiData.RigidTransform(9).axis = [0 0 0];
smiData.RigidTransform(9).ID = 'RootGround[555555555555555-1]';


%============= Solid =============%
%Center of Mass (CoM) %Moments of Inertia (MoI) %Product of Inertia (PoI)

%Initialize the Solid structure array by filling in null values.
smiData.Solid(5).mass = 0.0;
smiData.Solid(5).CoM = [0.0 0.0 0.0];
smiData.Solid(5).MoI = [0.0 0.0 0.0];
smiData.Solid(5).PoI = [0.0 0.0 0.0];
smiData.Solid(5).color = [0.0 0.0 0.0];
smiData.Solid(5).opacity = 0.0;
smiData.Solid(5).ID = '';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(1).mass = 0.93570696210308868;  % kg
smiData.Solid(1).CoM = [34.995505115737245 216.99437504808751 -4.9933135325694371];  % mm
smiData.Solid(1).MoI = [13559.687350263281 1213.0422397496718 13560.6438057784];  % kg*mm^2
smiData.Solid(1).PoI = [-1.2279955767161774 -0.091875986867634526 0.66692241139715935];  % kg*mm^2
smiData.Solid(1).color = [0.792156862745098 0.81960784313725488 0.93333333333333335];
smiData.Solid(1).opacity = 1;
smiData.Solid(1).ID = '4444444444444444444444*:*Default';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(2).mass = 0.41538260536017069;  % kg
smiData.Solid(2).CoM = [190.15204376230867 289.10334953162192 -4.921757484020068];  % mm
smiData.Solid(2).MoI = [381.56507562147442 656.77483325407127 860.92206271882219];  % kg*mm^2
smiData.Solid(2).PoI = [-1.11451767164562 0.49657837080207595 96.588691725750351];  % kg*mm^2
smiData.Solid(2).color = [0.792156862745098 0.81960784313725488 0.93333333333333335];
smiData.Solid(2).opacity = 1;
smiData.Solid(2).ID = '2222222222222*:*Default';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(3).mass = 0.76426183798232039;  % kg
smiData.Solid(3).CoM = [-12.599376608003208 52.358279049797147 -1.3804911201490031];  % mm
smiData.Solid(3).MoI = [1570.8514036378717 3201.7902033296864 2561.6166271099341];  % kg*mm^2
smiData.Solid(3).PoI = [33.393867240080269 -26.411439028214403 278.69335626258953];  % kg*mm^2
smiData.Solid(3).color = [0.792156862745098 0.81960784313725488 0.93333333333333335];
smiData.Solid(3).opacity = 1;
smiData.Solid(3).ID = '555555555555555*:*Default';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(4).mass = 0.54172165377638515;  % kg
smiData.Solid(4).CoM = [84.336212717499365 262.95416000990264 -28.210398684697722];  % mm
smiData.Solid(4).MoI = [459.7260789021941 1633.0951257172433 1445.661999075825];  % kg*mm^2
smiData.Solid(4).PoI = [64.188479225685896 38.384429366988321 -88.079734631795105];  % kg*mm^2
smiData.Solid(4).color = [0.792156862745098 0.81960784313725488 0.93333333333333335];
smiData.Solid(4).opacity = 1;
smiData.Solid(4).ID = '3333333333333333333333*:*Default';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(5).mass = 0.27538359535668155;  % kg
smiData.Solid(5).CoM = [275.02183346402086 248.79110605796203 -4.9638011940670541];  % mm
smiData.Solid(5).MoI = [1135.1415986497764 44.891895007762365 1135.0700387952309];  % kg*mm^2
smiData.Solid(5).PoI = [1.1088311055859039 -0.081881351000122268 -0.84918670510715311];  % kg*mm^2
smiData.Solid(5).color = [0.792156862745098 0.81960784313725488 0.93333333333333335];
smiData.Solid(5).opacity = 1;
smiData.Solid(5).ID = '1111111111111*:*Default';


%============= Joint =============%
%X Revolute Primitive (Rx) %Y Revolute Primitive (Ry) %Z Revolute Primitive (Rz)
%X Prismatic Primitive (Px) %Y Prismatic Primitive (Py) %Z Prismatic Primitive (Pz) %Spherical Primitive (S)
%Constant Velocity Primitive (CV) %Lead Screw Primitive (LS)
%Position Target (Pos)

%Initialize the PrismaticJoint structure array by filling in null values.
smiData.PrismaticJoint(1).Pz.Pos = 0.0;
smiData.PrismaticJoint(1).ID = '';

smiData.PrismaticJoint(1).Pz.Pos = 0;  % m
smiData.PrismaticJoint(1).ID = '[3333333333333333333333-1:-:4444444444444444444444-1]';


%Initialize the RevoluteJoint structure array by filling in null values.
smiData.RevoluteJoint(3).Rz.Pos = 0.0;
smiData.RevoluteJoint(3).ID = '';

smiData.RevoluteJoint(1).Rz.Pos = 89.998928421880777;  % deg
smiData.RevoluteJoint(1).ID = '[4444444444444444444444-1:-:555555555555555-1]';

smiData.RevoluteJoint(2).Rz.Pos = -65.943926940655857;  % deg
smiData.RevoluteJoint(2).ID = '[1111111111111-1:-:2222222222222-1]';

smiData.RevoluteJoint(3).Rz.Pos = 89.997780014610854;  % deg
smiData.RevoluteJoint(3).ID = '[2222222222222-1:-:3333333333333333333333-1]';

