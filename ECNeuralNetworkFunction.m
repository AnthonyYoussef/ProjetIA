function [y1] = ECNeuralNetworkFunction(x1)
%ECNEURALNETWORKFUNCTION neural network simulation function.
%
% Generated by Neural Network Toolbox function genFunction, 12-Jan-2017 11:03:55.
%
% [y1] = myNeuralNetworkFunction(x1) takes these arguments:
%   x = Qx30 matrix, input #1
% and returns:
%   y = Qx2 matrix, output #1
% where Q is the number of samples.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [9.878;0;7.33;0.12;0;13.602;-18.066;0.228;0.004;111.238;0.047;-1.414;0;20;-2.496;-3.141;26.001;-2.487;-3.142;0.2;-3.142;22.71;2;30.196;-4.497;-3.142;30.001;-4.5;-3.141;60.223];
x1_step1.gain = [0.00205081089062615;0.00289823569901822;0.00151219242951104;0.00262231114770692;0.235211101964013;0.000403113893582366;0.0575440211761998;0.373761913660998;0.00428705245851741;0.00125587592950517;0.101910828025478;0.707213578500707;2;0.00331750881627968;0.401042711048727;0.318319274232055;0.00458826093439934;0.401525798032524;0.318319274232055;0.00287631969142842;0.318268618714195;0.00116936702747486;2;0.00273728871552727;0.222321031569587;0.318319274232055;0.00289245142489388;0.222271615914648;0.318319274232055;0.0012712860965796];
x1_step1.ymin = -1;

% Layer 1
b1 = [-1.854770893677061;-3.3440073772023156;25.201963075629699;-3.389630991749137;13.938048124181325;0.62867739977247683;-7.3069099186048252;-0.60423656888849153;5.3500752140278696;6.3986705046128494];
IW1_1 = [1.9494939221423995 3.2010000569811514 1.840064972783009 0.8079988792409053 1.1907635277527104 -4.7436327681948178 -0.24903008544533928 -0.18724671400467502 -2.158827026001759 -0.41494490487838026 -0.18415415027260185 -0.3180621346742315 -0.034379172824081018 -1.2564237740517683 3.5851026289513341 0.98880257708302 -0.58652828564180892 0.34742188580720135 -0.45038483114799799 -0.78479261625150198 -0.62527203255381003 -1.3740553015572166 -0.092464128001447043 -0.48255031526119668 -2.3019262485520486 0.036237512522079213 2.2820438135740191 -2.3295978111837909 -0.53808985941974896 1.4141956309849315;-0.93499333020525044 0.60687831086436128 -2.1214180765124824 -0.05149486296182619 0.85310451657180619 -1.6949837558239613 -0.042798703920980737 0.5014244132063983 0.82748111277496539 -3.6633022678536711 0.34946162467696684 0.012968008019584245 0.023375397527297049 0.05486087633305136 0.017033648952912595 0.035401079084592516 1.0122944077164164 0.033174790618793568 0.023325225575513794 -1.2783441324480995 -0.011510899123626392 -0.96672326880146064 -0.040495999041588397 3.3423566620836866 -0.054065968748769871 0.00071853884943673721 3.4836140280184797 -0.019668877177357463 -0.011672892490102456 -1.8652107423347644;14.166328491975458 0.78546964378540074 17.665102994084329 2.5876824214265177 -0.78733429571015812 3.2800118570428527 0.083608925638168186 0.92872430322894595 -0.52439077120516864 7.5686337497738227 0.69527049932351848 0.36670408854243342 0.19735241488842739 -3.6247275336989238 0.053122201689350453 -0.0057058241410087966 -3.8016560886140263 -0.021140283273365042 -0.015520214874170034 1.4770367314372084 -0.0071179125506918069 -0.71051371861616619 -0.060589936017980559 -1.7442656706058004 -0.023355274450091917 -0.015550035626343011 -1.2997593603829374 -0.018575287784132453 -0.051346531788873898 -6.0675828670597776;-0.23802228213489995 0.0076592005261984196 -2.1663208005287879 0.14390663804019793 0.48322700054424939 -1.5623214708236606 -0.14649864210672689 0.94635994046451433 1.3054903872584767 -3.2164135597295953 0.41275693092645038 0.1294870516011713 -0.057383425238356191 -0.44997064500369027 0.0052682972040021753 0.060565582604443134 1.0416387935014617 0.050801790682598394 0.0043850255531577694 -1.4953788030987039 -0.022299113296122507 -0.9639793280832879 -0.10369689786766596 2.7858320093765614 -0.083516893814431198 -0.014128500796014581 2.6950507527742897 0.029769982467797232 -0.013972990437195149 -1.1974588200412903;4.3336714931068823 3.9853612017254578 16.419328050643102 0.70518466356682186 0.24573290070030995 -2.6303681121309648 -0.23557958007664809 0.56453614075072656 -0.45241125781485186 3.0591321357662919 2.2327413700714205 -0.041142402246582596 -0.013923358272459158 -5.2961166865042388 -0.024919878963395866 -0.053099840810776802 -4.7452419753569703 0.023640466711022361 -0.015096939009716356 1.8104777735163751 -0.017244885707041625 0.81463100809530131 0.12518377810403836 -0.20547284930444648 0.025358100329157765 -0.00082398064421861572 0.14748520633887244 0.0026667822785512974 -0.016079620551953454 -2.5020445584153173;0.42921484595424331 -3.867593613447549 -3.7444568230414124 1.3623340930290466 0.11097618867990118 2.6309050147104629 0.37534543499845735 0.87674505982032236 1.3418289965149628 0.65694359291217175 -0.85728592171147311 0.20986626529066352 0.015959251490583064 2.0790217497687475 -0.029224564284805268 0.016416591915863421 0.8836374580173173 -0.026964904506638382 -0.0009325918327681695 -1.0508508121810305 0.0042067887732764563 -0.062691477780083271 0.035828313826181908 0.092821821175970862 0.049091143094564658 -0.010581581865638099 -0.23662111517266093 0.028136997029265549 -0.029270909338385002 -0.77548801297988157;-0.77630255881577248 1.5973167419260943 1.4699006812424806 1.4401209458206483 0.52352365540606371 0.6591105177055363 0.79854352632985193 -0.23812036173289264 0.71632827949106825 -6.6486088326782609 3.4480370477764422 -0.27451477161661825 0.053375309191184404 -1.0254082034562053 -0.086867045059158668 -0.036025109787057565 -3.3132590135229067 0.3069759899473461 0.034697478175060345 -0.25640083971200411 -0.024741033852821469 -0.23351077440807572 0.012505677624097029 -0.8303437012319278 -0.011927322448853264 0.025700144691274265 -0.28884939097760276 -0.13332801125205151 -0.017225613841411306 -0.72919404274448507;-0.42401580492388574 3.3902989565142279 3.9624956619792879 -1.3756060001258168 -0.09204751085642611 -2.3079346058725014 -0.32567173656181908 -0.99623861441336792 -1.4501397784183157 -0.72670722358601592 0.98807014506973345 -0.2069691830616637 -0.017233772674554913 -2.25901761208344 0.0048471383076673681 -0.011066891132196171 -0.90796547614252576 0.033213769652561773 0.0046856289758690148 0.98130963355380252 0.00037037325633588439 -0.066341872686314002 -0.051977395912757005 0.088912536133585143 -0.036355577295582447 0.011067603942592171 0.23496064169269834 -0.016803363964698968 0.030241617758817736 0.77818339710599271;4.3445761153005522 4.5199837967230856 9.3126661295688908 0.50004693575838532 0.78680185116625678 -4.9627542309102886 0.16004570096154996 -0.096102134381905194 -1.3823738692227994 0.058975575398736754 2.5403930912127914 -0.21418498196597188 -0.17215000915170459 -6.5602470850570258 0.13466952618397074 0.049968664759379298 -4.5572466889638532 0.095481502544887173 -0.038389118889922885 0.6391136811317063 -0.050119042614706913 0.86827422010335975 -0.020825452144156029 0.066102912648589543 -0.15299135706238451 0.0045825961795880939 0.61491009750081127 -0.026854964237402221 0.026447069524692838 0.40193264075780871;0.38300695003121199 -0.76310172845717306 1.5991417246228432 2.6776870459977737 -0.56880851227517237 2.3901129653585893 0.097333827673153572 1.1197566945043131 -1.1928931403478806 4.6396764828568235 -2.2170326339235609 0.24937776775728468 0.068093173771605522 2.2047981331533792 -1.8290619579877678 0.13404408391936942 0.041898093761902143 2.3488638070802752 -0.13557028130730581 -1.1699214039054933 0.074962799145735587 3.464666968137275 0.025633344566335668 2.0688283876335034 -0.17737260046289502 0.05064873567507807 -8.7558372042672694 -0.18124105896193865 -0.073712895785383842 -0.26319745772461556];

% Layer 2
b2 = [2.6198423723626534;1.768509198089359];
LW2_1 = [0.020144789674730722 -1.6652102375729818 -0.048928371524960435 0.98298454373416178 0.18017216629566438 1.7949480191497125 3.8911725411244888 1.8237682034066764 -0.10078151326143411 -0.24117286068120075;0.11475661772073788 -5.2903626758647935 -1.0304061799562103 2.6767536371771481 1.1707380430295433 2.3609047296179511 3.305339078205642 2.3327040200474047 -0.30609162575981536 -0.10396401166753627];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = [0.256294165406702;2];
y1_step1.xoffset = [0.00150187015894;0];

% ===== SIMULATION ========

% Dimensions
Q = size(x1,1); % samples

% Input 1
x1 = x1';
xp1 = mapminmax_apply(x1,x1_step1);

% Layer 1
a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*xp1);

% Layer 2
a2 = repmat(b2,1,Q) + LW2_1*a1;

% Output 1
y1 = mapminmax_reverse(a2,y1_step1);
y1 = y1';
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings)
y = bsxfun(@minus,x,settings.xoffset);
y = bsxfun(@times,y,settings.gain);
y = bsxfun(@plus,y,settings.ymin);
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n,~)
a = 2 ./ (1 + exp(-2*n)) - 1;
end

% Map Minimum and Maximum Output Reverse-Processing Function
function x = mapminmax_reverse(y,settings)
x = bsxfun(@minus,y,settings.ymin);
x = bsxfun(@rdivide,x,settings.gain);
x = bsxfun(@plus,x,settings.xoffset);
end